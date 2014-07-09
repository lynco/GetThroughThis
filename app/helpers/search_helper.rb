module SearchHelper
  def highlight_label_with_query(token, query)
    if /#{query}/.match token
      'filter-label'
    else
      'tag-label'
    end
  end

  def check_filter(filter_list, filter_name)
    if filter_list and filter_list.include? filter_name
      true
    else
      false
    end
  end
  
end
