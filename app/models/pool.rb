class Pool < ActiveRecord::Base
	has_one :manager, :class_name => "User"
	has_many :users, through: :standing

	VISIBILITY = ['Public', 'Private']
	
end
