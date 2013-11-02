desc "Import games." 
		task :import_games => :environment do
			games = File.open("nfl_2013.txt", "r").map do |line|
				week, visitor_team, home_team, start_date, kickoff, favorite, line, status = line.strip.split("\t")            
				Game.new(:start_date => Date.parse(start_date), :week => week, :kickoff => kickoff,  :visitor_team => visitor_team, :home_team => home_team, :status => status, :favorite => favorite, :line => line)
		  end
	 Game.import games
  end