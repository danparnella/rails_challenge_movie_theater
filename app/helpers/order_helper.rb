module OrderHelper
  def cc_last_4_digits(cc_number)
    cc_number[-4...]
  end
end
