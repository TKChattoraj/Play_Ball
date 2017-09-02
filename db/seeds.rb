user = User.new(
    first_name:  "Sparky",
    last_name:  "Anderson",
    email: "sparky@anderson.com",
    cell:  "513-555-5555",
    password:  "hello_world",
    password_confirmation: "hello_world"
)
user.save
puts "User: #{user.last_name} created."

team = Team.new(
    name:  "Reds"
)
team.save
puts "Team: #{team.name} created."

roster_user = User.find_by(first_name: user.first_name)
roster_team = Team.find_by(name: team.name)

roster = Roster.new(
    user_id: roster_user.id,
    team_id: roster_team.id
)
roster.save
puts "Roster: User: #{roster.user_id} and Team: #{roster.team_id} created."



user = User.new(
    first_name:  "Darrell",
    last_name:  "Johnson",
    email: "darrell@johnson.com",
    cell:  "513-555-5555",
    password:  "hello_world",
    password_confirmation: "hello_world"
)
user.save
puts "User: #{user.last_name} created."

team = Team.new(
    name:  "Red Sox"
)
team.save
puts "Team: #{team.name} created."

roster_user = User.find_by(first_name: user.first_name)
roster_team = Team.find_by(name: team.name)

roster = Roster.new(
    user_id: roster_user.id,
    team_id: roster_team.id
)
roster.save
puts "Roster: User: #{roster.user_id} and Team: #{roster.team_id} created."



user = User.new(
    first_name:  "Walter",
    last_name:  "Alston",
    email: "walter@alston.com",
    cell:  "513-555-5555",
    password:  "hello_world",
    password_confirmation: "hello_world"
)
user.save
puts "User: #{user.last_name} created."

team = Team.new(
    name:  "Dodgers"
)
team.save
puts "Team: #{team.name} created."

roster_user = User.find_by(first_name: user.first_name)
roster_team = Team.find_by(name: team.name)

roster = Roster.new(
    user_id: roster_user.id,
    team_id: roster_team.id
)
roster.save
puts "Roster: User: #{roster.user_id} and Team: #{roster.team_id} created."

p = Position.new(name: "P")
p.save
p = Position.new(name: "C")
p.save
p = Position.new(name: "1B")
p.save
p = Position.new(name: "2B")
p.save
p = Position.new(name: "3B")
p.save
p = Position.new(name: "SS")
p.save
p = Position.new(name: "OF")
p.save

location = Location.new(
  name: "Riverfront"
)
location.save

location = Location.new(
  name: "Fenway"
)
location.save

location = Location.new(
  name: "Dodger Stadium"
)
location.save

player = Player.new(
  first_name: "Pete",
  last_name: "Rose",
  birthdate: 2017-01-01,
  bats: 2,
  throws: 1,
  team_id: 1
)
player.save
PlayersPosition.create(player_id: player.id, position_id: 5)
hitting_total = HittingTotal.new
hitting_total.set_initial_totals
hitting_total.player_id = player.id
hitting_total.save



player = Player.new(
  first_name: "Ken",
  last_name: "Griffey",
  birthdate: 2017-01-01,
  bats: 0,
  throws: 0,
  team_id: 1
)
player.save
PlayersPosition.create(player_id: player.id, position_id: 7)
hitting_total = HittingTotal.new
hitting_total.set_initial_totals
hitting_total.player_id = player.id
hitting_total.save

player = Player.new(
  first_name: "Joe",
  last_name: "Morgan",
  birthdate: 2017-01-01,
  bats: 0,
  throws: 1,
  team_id: 1
)
player.save
PlayersPosition.create(player_id: player.id, position_id: 4)
hitting_total = HittingTotal.new
hitting_total.set_initial_totals
hitting_total.player_id = player.id
hitting_total.save


player = Player.new(
  first_name: "Tony",
  last_name: "Perez",
  birthdate: 2017-01-01,
  bats: 1,
  throws: 0,
  team_id: 1
)
player.save
PlayersPosition.create(player_id: player.id, position_id: 3)
hitting_total = HittingTotal.new
hitting_total.set_initial_totals
hitting_total.player_id = player.id
hitting_total.save



player = Player.new(
  first_name: "Johnny",
  last_name: "Bench",
  birthdate: 2017-01-01,
  bats: 1,
  throws: 1,
  team_id: 1
)
player.save
PlayersPosition.create(player_id: player.id, position_id: 2)
hitting_total = HittingTotal.new
hitting_total.set_initial_totals
hitting_total.player_id = player.id
hitting_total.save


