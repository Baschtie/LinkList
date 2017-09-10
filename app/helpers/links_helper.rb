require 'rqrcode'

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

def display_link_button(link)
  return "<a href=\"#{link}\" class=\"ui primary button load\" data-tooltip=\"#{link}\" data-position=\"top right\">Visit</a>".html_safe
end

def generate_qrcode(link)
  qrcode = RQRCode::QRCode.new(link)
  image = qrcode.as_png(
          resize_gte_to: false,
          resize_exactly_to: false,
          fill: 'white',
          color: 'black',
          size: 120,
          border_modules: 4,
          module_px_size: 6,
          file: nil # path to write
          )
  return image.resize(150, 150)
end

end
