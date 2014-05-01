# app\models\user.rb

class User < ActiveRecord::Base
  attr_accessible :name, :password, :password_confirmation, :role
  has_secure_password
  
  validates :name, :presence => {:message => "Name: cannot be blank ..."}
  validates_uniqueness_of :name, :message => "This name has already been taken"
  

  has_many :bookings
  has_many :products, through: :bookings

		before_create { generate_token(:auth_token) }

		def send_password_reset
			  generate_token(:password_reset_token)
			  self.password_reset_sent_at = Time.zone.now
			  save!
			  UserMailer.password_reset(self).deliver
		end

		def generate_token(column)
			  begin
				self[column] = SecureRandom.urlsafe_base64
			  end while User.exists?(column => self[column])
		end

end