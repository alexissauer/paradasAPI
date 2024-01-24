class CreateParadaColectivos < ActiveRecord::Migration[7.1]
  def change
    create_table :parada_colectivos do |t|
      t.references :parada, null: false, foreign_key: true
      t.references :colectivo, null: false, foreign_key: true
      t.integer :tiempoRestante

      t.timestamps
    end
  end
end
