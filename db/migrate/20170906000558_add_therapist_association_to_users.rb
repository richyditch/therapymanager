class AddTherapistAssociationToUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :associated_therapist_id, :integer
  end
end
