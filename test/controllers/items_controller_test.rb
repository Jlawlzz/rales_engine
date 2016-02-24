require 'test_helper'

class Api::V1::ItemsControllerTest < ActionController::TestCase
  test '#index' do

    Item.create(name: 'guy',
                description: 'thing')

    get :index, format: :json

    items = JSON.parse(response.body)
    item = items.last
    assert_response :success
    assert_equal 'guy', item['name']
    assert_equal 'thing', item['description']
  end

  test '#show' do

    i = Item.create(name: 'guy',
                description: 'thing')

    get :show, format: :json, id: i.id

    item = JSON.parse(response.body)

    assert_response :success
    assert_equal 'guy', item['name']
    assert_equal 'thing', item['description']
  end


end
