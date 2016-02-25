require 'test_helper'

class Api::V1::Invoices::RandomControllerTest < ActionController::TestCase

  test '#show' do

    create_list(:invoice, 5)

    get :show, format: :json

    invoice = JSON.parse(response.body)
    assert_response :success
    assert_equal 6, invoice.count
    assert_equal Hash, invoice.class
  end


end
