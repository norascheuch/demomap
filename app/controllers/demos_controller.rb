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
    @demo = Demo.find(params[:id])
    authorize @demo
  end

  def destroy
    authorize @demo
  end

  private

  def demo_params
    params.require(:demo).permit(:name, :description, :start_time, :end_time)
  end

  def route
    if params[:demo][:route].present?
      info = JSON.parse(params[:demo][:route])
      @demo.start_location = info[0]['name']
      @demo.end_location = info[-1]['name']
      @demo.route = info.map{|hash| hash['latLng'].values.join(',')}.join(';')
    end
  end
end
