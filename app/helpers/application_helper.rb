module ApplicationHelper
  def get_month_year(date)
    unless date.nil?
      return date.strftime("%m-%y")
    end
  end

  def set_payment_row_class(status,month)
    row_class = 'table-dark'
    if status == 'Para pagar'
      row_class = 'table-primary'
    end
    if month == Time.now.strftime("%b%y")
      row_class = 'table-warning'
    end
    return row_class
  end
end
