package com.gmazurkevich.training.library.service;

import java.util.List;

import javax.transaction.Transactional;

import com.gmazurkevich.training.library.dataaccess.filters.IssueFilter;
import com.gmazurkevich.training.library.datamodel.CopyBook;
import com.gmazurkevich.training.library.datamodel.Issue;

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

	Issue getActiveIssue(CopyBook copyBook);
}
