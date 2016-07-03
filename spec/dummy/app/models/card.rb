class Card < ActiveRecord::Base
  belongs_to :user
  belongs_to :block

  scope :pending, -> { where('review_date <= ?', Time.now).order('RANDOM()') }
  scope :repeating, -> { where('quality < ?', 4).order('RANDOM()') }
end
