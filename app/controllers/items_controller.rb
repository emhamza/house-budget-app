class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_balance, only: %i[new create]

  def new
    if current_user.id == @balance.author_id
      @item = Item.new
      @balances = Balance.where(author_id: current_user.id)
    else
      redirect_to '/'
    end
  end

  def create
    @item = Item.new(name: params[:item][:name], amount: params[:item][:amount], author_id: current_user.id)
    if params[:item][:selected_ids].present?
      if save_and_balance_item
        redirect_to balance_path(params[:balance_id])
      else
        render :new, status: :unprocessable_entity
      end
    else
      redirect_to balance_items_path(params[:balance_id]), alert: 'Check at least one checkbox!'
    end
  end

  private

  def save_and_balance_item
    ActiveRecord::Base.transaction do
      @item.save
      params[:item][:selected_ids].each do |id|
        BalanceItem.create(item_id: @item.id, balance_id: id.to_i)
      end
    end
  rescue ActiveRecord::RecordInvalid
    false
  end

  def item_params
    params.require(:item).permit(:name, :amount, selected_ids: [])
  end

  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to home_path
    end
  end

  def load_balance
    @balance = Balance.find(params[:balance_id])
  end
end
