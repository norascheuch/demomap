class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:splash, :contact, :organizers, :tips, :impressum, :contact_create]

  def splash
  end

  def dashboard
  end

  def contact
  end

  def contact_create
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

  def admin
    @demo = Demo.find(params[:demo_id])
    @user = User.all # leave only for testing!!!!
    # remove [collection] in simple form!!

    # alternative: use one DB request and filter with ruby
    @admin_user = User.joins(:permissions).where(permissions: {role: 'admin'}).where(permissions: {demo: @demo})
    @medic_user = User.joins(:permissions).where(permissions: {role: 'medic'}).where(permissions: {demo: @demo})
    @scout_user = User.joins(:permissions).where(permissions: {role: 'scout'}).where(permissions: {demo: @demo})
  end

  def admin_create
    @demo = Demo.find(params[:demo_id])
    user = User.find_by("email = ?", params[:admin][:email_address])
    p = Permission.new(user: user, demo: @demo, role: params[:admin][:role])
    redirect_back(fallback_location: demos_path)
    if params[:admin][:role] == ''
      flash.alert = "Please specify a role."
    elsif user.nil?
      flash.alert = "Please specify an existing user."
    else p.save
      flash.notice = p.errors.messages[:user][0].nil? ? "User updated" : p.errors.messages[:user][0]
    end
  end
end

