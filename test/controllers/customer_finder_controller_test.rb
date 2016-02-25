require 'test_helper'

class Api::V1::Customers::FinderControllerTest < ActionController::TestCase

  test '#index' do

    customers = create_list(:customer, 10)

      customers.count.times do |t|
        get :index, format: :json, first_name: customers[t].first_name

        customer = JSON.parse(response.body)
        assert_response :success
        assert_equal customers[t].first_name, customer[0]['first_name']
        assert_equal customers[t].last_name, customer[0]['last_name']
    end
  end

  test '#show' do

    c = create(:customer)

    get :show, format: :json, first_name: c.first_name

    customer = JSON.parse(response.body)
    assert_response :success
    assert_equal c.first_name, customer['first_name']
    assert_equal c.last_name, customer['last_name']
  end


end
