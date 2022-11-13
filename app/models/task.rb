class Task < ApplicationRecord
    validates :title, presence: true
    validates :start, presence: true
    validates :end, presence: true
    validates :memo, presence: true
end
