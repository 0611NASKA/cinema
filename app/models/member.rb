class Member < ApplicationRecord
  has_many :reservations, dependent: :destroy
end
