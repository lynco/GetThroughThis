require 'mailchimp'

class ListEntriesController < ApplicationController
  def create

    email = params[:emailaddress]
    comment = params[:subscriber_comments]
    app_link = params[:app_link]

    if params[:list_id]
      list_id = params[:list_id]
    else
      list_id = ENV['mc_general_list_id']
    end
    
    puts ">>> #{params}"
    mc = Mailchimp::API.new(ENV['MAILCHIMP_API_KEY'])
    l=ListEntry.create email: email
    @mc_error=''

    # Hard-coding default list on LYN Co. account (login id = lynco_ss)
    begin
      mc.lists.subscribe(list_id, {email: email}, {'subcomment' => comment, 'applink' => app_link}, 'html', false)
    rescue Mailchimp::ListAlreadySubscribedError
      @mc_error = "#{email} is already subscribed to the list."
    rescue Mailchimp::ListDoesNotExistError
      @mc_error = "The list could not be found."
    rescue Mailchimp::Error => ex
      if ex.message
        @mc_error = ex.message
      else
        @mc_error = "An unknown error occurred."
      end
    end

    if @mc_error == ''
      l.status='success'
    else
      l.status='failed'
      puts ">>> #{@mc_error}"
    end
    l.save

    render nothing: true
  end

end
