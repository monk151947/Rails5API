require "spec_helper"
require 'rails_helper'
require 'factory_girl_rails'

#Index
describe Api::V1::TransactionsController , :type => :api do
  before(:each) do
       @consumer = FactoryGirl.create(:consumer)
       @merchant = FactoryGirl.create(:merchant)
       @transaction = FactoryGirl.create(:transaction, consumer_id: @consumer.id, merchant_id: @merchant.id, sale_amount: 300, date: Time.now)
  end
  describe "GET /v1/transactions" do
    it "returns all the transactions" do
      FactoryGirl.create(:transaction, consumer_id: @consumer.id, merchant_id: @merchant.id, sale_amount: 500, date: Time.now)
      get 'v1/transactions'
      expect(last_response.status).to be(200)
      body = JSON.parse(last_response.body)
      expect(body.length).to eq(2)
    end
  end

#Show
  describe "GET /v1/transactions/:id" do
    it "returns the single transaction" do
      get "v1/transactions/#{@transaction.id}"
      expect(last_response.status).to be(200)
      body = JSON.parse(last_response.body)
      expect(body["sale_amount"].to_s).to eq(@transaction.sale_amount.to_s)
    end
  end


#create
  describe "GET /v1/transactions" do
    it "creates the transactions" do
      post 'v1/transactions', {  consumer_id: @consumer.id, merchant_id: @merchant.id, sale_amount: 1000, date: Time.now }, format: :json
      expect(last_response.status).to be(200)
      body = JSON.parse(last_response.body)
      expect(body["sale_amount"]).to eq("1000.0")
    end
  end

#Update
  describe "GET /v1/transactions/:id" do
    it "update the transactions" do
      put "v1/transactions/#{@transaction.id}", { consumer_id: @consumer.id, merchant_id: @merchant.id, sale_amount: 2000, date: Time.now   }, format: :json
      expect(last_response.status).to be(200)
      body = JSON.parse(last_response.body)
      expect(body["sale_amount"]).to eq("2000.0")
    end
  end

#Delete
  describe "GET /v1/transactions/:id" do
    it "Delete the transaction" do
      delete "v1/transactions/#{@transaction.id}"
      expect(last_response.status).to be(200)
      body = last_response.body
      expect(body).to eq("Transaction Id: #{@transaction.id} Deleted Successfully")
    end
  end
end
