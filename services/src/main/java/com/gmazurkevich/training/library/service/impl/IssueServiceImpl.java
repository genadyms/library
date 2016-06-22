package com.gmazurkevich.training.library.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.gmazurkevich.training.library.dataaccess.IssueDao;
import com.gmazurkevich.training.library.dataaccess.filters.IssueFilter;
import com.gmazurkevich.training.library.datamodel.CopyBook;
import com.gmazurkevich.training.library.datamodel.Issue;
import com.gmazurkevich.training.library.service.IssueService;

@Service
public class IssueServiceImpl implements IssueService {
	private static Logger LOGGER = LoggerFactory.getLogger(IssueServiceImpl.class);
	@Inject
	private IssueDao issueDao;

	@Override
	public Issue get(Long id) {
		return issueDao.get(id);
	}

	@Override
	public void update(Issue issue) {
		issueDao.update(issue);
		LOGGER.info("Update {}", issue);
	}

	@Override
	public void delete(Issue issue) {
		issueDao.delete(issue.getId());
		LOGGER.info("Delete {}", issue);
	}

	@Override
	public void save(Issue issue) {
		issueDao.insert(issue);
		LOGGER.info("Save {}", issue);
	}

	@Override
	public List<Issue> find(IssueFilter issueFilter) {
		return issueDao.find(issueFilter);
	}

	@Override
	public Long count(IssueFilter issueFilter) {
		return issueDao.count(issueFilter);
	}

	@Override
	public List<Issue> getAll() {
		return issueDao.getAll();
	}

	@Override
	public Issue getActiveIssue(CopyBook copyBook) {
		IssueFilter filter = new IssueFilter();
		filter.setCopyBook(copyBook);
		filter.setStatusActive(true);
		List<Issue> result = issueDao.find(filter);
		return result.isEmpty() ? null : result.get(0);
	}

}
