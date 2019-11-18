class Favorite < ApplicationRecord
  belongs_to :cookbook
  belongs_to :recipe
end
