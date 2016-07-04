FactoryGirl.define do
  factory :card do
    original_text "дом"
    translated_text "house"
    review_date (-1).days.from_now
    user
    block
    # interval 1
    # attempt 1
  end
end