class BalancesController < ApplicationController
  before_action :authenticate_user!
  before_action :load_balance, only: [:show]

  def index
    @balances = current_user.balances.includes(:items).order(created_at: :desc)
  end

  def new
    @balance = Balance.new
  end

  class BalancesController < ApplicationController
    before_action :authenticate_user!
    before_action :load_balance, only: [:show]

    def index
      @balances = current_user.balances.includes(:items).order(created_at: :desc)
    end

    def new
      @balance = Balance.new
    end

    def show
      if current_user.id == @balance.author_id
        # You can remove the redundant Balance.find since @balance is already loaded
      else
        redirect_to '/', alert: 'You do not have permission to access this balance.'
      end
    end

    def create
      @balance = current_user.balances.build(balance_params)
      if @balance.save
        redirect_to root_path, notice: 'Balance was successfully created.'
      else
        render :new, status: :unprocessable_entity
      end
    end

    private

    def balance_params
      params.require(:balance).permit(:name, :icon)
    end

    def load_balance
      @balance = Balance.find(params[:id])
    end
  end

  def create
    @balance = current_user.balances.build(balance_params)
    if @balance.save
      redirect_to root_path, notice: 'Balance was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def balance_params
    params.require(:balance).permit(:name, :icon)
  end

  def load_balance
    @balance = Balance.find(params[:id])
  end
end
