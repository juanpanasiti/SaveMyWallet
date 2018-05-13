class HomeController < ApplicationController
  def index
    @credit_cards = current_user.credit_cards
    @purchases = current_user.purchases.no_charged
    @payments = current_user.payments
    @taxes = current_user.taxes
    @months_resume = Purchase.months_resume(current_user)
  end

  def show_detail_month
    @month = params[:month]
    @payments = Payment.by_month(current_user, @month[0])
    @taxes = Tax.by_month(current_user, @month[0])
  end

  def new_credit_card
    #@credit_card = CreditCard.new
    respond_to do |format|
      format.html
      format.js
    end
  end
end
