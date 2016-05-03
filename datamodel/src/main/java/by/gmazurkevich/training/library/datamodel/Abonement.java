package by.gmazurkevich.training.library.datamodel;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.MapsId;
import javax.persistence.OneToOne;

@Entity
public class Abonement extends AbstractModel{
	@MapsId
	@OneToOne(fetch = FetchType.LAZY, optional = false, cascade = { CascadeType.PERSIST, CascadeType.MERGE })
	@JoinColumn(nullable = false, updatable = false, name = "id")
	private Order order;
	
	@Column (updatable = false)
	private Date dateTake;
	
	@Column
	private Date dateReturn;
	
	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	protected Date getDateTake() {
		return dateTake;
	}

	protected void setDateTake(Date dateTake) {
		this.dateTake = dateTake;
	}

	protected Date getDateReturn() {
		return dateReturn;
	}

	protected void setDateReturn(Date dateReturn) {
		this.dateReturn = dateReturn;
	}


}
