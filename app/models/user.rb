class User < ActiveRecord::Base
  attr_accessible :email, :firstname, :lastname, :username , :encrypted_password , :encrypted_password_confirmation , :remember_token

  has_many :categories
  
  validates_presence_of :firstname, :lastname , :email, :username
  validates_uniqueness_of :email,  :username
  validates :encrypted_password, :presence => true,
					   :confirmation => true,
					   :length => {:within => 6..40},
					   :on => :create
  validates :encrypted_password, :confirmation => true,
					   :length => {:within => 6..40},
					   :allow_blank => true,
					   :on => :update

  validates_format_of :email, :with => /^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$/

  before_save { |user| user.email = email.downcase }

  before_save :encrypt_password
  
  


  def has_password?(submitted_password)
	encrypted_password == encrypt(submitted_password)
  end
  
  def self.authenticate(username, submitted_password)
	user = find_by_username(username)
	return nil if user.nil?
	return user if user.has_password?(submitted_password)
  end
	
 def self.authenticate_with_salt(username, cookie_salt)
    user = find_by_username(username)
    (user && user.salt == cookie_salt) ? user : nil
  end

private

	def encrypt_password
      self.salt = make_salt unless has_password?(encrypted_password)
      self.encrypted_password = encrypt(encrypted_password)
    end

    def encrypt(string)
      secure_hash("#{salt}--#{string}")
    end

    def make_salt
      secure_hash("#{Time.now.utc}--#{encrypted_password}")
    end

    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end
					   
  
end
