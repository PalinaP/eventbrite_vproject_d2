class Event < ApplicationRecord

  has_many :attendances, dependent: :destroy
  has_many :participants, foreign_key: 'participant_id', class_name: 'User', through: :attendances
  belongs_to :organizor, class_name: "User"


  validates :start_date, presence: true
  validate :start_date_not_in_the_past

  def start_date_not_in_the_past
    if start_date < Date.today
      errors.add(:start_date, "cannot be in the past")
    end
  end

  validates :duration, presence: true
  validate :duration_multiple_of_5

  def duration_multiple_of_5
    if duration < 0 || (duration%5 != 0)
      errors.add(:duration, "must be a positive integer and a multiple of 5")
    end
  end

  validates :title, presence: true, length: { in: 5..140 }
  validates :description, presence: true, length: { in: 20..1000 }
  validates :price, presence: true
  validate :price_range

  def price_range
    if self.price < 1 || self.price > 1000
      errors.add(:price, "must be between 1€ and 1000€")
    end
  end

  validates :location, presence: true

end
