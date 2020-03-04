class CommentsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @comments = Demo.find(params[:demo_id]).comments
  end

  def new
  end
end
