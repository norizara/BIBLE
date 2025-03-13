package cicinenemama;

public class Ticket {
	int id;
	double price;
	boolean paymentStatus;
	Customer customer;
	public Ticket(int id, double price, Customer customer) {
		this.id = id;
		this.price = price;
		this.customer = customer;
		this.paymentStatus = true;
	}
	
	public int getId() {
		return id;
	}
	public double getPrice() {
		return price;
	}
	public String getPaymentStatus() {
		if(paymentStatus == true)
			return "Paid";
		else
			return "Not Paid";
	}
	public Customer getCustomer() {
		return customer;
	}

}
