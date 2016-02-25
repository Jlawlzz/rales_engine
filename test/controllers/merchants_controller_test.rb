require 'test_helper'

class Api::V1::MerchantsControllerTest < ActionController::TestCase
  test '#index' do

    Merchant.create(name: 'guy')

    get :index, format: :json

    merchants = JSON.parse(response.body)
    merchant = merchants.last
    assert_response :success
    assert_equal 'guy', merchant['name']
  end

  test '#show' do

    m = Merchant.create(name: 'guy')

    get :show, format: :json, id: m.id

    merchant = JSON.parse(response.body)

    assert_response :success
    assert_equal 'guy', merchant['name']
  end


end
