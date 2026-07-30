class Car < ApplicationRecord
    has_many :reservations
    has_many :users, through: :reservations
    validates :brand, uniqueness: { scope: [:name, :year] }
end
