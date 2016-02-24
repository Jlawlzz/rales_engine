class Api::V1::TransactionsController < Api::ApiController

  respond_to :json

  def index
    find_all
  end

  def show
    find
  end

  private

  def find
    if params[:id]
      respond_with Transaction.find(params[:id])
    elsif params[:invoice_id]
      respond_with Transaction.find_by(invoice_id: params[:invoice_id])
    elsif params[:credit_card_number]
      respond_with Transaction.find_by(credit_card_number: params[:credit_card_number])
    elsif params[:credit_card_expiration_date]
      respond_with Transaction.find_by(credit_card_expiration_date: params[:credit_card_expiration_date])
    elsif params[:result]
      respond_with Transaction.find_by('LOWER(result) = ?', params[:result].downcase)
    elsif params[:created_at]
      respond_with Transaction.find_by(created_at: params[:created_at])
    elsif params[:updated_at]
      respond_with Transaction.find_by(updated_at: params[:updated_at])
    else
      offset = rand(Transaction.count)
      respond_with Transaction.offset(offset).first
    end
  end

  def find_all
    if params[:id]
      respond_with Transaction.where(id: params[:id])
    elsif params[:invoice_id]
      respond_with Transaction.where(invoice_id: params[:invoice_id])
    elsif params[:result]
      respond_with Transaction.where('LOWER(result) = ?', params[:result].downcase)
    elsif params[:credit_card_number]
      respond_with Transaction.where(credit_card_number: params[:credit_card_number])
    elsif params[:credit_card_expiration_date]
      respond_with Transaction.where(credit_card_expiration_date: params[:credit_card_expiration_date])
    elsif params[:created_at]
      respond_with Transaction.where(created_at: params[:created_at])
    elsif params[:updated_at]
      respond_with Transaction.where(updated_at: params[:updated_at])
    else
      respond_with Transaction.all
    end
  end

end
