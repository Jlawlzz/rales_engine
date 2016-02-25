require 'test_helper'

class Api::V1::Items::RandomControllerTest < ActionController::TestCase

  test '#show' do

    create_list(:item, 5)

    get :show, format: :json

    item = JSON.parse(response.body)
    assert_response :success
    assert_equal 7, item.count
    assert_equal Hash, item.class
  end

end
