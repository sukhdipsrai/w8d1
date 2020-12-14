class User < ApplicationRecord
    validates :username , uniqueness: true, presence: true
    validates :session_token, uniqueness: true, presence: true
    validates :password_digest, presence:true
    validates :password, length: {minimum: 6, allow_nil: true}

    has_many :posts,
    foreign_key: :author_id,
    class_name: :Post 

    attr_reader :password

    after_initialize :ensure_session_token

    def ensure_session_token
        self.session_token ||= SecureRandom.base64(16)
    end

    def self.find_by_credentials(username, password)
        user = User.find_by(username: username)

        return user if user && user.is_password?(password)
        
    end

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end

    def reset_session_token!
        self.session_token = SecureRandom.base64(16)
        self.save!
        self.session_token
    end

end
