package com.gmazurkevich.training.library.dataaccess;

import java.util.List;

import com.gmazurkevich.training.library.dataaccess.filters.CopyBookFilter;
import com.gmazurkevich.training.library.datamodel.CopyBook;

public interface CopyBookDao extends AbstractDao<CopyBook, Long> {

	List<CopyBook> find(CopyBookFilter filter);

	Long count(CopyBookFilter filter);

	CopyBook getFetchCopyBook(CopyBookFilter filter);
}
