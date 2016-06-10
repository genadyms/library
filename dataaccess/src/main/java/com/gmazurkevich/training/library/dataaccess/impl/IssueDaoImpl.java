package com.gmazurkevich.training.library.dataaccess.impl;

import com.gmazurkevich.training.library.dataaccess.IssueDao;
import com.gmazurkevich.training.library.datamodel.Issue;

public class IssueDaoImpl extends AbstractDaoImpl<Issue, Long> implements IssueDao {

	protected IssueDaoImpl() {
		super(Issue.class);
	}
	
}
