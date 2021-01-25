secretNum <- 9
previousGuess <- 0
counter <- 0
repeat {
  guess <- as.integer(readline(prompt = "Give me a guess. "))
  if(guess != previousGuess){
    counter <- counter + 1
  }
  if (guess < secretNum){
    print("too small")
  }
  else if(guess > secretNum){
    print("too big")
  }
  else{
    print("That's it!")
    print(paste("Number of tries: ", counter))
    break
  }
  previousGuess <- guess
}
