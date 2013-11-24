module ApplicationHelper
  def html_title(subtitle)
    if subtitle.empty?
      "Problems Tracker"
    else
      "Problems Tracker | #{subtitle}"
    end
  end
end
