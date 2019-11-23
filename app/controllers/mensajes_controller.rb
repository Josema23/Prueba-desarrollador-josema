class MensajesController < ApplicationController
  before_action :set_mensaje, only: [:show, :update, :destroy]

  # GET /mensajes
  def index
    @mensajes = Mensaje.all

    render json: @mensajes
  end

  # GET /mensajes/1
  def show
    render json: @mensaje
  end

  # POST /mensajes
  def create
    @mensaje = Mensaje.new(mensaje_params)

    if @mensaje.save
      render json: @mensaje, status: :created, location: @mensaje
    else
      render json: @mensaje.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /mensajes/1
  def update
    if @mensaje.update(mensaje_params)
      render json: @mensaje
    else
      render json: @mensaje.errors, status: :unprocessable_entity
    end
  end

  # DELETE /mensajes/1
  def destroy
    @mensaje.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mensaje
      @mensaje = Mensaje.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def mensaje_params
      params.require(:mensaje).permit(:cuerpo, :sala_id, :users_id)
    end
end
