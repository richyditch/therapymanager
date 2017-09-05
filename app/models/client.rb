class Client < ApplicationRecord
	has_many :therapysessions
  	has_many :therapists, through: :therapysessions
  	has_many :invoices, through: :therapysessions
 


	validates :client_name, presence: true
	validates :default_rate_pence, numericality: {greater_than_or_equal_to: 0.01}, allow_nil: true

	# t.text :client_name
	# t.integer :default_rate_pence

	def default_rate_in_pounds
        default_rate_pence / 100
    end   
end
