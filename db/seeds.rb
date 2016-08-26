

User.create({ user_name: "joe", email: "joe@dbc.com", password_hash: "password"})

Deck.create({title: "Test Deck"})

Card.create({deck_id: 1, question: "Is this working? (yes, no)", answer: "no"})
Card.create({deck_id: 1, question: "Is this the best team ever? (yes, no)", answer: "yes"})
Card.create({deck_id: 1, question: "What is Adrian's last name?", answer: "Muresan"})
Card.create({deck_id: 1, question: "What's today? ", answer: "friday"})


Round.create({ user_id: 1, deck_id: 1, first_time_correct: 0, total_guesses: 0})
