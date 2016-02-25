require 'test_helper'

class Api::V1::Customers::FinderControllerTest < ActionController::TestCase

  test '#index' do

    customers = create_list(:customers, 10)

      customers.count.times do |t|
        get :index, format: :json, first_name: "#{n} first_name"

        customer = JSON.parse(response.body)
        assert_response :success
        assert_equal customers[t].value, customers[t]
    end
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
