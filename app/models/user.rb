class User < ActiveRecord::Base
has_many :events, :foreign_key => 'host_id'
has_many :event_users, through: :events
#has_many :events
#Now add the association between the event attendee (also a User) and the event. Call this user the "attendee". Call the event the "attended_event". You'll again need to juggle specially named foreign keys and classes and sources.

  # def hosted_events
  #   events.joins(:users).where('host_id = ?', self.id)
  # end
end
