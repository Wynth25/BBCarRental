class Reservation < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :car, optional: true

  validates :user, presence: { message: "musí být vybrán ze seznamu" }
  validates :car, presence: { message: "musí být vybráno" }

  validates :start_date, presence: { message: "nemůže být prázdný" }
  validates :end_date, presence: { message: "nemůže být prázdný" }
  
  validate :end_date_after_start_date
  
  validate :car_must_be_available

  private
  
  def end_date_after_start_date
    return if start_date.blank? || end_date.blank?

    if end_date < start_date
      errors.add(:end_date, "musí být po datu začátku")
    end
  end

  def car_must_be_available
    return if start_date.blank? || end_date.blank? || car_id.blank?

    overlapping_reservations = Reservation.where(car_id: car_id)
    .where.not(id: id) 
    .where("start_date <= ? AND end_date >= ?", end_date, start_date)

    if overlapping_reservations.exists?
      errors.add(:base, "Bohužel, toto auto je ve vybraném termínu již zarezervováno.")
    end
  end
end