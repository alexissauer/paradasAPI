class ColectivoSerializer < ActiveModel::Serializer
  attributes :id, :nombre, :isFavorito, :isAccesible, :lat, :long
  has_many :parada_colectivos

  def parada_colectivos
    object.parada_colectivos.map do |parada_colectivo|
      parada = parada_colectivo.parada
      {
        id: parada_colectivo.id,
        parada_id: parada.id,
        nombre: parada.nombre,
        isFavorito: parada.isFavorito,
        lat: parada.lat,
        long: parada.long,
        tiempoRestante: parada_colectivo.tiempoRestante,
        hasNotification: parada_colectivo.hasNotification
      }
    end
  end
end