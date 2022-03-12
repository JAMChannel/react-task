class User < ApplicationRecord
   # gem bcrypt
   # パスワードを暗号化
   # password_digestをpasswordとできる
   # password_confirmationを利用でき一致確認が可能
   # authenticateメソッドが利用可能
  has_secure_password

    # validates
    validates :name, presence: true,
    length: { maximum: 30, allow_blank: true }  # allow_blank: true 空白文字はスキップ
    
    # [\w\-] :a~z,A~Z,0~9,_,-が対応可能
    # \A ：先頭に[\w\-]のどれかがあるのか？
    # +  今回で言うと[\w\-]が一文字以上存在するかどうか？
    # \z 末尾に[\w\-]のどれかがあるのか？

    
    VALID_PASSWORD_REGEX = /\A[\w\-]+\z/
    validates :password, presence: true,
                         length: { minimum: 3 },
                         format: {
                           with: VALID_PASSWORD_REGEX,
                           message: :invalid_password
                         },
                         allow_nil: true
end
