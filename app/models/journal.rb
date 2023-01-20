class Journal < ApplicationRecord
    belongs_to :user
    belongs_to :voice
    validates :date, presence: true
end