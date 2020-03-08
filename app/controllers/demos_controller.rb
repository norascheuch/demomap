class DemosController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @demo = Demo.all
    @demos = policy_scope(Demo).order(start_time: :asc)
  end

  def show
    @demo = Demo.find(params[:id])
    authorize @demo
  end

  def new
    @demo = Demo.new
    authorize @demo
    @page = request.original_url
    @doc = Nokogiri::HTML(open("www.rubygems.org/gems/nokogiri"))
    authorize @doc
    dataVvalue = doc.css('div.mapbox-directions-steps')[0]["data-lat"]
    raise
  end

  def create
    @demo = Demo.new(params[:id])
    authorize @demo
    @demo.user = current_user
    if @demo.save
      redirect_to demo_path(@demo)
    else
      render :new
    end
  end

  def edit
    @demo = Demo.find(params[:id])
    authorize @demo
  end

  def destroy
    authorize @demo
  end

  private

  def demo_params
    params.require(:demos).permit(:name, :description, :start_time, :end_time, :start_location, :end_location)
  end

end
