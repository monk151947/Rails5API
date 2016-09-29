require "spec_helper"
require 'rails_helper'
require 'factory_girl_rails'

#Index
describe Api::V1::MerchantsController , :type => :api do
  describe "GET /v1/merchants" do
    it "returns all the merchants" do
      FactoryGirl.create_list(:merchant, 5)
      get 'v1/merchants'
      expect(last_response.status).to be(200)
      body = JSON.parse(last_response.body)
      expect(body.length).to eq(5)
    end
  end
end

#Show
describe Api::V1::MerchantsController , :type => :api do
  describe "GET /v1/merchants/:id" do
    it "returns the single merchant" do
      merchant = FactoryGirl.create(:merchant)
      get "v1/merchants/#{merchant.id}"
      expect(last_response.status).to be(200)
      body = JSON.parse(last_response.body)
      expect(body["name"]).to eq(merchant.name)
    end
  end
end

#create
describe Api::V1::MerchantsController , :type => :api do
  describe "GET /v1/merchants" do
    it "creates the merchants" do
      post 'v1/merchants', { name: "John", domain: "Garments" }, format: :json
      expect(last_response.status).to be(200)
      body = JSON.parse(last_response.body)
      expect(body["name"]).to eq("John")
    end
  end
end

#Update
describe Api::V1::MerchantsController , :type => :api do
  describe "GET /v1/merchants/:id" do
    it "update the merchants" do
      merchant = Merchant.last
      put "v1/merchants/#{merchant.id}", { name: "Johny", domain: "Textile"  }, format: :json
      expect(last_response.status).to be(200)
      body = JSON.parse(last_response.body)
      expect(body["name"]).to eq("Johny")
    end
  end
end

#Delete
describe Api::V1::MerchantsController , :type => :api do
  describe "GET /v1/merchants/:id" do
    it "Delete the merchant" do
      merchant = Merchant.last
      delete "v1/merchants/#{merchant.id}"
      expect(last_response.status).to be(200)
      body = last_response.body
      expect(body).to eq("Johny Deleted Successfully")
    end
  end
end
