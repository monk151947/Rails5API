require "rails_helper"

RSpec.describe ConsumersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/v1/consumers").to route_to("consumers#index")
    end

    it "routes to #new" do
      expect(:get => "/v1/consumers/new").to route_to("consumers#new")
    end

    it "routes to #show" do
      expect(:get => "/v1/consumers/1").to route_to("consumers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/v1/consumers/1/edit").to route_to("consumers#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/v1/consumers").to route_to("consumers#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/v1/consumers/1").to route_to("consumers#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/v1/consumers/1").to route_to("consumers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/v1/consumers/1").to route_to("consumers#destroy", :id => "1")
    end

  end
end
