module Api::V1
  class TransactionsController < ApiController
  before_action :set_transaction, only: [:show, :edit]


  def index
    render json: Transaction.all
  end

  def show
  end

  def new
    @transaction = Transaction.new
  end


  def edit
  end

  def create
    @transaction = Transaction.new(transaction_params)
    if @transaction.save
      render json: @transaction
    else
      render json: @transaction.errors, status: :unprocessable_entity
    end
  end

  def update
    @transaction = Transaction.find(params[:id])
    if @transaction.update(transaction_params)
      render json: @transaction
    else
      render json: @transaction.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @transaction = Transaction.find(params[:id])
    @transaction.destroy
    render json: "Transaction Id: #{@transaction.id} Deleted Successfully"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      render json: Transaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_params
      params.permit(:consumer_id, :merchant_id, :sale_amount, :date)
    end
  end
 end
