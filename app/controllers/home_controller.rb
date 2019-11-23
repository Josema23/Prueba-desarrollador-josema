class HomeController < ActionController::API
  def index
    @salas = Sala.all
    render json: @salas
  end
end
