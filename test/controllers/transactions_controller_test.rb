require 'test_helper'

class Api::V1::TransactionsControllerTest < ActionController::TestCase
  test '#index' do

    Transaction.create(credit_card_number: '1234',
                       result: 'success')

    get :index, format: :json

    transactions = JSON.parse(response.body)
    transaction = transactions.last
    assert_response :success
    assert_equal '1234', transaction['credit_card_number']
  end

  test '#show' do

    t = Transaction.create(credit_card_number: '1234',
                           result: 'success')

    get :show, format: :json, id: t.id

    transaction = JSON.parse(response.body)

    assert_response :success
    assert_equal '1234', transaction['credit_card_number']
    assert_equal 'success', transaction['result']
  end


end
