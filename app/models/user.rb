class User < ApplicationRecord
  has_many :bike_services, dependent: :destroy
end
