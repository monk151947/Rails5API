require "spec_helper"
require 'rails_helper'
require 'factory_girl_rails'

RSpec.describe WelcomeController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response.status).to be(200)
    end

    it "returns the distance between two zipcodes" do
      get :index , { zipecode1: 41101, zipecode2: 41105 }, format: :json
      expect(response.status).to be(200)
      body = response.body
      expect(response.status).to be(200)
    end
  end

end
