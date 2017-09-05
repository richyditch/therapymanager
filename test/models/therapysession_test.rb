require 'test_helper'

class TherapysessionTest < ActiveSupport::TestCase
	# fixtures :therapysessions
  # test "the truth" do
  #   assert true
  # end

  def setup
    @current_therapy_sessions = Therapysession.count
  end

  test "must have client and therapist" do

    t = Therapysession.create
    refute t.valid?
    assert t.errors[:client]
    assert t.errors[:therapist]

    assert_equal @current_therapy_sessions, Therapysession.count
    # puts t.errors.inspect   #to 'see inside' an object    
  end

  test "should save happy path" do
    client = clients(:mad_mike)
    therapist = therapists(:sherene)

    t = Therapysession.create!(client: client, therapist: therapist, location: "test location", fee_pence: 123)
    assert_equal @current_therapy_sessions + 1, Therapysession.count
  end


  # test "therapysessions attributes must not be empty" do
  #   c = Client.new
  #   t = Therapist.new
  #   # i = Invoice.mew
  #   # ts = Therapysession.new(therapist_id: t.id, client_id: c.id)
  #   ts = Therapysession.new

  #   puts "here!!"

  #   assert ts.invalid?
  #   assert ts.errors[:client_id].any?
  #   assert ts.errors[:location].any?
  #   assert ts.errors[:fee_pence].any?
  # end

  # test "fee must be positive" do
  #   c = Client.new
  #   t = Therapist.new
  #   # i = Invoice.mew
  #   ts = Therapysession.new(therapist_id: t.id, client_id: c.id)

  #   ts.fee_pence = -1
  #   assert ts.invalid?
  #   assert_equal ["must be greater than or equal to 0.01"], ts.errors[:fee_pence]
    
  #   ts.fee_pence = 1000
  #   assert ts.valid?
  # end


end
