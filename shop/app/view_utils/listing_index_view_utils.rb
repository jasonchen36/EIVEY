module ListingIndexViewUtils

  ListingItem = Struct.new(
    :id,
    :url,
    :title,
    :category_id,
    :latitude,
    :longitude,
    :distance,
    :distance_unit,
    :author,
    :description,
    :listing_images,
    :price,
    :unit_tr_key,
    :unit_type,
    :quantity,
    :shape_name_tr_key,
    :listing_shape_id,
    :icon_name,
    :custom_field_values)

  Author = Struct.new(
    :id,
    :username,
    :first_name,
    :last_name,
    :organization_name,
    :is_organization,
    :avatar,
    :is_deleted,
    :num_of_reviews)

  ListingImage = Struct.new(
    :thumb,
    :small_3x2)

  CustomField = Struct.new(
    :id,
    :name,
    :text_value,
    :numeric_value
  )

  module_function

  def to_struct(result:, includes:, per_page:, page:)
    listings = result[:listings].map { |l|
      author =
        if includes.include?(:author)
          Author.new(
            l[:author][:id],
            l[:author][:username],
            l[:author][:first_name],
            l[:author][:last_name],
            l[:author][:organization_name],
            l[:author][:is_organization],
            ListingImage.new(
              l[:author][:avatar][:thumb]
            ),
            l[:author][:is_deleted],
            l[:author][:num_of_reviews]
          )
        end


      listing_images =
        if includes.include?(:listing_images)
          l[:listing_images].map { |li|
            ListingImage.new(li[:thumb], li[:small_3x2])
          }
        else
          []
        end


      # Added size
#      size = l.list_size
      custom_field_values=
        if includes.include?(:custom_field_values)
          l[:custom_field_values].map { |li|
            CustomField.new(li[:id],"test",li[:text_value],li[:numeric_value])
          }
        else 
          []
        end

      ListingItem.new(
        l[:id],
        l[:url],
        l[:title],
        l[:category_id],
        l[:latitude],
        l[:longitude],
        l[:distance],
        l[:distance_unit],
        author,
        l[:description],
        listing_images,
        l[:price],
        l[:unit_tr_key],
        l[:unit_type],
        l[:quantity],
        l[:shape_name_tr_key],
        l[:listing_shape_id],
        l[:icon_name],
        custom_field_values
      )
    }

    paginated = WillPaginate::Collection.create(page, per_page, result[:count]) do |pager|
      pager.replace(listings)
    end
  end
end
