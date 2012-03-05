class User < ActiveRecord::Base
  before_save :encrypt_password


  attr_accessor :password
  attr_accessible :email, :show_tooltips, :password, :password_confirmation
  validates_confirmation_of :password
  validates_presence_of :password
  validates_length_of :password, :within => 6..40
  validates_presence_of :email
  validates_uniqueness_of :email

  def toggle_tooltips
    show_tooltips? ? self.update_attribute(:show_tooltips, false) : self.update_attribute(:show_tooltips, true)
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.encrypted_password = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end


  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.encrypted_password == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

end