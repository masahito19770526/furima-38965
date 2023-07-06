FactoryBot.define do
  factory :purchase_address do
    zip_code                  { '123-4567' }
    prefecture_id             { '2' }
    city                      { 'テスト市' }
    block_number              { 'テスト１−１ー１１' }
    building_name             { 'テストビル１階' }
    phone_number              { '09012345678' }
    token                     { 'tok000o0o0000o0' }
  end
end
