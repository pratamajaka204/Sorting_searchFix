class Article < ApplicationRecord
	validates :title, presence: true,
						length: { minimum: 5 }
	validates :content, presence: true,
						length: { minimum: 10 }
	validates :status, presence: true


	def self.search(search)
		if search
			where('title LIKE ?', "%#{search}%")
		else	
			Article.all
		end
	end
	
	scope :status_active, -> {where(status: 'active')}
	default_scope {where(status: 'active')}

	# has_many :comments, required: false  

	
	
end
