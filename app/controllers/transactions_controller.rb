class TransactionsController < ApplicationController
  before_action :authorize, only: %i[new index]
  def no_grp
    @transaction_nil = current_user.transactions.where(group_id: nil)
  end

  def index
    @transactions = current_user.transactions.includes(:group).where.not(group_id: nil).order('created_at DESC')
  end

  def new
    @transaction = Transaction.new
  end

  def show
    @transaction = Transaction.find_by(id: params[:id])
  end

  def create
    @transaction = current_user.transactions.build(transaction_params)
    if @transaction.save
      flash[:notice] = 'transaction was succesffuly created'
      redirect_to @transaction
    else
      flash.now[:danger] = 'error with some fields'
      render :new
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:name, :amount, :group_id)
  end
end
