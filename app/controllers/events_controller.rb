class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @events = policy_scope(Event.geocoded)
    @mappoints = '13.413930095294177,52.52162393940594;13.410865,52.522989,13.397043,52.517562;13.388856,52.517209;13.391318,52.501354'
    @markers = @events.map do |event|
      @icon = event.event_type.icon
      @demo = event.demo
           {
     lat: event.latitude,
     lng: event.longitude,
     infoWindow: render_to_string(partial: "info_window", locals: { demo: @demo, event: event }),
     image_url: helpers.asset_url(@icon)
     }
    end
  end

  def new
  end

  def show
    @event = Event.find(params[:id])
    @comments = @event.comments
    authorize @comments
    @demo = Demo.find(params[:demo_id])
  end
end
