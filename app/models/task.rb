class Task < ApplicationRecord

    validates :title, presence: true, length: { minimum: 5 }
    validates :body, presence: true, length: { minimum: 5 }

    enum category: { privates: 0, business: 1 }

    belongs_to :account
    belongs_to :priority

end
