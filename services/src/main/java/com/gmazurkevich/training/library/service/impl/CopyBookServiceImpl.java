package com.gmazurkevich.training.library.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.gmazurkevich.training.library.dataaccess.CopyBookDao;
import com.gmazurkevich.training.library.dataaccess.filters.CopyBookFilter;
import com.gmazurkevich.training.library.datamodel.CopyBook;
import com.gmazurkevich.training.library.service.CopyBookService;

@Service
public class CopyBookServiceImpl implements CopyBookService {
	@Inject
	private CopyBookDao copyBookDao;

	@Override
	public CopyBook get(Long id) {
		return copyBookDao.get(id);
	}

	@Override
	public void update(CopyBook copyBook) {
		copyBookDao.update(copyBook);
	}

	@Override
	public void delete(Long id) {
		copyBookDao.delete(id);
	}

	@Override
	public void save(CopyBook copyBook) {
		copyBookDao.insert(copyBook);
	}

	@Override
	public List<CopyBook> find(CopyBookFilter filter) {
		return copyBookDao.find(filter);
	}

}
