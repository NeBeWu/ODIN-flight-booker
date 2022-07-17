class RenameFlightAttributes < ActiveRecord::Migration[7.0]
  def change
    change_table :flights do |t|
      t.rename :departure_id, :departure_airport_id
      t.rename :arrival_id, :arrival_airport_id
      t.rename :duration, :duration_interval
    end
  end
end
