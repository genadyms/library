package by.gmazurkevich.training.library.datamodel;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.MapsId;
import javax.persistence.OneToOne;

@Entity
public class Abonement {
	
	@MapsId
    @OneToOne(fetch = FetchType.LAZY, optional = false, cascade = { CascadeType.PERSIST, CascadeType.MERGE })
    @JoinColumn(nullable = false, updatable = false, name = "id")
	private Order order;
	
	@Column (updatable = false)
	private Date issue;
	
	@Column
	private Date returnDate;
	
	@Column
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
