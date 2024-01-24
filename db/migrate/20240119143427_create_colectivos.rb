class CreateColectivos < ActiveRecord::Migration[7.1]
  def change
    create_table :colectivos do |t|
      t.string :nombre
      t.boolean :isFavorito
      t.boolean :isAccesible
      t.string :lat
      t.string :long

      t.timestamps
    end
  end
end
