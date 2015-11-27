class AccountsController < ApplicationController
  before_action :authenticate_account!

  def index
    @account = Account.all
  end

  def show
    @account = Account.find(params[:id])
    unless @account == current_account
      redirect_to :back, :alert => "Access denied."
    end
  end

end