class DemosController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_demo, only: [:show, :edit, :update]

  def index
    @demo = Demo.all
    @demos = policy_scope(Demo).order(start_time: :asc)
  end

  def show
    authorize @demo
  end

  def new
    @demo = Demo.new
    authorize @demo
  end

  def create
    @demo = Demo.new(demo_params)
    authorize @demo
    @demo.user = current_user
    if route && @demo.save
      # events and permission are generated in model
      redirect_to demo_path(@demo)
    else
      render :new
    end
  end

  def edit
    authorize @demo
  end

  def update
    authorize @demo
    if route && @demo.update!(demo_params)
      # events are updated in model
      redirect_to demo_path(@demo)
    else
      render :edit
    end
  end

  def destroy
    authorize @demo
  end

  private

  def find_demo
    @demo = Demo.find(params[:id])
  end

  def demo_params
    params.require(:demo).permit(:name, :description, :start_time, :end_time, :d_hashtag)
  end

  def route
    if params[:demo][:route].present?
      info = JSON.parse(params[:demo][:route])
      # when start/end location is the last to be changed by dragging no name is send
      @demo.start_location = info[0]['name'] == '' || info[0]['name'].nil? ? Geocoder.search(info[0]["latLng"].values).first.address : info[0]['name']
      @demo.end_location = info[-1]['name'] == '' || info[-1]['name'].nil? ? Geocoder.search(info[-1]["latLng"].values).first.address : info[-1]['name']
      @demo.route = info.map{|hash| hash['latLng'].values.join(',')}.join(';')
    end
  end
end
