// Bubble Tea Shop
// YINA GAO
// March 2021
// ICS 4UI

// DESCRIPTION: An object-orientated interpretation of the day-to-day
//              operations of a bubble tea store! Based (loosely) on
//              my experiences working at a bubble tea store :D

// NOTE: Please import Minim for the full experience! (Sketch > Import Library > Add Library > Minim > Install)
// ID3 Error occurs because Minim can't find the artist/track name information of my shady mp3 files, but it doesn't interfere with the program

// what_is_love.mp3 via (https://www.youtube.com/watch?v=BeGFu6ezw88&t=134s&ab_channel=Darnu-Pop)
// mario_course_clear.mp3 via (https://www.youtube.com/watch?v=1Zmb9Vh8Ja0&ab_channel=GilvaSunner)

// Change these values to name and create your own Bubble Tea Shop!
String storeName = "Starlight Tea Shop";
String openingTime = "12:00"; // 24 hour time
String closingTime = "23:00";
String slogan = "Every drink here is infused with a bit of star dust";

// Don't touch from here on
import ddf.minim.*;
Minim minim;
AudioPlayer bgm, closingTheme;

boolean showMenu = true;
int customerIndex = 0;
PImage menu, bg;
PFont f1, f2, f3;
color peach = color(237, 146, 152);
color cream = color(255, 244, 231);

// needs to be global for draw()
Store myStore = new Store(storeName, openingTime, closingTime, slogan);

void setup() {
  size(500, 700);
  background(cream);
  fill(peach);
  
  menu = loadImage("menu.jpg");
  bg = loadImage("background.jpg");
  
  f1 = createFont("Century Gothic Bold", 18);
  f2 = createFont("Century Gothic Bold", 12);
  f3 = createFont("Century Gothic Bold", 24);
  
  minim = new Minim(this);
  bgm = minim.loadFile("what_is_love.mp3");
  closingTheme = minim.loadFile("mario_course_clear.mp3");
  bgm.loop();
  
  Manager michelle = new Manager("Michelle", "she", 8, 2);

  Customer jessica = new Customer(myStore, "Jessica", 10, 21);
  Customer samer = new Customer(myStore, "Samer", 6, 13);
  Customer cristian = new Customer(myStore, "Cristian", 5, 52);
  Customer trevor = new Customer(myStore, "Trevor", 1, 5);
  Customer mrS = new Customer(myStore, "Mr. Schattman", 4, 0);
  
  Employee yina = new Employee("Yina", 0, 10, 3);
  Employee sean = new Employee("Sean", 7, 4, 5);
  Employee lauren = new Employee("Lauren", 5, 2, 5);
  Employee khaled = new Employee("Khaled", 6, 4, 5);
  
  myStore.openStore();
  myStore.hireManager(michelle);
  
  // manager is reviewing applicants and deciding who to hire
  michelle.hireEmployees(myStore, yina);
  michelle.hireEmployees(myStore, sean);
  michelle.hireEmployees(myStore, lauren);
  michelle.hireEmployees(myStore, khaled);
  
  // preparing ingredients
  Employee pearlDuty = michelle.assignEmployee(myStore);
  pearlDuty.makePearl();
  
  // customers are coming in and ordering!
  myStore.addCustomer(jessica);
  jessica.describe();
  jessica.orderDrink(" ", "Green Milk Tea", 80, "less ice");
  jessica.orderDrink("Mango", "Green Tea + pearls", 100, "normal ice");
  
  // make customer #1's drinks
  Employee orderOne = michelle.assignEmployee(myStore);
  orderOne.prepareOrder(jessica, michelle);
  
  myStore.addCustomer(samer);
  samer.describe();
  samer.orderDrink(" ", "Iron Goddess Milk Tea", 25, "no ice");
  
  // make customer #2's drinks
  Employee orderTwo = michelle.assignEmployee(myStore);
  orderTwo.prepareOrder(samer, michelle);
  
  myStore.addCustomer(cristian);
  cristian.describe();
  cristian.orderDrink("Taro", "Milk Tea + pearls", 80, "normal ice");
  cristian.orderDrink("Strawberry", "Green Tea", 80, "normal ice");
  cristian.orderDrink("Peach", "Green Tea + pearls", 80, "normal ice");
  
  // make customer #3's drinks
  Employee orderThree = michelle.assignEmployee(myStore);
  orderThree.prepareOrder(cristian, michelle);
  
  myStore.addCustomer(trevor);
  trevor.describe();
  trevor.orderDrink(" ", "Oolong Milk Tea + pearls", 25, "no ice");
  
  // make customer #4's drinks
  Employee orderFour = michelle.assignEmployee(myStore);
  orderFour.prepareOrder(trevor, michelle);
  
  myStore.addCustomer(mrS);
  mrS.describe();
  mrS.orderDrink("Matcha", "Milk Tea", 50, "normal ice");
  mrS.orderDrink(" ", "Earl Grey Milk Tea", 50, "normal ice");
  
  // make customer #5's drinks
  Employee orderFive = michelle.assignEmployee(myStore);
  orderFive.prepareOrder(mrS, michelle);

  // close store and count revenue
  myStore.closeStore();
  myStore.endOfDayReport();
}

void draw() {

  if (showMenu == true) {
    image(menu, 0, 0);
    stroke(peach);
    fill(cream);
    rect(200, 630, 100, 50);
    fill(peach);
    textFont(f1);
    textAlign(CENTER);
    text("RECEIPTS", 250, 663);
    textAlign(LEFT);
    textFont(f3);
    text(myStore.name, 50, 80);
  }
  
  else {
    background(bg);
    fill(cream);
    rect(100, 100, 300, 500);
    
    Customer currentOrder = myStore.customers.get(customerIndex);
    currentOrder.printReceipt(); // draws the receipts of each customer
    
    fill(peach);
    rect(200, 630, 100, 50);
    fill(cream);
    textFont(f1);
    textAlign(CENTER);
    text("NEXT", 250, 663);
    
  }
  noLoop();
}

// chnage between pages
void mousePressed() {
  if (mouseX > 200 && mouseX < 300 && mouseY > 630 && mouseY < 680) {
   
    if (showMenu == true) {
      showMenu = false;
    }
        
    else {
      if (customerIndex < myStore.customers.size()-1)
        customerIndex++;
      else
        customerIndex = 0;
    }
    
    loop();
  }
}
