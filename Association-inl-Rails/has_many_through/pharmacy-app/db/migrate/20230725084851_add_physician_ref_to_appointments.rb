class AddPhysicianRefToAppointments < ActiveRecord::Migration[7.0]
  def change
    add_reference :appointments, :physician, null: false, foreign_key: true
  end
end
