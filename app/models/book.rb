class Book < ApplicationRecord

  validates :title, :opinion, presence: true
  validates :title, :opinion, length: {maximum: 200}

  belongs_to :user

end
