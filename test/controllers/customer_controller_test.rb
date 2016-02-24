require 'test_helper'

class Api::V1::CustomersControllerTest < ActionController::TestCase
  test '#index' do

    Customer.create(first_name: 'guy',
                    last_name: 'person')

    get :index, format: :json

    customers = JSON.parse(response.body)
    first_customer = customers.last
    assert_response :success
    assert_equal 'guy', first_customer['first_name']
    assert_equal 'person', first_customer['last_name']
  end

  test '#show' do

    c = Customer.create(first_name: 'guy',
                    last_name: 'person')

    get :show, format: :json, id: c.id

    customer = JSON.parse(response.body)
    assert_response :success
    assert_equal 'guy', customer['first_name']
    assert_equal 'person', customer['last_name']
  end


end
