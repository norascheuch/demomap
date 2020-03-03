class CommentsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index

  end

  def new
  end
end
