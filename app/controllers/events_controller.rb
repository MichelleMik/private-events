class EventsController < ApplicationController
  def new

    @user = User.find(params[:user_id])
    @event = @user.events.build(host_id: params[:user_id])
    @action = user_events_path(@user, @event)
    @method = "POST"
  end

  def create
    
    @user = User.find(params[:user_id])
    @event = Event.new(event_params)
    @event.host = @user
    #@event = @user.events.build(host_id: @user.id, params[event_params])
    #@event = @user.events.build(params[event_params])
    # @action = user_event_path(@user, @event)
    # @method = "POST"
    if @event.save
      redirect_to user_event_path(@user, @event)
    else
      render :new
    end
  end

  def show
 
    @event = Event.find(params[:id])
    @user = User.find(params[:user_id])
    #@event = Event.find[params[:id]]
  end

  def index
    @events = Event.all
  end

  private
    def event_params
      params.require(:event).permit(:name, :date, :description)
    end
end
