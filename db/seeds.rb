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

user = User.new(
    first_name:  "Billy",
    last_name:  "Martin",
    email: "billy@martin.com",
    cell:  "513-555-5555",
    password:  "hello_world",
    password_confirmation: "hello_world"
)
user.save
puts "User: #{user.last_name} created."

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
    name:  "Reds",
    wins: 15,
    losses: 7
)
team.save
puts "Team: #{team.name} created."


team = Team.new(
    name:  "Yankees",
    wins: 12,
    losses: 9
)
team.save
puts "Team: #{team.name} created."

team = Team.new(
    name:  "Dodgers",
    wins: 11,
    losses: 10
)
team.save
puts "Team: #{team.name} created."

roster = Roster.new(
    user_id: User.first.id,
    team_id: Team.first.id
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
  name: "Crosley"
)
location.save

location = Location.new(
  name: "Riverfront"
)
location.save

location = Location.new(
  name: "GABP"
)
location.save

player = Player.new(
  first_name: "Dave",
  last_name: "Concepcion",
  birthdate: 2017-01-01,
  bats: 0,
  throws: 0,
  team_id: 1
)
player.save
PlayersPosition.create(player_id: player.id, position_id: 6)
hitting_total = HittingTotal.new
hitting_total.set_initial_totals
hitting_total.player_id = player.id
hitting_total.save



player = Player.new(
  first_name: "Joe",
  last_name: "Morgan",
  birthdate: 2017-01-01,
  bats: 1,
  throws: 0,
  team_id: 1
)
player.save
PlayersPosition.create(player_id: player.id, position_id: 4)
hitting_total = HittingTotal.new
hitting_total.set_initial_totals
hitting_total.player_id = player.id
hitting_total.save

player = Player.new(
  first_name: "Cesar",
  last_name: "Geronimo",
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
  first_name: "Reggie",
  last_name: "Jackson",
  birthdate: 2017-01-01,
  bats: 1,
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
  first_name: "Chris",
  last_name: "Chambliss",
  birthdate: 2017-01-01,
  bats: 1,
  throws: 0,
  team_id: 2
)
player.save
PlayersPosition.create(player_id: player.id, position_id: 3)
hitting_total = HittingTotal.new
hitting_total.set_initial_totals
hitting_total.player_id = player.id
hitting_total.save


player = Player.new(
  first_name: "Mickey",
  last_name: "Rivers",
  birthdate: 2017-01-01,
  bats: 1,
  throws: 0,
  team_id: 2
)
player.save
PlayersPosition.create(player_id: player.id, position_id: 3)
hitting_total = HittingTotal.new
hitting_total.set_initial_totals
hitting_total.player_id = player.id
hitting_total.save
