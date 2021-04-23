class Place < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy

  validates :name, presence: true
  validates :lat, presence: true
  validates :lng, presence: true

  acts_as_mappable :lat_column_name => :lat,
                   :lng_column_name => :lng
end
