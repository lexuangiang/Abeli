class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :fullname, length: { maximum: 50}
  validates :weight, numericality: {greater_than_or_equal_to: 0 }
end
