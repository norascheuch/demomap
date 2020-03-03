class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:splash]
  def splash
  end

  def dashboard
  end

  def contact
  end

  def organizers
  end

  def tips
  end

  def impressum
  end
end

