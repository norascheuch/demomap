class CommentsController < ApplicationController
  def index
    @comments = Demo.find(params[:demo_id]).comments
  end

  def new
  end
end
