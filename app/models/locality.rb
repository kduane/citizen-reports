class Locality < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :zip_code, presence: true
  has_many :issues
end
