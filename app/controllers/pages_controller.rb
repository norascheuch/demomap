class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:splash, :contact, :organizers, :tips, :impressum, :create_contact]

  def splash
  end

  def dashboard
  end

  def contact
  end

  def create_contact
    unless params[:contact][:message] == '' || params[:contact][:email_address] == ''
      ContactMailer.with(contact: params[:contact]).contact.deliver_now
      redirect_to contact_path, notice: 'EMail send successfully!'
    else
      redirect_to contact_path, alert: 'Please make sure to input a message and email address, so that we can reply to you!'
    end
  end

  def organizers
  end

  def tips
  end

  def impressum
  end
end

