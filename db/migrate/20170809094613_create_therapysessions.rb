class CreateTherapysessions < ActiveRecord::Migration[5.0]
  def change
    create_table :therapysessions do |t|
    	# t.integer :client_id
    	# t.integer :therapist_id

      t.belongs_to :client, index: true
      t.belongs_to :therapist, index: true
      t.belongs_to :invoice, index: true, optional: true
      
    	t.datetime :session_started_at
    	t.integer :session_duration_minutes, {:default => 50}
    	t.text :location
    	t.integer :fee_pence
    	t.boolean :new_client_assessment, {:default => false}
    	t.boolean :attendance, {:default => true}
      t.timestamps
    end
  end
end
