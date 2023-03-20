class Customer {
  Store store;
  String name;
  int generosity;
  int loyaltyPoints;
  ArrayList<Drink> totalDrinks;
  float orderTotal;
  float tip;
  
  Customer(Store s, String n, int g, int l) {
    this.store = s;
    this.name = n;
    this.generosity = g;
    this.loyaltyPoints = l;
    this.totalDrinks = new ArrayList<Drink>();
  }
  
  void describe() {
    println(this.name + " has " + this.loyaltyPoints + " loyalty points!");
    delay(1000);
    
    if (this.loyaltyPoints > 15)
      println("Watch out, that makes " + this.name + " a bubble tea CONNOISSEUR!1!");
    else if (this.loyaltyPoints > 8)
      println(this.name + " enjoys bubble tea quite a bit, but they probably like to stick to the same order every time");
    else
      println(this.name + " was probably newly introduced to the world of bubble tea. Watch and learn, kiddo...");
    
    println();
    delay(1000);
  }
  
  void orderDrink(String flavour, String fullName, int sugarLevel, String iceLevel) {
    Drink newDrink;
    int andIndex = fullName.indexOf("+");
    
    if (andIndex == -1) {
      if (flavour == " ")
        newDrink = new Drink(fullName, sugarLevel, iceLevel, false); 
      else
        newDrink = new Drink(fullName, flavour, sugarLevel, iceLevel, false);
    }
    
    else {
      String base = fullName.substring(0, andIndex-1);
      
      if (flavour == " ")
        newDrink = new Drink(base, sugarLevel, iceLevel, true);
      else
        newDrink = new Drink(base, flavour, sugarLevel, iceLevel, true);

    }
    this.totalDrinks.add(newDrink);
    newDrink.setDrinkName();
    println(this.name + " ordered one " + newDrink.name + "! Coming right up!");
    delay(1000);
  }
  
  void calculateTotal() {
    this.orderTotal = 0;
    
    for (Drink d: this.totalDrinks) {
      this.orderTotal += d.calculateCost();
    }
    
    float tipPercentage = 0.3 * this.generosity/10.0;
    this.tip = this.orderTotal * tipPercentage;
    this.orderTotal += this.tip;
  }
  
  void printReceipt() {
    this.calculateTotal();
    
    int y = 160;
    fill(peach);
    textFont(f1);
    textAlign(CENTER);
    text(this.name, width/2, 130);

    textFont(f2);
    for (Drink d: totalDrinks) {
      textAlign(LEFT);
      text(d.name, 125, y);
      text(d.sugarLevel + "% Sugar", 135, y+15);
      text(d.iceLevel, 135, y+30);
      
      textAlign(RIGHT);
      text(nf(d.calculateCost(), 0, 2), 370, y);
      
      y += 55; 
    }
    textAlign(LEFT);
    text("TIP", 125, y+10);
    text("ORDER TOTAL", 125, y+25);
    
    textAlign(RIGHT);
    text(nf(this.orderTotal, 0, 2), 370, y+25);
    text(nf(this.tip, 0, 2), 370, y+10);
  }
}
