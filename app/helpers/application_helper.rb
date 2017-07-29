module ApplicationHelper
  def display_tag_name(tag_id)
    tag = Tag.where(:id => tag_id).first
    if !tag
      result = "None"
    else
      result = tag.name
    end
    return result
  end
end
