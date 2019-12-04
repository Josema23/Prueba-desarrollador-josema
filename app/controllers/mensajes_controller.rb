class MensajesController < ApplicationController
  before_action :authorize_access_request!
  before_action :set_sala
  # before_action :set_mensaje, only: [:show, :update, :destroy]

  # GET /mensajes
  def index
    @mensaje = @sala.mensajes.desc('_id').limit(20)
    render json: @mensaje
    # render :json => {:mensajes => @mensaje, :user => @user }
  end

  # GET /mensajes/1
  def show
    render json: @mensaje
  end

  # POST /mensajes
  def create

    @mensaje = current_user.mensajes.build(mensaje_params)

    if @mensaje.save
      # ActionCable.server.broadcast "chat_#{params[:sala_id]}", message: @message
      ActionCable.server.broadcast "chat_", mensaje: @mensaje
      render json: @mensaje, status: :created
    else
      render json: @mensaje.errors, status: :unprocessable_entity
    end
  end

  # # PATCH/PUT /mensajes/1
  def update
    if @mensaje.update(mensaje_params)
      render json: @mensaje
    else
      render json: @mensaje.errors, status: :unprocessable_entity
    end
  end

  # # DELETE /mensajes/1
  def destroy
    @mensaje.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sala
      if params[:sala_id]
        @sala = Sala.find(params[:sala_id])
      end
    end

    # Only allow a trusted parameter "white list" through.
    def mensaje_params
      params.require(:mensaje).permit(:cuerpo, :sala_id)
    end
end
