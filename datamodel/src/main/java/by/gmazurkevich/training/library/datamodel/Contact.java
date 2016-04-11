package by.gmazurkevich.training.library.datamodel;

public class Contact extends AbstractModel {
	private Integer phone;
	private String address;

	public Integer getPhone() {
		return phone;
	}

	public void setPhone(Integer phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
}