player = Player.new(
  first_name: "George",
  last_name: "Foster",
  birthdate: 2017-01-01,
  bats: 1,
  throws: 1,
  team_id: 1
)
player.save
PlayersPosition.create(player_id: player.id, position_id: 7)
hitting_total = HittingTotal.new
hitting_total.set_initial_totals
hitting_total.player_id = player.id
hitting_total.save

player = Player.new(
  first_name: "Dave",
  last_name: "Concepcion",
  birthdate: 2017-01-01,
  bats: 1,
  throws: 1,
  team_id: 1
)
player.save
PlayersPosition.create(player_id: player.id, position_id: 6)
hitting_total = HittingTotal.new
hitting_total.set_initial_totals
hitting_total.player_id = player.id
hitting_total.save



player = Player.new(
  first_name: "Ceasar",
  last_name: "Geronimo",
  birthdate: 2017-01-01,
  bats: 0,
  throws: 0,
  team_id: 1
)
player.save
PlayersPosition.create(player_id: player.id, position_id: 7)
hitting_total = HittingTotal.new
hitting_total.set_initial_totals
hitting_total.player_id = player.id
hitting_total.save

player = Player.new(
  first_name: "Don",
  last_name: "Geullett",
  birthdate: 2017-01-01,
  bats: 1,
  throws: 0,
  team_id: 1
)
player.save
PlayersPosition.create(player_id: player.id, position_id: 1)
hitting_total = HittingTotal.new
hitting_total.set_initial_totals
hitting_total.player_id = player.id
hitting_total.save

pitching_total = PitchingTotal.new
pitching_total.set_initial_totals
pitching_total.player_id = player.id
pitching_total.save




player = Player.new(
  first_name: "Bernie",
  last_name: "Carbo",
  birthdate: 2017-01-01,
  bats: 0,
  throws: 1,
  team_id: 2
)
player.save
PlayersPosition.create(player_id: player.id, position_id: 7)
hitting_total = HittingTotal.new
hitting_total.set_initial_totals
hitting_total.player_id = player.id
hitting_total.save



player = Player.new(
  first_name: "Denny",
  last_name: "Doyle",
  birthdate: 2017-01-01,
  bats: 0,
  throws: 1,
  team_id: 2
)
player.save
PlayersPosition.create(player_id: player.id, position_id: 4)
hitting_total = HittingTotal.new
hitting_total.set_initial_totals
hitting_total.player_id = player.id
hitting_total.save


player = Player.new(
  first_name: "Carl",
  last_name: "Yastrzemski",
  birthdate: 2017-01-01,
  bats: 0,
  throws: 1,
  team_id: 2
)
player.save
PlayersPosition.create(player_id: player.id, position_id: 3)
hitting_total = HittingTotal.new
hitting_total.set_initial_totals
hitting_total.player_id = player.id
hitting_total.save



player = Player.new(
  first_name: "Carlton",
  last_name: "Fisk",
  birthdate: 2017-01-01,
  bats: 1,
  throws: 1,
  team_id: 2
)
player.save
PlayersPosition.create(player_id: player.id, position_id: 2)
hitting_total = HittingTotal.new
hitting_total.set_initial_totals
hitting_total.player_id = player.id
hitting_total.save

player = Player.new(
  first_name: "Fred",
  last_name: "Lynn",
  birthdate: 2017-01-01,
  bats: 0,
  throws: 0,
  team_id: 2
)
player.save
PlayersPosition.create(player_id: player.id, position_id: 7)
hitting_total = HittingTotal.new
hitting_total.set_initial_totals
hitting_total.player_id = player.id
hitting_total.save


player = Player.new(
  first_name: "Rico",
  last_name: "Petrocelli",
  birthdate: 2017-01-01,
  bats: 1,
  throws: 1,
  team_id: 2
)
player.save
PlayersPosition.create(player_id: player.id, position_id: 5)
hitting_total = HittingTotal.new
hitting_total.set_initial_totals
hitting_total.player_id = player.id
hitting_total.save



player = Player.new(
  first_name: "Dwight",
  last_name: "Evans",
  birthdate: 2017-01-01,
  bats: 1,
  throws: 1,
  team_id: 2
)
player.save
PlayersPosition.create(player_id: player.id, position_id: 7)
hitting_total = HittingTotal.new
hitting_total.set_initial_totals
hitting_total.player_id = player.id
hitting_total.save


