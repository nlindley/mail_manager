class Alias < ActiveRecord::Base
  attr_accessible :destination, :source
  belongs_to :domain

  validates :source, :presence => true, :username => true
  validates :destination, :email => { :message => 'must be a valid email address' }
end
