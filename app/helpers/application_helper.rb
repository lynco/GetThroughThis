module ApplicationHelper
  def mobile_hide(entry)
    # returns a Bootstrap class that will hide in mobile view (xs) if flag is false
    flag = entry[:is_mobile]
    if flag.nil? or flag==true
      return ""
    else
      return "hidden-xs"
    end
  end
end
