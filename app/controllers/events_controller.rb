class EventsController < ApplicationController
  def index
    @events = Event.geocoded
    @markers = @events.map do |event|
      @icon = event.event_type.icon
           {
     lat: event.latitude,
     lng: event.longitude,
     infoWindow: render_to_string(partial: "info_window", locals: { event: event }),
     image_url: helpers.asset_url(@icon)
     }
    end
  end

  def new
  end

  def show
    @comments = Event.find(params[:id]).comments
  end
end
