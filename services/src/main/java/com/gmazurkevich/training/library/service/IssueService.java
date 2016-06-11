package com.gmazurkevich.training.library.service;

import java.util.List;

import javax.transaction.Transactional;

import com.gmazurkevich.training.library.dataaccess.filters.IssueFilter;
import com.gmazurkevich.training.library.datamodel.Issue;
import com.gmazurkevich.training.library.service.exception.DeleteNotEmptyItemException;

public interface IssueService {
	Issue get(Long id);

	@Transactional
	void update(Issue issue);

	@Transactional
	void delete(Issue issue);

	@Transactional
	void save(Issue issue);

	List<Issue> find(IssueFilter issueFilter);

	Long count(IssueFilter issueFilter);

	List<Issue> getAll();
}
