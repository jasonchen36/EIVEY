module ListingIndexService::Search::Converters
  module_function

  def listing_hash(l, includes, meta={})
    {
        id: l.id,
        title: l.title,
        description: l.description,
        updated_at: l.updated_at,
        created_at: l.created_at,
        category_id: l.category_id,
        comment_count: l.comments_count,
        price: l.price,
        unit_tr_key: l.unit_tr_key,
        unit_type: l.unit_type,
        quantity: l.quantity,
        shape_name_tr_key: l.shape_name_tr_key,
        listing_shape_id: l.listing_shape_id
    }.merge(meta)
        .merge(location_hash(l, includes))
        .merge(author_hash(l, includes))
        .merge(listing_images_hash(l, includes))
        .merge(custom_field_values_hash(l, includes))
  end

  def location_hash(l, includes)
    if includes.include?(:location)
      m_location = Maybe(l.location)
      {
          latitude: m_location.latitude.or_else(nil),
          longitude: m_location.longitude.or_else(nil),
          address: m_location.address.or_else(nil),
      }
    else
      {}
    end
  end

  def author_hash(l, includes)
    if includes.include?(:num_of_reviews) || includes.include?(:author)
      {
          author: {
              id: l.author_id,
              username: l.author.username,
              first_name: l.author.given_name,
              last_name: l.author.family_name,
              organization_name: l.author.organization_name,
              is_organization: l.author.is_organization,
              avatar: {
                  thumb: l.author.image.present? ? l.author.image.url(:thumb) : nil
              },
              is_deleted: l.author.deleted?,
          }.merge(num_of_reviews_hash(l, includes))
      }
    else
      {}
    end
  end

  def num_of_reviews_hash(l, includes)
    if includes.include?(:num_of_reviews)
      {num_of_reviews: l.author.received_testimonials.size}
    else
      {}
    end

  end

  def listing_images_hash(l, includes)
    if includes.include?(:listing_images)
      {
          listing_images: Maybe(l.listing_images.first)
                              .select { |li| li.image_ready? } # Filter images that are not processed
                              .map { |li|
            [{
                 thumb: li.image.url(:thumb),
                 small_3x2: li.image.url(:small_3x2),
                 medium: li.image.url(:medium)
             }]
          }.or_else([])
      }
    else
      {}
    end
  end

  def field_values_helper(listing)
    converted_values = []
    field_values = listing.custom_field_values
    field_values.each{ |li|

      converted_values.push(
          {
              id: li[:id],
              custom_field_id: li[:custom_field_id],
              text_value: ActiveRecord::Base.connection.exec_query(
                  "SELECT custom_field_option_titles.value "+
                      "FROM custom_field_option_titles "+
                      "INNER JOIN custom_field_option_selections "+
                      "ON custom_field_option_titles.custom_field_option_id=custom_field_option_selections.custom_field_option_id "+
                      "WHERE custom_field_option_selections.listing_id = '#{listing.id}' "+
                      "LIMIT 1"
              ).rows[0][0],
              numeric_value: li[:numeric_value]
          }
      )
      return converted_values
    }
  end

  def custom_field_values_hash(l, includes)
    if includes.include?(:custom_field_values)
      {
          custom_field_values: field_values_helper(Maybe(l).or_else([]))
      }
    else
      {
          custom_field_values: []
      }
    end
  end

end

