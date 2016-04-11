package by.gmazurkevich.training.library.datamodel;

import java.util.Date;

public class Abonement {
	private Order order;
	private Date issue;
	private Date returnDate;
	private Date returnDateFact;

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public Date getIssue() {
		return issue;
	}

	public void setIssue(Date issue) {
		this.issue = issue;
	}

	public Date getReturnDate() {
		return returnDate;
	}

	public void setReturnDate(Date returnDate) {
		this.returnDate = returnDate;
	}

	public Date getReturnDateFact() {
		return returnDateFact;
	}

	public void setReturnDateFact(Date returnDateFact) {
		this.returnDateFact = returnDateFact;
	}
}
