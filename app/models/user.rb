class User < ActiveRecord::Base
  attr_reader :password
  attr_accessible :username, :password, :password_confirmation, :admin
  belongs_to :domain

  validates :password, :confirmation => true, :length => { :minimum => 6 }, :unless => 'password.blank?'
  validates :password, :presence => true, :on => :create
  validates :username, :presence => true, :username => true

  def password=(submitted_password)
    self.password_encrypted = encrypt_password(submitted_password) unless submitted_password.blank?
    @password = submitted_password
  end

  def has_password?(submitted_password)
    self.password_encrypted == Digest::MD5.hexdigest(submitted_password)
  end

  def self.find_by_email(email)
    username, domain = email.split('@', 2)
    User.joins('LEFT JOIN domains ON domains.id = users.domain_id').where('users.username = ? AND domains.name = ?', username, domain).first
  end

  def self.authenticate(email, submitted_password)
    user = User.find_by_email(email)
    return nil if user.nil?
    return user if user.has_password?(submitted_password)
  end

  private

  def encrypt_password(submitted_password)
    Digest::MD5.hexdigest(submitted_password)
  end
end
