require 'test_helper'

class Api::V1::Customers::RandomControllerTest < ActionController::TestCase

  test '#show' do

    create_list(:customer, 5)

    get :show, format: :json

    customer = JSON.parse(response.body)
    assert_response :success
    assert_equal 5, customer.count
    assert_equal Hash, customer.class
  end


end
