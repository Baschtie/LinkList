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

  def flash_class(key)
    if key == "notice"
      return "ui closable info message"
    elsif key == "error"
      return "ui closable floating negative message"
    elsif key == "success"
      return "ui closable floating positive message"
    else
      return "ui closable message"
    end
  end

  def flash_header(key)
    if key == "notice"
      return "Info!"
    elsif key == "error"
      return "Error!"
    elsif key == "success"
      return "Success!"
    else
      return "Attention!"
    end
  end

end
