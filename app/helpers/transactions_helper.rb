module TransactionsHelper
  def sum_amount(transactions)
    sum=0
    if current_user.transactions
      current_user.transactions.each {|t| sum=sum+t.amount}
    end
    sum
  end
end
