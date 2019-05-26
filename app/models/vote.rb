class Vote < ApplicationRecord
  belongs_to :issue
  belongs_to :comment

end
