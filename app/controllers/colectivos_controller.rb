class ColectivosController < ApplicationController
  before_action :set_colectivo, only: %i[ show update destroy add_parada delete_parada ]

  # GET /colectivos
  def index
    @colectivos = Colectivo.all

    render json: @colectivos
  end

  # GET /colectivos/1
  def show
    render json: @colectivo
  end

  # POST /colectivos
  def create
    @colectivo = Colectivo.new(colectivo_params)

    if @colectivo.save
      render json: @colectivo, status: :created, location: @colectivo
    else
      render json: @colectivo.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /colectivos/1
  def update
    if @colectivo.update(colectivo_params)
      render json: @colectivo
    else
      render json: @colectivo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /colectivos/1
  def destroy
    @colectivo.destroy!
  end

  def add_parada
    parada_id = params[:parada_id]
    tiempo_restante = params[:tiempo_restante]
  
    # Asegúrate de que la parada exista
    parada = Parada.find_by(id: parada_id)
    if(parada.nil?)
      render json: {error: "La parada no existe"}, status: 404
      return
    end
  
    paradaColectivo = ParadaColectivo.new
    paradaColectivo.parada = parada
    paradaColectivo.colectivo = @colectivo
    paradaColectivo.tiempoRestante = tiempo_restante
    paradaColectivo.hasNotification = false
  
    if paradaColectivo.save
      # Include associated parada_colectivos when fetching @colectivo
      @colectivo = Colectivo.includes(:parada_colectivos).find(@colectivo.id)
      render json: @colectivo
    else
      render json:{error:"Ha ocurrido un error"}, status: 500
    end
  end
  
  def delete_parada
    parada_id = params[:parada_id]
  
    # Find and destroy all ParadaColectivo records with the given parada_id
    parada_colectivos = @colectivo.parada_colectivos.where(parada_id: parada_id)
    
    if parada_colectivos.present?
      parada_colectivos.destroy_all
      render json: @colectivo
    else
      render json: { error: "No se encontraron relaciones entre el colectivo y la parada" }, status: 404
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_colectivo
      @colectivo = Colectivo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def colectivo_params
      params.permit(:nombre, :isFavorito, :isAccesible, :lat, :long)
    end
end
