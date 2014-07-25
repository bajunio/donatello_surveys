Survey.create(name: 'Test Survey')


Survey.find(1).questions << Question.new(question: "What is your favorite color?")
Question.find(1).choices << Choice.new(choice: "Red")
Question.find(1).choices << Choice.new(choice: "Blue")

Survey.find(1).questions << Question.new(question: "What is your favorite food?")
Question.find(2).choices << Choice.new(choice: "Japanese")
Question.find(2).choices << Choice.new(choice: "Italian")
