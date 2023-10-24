class AddaddresstoCustomer < ActiveRecord::Migration[7.0]
  def change
    add_column :customers, :address, :jsonb, default:{city:"",country:"",state:"",line1:"",postal_code:""}
  end
end
