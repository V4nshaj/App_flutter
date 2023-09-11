void main() {
  Animal().move();
  Fish().move();
  Bird().move();
  Duck().move();
  Duck().fly();
  Duck().swim();
}

class Animal {
  void move() {
    print("Change position");
  }
}

class Fish extends Animal {
  //extends inherits the properties of animal class
  @override //override helps to rewrite the function
  void move() {
    super.move(); //calls the function of super class
    print("by swimming");
  }
}

class Bird extends Animal with Canfly {}

mixin Canfly {
  void fly() {
    print("Change position by flying");
  }
}
mixin Canswim {
  void swim() {
    print("Change position by swimn");
  }
}

class Duck extends Animal with Canfly, Canswim {
  //duck can both aswim and fly but we can inherit only one class Bird or Fish to inherit both properties we use mixin

}

class Airplane with Canfly {}
