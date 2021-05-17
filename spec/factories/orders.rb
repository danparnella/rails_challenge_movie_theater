FactoryBot.define do
  factory :order do
    quantity { 1 }
    cc_number { 1 }
    cc_expiration { "2021-05-17" }
    total_cost { 1.5 }
    showtime { nil }
    customer { nil }
  end
end
