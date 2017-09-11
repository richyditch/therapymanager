class Therapysession < ApplicationRecord
	attr_reader :default_fee_type

    belongs_to :invoice, optional: true
    belongs_to :therapist
    belongs_to :client

    validates :location, presence: true
	validates :fee_pence, presence: true
    validates :fee_pence, numericality: {greater_than_or_equal_to: 0.01}, allow_nil: true

    # t.integer  "client_id"
    # t.integer  "invoice_id"
    # t.datetime "session_started_at"
    # t.integer  "session_duration_minutes", default: 50
    # t.text     "location"
    # t.integer  "fee_pence"
    # t.boolean  "new_client_assessment",    default: false
    # t.boolean  "did_not_attend",           default: true
    # t.datetime "created_at",                               null: false
    # t.datetime "updated_at",

    def fee_in_pounds
        fee_pence / 100
    end          

    def default_location_on_new
        if therapist
            therapist.default_location
        end
    end

    def default_fee_pence_on_new
        if client
            @default_fee_type = "agreed client fee"
            client.default_rate_pence
        elsif therapist
            @default_fee_type = "standard therapist rate"
            therapist.default_rate_pence
        else
            @default_fee_type = ""
        end
    end
end
