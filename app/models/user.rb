class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :attendances, foreign_key: 'participant_id'
  has_many :attended_events, :through => :attendances, :source => :event
  has_many :organized_events, foreign_key: 'organizor_id', class_name: 'Event', dependent: :destroy


  # after_create :welcome_email
  #
  # def welcome_email
  #   Devise::Mailer.confirmation_instructions(self, :confirmation_instructions, opts={}).deliver_now
  # end

end
