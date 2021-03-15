class Appointment < ApplicationRecord
  belongs_to :user
  scope :future, -> { where('date >= ?', DateTime.now) }

  validate :valid_appointment_slot, on: [:create, :update]

  def valid_appointment_slot
    Appointment.future.where('date = ?', date.hour).count <= 5
  end
end
