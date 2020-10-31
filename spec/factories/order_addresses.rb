FactoryBot.define do
  factory :order_address do
    postal_code        { '241-1111' }
    ship_region_id     { 2 }
    ship_city          { '横浜市緑区' }
    ship_block         { '青山1-1-1' }
    ship_building      { '青山ビル' }
    phone              { '090-1111-1111' }
    token              { 'tok_abcdefghijk00000000000000000' }
    association :order
  end
end
