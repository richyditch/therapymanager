class CreateTherapists < ActiveRecord::Migration[5.0]
  def change
    create_table :therapists do |t|
   		t.text :therapist_name
  		t.text :default_location
  		t.integer :default_rate_pence
    end
  end
end
