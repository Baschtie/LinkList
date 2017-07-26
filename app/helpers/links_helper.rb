module LinksHelper

  def display_expire_flag(link)
    if !link[:does_expire]
      return "<div class=\"grey text\">Never</div>".html_safe
    else
      if link[:experies_on] == Date.today
        return "<div class=\"red text\">Today</div>".html_safe
      else
        return "<div class=\"ui momentjs\" data-tooltip=\"#{link[:experies_on].strftime("%d.%m.%Y")}\" data-position=\"top left\">#{link[:experies_on].strftime("%Y%m%d")}</div>".html_safe
      end
    end
  end
end
