class House < ActiveRecord::Base
  validate :address, presence: true
end