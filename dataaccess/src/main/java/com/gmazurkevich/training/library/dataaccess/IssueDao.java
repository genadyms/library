package com.gmazurkevich.training.library.dataaccess;

import java.util.List;

import com.gmazurkevich.training.library.dataaccess.filters.IssueFilter;
import com.gmazurkevich.training.library.datamodel.Issue;

public interface IssueDao extends AbstractDao<Issue, Long> {
	List<Issue> find(IssueFilter filter);

	long count(IssueFilter filter);
}
