class Employee {

  String name;
  int efficiency;
  int clumsiness;
  int stamina;
  int mistakesMade;
  
  String[] mistakes = {"The cap of the shaker cup flew off and hit a customer in the face!",
              "A bucket of tea accidentally got knocked over! There's tea everywhere!", 
              "The cap of the fruit syrup bottle is screwed on too tight! It can't be opened!", 
              "Someone got caught going on their phone at work!", 
              "The tea barrel labels got all mixed up! Now we don't know which is which!"};
  
  Employee (String n, int e, int c, int s) {
    this.name = n;
    this.efficiency = e;
    this.clumsiness = c;
    this.stamina = s;
  }
  
  void makePearl() {
    println(this.name + " has pulled out the big pot to make pearls!");
    delay(1000);
    println(this.name + " is boiling the pearls!");
    delay(1000);
    println(this.name + " is stirring the pearls!");
    delay(1000);
    println(this.name + " rinsed the pearls! Pearls are ready!");
    delay(1000);
    this.stamina--;
  }
  
  void prepareOrder(Customer c, Manager m) {
    for (Drink d: c.totalDrinks) {
      this.makeDrink(d, m);
    }
  }
  
  void makeDrink(Drink d, Manager m) {
    println();
    
    if (this.checkStamina() == false) {
      println(this.name + " cannot make another drink! They've been worked into exhaustion!");
      delay(1000);
      println(this.name + " has collapsed!");
      delay(1000);
      
      println(m.name + " gives " + this.name + " a dirty look...");
      delay(1000);
      println(m.name + " gave " + this.name + " a granola bar! Stamina +5!");
      
      this.stamina += 5;
      println();
      delay(1000);
    }
    
    else {
      if (d.addPearl == true) {
        println(this.name + " adds a scoop of pearls into the bubble tea cup!");
        delay(1000);
      }
      
      println(this.name + " is scooping " + d.iceLevel + " into the shaking cup...");
      delay(1000);
      println(this.name + " is adding " + d.sugarLevel + "% sugar into the shaking cup...");
      delay(1000);
      
      if (d.flavour != "none") {
        println(this.name + " is adding " + d.flavour + " flavouring...");
        delay(1000);
      }
      
      println(this.name + " is filling up the cup with " + d.teaBase + "...");
      delay(1000);
      println(this.name + " is shaking the drink...");
      delay(1000);
      
      if (this.efficiency > 6)
        println(this.name + " finished the drink speedy fast! " + m.name + " looks pleased :)");
      else if (this.efficiency > 4)
        println(this.name + " is done making the drink!");
      else
        println(this.name + " is taking too long! The customers are getting mad!");
      
      this.stamina --;
      delay(1000);
      
      int probMistake = round(random(0, 10));
      if (probMistake < this.clumsiness) 
        this.makeMistake(m);
    }
    
    println(this.name + " has " + this.stamina + " stamina left. You can do it, " + this.name + "!");
    delay(1000);
  }
  
  void makeMistake(Manager m) {
    int randInt = round(random(0, mistakes.length-1));
    
    println("Oh no! " + mistakes[randInt]);
    delay(1000);
    
    int probInsult = round(random(0, 10));
    if (probInsult >= m.patience)
      m.insultEmployee(this);
    else 
      println(m.name + " catches " + this.name + " red-handed, but lets it pass this time...");
  }
  
  private boolean checkStamina() {
    if (stamina > 0)
      return true;
    else {
      return false;
    }
  }
}
