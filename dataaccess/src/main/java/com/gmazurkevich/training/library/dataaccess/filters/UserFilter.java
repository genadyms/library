package com.gmazurkevich.training.library.dataaccess.filters;

import javax.persistence.metamodel.SingularAttribute;

import com.gmazurkevich.training.library.datamodel.Department;
import com.gmazurkevich.training.library.datamodel.UserRole;

public class UserFilter extends AbstractFilter {

    private String userName;
    private SingularAttribute sortProperty;
    private boolean sortOrder;
    private Integer offset;
    private Integer limit;
    private Department department;
    private UserRole role;

    public UserRole getRole() {
		return role;
	}

	public void setRole(UserRole role) {
		this.role = role;
	}

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	private boolean isFetchCredentials;

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public SingularAttribute getSortProperty() {
        return sortProperty;
    }

    public void setSortProperty(SingularAttribute sortProperty) {
        this.sortProperty = sortProperty;
    }

    public boolean isSortOrder() {
        return sortOrder;
    }

    public void setSortOrder(boolean sortOrder) {
        this.sortOrder = sortOrder;
    }

    public Integer getOffset() {
        return offset;
    }

    public void setOffset(Integer offset) {
        this.offset = offset;
    }

    public Integer getLimit() {
        return limit;
    }

    public void setLimit(Integer limit) {
        this.limit = limit;
    }

    public boolean isFetchCredentials() {
        return isFetchCredentials;
    }

    public void setFetchCredentials(boolean isFetchCredentials) {
        this.isFetchCredentials = isFetchCredentials;
    }

}
