require 'test_helper'

class TherapysessionsControllerTest < ActionDispatch::IntegrationTest
  
  setup do
    @therapysession = therapysessions(:ts1)

    @update = {
      location: 'new location',
      fee_pence: 999
    }

    # @create = {
    #   client: clients(:mad_mike),
    #   therapist: therapists(:sherene),
    #   location: 'new location 2',
    #   fee_pence: 9999    
    # }

    @create = {
      client_id: clients(:mad_mike).id,
      therapist_id: therapists(:sherene).id,
      location: 'new location 2',
      fee_pence: 9999    
    }
  end

  test "should get index" do
    # puts "the url is #{therapysessions_url}"
    # puts "the path is #{therapysessions_path}"
    get therapysessions_url
    assert_response :success
  end

  test "should get new" do
    get new_therapysession_url
    assert_response :success
  end

  test "should create therapysession" do
    puts "about to create #{@create.inspect}"

    c1 = Therapysession.count

    # params: { address_book: { address_line1: @address_book.address_line1, address_line2: @address_book.address_line2, dob: @address_book.dob, name: @address_book.name, postcode: @address_book.postcode } }
    assert_difference('Therapysession.count') do
      # post therapysessions_url, params: { therapysession: { client_id: @create['client_id'], therapist_id: @create['therapist_id'], location: @create['location'], fee_pence: @create['fee_pence'] } }
      post therapysessions_url, params: { therapysession: @create }
    end

    c2 = Therapysession.count
    puts "old count = #{c1}, new count = #{c2}"
    
    # assert_redirected_to therapysession_url(Therapysession.last)
  end

  # test "should show therapysession" do
  #   get therapysession_url(@therapysession)
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get edit_therapysession_url(@therapysession)
  #   assert_response :success
  # end

  test "should update therapysession" do
    puts "current record: #{@therapysession.inspect}"

    patch therapysession_url(@therapysession), params: { therapysession: @update }

    tt = Therapysession.find(@therapysession.id)
    puts "updated record: #{tt.inspect}"

    assert_redirected_to therapysession_url(@therapysession)
  end

  # test "should destroy therapysession" do
  #   assert_difference('Therapysession.count', -1) do
  #     delete therapysession_url(@therapysession)
  #   end

  #   assert_redirected_to therapysessions_url
  # end
end
