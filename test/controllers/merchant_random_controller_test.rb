require 'test_helper'

class Api::V1::Merchants::RandomControllerTest < ActionController::TestCase

  test '#show' do

    create_list(:merchant, 5)

    get :show, format: :json

    merchant = JSON.parse(response.body)
    assert_response :success
    assert_equal 4, merchant.count
    assert_equal Hash, merchant.class
  end


end
