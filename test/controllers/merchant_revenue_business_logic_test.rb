require 'test_helper'

class Api::V1::Merchants::RevenueControllerTest < ActionController::TestCase

  test '#index' do

    invoiceitem = create :invoice_item
    transaction = create(:transaction)
    invoiceitem.invoice.transactions << transaction

    get :index, format: :json, date: invoiceitem.invoice.created_at

    answer = JSON.parse(response.body)
    assert_response :success
    hash = {"total_revenue"=> answer['total_revenue'] }
    assert_equal hash, answer

  end

  test '#show' do

    invoiceitem = create :invoice_item
    transaction = create(:transaction)
    invoiceitem.invoice.transactions << transaction

    get :show, format: :json, merchant_id: invoiceitem.invoice.merchant.id

    answer = JSON.parse(response.body)
    assert_response :success
    quotent = (invoiceitem.quantity * invoiceitem.unit_price).to_f
    hash = {"revenue" => quotent.to_s}
    assert_equal hash, answer

  end


end
