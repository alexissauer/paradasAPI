class AddHasNotificationToParadaColectivo < ActiveRecord::Migration[7.1]
  def change
    add_column :parada_colectivos, :hasNotification, :boolean
  end
end
