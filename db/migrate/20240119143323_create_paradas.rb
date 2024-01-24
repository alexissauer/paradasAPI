class CreateParadas < ActiveRecord::Migration[7.1]
  def change
    create_table :paradas do |t|
      t.string :nombre
      t.boolean :isFavorito
      t.string :lat
      t.string :long

      t.timestamps
    end
  end
end
