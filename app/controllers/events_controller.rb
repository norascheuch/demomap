class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_event, only: [:show, :edit, :update, :destroy]
  def index
    @demo = Demo.find(params[:demo_id])
    @events = policy_scope(Event.where('demo_id = ?', params[:demo_id]).includes([:event_type, :comments]))
    @mappoints = @demo.route
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

  def show
    @comments = @event.comments
    authorize @comments
    @demo = Demo.find(params[:demo_id])

### order comments of an event by votes. weighted_score comes from the gem act_as_votable ###
    @votes_comments = @comments.all.sort_by{ |a| a.weighted_score }.reverse
### End of comment ###
  end

  def new
    @demo = Demo.find(params[:demo_id])
    @event = Event.new(demo: @demo)
    authorize @event
    @collection = EventType.where("id > 2")
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    @event.demo_id = params[:demo_id]
    authorize @event
    @event.event_type = EventType.find(params[:event][:event_type]) if params[:event][:event_type] != ''
    if @event.save
      redirect_to demo_events_path(params[:demo_id]), notice: 'Event created successfully'
    else
      @demo = Demo.find(params[:demo_id])
      @collection = EventType.where("id > 2")
      flash.alert = 'Something went wrong, please try again. You need to select a description, an event type and a location.'
      render :new
    end
  end

  def edit
    @demo = Demo.find(params[:demo_id])
    authorize @event
    @collection = EventType.where("id > 2")
  end

  def update
    @demo = Demo.find(params[:demo_id])
    authorize @event
    @event.event_type = EventType.find(params[:event][:event_type]) if params[:event][:event_type] != ''
    if @event.update!(event_params)
      redirect_to demo_events_path(params[:demo_id]), notice: 'Event edited successfully'
    else
      @demo = Demo.find(params[:demo_id])
      @collection = EventType.where("id > 2")
      flash.alert = 'Something went wrong, please try again. You need to select a description, an event type and a location.'
      render :edit
    end

  end

  def destroy
    authorize @event
    @event.destroy
    redirect_to demo_events_path(Demo.find(params[:demo_id]))
  end

  private

  def find_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:location, :description, :latitude, :longitude)
  end

end
