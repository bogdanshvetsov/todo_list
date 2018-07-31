class Task < ActiveRecord::Base
	belongs_to :user
	belongs_to :project
	default_scope -> { order('id DESC') }

	#default_scope -> { order('created_at DESC') }
	validates :name, presence: true, length: { minimum: 1, maximum: 350 }
end
