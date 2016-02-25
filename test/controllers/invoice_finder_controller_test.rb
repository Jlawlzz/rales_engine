require 'test_helper'

class Api::V1::Invoices::FinderControllerTest < ActionController::TestCase

  test '#index' do

    invoices = create_list(:invoice, 10)

        invoices.count.times do |t|

          get :index, format: :json, status: invoices[t].status

          invoice = JSON.parse(response.body)

        assert_response :success
        assert_equal invoices[t].status, invoice[0]['status']
    end
  end

  test '#show' do

    c = create(:invoice)

    get :show, format: :json, status: c.status

    invoice = JSON.parse(response.body)
    assert_response :success
    assert_equal c.status, invoice['status']
  end


end