player = Player.new(
  first_name: "Rick",
  last_name: "Burleson",
  birthdate: 2017-01-01,
  bats: 1,
  throws: 1,
  team_id: 2
)
player.save
PlayersPosition.create(player_id: player.id, position_id: 6)
hitting_total = HittingTotal.new
hitting_total.set_initial_totals
hitting_total.player_id = player.id
hitting_total.save


player = Player.new(
  first_name: "Bill",
  last_name: "Lee",
  birthdate: 2017-01-01,
  bats: 0,
  throws: 0,
  team_id: 2
)
player.save
PlayersPosition.create(player_id: player.id, position_id: 1)
hitting_total = HittingTotal.new
hitting_total.set_initial_totals
hitting_total.player_id = player.id
hitting_total.save

pitching_total = PitchingTotal.new
pitching_total.set_initial_totals
pitching_total.player_id = player.id
pitching_total.save



player = Player.new(
  first_name: "Steve",
  last_name: "Yeager",
  birthdate: 2017-01-01,
  bats: 1,
  throws: 1,
  team_id: 3
)
player.save
PlayersPosition.create(player_id: player.id, position_id: 2)
hitting_total = HittingTotal.new
hitting_total.set_initial_totals
hitting_total.player_id = player.id
hitting_total.save

player = Player.new(
  first_name: "Steve",
  last_name: "Garvey",
  birthdate: 2017-01-01,
  bats: 1,
  throws: 1,
  team_id: 3
)
player.save
PlayersPosition.create(player_id: player.id, position_id: 3)
hitting_total = HittingTotal.new
hitting_total.set_initial_totals
hitting_total.player_id = player.id
hitting_total.save


player = Player.new(
  first_name: "Davey",
  last_name: "Lopes",
  birthdate: 2017-01-01,
  bats: 1,
  throws: 1,
  team_id: 3
)
player.save
PlayersPosition.create(player_id: player.id, position_id: 4)
hitting_total = HittingTotal.new
hitting_total.set_initial_totals
hitting_total.player_id = player.id
hitting_total.save



player = Player.new(
  first_name: "Bill",
  last_name: "Russell",
  birthdate: 2017-01-01,
  bats: 1,
  throws: 1,
  team_id: 3
)
player.save
PlayersPosition.create(player_id: player.id, position_id: 6)
hitting_total = HittingTotal.new
hitting_total.set_initial_totals
hitting_total.player_id = player.id
hitting_total.save


player = Player.new(
  first_name: "Ron",
  last_name: "Cey",
  birthdate: 2017-01-01,
  bats: 1,
  throws: 1,
  team_id: 3
)
player.save
PlayersPosition.create(player_id: player.id, position_id: 4)
hitting_total = HittingTotal.new
hitting_total.set_initial_totals
hitting_total.player_id = player.id
hitting_total.save

player = Player.new(
  first_name: "Bill",
  last_name: "Buckner",
  birthdate: 2017-01-01,
  bats: 0,
  throws: 0,
  team_id: 3
)
player.save
PlayersPosition.create(player_id: player.id, position_id: 7)
hitting_total = HittingTotal.new
hitting_total.set_initial_totals
hitting_total.player_id = player.id
hitting_total.save


player = Player.new(
  first_name: "Jim",
  last_name: "Wynn",
  birthdate: 2017-01-01,
  bats: 1,
  throws: 1,
  team_id: 3
)
player.save
PlayersPosition.create(player_id: player.id, position_id: 7)
hitting_total = HittingTotal.new
hitting_total.set_initial_totals
hitting_total.player_id = player.id
hitting_total.save



player = Player.new(
  first_name: "Willie",
  last_name: "Crawford",
  birthdate: 2017-01-01,
  bats: 0,
  throws: 0,
  team_id: 3
)
player.save
PlayersPosition.create(player_id: player.id, position_id: 7)
hitting_total = HittingTotal.new
hitting_total.set_initial_totals
hitting_total.player_id = player.id
hitting_total.save


player = Player.new(
  first_name: "Don",
  last_name: "Sutton",
  birthdate: 2017-01-01,
  bats: 1,
  throws: 1,
  team_id: 3
)
player.save
PlayersPosition.create(player_id: player.id, position_id: 1)
hitting_total = HittingTotal.new
hitting_total.set_initial_totals
hitting_total.player_id = player.id
hitting_total.save

pitching_total = PitchingTotal.new
pitching_total.set_initial_totals
pitching_total.player_id = player.id
pitching_total.save
