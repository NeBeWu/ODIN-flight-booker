class CreateAirports < ActiveRecord::Migration[7.0]
  def change
    create_table :airports do |t|
      t.text :city
      t.text :location
      t.text :code

      t.timestamps
    end
  end
end
