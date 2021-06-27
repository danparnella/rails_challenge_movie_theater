module OrderHelper
  def total_cost_dollars(total_cost)
    '%.2f' % (total_cost.to_f / 100)
  end

  def cc_last_4_digits(cc_number)
    cc_number[-4...]
  end
end
