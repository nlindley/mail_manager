class Domain < ActiveRecord::Base
  attr_accessible :name

  has_many :users, dependent: :destroy
  has_many :aliases, dependent: :destroy
end
