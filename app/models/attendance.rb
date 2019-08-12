class Attendance < ApplicationRecord
  belongs_to :event
  belongs_to :participant, class_name: 'User'

  after_create :attendance_confirmation_email

  def attendance_confirmation_email
    UserMailer.attendance_confirmation_email(self.participant, self.event).deliver_now
  end

end
