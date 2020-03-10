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
    # @page = request.original_url
    # @doc = Nokogiri::HTML(open("www.rubygems.org/gems/nokogiri"))
    # authorize @doc
    # dataVvalue = doc.css('div.mapbox-directions-steps')[0]["data-lat"]
    # raise
  end

  def create
    @demo = Demo.new(demo_params)
    authorize @demo
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
    params.require(:demo).permit(:name, :description, :start_time, :end_time)
  end

end
