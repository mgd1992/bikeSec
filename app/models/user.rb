class User < ApplicationRecord
  has_many :bike_services, dependent: :destroy

  validates :nombre, :apellido, presence: true
  validates :email, uniqueness: true, presence: true
  validates :telefono, format: { with: /\A(\+34|0034|34)?[6789]\d{8}\z/, message: "no es un número de teléfono válido" }


end
