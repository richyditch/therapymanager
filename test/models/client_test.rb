require 'test_helper'

class ClientTest < ActiveSupport::TestCase
  test "should enforce validations" do
  	assert_raises (ActiveRecord::RecordInvalid){
  		Client.create!
  	}
  	assert_raises (ActiveRecord::RecordInvalid){
  		Client.create!(client_name: "hello", default_rate_pence: 0.0001)
  	}
  	assert_nothing_raised (ActiveRecord::RecordInvalid){
  		Client.create!(client_name: "hello")
  	}
  	assert_nothing_raised {
  		Client.create!(client_name: "hello", default_rate_pence: 0.1)
  	}


  end
end
