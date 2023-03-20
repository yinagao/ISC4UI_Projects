class Manager {
  String name;
  String pronoun;
  int patience;
  int standards;
  
  String[] insults = {"You're too slow! My grandma could stir the pearls faster than you!",
                      "You're weak! An empty can of soda has more will power than you!", 
                      "You're getting distracted! I don't pay you to go on twitter!",
                      "You're boring! Sparkling water has more flavour than your personality!",
                      "You're too clumsy! Know the difference between your right and left!" };
                      
  String[] skills = {"ride a unicycle", "carve a carrot into a flute", "play the harmonica", "bench 450 lbs",
                     "tame a wild pack of wolves", "fold an origami tortoise", "forge an iron sword", 
                     "cure COVID", "do a backflip", "recite the periodic table backwards"};                      
  
  Manager(String n, String pr, int pa, int s) {
    this.name = n;
    this.pronoun = pr;
    this.patience = pa;
    this.standards = s;
  }
  
  void describe() {
    println(this.name + " has been hired to be the new manager!");
    delay(1000);
    
    if (this.patience < 4) {
      println("Word on the street is that " + this.name + " is extremely strict");
      delay(1000);
      println("Apparently, no employee has even lasted a week here before getting fired...");
      delay(1000);
    }
    
    else if (this.patience < 7) {
      println(this.name + " is eager to train " + this.pronoun + " employees with care and patience!");
      delay(1000);
    }
    
    else {
      println(this.name + " really could not care less whether or not the employees do their job right.");
      delay(1000);
      println("...someone could probably start giving out free drinks right in front of " + this.name + " and " + this.pronoun + " would still let them work here.");
      delay(1000);
    }
    println("");
    delay(1000);
  }
  
  void hireEmployees(Store s, Employee e) {
    println(this.name + " is evaluating " + e.name + "'s application...");
    delay(1000);
    
    int hireable = 0;
    if (e.efficiency >= this.standards)
      hireable++;
    if (10 - e.clumsiness >= this.standards) 
      hireable++;
    
    if (hireable >= 1) {
      s.employees.add(e);
      println(e.name + " has been hired!");
      delay(1000);
    }
    
    else {
      int randIndex = round(random(0, skills.length - 1));
      String randSkill = skills[randIndex];
      println("[" + this.name + "] " + e.name + ", you are weak. You wouldn't last a day here. Learn how to " + randSkill + " before showing your face here again.");
      delay(1000);
      println(e.name + " was not hired!");
      delay(1000);
    }
    println("");
    delay(1000);
  }
  
  Employee assignEmployee(Store s) {
    int randIndex = round(random(0, s.employees.size()-1));
    return s.employees.get(randIndex);
  }
  
  void insultEmployee(Employee e) {
    int randIndex = round(random(0, insults.length-1));
    String randInsult = insults[randIndex];
    
    println("[" + this.name + "] " + e.name + "! " + randInsult);
    delay(1000);
    println("[" + e.name + "] " + " :(");
    delay(1000);
    println(e.name + " has taken -10 psychic damage *sob*");
    delay(1000);
  }
}
