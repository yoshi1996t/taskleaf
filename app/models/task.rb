class Task < ApplicationRecord
  validates :name, presence: true, length: { maximum: 35 }
end
