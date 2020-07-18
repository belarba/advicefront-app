class ContactController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
  end

  def index
    @email = params[:email]
    @message = params[:message]
    
  end

  def create        
    redirect_to contact_path(email: params[:email], message: params[:message])
  end  
end
