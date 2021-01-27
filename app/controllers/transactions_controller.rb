class TransactionsController < ApplicationController
  def index
    @transactions=Transaction.all
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