class AddDetailsToPayment < ActiveRecord::Migration[7.0]
  def change
    add_column :payments, :name, :string
    add_column :payments, :totalPrice, :integer
    add_column :payments, :email, :string
    add_column :payments, :address, :jsonb, default:{city:"",country:"",state:"",line1:"",postal_code:""}
    add_column :payments, :client_secret, :string

  end
end
