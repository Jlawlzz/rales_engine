require 'test_helper'

class Api::V1::Merchants::FinderControllerTest < ActionController::TestCase

  test '#index' do

    merchants = create_list(:merchant, 10)

      merchants.count.times do |t|

        get :index, format: :json, name: merchants[t].name
        merchant = JSON.parse(response.body)

        assert_response :success
        assert_equal merchants[t].name, merchant[0]['name']

    end
  end

  test '#show' do

    c = create(:merchant)

    get :show, format: :json, name: c.name

    merchant = JSON.parse(response.body)
    assert_response :success
    assert_equal c.name, merchant['name']
  end


end
