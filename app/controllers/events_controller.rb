class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @demo = Demo.find(params[:demo_id])
    @events = policy_scope(Event.where('demo_id = ?', params[:demo_id]).geocoded)
    @mappoints = '13.413930095294177,52.52162393940594;13.410865,52.522989,13.397043,52.517562;13.388856,52.517209;13.391318,52.501354'
    if @events == []
        @markers =[
             {
       lat: '52.518743',
       lng: '13.406523',
       }]
    else
      @markers = @events.map do |event|
        @icon = event.event_type.icon
             {
       lat: event.latitude,
       lng: event.longitude,
       infoWindow: render_to_string(partial: "info_window", locals: { demo: @demo, event: event }),
       image_url: helpers.asset_url(@icon)
       }
      end
    end
  end

  def new
    @event = Event.new(demo_id: params[:demo_id])
    authorize @event
    @demo = Demo.find(params[:demo_id])
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    @event.demo_id = params[:demo_id]
    authorize @event
    @event.event_type = EventType.find(params[:event][:event_type])
    if @event.save
      redirect_to demo_events_path(params[:demo_id])
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
    @comments = @event.comments
    authorize @comments
    @demo = Demo.find(params[:demo_id])
  end

  private

  def event_params
    params.require(:event).permit(:location, :description)
  end

end
