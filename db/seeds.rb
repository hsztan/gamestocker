user = User.create(username: "testuser", email: "test@test.com", password: "12345")

consoles = ["Xbox", "PlayStation 4", "Nintendo Switch", "Wii U", "MacOS", "PC", "iPhone", "Android"]
consoles.each {|c| Console.create(name: c)}

game = Game.create(name: "Mario", console_id: 3, user_id: 1)
game2 = Game.create(name: "God of War", console_id: 2, user_id: 1)
game3 = Game.create(name: "Final Fantasy", console_id: 1, user_id: 1)
