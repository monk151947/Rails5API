module Api::V1
  class MerchantsController < ApiController
    before_action :set_merchant, only: [:show, :edit]

    def index
      render json: Merchant.all
    end

    def show
    end

    def new
      @merchant = Merchant.new
    end

    def edit
    end

    def create
      @merchant = Merchant.new(merchant_params)
      if @merchant.save
        render json: @merchant
      else
        render json: @merchant.errors, status: :unprocessable_entity
      end
    end

    def update
      @merchant = Merchant.find(params[:id])
      if @merchant.update(merchant_params)
        render json: @merchant
      else
        render json: @merchant.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @merchant = Merchant.find(params[:id])
      @merchant.destroy
      render json: "#{@merchant.name} Deleted Successfully"
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_merchant
      render json: Merchant.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def merchant_params
        params.permit(:name, :domain)
      end
  end
end