FactoryBot.define do
  factory :order do
    quantity { 1 }
    cc_number { CreditCardValidations::Factory.random(:visa) }
    cc_expiration { "05/2025".to_date }
    cc_security_code { "123" }
    showtime
    customer

    trait :invalid_cc_number do
      cc_number { "12345678910" }
    end
  end
end
