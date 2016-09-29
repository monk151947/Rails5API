module Api::V1
  class ConsumersController < ApiController
    before_action :set_consumer, only: [:show, :edit]

    def index
      render json: Consumer.all
    end

    def show
    end

    def new
      @consumer = Consumer.new
    end


    def edit
    end

    def create
      @consumer = Consumer.new(consumer_params)
      if @consumer.save
         render json: @consumer
      else
         render json: @consumer.errors, status: :unprocessable_entity
      end
    end

    def update
      @consumer = Consumer.find(params[:id])
      if @consumer.update(consumer_params)
        render  json: @consumer
      else
        render json: @consumer.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @consumer = Consumer.find(params[:id])
      @consumer.destroy
      render json: "#{@consumer.firstname} Deleted Successfully"
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_consumer
        render json: Consumer.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def consumer_params
        params.permit(:firstname, :lastname)
      end
  end
end
