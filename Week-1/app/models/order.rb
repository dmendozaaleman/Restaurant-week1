class Order < ActiveRecord::Base
  belongs_to :product
  validates :name, :phone, :address, presence: true
end
