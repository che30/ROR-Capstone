module TransactionsHelper
  def sum_amount(transactions)
    sum = 0
    if transactions
      transactions.each { |t| sum += t.amount }
    end
    sum
  end
end
