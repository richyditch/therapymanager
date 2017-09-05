class CreateClients < ActiveRecord::Migration[5.0]
  def change
  	
  	create_table :clients do |t|
  		t.text :client_name
  		t.integer :default_rate_pence
  	end

  end
end
