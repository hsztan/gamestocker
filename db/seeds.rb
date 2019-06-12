User.create(username: "testuser", email: "test@test.com", password: "12345")
Game.create(name: "Mario")
consoles = ["Xbox", "PlayStation 4", "Nintendo Switch", "Wii U", "MacOS", "PC", "iPhone", "Android"]
consoles.each {|c| Console.create(name: c)}
