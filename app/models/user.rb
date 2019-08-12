class User < ApplicationRecord
  has_many :attendances, foreign_key: 'participant_id'
  has_many :attended_events, :through => :attendances, :source => :event
  has_many :organized_events, foreign_key: 'organizor_id', class_name: 'Event', dependent: :destroy

  after_create :welcome_email

  def welcome_email
    UserMailer.welcome_email(self).deliver_now
  end


end
