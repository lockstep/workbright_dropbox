require 'open-uri'

class DropboxController < ApplicationController

  def save_url
    begin
      DropboxService.save_url(params[:path], params[:url])
    rescue
      return head :bad_request
    end
    head :ok
  end

end
