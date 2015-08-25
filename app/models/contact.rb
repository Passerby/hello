class Contact < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true
  validates :title, presence: true
  validates :content, presence: true
end
