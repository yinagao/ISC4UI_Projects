class Drink {
  String name;
  String teaBase;
  String flavour;
  String iceLevel;
  int sugarLevel;
  boolean addPearl;
  float cost;
  
  // 2 constructors, drink may or may not have extra flavourings
  Drink(String b, String f, int s, String i, boolean t) {
    this.teaBase = b;
    this.flavour = f;
    this.iceLevel = i;
    this.sugarLevel = s;
    this.addPearl = t;
  }
  
  Drink(String b, int s, String i, boolean t) {
    this.teaBase = b;
    this.flavour = "none";
    this.iceLevel = i;
    this.sugarLevel = s;
    this.addPearl = t;
  }
  
  void setDrinkName() {
    if (this.flavour == "none"){
      if (this.addPearl == true)
        this.name = this.teaBase + " with Pearls";
      else 
        this.name = this.teaBase;
    }
    else {
      if (this.addPearl == true)
        this.name = this.flavour + " " + this.teaBase + " with Pearls";
      else 
        this.name = this.flavour + " " + this.teaBase;
    }
  }
  
  float calculateCost() {
    this.cost = 0;
    
    if (this.flavour == "none") 
      this.cost += 5.3;
    else
      this.cost += 5.8;
    
    if (this.addPearl == true)
      this.cost += 0.5;
      
    return this.cost;
  }
  
}
