class Store {
  String name;
  String open;
  String close;
  String slogan;
  Manager manager;
  ArrayList<Employee> employees; 
  ArrayList<Customer> customers;
  float revenue;
  
  Store(String n, String o, String c, String s) {
    this.name = n;
    this.open = o;
    this.close = c;
    this.slogan = s;
    this.employees = new ArrayList<Employee>();
    this.customers = new ArrayList<Customer>();
  }
  
  void openStore() {
    String opening = convertTime(this.open);
    String closing = convertTime(this.close);
    println("~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~");
    println("Welcome to " + this.name + "!");
    println(this.slogan + "!");
    println("We are open from " + opening + " - " + closing + " today.");
    println("Another beautiful day full of unexpected events lies ahead!");
    println("~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~");
    delay(1000);
    println("NOTE: Please hang tight as we set up shop! The output window will update shortly!");
    println();
    delay(1000);
  }
  
  void hireManager(Manager m) {
    this.manager = m;
    println("A new manager has arrived!");
    delay(1000);
    this.manager.describe();
  }
  
  void addCustomer(Customer c) {
    this.customers.add(c);
    println();
    println(c.name + " has entered the store!");
    delay(1000);
  }
  
  void closeStore() {
    println("~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~");
    println("Thank you for visiting " + this.name + "! ");
    println("Feel free to take a copy of the menu with you :)");
    println("Remember to take your receipt from the printer!");
    println();
    println("We are now closed!");
    println("~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~");
    
    bgm.pause();
    closingTheme.play();
    delay(8000);
    bgm.loop();

  }
  
  void endOfDayReport() {
    this.revenue = 0;
    for (Customer c: customers) {
      c.calculateTotal();
      this.revenue += c.orderTotal;
    }
    println("Today's revenue totaled to $" + nf(this.revenue, 0, 2) + ".");
  }
  
  //converts from 24 hour time to AM/PM
  private String convertTime(String t) {
    int colonI = t.indexOf(":");
    int hour = int(t.substring(0, colonI));
    
    if (hour > 12) 
      return str(hour - 12) + ":00 pm";
  
    else if (hour == 12)
      return t + "pm";
      
    else
      return t + "am";
  }
  
}
