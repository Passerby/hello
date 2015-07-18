class Resume < ActiveRecord::Base
  default_scope { order(default: :desc) }
	belongs_to :user
end
