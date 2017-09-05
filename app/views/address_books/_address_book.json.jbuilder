json.extract! address_book, :id, :name, :dob, :address_line1, :address_line2, :postcode, :created_at, :updated_at
json.url address_book_url(address_book, format: :json)
