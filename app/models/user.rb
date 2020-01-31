class User < ApplicationRecord
    validates :username, format: { without: /\s/, message: "must contain no spaces" }
    # validates_uniqueness_of :username
end
