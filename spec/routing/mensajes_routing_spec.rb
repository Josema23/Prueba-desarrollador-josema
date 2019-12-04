require "rails_helper"

RSpec.describe MensajesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => '/mensajes/:sala_id').to route_to('mensajes#index')
    end

    # it "routes to #show" do
    #   expect(:get => "/mensajes/1").to route_to("mensajes#show", :id => "1")
    # end


    it "routes to #create" do
      expect(:post => "/mensajes").to route_to("mensajes#create")
    end

    # it "routes to #update via PUT" do
    #   expect(:put => "/mensajes/1").to route_to("mensajes#update", :id => "1")
    # end
    #
    # it "routes to #update via PATCH" do
    #   expect(:patch => "/mensajes/1").to route_to("mensajes#update", :id => "1")
    # end
    #
    # it "routes to #destroy" do
    #   expect(:delete => "/mensajes/1").to route_to("mensajes#destroy", :id => "1")
    # end
  end
end
