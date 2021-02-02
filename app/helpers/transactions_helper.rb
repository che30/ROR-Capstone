module TransactionsHelper
  def sum_amount(transactions)
    sum = 0
    transactions&.each { |t| sum += t.amount }
    sum
  end
end
