class WebServicesController < ApplicationController 
  before_action :set_web_service

  def show
  end

  private
  def set_web_service
    @web_service = WebService.includes(:related_resources, :tags).find params[:id]
  end
end

