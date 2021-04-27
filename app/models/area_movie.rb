class AreaMovie < ApplicationRecord
    validates :region_num, presence: true, uniqueness: true
    validates :code, presence: true
end
