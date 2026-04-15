class User < ApplicationRecord
  has_many :reservations, dependent: :restrict_with_error
  validates :name, 
            presence: { message: "nemůže být prázdné" }, 
            uniqueness: { message: "již existuje, zvolte prosím jiné" }

  validates :email, 
            presence: { message: "nemůže být prázdný" }, 
            uniqueness: { message: "již je v systému zaregistrován" }
end