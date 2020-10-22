FactoryBot.define do
  factory :user do
    nickname              { 'abe' }
    email                 { 'kkkdd@gmail.com' }
    password              { 'taka1008' }
    password_confirmation { password }
    last_name             { '貴光' }
    first_name            { '村田' }
    last_name_kana        { 'タカミツ' }
    first_name_kana       { 'ムラタ' }
    birthday              { '1985-10-8' }
  end
end
