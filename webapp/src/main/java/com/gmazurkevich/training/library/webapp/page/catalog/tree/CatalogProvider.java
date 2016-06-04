package com.gmazurkevich.training.library.webapp.page.catalog.tree;


import java.util.Iterator;
import java.util.List;

import javax.inject.Inject;

import org.apache.wicket.extensions.markup.html.repeater.tree.ITreeProvider;
import org.apache.wicket.injection.Injector;
import org.apache.wicket.model.IModel;
import org.apache.wicket.model.LoadableDetachableModel;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.gmazurkevich.training.library.datamodel.Catalog;
import com.gmazurkevich.training.library.service.CatalogService;

public class CatalogProvider implements ITreeProvider<Catalog>{
	@Inject
	public CatalogService catalogService;
	
	private static Logger LOGGER = LoggerFactory.getLogger(CatalogProvider.class);
	private List<Catalog> roots;
	
	public CatalogProvider() {
		Injector.get().inject(this);
	}
	
	@Override
	public void detach() {
		
	}

	@Override
	public Iterator<Catalog> getChildren(Catalog catalog) {
		return catalogService.getCatalogs(catalog).iterator();
	}

	@Override
	public Iterator<Catalog> getRoots() {
		List<Catalog> childs = catalogService.getCatalogs(null);
		if(childs==null) {
			LOGGER.debug("No find root catalog");
			return null;
		}
		return catalogService.getCatalogs(null).iterator();
		
	}

	@Override
	public boolean hasChildren(Catalog catalog) {
		List<Catalog> childs = catalogService.getCatalogs(catalog);
		return childs!=null || !childs.isEmpty();
	}

	@Override
	public IModel<Catalog> model(Catalog catalog) {
		return new CatalogModel(catalog);
	}
	
	private class CatalogModel extends LoadableDetachableModel<Catalog>{
		
		private final Long id;
		private final Catalog catalog;
		
		public CatalogModel(Catalog catalog) {
			super(catalog);
			this.catalog=catalog;
			id = catalog.getId();
		}

		@Override
		protected Catalog load() {
			return catalogService.getCatalog(id);
		}

		@Override
		public int hashCode() {
			final int prime = 31;
			int result = 1;
			result = prime * result + getOuterType().hashCode();
			result = prime * result + ((id == null) ? 0 : id.hashCode());
			return result;
		}

		@Override
		public boolean equals(Object obj) {
			if (this == obj)
				return true;
			if (obj == null)
				return false;
			if (getClass() != obj.getClass())
				return false;
			CatalogModel other = (CatalogModel) obj;
			if (!getOuterType().equals(other.getOuterType()))
				return false;
			if (id == null) {
				if (other.id != null)
					return false;
			} else if (!id.equals(other.id))
				return false;
			return true;
		}

		private CatalogProvider getOuterType() {
			return CatalogProvider.this;
		}

		@Override
		public String toString() {
			return (catalog.getTitle()+"/");
		}
		
	}
}
