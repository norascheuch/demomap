class EventsController < ApplicationController
  def index
    @events = Event.geocoded #returns flats with coordinates

    @markers = @events.map do |event|
      {
        lat: event.latitude,
        lng: event.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { event: event })
      }
    end
  end

  def new
  end

  def show
    @comments = Event.find(params[:id]).comments
  end
end
