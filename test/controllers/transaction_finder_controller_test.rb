require 'test_helper'

class Api::V1::Transactions::FinderControllerTest < ActionController::TestCase

  test '#index' do

    transactions = create_list(:transaction, 10)

      transactions.count.times do |t|
        get :index, format: :json, credit_card_number: transactions[t].credit_card_number

        transaction = JSON.parse(response.body)
        assert_response :success
        assert_equal transactions[t].credit_card_number, transaction[0]['credit_card_number']
        assert_equal transactions[t].result, transaction[0]['result']
    end
  end

  test '#show' do

    c = create(:transaction)

    get :show, format: :json, credit_card_number: c.credit_card_number

    transaction = JSON.parse(response.body)
    assert_response :success
    assert_equal c.credit_card_number, transaction['credit_card_number']
    assert_equal c.result, transaction['result']
  end


end
