class Api::V1::CustomersController < Api::ApiController

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
      respond_with Customer.find(params[:id])
    elsif params[:first_name]
      respond_with Customer.find_by('LOWER(first_name) = ?', params[:first_name].downcase)
    elsif params[:last_name]
      respond_with Customer.find_by('LOWER(last_name) = ?', params[:last_name].downcase)
    elsif params[:created_at]
      respond_with Customer.find_by(create_at: params[:created_at].downcase)
    elsif params[:updated_at]
      respond_with Customer.find_by(updated_at: params[:updated_at].downcase)
    else
      offset = rand(Customer.count)
      respond_with Customer.offset(offset).first
    end
  end

  def find_all
    if params[:first_name]
      respond_with Customer.where('LOWER(first_name) = ?', params[:first_name].downcase)
    elsif params[:last_name]
      respond_with Customer.where('LOWER(last_name) = ?', params[:last_name].downcase)
    elsif params[:created_at]
      respond_with Customer.where(create_at: params[:created_at].downcase)
    elsif params[:updated_at]
      respond_with Customer.where(updated_at: params[:updated_at].downcase)
    end
  end

end
