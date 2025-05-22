package OCP;

public class Regular implements DiscountCalculator{
	private int amount;
	private double discount;
	
	public Regular(int amount, int discount) {
		this.amount = amount;
		this.discount = discount;
	}
	
	@Override
    public double calculateDiscount() {
		return this.amount * this.discount;
    }
}
