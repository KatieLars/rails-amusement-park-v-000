class User < ActiveRecord::Base
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides
  validates :password_digest, presence: true

  def is_happy? #returns true of happy is greater than nausea
    happiness > nausea
  end

  def mood
    if is_happy?
      "happy"
    else
      "sad"
    end
  end

end
