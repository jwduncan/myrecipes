class Review < ActiveRecord::Base
  belongs_to :chef
  belongs_to :recipe
  
 validates_uniqueness_of :chef, scope: :recipe #vote for each recipe only once (without scope only one total review)
end