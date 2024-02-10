# app/serializers/parada_serializer.rb
class ParadaSerializer < ActiveModel::Serializer
  attributes :id, :nombre, :isFavorito, :lat, :long
  has_many :parada_colectivos

  def parada_colectivos
    object.parada_colectivos.map do |parada_colectivo|
      colectivo = parada_colectivo.colectivo

      {
        id: parada_colectivo.id,
        colectivo_id: colectivo.id,
        nombre: colectivo.nombre,
        isFavorito: colectivo.isFavorito,
        isAccesible: colectivo.isAccesible,
        lat: colectivo.lat,
        long: colectivo.long,
        tiempoRestante: parada_colectivo.tiempoRestante,
        hasNotification: parada_colectivo.hasNotification
      }
    end
  end
end
