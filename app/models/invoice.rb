class Invoice < ApplicationRecord
    has_many :therapysessions
    belongs_to :client
    
    validates :total_pence, numericality: {greater_than_or_equal_to: 0.01}

    # t.datetime "date_raised"
    # t.string   "description"
    # t.integer  "total_pence"
    # t.datetime "created_at",  null: false
    # t.datetime "updated_at",  null: false
end
