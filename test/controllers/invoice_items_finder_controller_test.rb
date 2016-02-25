require 'test_helper'

class Api::V1::InvoiceItems::FinderControllerTest < ActionController::TestCase

  test '#index' do

    invoiceitems = create_list(:invoice_item, 10)

        invoiceitems.count.times do |t|

          get :index, format: :json, unit_price: invoiceitems[t].unit_price

          invoiceitem = JSON.parse(response.body)

        assert_response :success
        assert_equal invoiceitems[t].unit_price, invoiceitem[0]['unit_price'].to_f
        assert_equal invoiceitems[t].quantity, invoiceitem[0]['quantity']

    end
  end

  test '#show' do

    c = create(:invoice_item)

    get :show, format: :json, unit_price: c.unit_price

    invoiceitem = JSON.parse(response.body)
    assert_response :success
    assert_equal c.unit_price, invoiceitem['unit_price'].to_f
    assert_equal c.quantity, invoiceitem['quantity']
  end


end
