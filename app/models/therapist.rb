class Therapist < ApplicationRecord
	has_many :therapysessions
  	has_many :clients, through: :therapysessions
	has_many :invoices, through: :therapysessions
  	
  	validates :therapist_name, presence: true

	# t.text :therapist_name
	# t.text :default_location
	# t.integer :default_rate_pence

	def default_rate_in_pounds
        default_rate_pence / 100
    end

end
