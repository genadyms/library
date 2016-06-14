package com.gmazurkevich.training.library.service;

import java.util.Date;
import java.util.List;
import javax.transaction.Transactional;

import com.gmazurkevich.training.library.dataaccess.filters.CopyBookFilter;
import com.gmazurkevich.training.library.datamodel.CopyBook;

public interface CopyBookService {
	CopyBook get(Long id);

	@Transactional
	void update(CopyBook copyBook);

	@Transactional
	void delete(Long id);

	@Transactional
	void save(CopyBook copyBook);

	List<CopyBook> find(CopyBookFilter filter);

	Long count(CopyBookFilter filter);

	Date getFreeDateFrom(CopyBook copyBook);

}
