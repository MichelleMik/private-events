class Event < ActiveRecord::Base
  belongs_to :host, :class_name => "User", :foreign_key => 'host_id'
  has_many :event_users
  has_many :guests, :class_name => "User", :through => :event_users
end
