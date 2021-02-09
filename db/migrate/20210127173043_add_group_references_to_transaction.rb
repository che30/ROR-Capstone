class AddGroupReferencesToTransaction < ActiveRecord::Migration[6.1]
  def change
    add_reference :transactions, :group,  foreign_key: true
  end
end
