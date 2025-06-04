class CreateBikeServices < ActiveRecord::Migration[7.1]
  def change
    create_table :bike_services do |t|
      t.references :user, null: false, foreign_key: true
      t.string :descripcion, null: false
      t.date :date, null: false
      t.decimal :cost

      t.timestamps
    end
  end
end
