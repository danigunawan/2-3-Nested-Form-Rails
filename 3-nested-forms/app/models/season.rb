# models/season.rb
class Season < ApplicationRecord
  belongs_to :show, optional: true
  has_many :episodes
  accepts_nested_attributes_for :episodes
end