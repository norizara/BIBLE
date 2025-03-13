package cicinenemama;
import java.util.*;

public class Cinema {
	String name;
	String location;
	ArrayList<Hall> halls = new ArrayList<Hall>();
	ArrayList<Employee> employees = new ArrayList<Employee>();
	
	public Cinema(String name, String location) {
		this.name = name;
		this.location = location;
	}

	public String getName() {
		return name;
	}

	public String getLocation() {
		return location;
	}

	public ArrayList<Hall> getHalls() {
		return halls;
	}

	public ArrayList<Employee> getEmployees() {
		return employees;
	}
	
	public void addHall(Hall hall) {
		halls.add(hall);
	}
	
	public void addEmployee(Employee employee) {
		employees.add(employee);
	}
	
	public void displayCinemaInfo() {
		System.out.println("Cinema: "+name);
		System.out.println("Location: "+location+"\n");
		System.out.println("Employees: ");
		for(Employee employee: employees) {
			System.out.println("- Name: " + employee.getName() +", Role: "+ employee.getRole());
		}
		System.out.println();
		System.out.println("Halls: ");
		for(Hall hall: halls) {
			System.out.println("Hall "+hall.getHallNumber() + "(Capacity: " + hall.getCapacity() + ")");
			for(Showtime showtime: hall.getShowtimes()) {
				System.out.println("Showtimes");
				System.out.println("- Movie: "+showtime.getMovie().getTitle());
				System.out.println("Time: "+showtime.getTime() + ", Date: "+showtime.getDate());
				System.out.println("Tickets: ");
				if(showtime.getTickets().isEmpty() == true) {
					System.out.println("No Tickets Booked");
				}else {
					for(Ticket ticket: showtime.getTickets()) {
						System.out.println("* Ticket ID: " + ticket.getId() + ", Price: "+ticket.getPrice()+", Customer: "+ticket.getCustomer().getName() + ", Payment Status: "+ticket.getPaymentStatus());
					}					
				}
				System.out.println();
			}
		}
		
		System.out.println("Customer: ");
		for(Hall hall: halls) {
			for(Showtime showtime: hall.getShowtimes()) {
				for(Ticket ticket: showtime.getTickets()) {
					System.out.println("Name: "+ticket.getCustomer().getName()+", Age: "+ticket.getCustomer().getAge());
					System.out.println("Tickets: ");
					for(Ticket customerTickets: ticket.getCustomer().getTickets()) {
						System.out.println("* Ticket ID: "+customerTickets.getId()+", Movie: "+showtime.getMovie().getTitle()+", Showtime: "+showtime.getTime()+", Date: "+showtime.getDate()+",Price: "+customerTickets.getPrice()+", Status: "+customerTickets.getPaymentStatus());
					}
				}
			}
		}
	} 

	
}
