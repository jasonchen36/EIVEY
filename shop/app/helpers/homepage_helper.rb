module HomepageHelper
  def show_subcategory_list(category, current_category_id)
    category.id == current_category_id || category.children.any? do |child_category|
      child_category.id == current_category_id
    end
  end

  def with_first_listing_image(listing, &block)
    Maybe(listing)
        .listing_images
        .map { |images| images.first }[:medium].each { |url|
      block.call(url.sub! 'medium', 'big')
    }
  end

  def without_listing_image(listing, &block)
    if listing.listing_images.size == 0
      block.call
    end
  end

  def format_distance(distance)
    precision = (distance < 1) ? 1 : 2
    (distance < 0.1) ? "< #{number_with_delimiter(0.1, locale: locale)}" : number_with_precision(distance, precision: precision, significant: true, locale: locale)
  end

  def is_root_category(category)
    category.parent_id == nil
  end

  def get_subcategories(category, categories)
    categories
        .select{|subcategory| subcategory.parent_id == category.id}
        .sort{|category1,category2| category1.sort_priority <=> category2.sort_priority}
  end

  def has_subcategories(subcategories)
    subcategories.length > 0
  end
end