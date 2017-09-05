class CreateAddressBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :address_books do |t|
      t.text :name
      t.date :dob
      t.text :address_line1
      t.text :address_line2
      t.text :postcode

      t.timestamps
    end
  end
end
