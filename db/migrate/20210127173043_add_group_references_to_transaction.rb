class AddGroupReferencesToTransaction < ActiveRecord::Migration[6.1]
  def change
    add_reference :transactions, :group, null: false, foreign_key: true
  end
end
