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
    return false if params[:demo][:start_location].empty? || params[:demo][:end_location].empty?
    start = JSON.parse(params[:demo][:start_location])['geometry']['coordinates']
    @demo.start_location = Geocoder.search([start[1], start[0]])[0].data['display_name']
    ende = JSON.parse(params[:demo][:end_location])['geometry']['coordinates']
    @demo.end_location = Geocoder.search([ende[1], ende[0]])[0].data['display_name']
    waypoints = JSON.parse(params[:demo][:route]).map{|wp| wp['geometry']['coordinates'].join(',')}.join(';')
    mappoints = ''
    if waypoints == ''
      mappoints << start.join(',') + ';' + ende.join(',')
    else
      mappoints << start.join(',') + ';' + waypoints + ';' + ende.join(',')
    end
    @demo.route = mappoints
  end
end
