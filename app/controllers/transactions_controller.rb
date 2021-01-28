class TransactionsController < ApplicationController
  before_action :authorize,only: [:new,:index]
  def index
      @transactions=current_user.transactions.all.order('created_at DESC')
  end
  def new
    @transaction= Transaction.new
  end
  def create
    @transaction=current_user.transactions.build(transaction_params)
    if @transaction.save
      flash[:notice]="transaction was succesffuly created"
      redirect_to transaction_path(current_user)
    else 
      flash.now[:danger] = 'error with some fields'
      render :new
    end
    
  end
  private
  def transaction_params
    params.require(:transaction).permit(:name,:amount,:group_id)
  end
end