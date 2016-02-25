require 'test_helper'

class Api::V1::Merchants::CustomersControllerTest < ActionController::TestCase

  test '#index' do

    invoiceitem = create :invoice_item
    transaction = create(:transaction)
    transaction.update(result: 'failed')
    invoiceitem.invoice.transactions << transaction

    get :index, format: :json, merchant_id: invoiceitem.invoice.merchant.id

    answer = response.body
    assert_response :success
    assert_equal answer, [invoiceitem.invoice.customer].to_json
  end

  test '#show' do

    invoiceitem = create :invoice_item
    transaction = create(:transaction)
    invoiceitem.invoice.transactions << transaction

    get :show, format: :json, merchant_id: invoiceitem.invoice.merchant.id

    answer = response.body
    customer = invoiceitem.invoice.customer
    assert_equal answer, customer.to_json

  end


end
