class Movie < ApplicationRecord
  has_many :schedules
  has_one_attached :movie_picture
  attribute :new_movie_picture

  validates :title, presence: true
  validates :explanation, presence: true
  validates :screening_time, presence: true,
  numericality: {only_integer: true, greater_than_or_equal_to: 1 }

  scope :visible, -> do
    now = Time.current

    where("released_at <= ?", now)
      .where("expired_at >= ? OR expired_at IS NULL", now)
  end

  validate do
    if expired_at && expired_at < released_at
      errors.add(:expired_at, "は公開開始日時より新しい日時にしてください。")
    end
  end

  class << self
    def search(query)
      rel = order("id")
      if query.present?
        rel = rel.where("title LIKE ?","%#{query}%")
      end
      rel
    end
  end

  before_save do
    if new_movie_picture
      self.movie_picture = new_movie_picture
    end
  end

  scope :visible, -> do
    now = Time.current

    where("released_at <= ?", now)
      .where("expired_at > ? OR expired_at IS NULL", now)
  end

  def no_expiration
    expired_at.nil?
  end

  def no_expiration=(val)
    @no_expiration = val.in?([true, "1"])
  end

  before_validation do
    self.expired_at = nil if @no_expiration
  end

  validate do
    if expired_at && expired_at < released_at
      errors.add(:expired_at, :expired_at_too_old)
    end
  end
end
