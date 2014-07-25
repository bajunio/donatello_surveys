Survey.create(name: 'Test Survey')


Survey.find(1).questions << Question.new(question: "Who just wants to have fun?")
Question.find(1).choices << Choice.new(choice: "Girls")
Question.find(1).choices << Choice.new(choice: "Boys")

Survey.find(1).questions << Question.new(question: "What is your favorite food?")
Question.find(2).choices << Choice.new(choice: "Japanese")
Question.find(2).choices << Choice.new(choice: "Italian")
