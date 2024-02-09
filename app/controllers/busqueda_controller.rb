class BusquedaController < ApplicationController
    def all_resources_by_name
        paradas = Parada.where("nombre LIKE ?", "%#{params[:nombre]}%").order(:nombre).select("id, nombre, lat, long,isFavorito").map do |parada|
          {
            id: parada.id,
            nombre: parada.nombre,
            lat: parada.lat,
            long: parada.long,
            isFavorito: parada.isFavorito,
            isParada: true,
            isColectivo: false
          }
        end
      
        colectivos = Colectivo.where("nombre LIKE ?", "%#{params[:nombre]}%").order(:nombre).select("id, nombre, lat, long,isFavorito,isAccesible").map do |colectivo|
          {
            id: colectivo.id,
            nombre: colectivo.nombre,
            lat: colectivo.lat,
            long: colectivo.long,
            isFavorito: colectivo.isFavorito,
            isAccesible: colectivo.isAccesible,
            isParada: false,
            isColectivo: true
          }
        end
      
        all_resources = paradas + colectivos
        all_resources.sort_by! { |resource| [resource[:isFavorito] ? 0 : 1, resource[:nombre]] }

      
        render json: all_resources
      end
end
