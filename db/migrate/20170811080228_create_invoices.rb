class CreateInvoices < ActiveRecord::Migration[5.0]
  def change
    create_table :invoices do |t|
      t.belongs_to :client, index: true
      t.timestamp :date_raised
      t.string :description
      t.integer :total_pence 
      t.timestamps
    end
  end
end
