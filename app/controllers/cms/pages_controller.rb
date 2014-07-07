module Cms
  class PagesController < ApplicationController
    def show
      # All content is added in the hash @page_content, via keys that represent CMS regions

      # id = all digits, means it's a true ID, else it's an attempted slug.
      if /^\d+$/.match(params[:id].to_s)
        curr_pg = Page.find params[:id]
      else
        # If there is no page with this slug, raise 404 exception
        curr_pg = Page.find_by_slug(params[:id])
      end

      if curr_pg.nil?
        raise ActionController::RoutingError
      end

      page_id = curr_pg.id
      @page_content = {}

      title_rec = curr_pg.page_attributes.where("key = 'title'")[0]
      if title_rec.nil? # page does't have a title
        @title = :brand_name
      else
        @title = title_rec.value
      end

      template = curr_pg.template
      template = 'cms_template' if (template.nil? or template == "")

      layout = curr_pg.layout
      layout = 'application' if (layout.nil? or layout == "")

      # Populate all the attributes
      curr_pg.page_attributes.each do |attr|
        @page_content[attr.key.to_sym] = attr.value
      end

      render "cms/pages/#{template}", layout: layout
    end
  end
end

