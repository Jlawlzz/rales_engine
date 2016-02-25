require 'test_helper'

class Api::V1::Items::FinderControllerTest < ActionController::TestCase

  test '#index' do

    items = create_list(:item, 10)

      items.count.times do |t|
        get :index, format: :json, name: items[t].name

        item = JSON.parse(response.body)
        assert_response :success
        assert_equal items[t].name, item[0]['name']
        assert_equal items[t].description, item[0]['description']
    end
  end

  test '#show' do

    c = create(:item)

    get :show, format: :json, name: c.name

    item = JSON.parse(response.body)
    assert_response :success
    assert_equal c.name, item['name']
    assert_equal c.description, item['description']
  end


end
