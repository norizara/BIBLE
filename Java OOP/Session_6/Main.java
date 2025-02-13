public class Main {
    public Main() {
        AVar aVar = new AVar();
        aVar.aVarConfirm();
    }

    public static void main(String[] args) {
        new Main();
        System.out.println("Hello World");
        myWorld();
    }

    public static void myWorld() {
        System.out.println("My World");
    }
}