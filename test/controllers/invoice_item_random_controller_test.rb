require 'test_helper'

class Api::V1::InvoiceItems::RandomControllerTest < ActionController::TestCase

  test '#show' do

    create_list(:invoice_item, 5)

    get :show, format: :json

    invoice_item = JSON.parse(response.body)
    assert_response :success
    assert_equal 7, invoice_item.count
    assert_equal Hash, invoice_item.class
  end


end
