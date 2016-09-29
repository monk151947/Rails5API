require "rails_helper"

RSpec.describe MerchantsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/v1/merchants").to route_to("merchants#index")
    end

    it "routes to #new" do
      expect(:get => "/v1/merchants/new").to route_to("merchants#new")
    end

    it "routes to #show" do
      expect(:get => "/v1/merchants/1").to route_to("merchants#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/v1/merchants/1/edit").to route_to("merchants#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/v1/merchants").to route_to("merchants#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/v1/merchants/1").to route_to("merchants#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/v1/merchants/1").to route_to("merchants#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/v1/merchants/1").to route_to("merchants#destroy", :id => "1")
    end

  end
end
