require 'test_helper'

class Api::V1::CustomersControllerTest < ActionController::TestCase
  test "should get index" do

    @controller = Api::V1::CustomersController.new

    Customer.create(first_name: 'jordan', last_name: 'lawler')
    Customer.create(first_name: 'nadroj', last_name: 'relwal')

    get '/api/v1/customers'

    binding.pry
    assert_response :success
  end


end
