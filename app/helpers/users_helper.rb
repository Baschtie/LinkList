module UsersHelper
  def display_is_admin(is_admin)
    if is_admin
      return "<div class=\"ui orange label\">Admin</div>".html_safe
    else
      return "<div class=\"ui blue label\">User</div>".html_safe
    end
  end
end
