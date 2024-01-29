class ParadasController < ApplicationController
  before_action :set_parada, only: %i[ show update destroy ]

  # GET /paradas
  def index
    @paradas = Parada.all

    @paradas = @paradas.where(isFavorito:params[:isFavorito]) if params[:isFavorito].present?

    render json: @paradas
  end

  # GET /paradas/1
  def show
    render json: @parada
  end

  # POST /paradas
  def create
    @parada = Parada.new(parada_params)

    if @parada.save
      render json: @parada, status: :created, location: @parada
    else
      render json: @parada.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /paradas/1
  def update
    if @parada.update(parada_params)
      render json: @parada
    else
      render json: @parada.errors, status: :unprocessable_entity
    end
  end

  # DELETE /paradas/1
  def destroy
    @parada.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parada
      @parada = Parada.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def parada_params
      params.require(:parada).permit(:nombre, :isFavorito, :lat, :long)
    end
end
