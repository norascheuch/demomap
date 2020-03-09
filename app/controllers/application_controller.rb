class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:splash, :index, :show]

  include Pundit

  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end


  protected

  def after_sign_in_path_for(resource)
    demos_path
  end

  def after_sign_out_path_for(resource)
    demos_path
  end


end
