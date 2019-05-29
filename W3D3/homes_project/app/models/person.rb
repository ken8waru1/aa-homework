class Person < ActiveRecord::Base
  validate :name, :house_id, prescence: true
end