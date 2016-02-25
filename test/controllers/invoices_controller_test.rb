require 'test_helper'

class Api::V1::InvoicesControllerTest < ActionController::TestCase
  test '#index' do

    Invoice.create(status: 'success')

    get :index, format: :json

    invoices = JSON.parse(response.body)
    invoice = invoices.last
    assert_response :success
    assert_equal 'success', invoice['status']
  end

  test '#show' do

    i = Invoice.create(status: 'success')

    get :show, format: :json, id: i.id

    invoice = JSON.parse(response.body)

    assert_response :success
    assert_equal 'success', invoice['status']
  end


end
