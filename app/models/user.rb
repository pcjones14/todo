class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not a valid email address")
    end
  end
end

class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation

  validates :email, presence: true, uniqueness: true, email: true
  validates :name, presence: true
  validates :password, presence: true, confirmation: true
  validates :password_confirmation, presence: true, :if => 'password.nil?'

end
