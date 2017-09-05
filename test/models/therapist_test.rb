require 'test_helper'

class TherapistTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  # todo validation tests

  test "can get invoices" do
  	i1 = invoices(:one)    #accessor method for fixtures
  	assert_equal "mad mike", i1.client.client_name
  end

  test "therapists have invoices" do
  	t1 = therapists(:sherene)
  	refute_equal 0, t1.invoices.count
  end

end
