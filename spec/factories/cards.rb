FactoryGirl.define do
  factory :card do
    original_text "house"
    translated_text "дом"
    review_date (-1).days.from_now
    user
    block
    # interval 1
    # attempt 1
  end
end