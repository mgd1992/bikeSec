class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :nombre, null: false
      t.string :apellido, null: false
      t.string :telefono, null: false
      t.string :email, null: false

      t.timestamps
    end
  end
end
