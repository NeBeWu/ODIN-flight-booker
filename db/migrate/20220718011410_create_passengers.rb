class CreatePassengers < ActiveRecord::Migration[7.0]
  def change
    create_table :passengers do |t|
      t.text :name
      t.text :email
      t.references :booking, null: false, foreign_key: { to_table: :bookings }

      t.timestamps
    end
  end
end
