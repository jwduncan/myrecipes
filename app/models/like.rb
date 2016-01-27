class Like < ActiveRecord::Base
  belongs_to :chef
  belongs_to :recipe
  
  validates_uniqueness_of :chef, scope: :recipe #vote for each recipe only once (without scope only one total vote)
  validates :chef_id, presence: true
  validates :description, presence: true, length: { minimum: 10, maximum: 250 }
end