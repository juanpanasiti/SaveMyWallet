module ApplicationHelper
  def get_month_year(date)
    unless date.nil?
      return date.strftime("%m-%y")
    end
  end

  def set_payment_row_class(payment)
    status = payment.status
    month = payment.month_to_pay
    row_class = case status
    when 'Para pagar' then 'table-primary'
    when 'Pagado' then 'table-secondary'
    else 'table-dark'
    end #case
    unless row_class != 'table-dark'
      if month == Time.now.strftime("%b%y")
        row_class = 'table-warning'
      end
    end
    if payment.last_fee?
      row_class.concat(" last-fee")
    end
    return row_class
  end #set_payment_row_class
end
