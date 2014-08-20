module SearchHelper
  def highlight_label_with_query(token, query)
    # This is optimized for behaving well with the multiple tags scenario, rather than to highlight partial query matches 
    # in a tag.
    if /#{token}/.match query
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
