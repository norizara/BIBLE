package packaage;
public class Main {
    public static void main(String[] args) {
        Student student = new Student();
        student.name.setFirstName("John");
        student.name.setLastName("Doe");
        student.address.setStreet("123 Main St");
        student.address.setCity("Anytown");
        student.address.setState("NY");
        student.address.setZip("12345");

        System.out.println("First Name: " + student.name.firstName);
        System.out.println("Last Name: " + student.name.lastName);
        System.out.println("Street: " + student.address.street);
        System.out.println("City: " + student.address.city);
        System.out.println("State: " + student.address.state);
        System.out.println("Zip: " + student.address.zip);
    }
}
