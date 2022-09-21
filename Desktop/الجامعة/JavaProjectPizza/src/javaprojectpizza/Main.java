package javaprojectpizza;

public class Main {

    public static void main(String[] args) {

        PizzaLogger logger = new PizzaLogger();
        Pizza pizza = new Pizza(logger);
        pizza.pizzaMachineStarted();

//        OrderPizza order = new OrderPizza(logger);
//        order.setVisible(true);
        
    }

}
