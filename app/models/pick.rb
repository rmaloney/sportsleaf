class Pick < ActiveRecord::Base
	belongs_to :user

	#callbacks
	before_create :default_values

	#validation
		# Cannot make multiple plays on same game
		# Needs to make a selection
		# Cannot have more than 6 picks for that week
		# Cannot make play on closed game
	validates :selection, :uniqueness => {:scope => [:game_id, :user_id]}
	validates :selection, :presence => true
	validate :cannot_have_more_than_6_plays
	validate :cannot_make_pick_on_game_with_result
	validate :cannot_update_closed_pick

	#scopes
	scope :closed, where(:status => "Closed")
	scope :open, where(:status => "Open")

	# Fetch score from game to determine result of pick
	def self.process_result
		pick = self.selection
		winning_side = self.game.cover 
		result = 'PUSH' if winning_side == 'PUSH'
		result =  pick == winning_side ? 'WIN' : 'LOSS'
		self.update_attributes(:result => result)
	end

	# Callback  to set status of all newly created plays to 'Open'
	def default_values
		self.status ||= 'Open'
	end

	# Validation to ensure user cannot have more than 6 open plays
	def cannot_have_more_than_6_plays
		open_plays = Play.where("status = ? AND user_id = ?", "Open", user_id)
		
		if open_plays.count >= 6
			errors.add(:selection, "You already have 6 open plays")
		end
	end

	# Validation. Prevents user from creating a play on a game with a closed status
	def cannot_make_pick_on_game_with_result
		if self.game.status == "Closed"
			errors.add( :selection, "That game is currently closed")
		end
	end

	# Prevents user from updating a play with a closed status
	def cannot_update_closed_pick
		if self.status == "Closed"
			errors.add(:selection, "This pick is currently closed")
		end
	end
end
