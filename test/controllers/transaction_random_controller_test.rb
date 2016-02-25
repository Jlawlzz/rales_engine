require 'test_helper'

class Api::V1::Transactions::RandomControllerTest < ActionController::TestCase

  test '#show' do

    create_list(:transaction, 5)

    get :show, format: :json

    transaction = JSON.parse(response.body)
    assert_response :success
    assert_equal 6, transaction.count
    assert_equal Hash, transaction.class
  end


end
