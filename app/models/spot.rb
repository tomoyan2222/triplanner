class Spot < ApplicationRecord
    has_rich_text :content
    has_many :images, dependent: :destroy
    has_many :movies, dependent: :destroy

    validates :name, presence: true, length: { maximum: 100 }
    validates :region_num, presence: true
    validates :thumbnail, presence: true
end
