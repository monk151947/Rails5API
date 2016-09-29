require "spec_helper"
require 'rails_helper'
require 'factory_girl_rails'

#Index
describe Api::V1::ConsumersController , :type => :api do
  describe "GET /v1/consumers" do
    it "returns all the consumers" do
      FactoryGirl.create_list(:consumer, 5)
      get 'v1/consumers'
      expect(last_response.status).to be(200)
      body = JSON.parse(last_response.body)
      expect(body.length).to eq(5)
    end
  end
end

#Show
describe Api::V1::ConsumersController , :type => :api do
  describe "GET /v1/consumers/:id" do
    it "returns the single consumer" do
      consumer = FactoryGirl.create(:consumer)
      get "v1/consumers/#{consumer.id}"
      expect(last_response.status).to be(200)
      body = JSON.parse(last_response.body)
      expect(body["firstname"]).to eq(consumer.firstname)
    end
  end
end

#create
describe Api::V1::ConsumersController , :type => :api do
  describe "GET /v1/consumers" do
    it "creates the consumers" do
      post 'v1/consumers', { firstname: "Amit", lastname: "Patil" }, format: :json
      expect(last_response.status).to be(200)
      body = JSON.parse(last_response.body)
      expect(body["firstname"]).to eq("Amit")
    end
  end
end

#Update
describe Api::V1::ConsumersController , :type => :api do
  describe "GET /v1/consumers/:id" do
    it "update the consumers" do
      consumer = Consumer.last
      put "v1/consumers/#{consumer.id}", { firstname: "AmitKumar", lastname: "PatilP" }, format: :json
      expect(last_response.status).to be(200)
      body = JSON.parse(last_response.body)
      expect(body["firstname"]).to eq("AmitKumar")
    end
  end
end

#Delete
describe Api::V1::ConsumersController , :type => :api do
  describe "GET /v1/consumers/:id" do
    it "Delete the consumer" do
      consumer = Consumer.last
      delete "v1/consumers/#{consumer.id}"
      expect(last_response.status).to be(200)
      body = last_response.body
      expect(body).to eq("AmitKumar Deleted Successfully")
    end
  end
end
