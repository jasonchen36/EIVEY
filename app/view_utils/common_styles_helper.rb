module CommonStylesHelper

  module_function

  def marketplace_colors(community)
    {
      marketplace_color1: community&.custom_color1 ? "##{community.custom_color1}" : "#abcdc6",
      marketplace_color2: community&.custom_color2 ? "##{community.custom_color2}" : "#ddb35a"
    }
  end
end
