class Author < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:github, :google_oauth2]

  has_many :posts

  def self.from_omniauth(access_token)
    data = access_token.info
    author = Author.where(email: data['email']).first
      unless author
         author = Author.create(
            email: data['email'],
            password: Devise.friendly_token[0,20]
         )
      end
    author
  end
end
