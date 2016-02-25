require 'test_helper'

class Api::V1::Customers::FavoriteMerchantControllerTest < ActionController::TestCase

  test '#show' do

    invoiceitem = create :invoice_item
    invoiceitem.invoice.transactions << create(:transaction)

    get :show, format: :json, customer_id: invoiceitem.invoice.customer.id

    answer = JSON.parse(response.body)
    assert_response :success
    assert_equal invoiceitem.invoice.merchant.name, answer['name']
  end


end
