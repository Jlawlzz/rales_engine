require 'test_helper'

class Api::V1::InvoiceItemsControllerTest < ActionController::TestCase

  test '#index' do

    items = create_list(:invoice_item, 3)

    get :index, format: :json

    invoiceitems = JSON.parse(response.body)
    assert_response :success
    assert_equal invoiceitems.last['quantity'], items.last.quantity
  end

  test '#show' do

    i = create(:invoice_item)

    get :show, format: :json, id: i.id

    invoiceitem = JSON.parse(response.body)
    assert_response :success
    assert_equal i.quantity, invoiceitem['quantity']
  end


end
