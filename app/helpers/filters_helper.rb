module FiltersHelper
  def run_filters(recs, filter_param)
    delete_list=[]
    filters = filter_param

    # OR filter - in_filter if any of the use modes are in the filter list
    recs.each do |rec|
      in_filter=false
      rec.service_use_modes.each do |use_mode|
        if filters.include? use_mode.name
          in_filter=true
        end
      end

      if !in_filter
        delete_list << rec
      end
    end

    recs - delete_list
  end
end
