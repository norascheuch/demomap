class CommentsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @demo = Demo.find(params[:demo_id]) # integrate order by created!
    @comments = policy_scope(@demo.comments) # integrate order by created!
  end

  def new
  end

  def update
    @comment = Comment.find(params[:id])# integrate order by created!
    authorize @comment
    case params[:comment][:vote]
    when 'up' then @comment.vote_by :voter => current_user, :vote => 'up'
    when 'down' then @comment.vote_by :voter => current_user, :vote => 'down'
    end

    respond_to do |format|
      # format.html {redirect_to demos_path(Demo.find(params[:demo_id]))}
      format.js  # <-- will render `app/views/reviews/create.js.erb`
    end
    # @review.restaurant = @restaurant
    # if @review.save
    #   redirect_to restaurant_path(@restaurant)
    # else
    #   render 'restaurants/show'
    # end
  end
end
