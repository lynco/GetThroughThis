module SearchHelper
  def highlight_label_with_query(token, query)
    if /#{query}/.match token
      'filter-label'
    else
      'tag-label'
    end
  end
end
