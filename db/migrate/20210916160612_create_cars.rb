class CreateCars < ActiveRecord::Migration[6.1]
  def change
    create_table :cars do |t|
      t.string :name
      t.string :car_type
      t.string :car_model

      t.timestamps
    end
  end
end
