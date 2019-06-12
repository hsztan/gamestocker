User.create(username: "testuser", email: "test@test.com", password: "12345")
Game.create(name: "Mario")
consoles = ["Xbox", "PS4", "Switch", "MacOS", "PC"]
consoles.each {|c| Console.create(name: c)}
