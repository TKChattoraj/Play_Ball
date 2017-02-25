user = User.new(
    first_name:  "Chuck",
    last_name:  "Tanner",
    email: "chuck@tanner.com",
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
    name:  "Pirates",
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

position = Position.new(name: "P")
position.save
position = Position.new(name: "C")
position.save
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
