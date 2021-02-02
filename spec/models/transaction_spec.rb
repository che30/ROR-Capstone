require 'rails_helper'

RSpec.describe Transaction, type: :model do
  let(:user) { User.create(username: 'User') }
  let(:group) { user.groups.create(name: 'abc', icon: 'cde') }
  let(:transaction) { user.transactions.create(name: 'Transaction', amount: 0.50, group_id: group.id) }
  context 'testing transaction controller methods ' do
    it 'creates a new transaction' do
      expect(transaction.valid?).to eq(true)
    end
    it "doesn't create a transaction with an empty name, amount or description" do
      transaction1 = user.transactions.create(name: '',
                                              amount: nil,
                                              group_id: group.id)
      expect(transaction1.valid?).to eq false
    end
    it 'creates a transaction only if the name is unique' do
      transaction2 = user.transactions.create(name: transaction.name.to_s,
                                              amount: 1.50,
                                              group_id: group.id)
      expect(transaction2.valid?).to eq false
    end
    it 'creates a transaction not needing to belong to a group' do
      expect(transaction.group_id.nil? & transaction.valid?).to eq false
    end
  end
end
