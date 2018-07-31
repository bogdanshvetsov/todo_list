class Project < ActiveRecord::Base
	belongs_to :user
	has_many :tasks, dependent: :destroy
	default_scope -> { order('id DESC') }

	validates :name, presence: true, length: { minimum: 1, maximum: 45 }
	validates :user_id, presence: true
end
