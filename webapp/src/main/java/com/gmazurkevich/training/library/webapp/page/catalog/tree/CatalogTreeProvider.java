package com.gmazurkevich.training.library.webapp.page.catalog.tree;
/*
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.wicket.extensions.markup.html.repeater.tree.ITreeProvider;
import org.apache.wicket.model.IModel;
import org.apache.wicket.model.LoadableDetachableModel;
import com.gmazurkevich.training.library.datamodel.Catalog;

public class CatalogTreeProvider implements ITreeProvider<Foo> {

	private static final long serialVersionUID = 1L;

	private final static List<Foo> foos = new ArrayList<>();

	public CatalogTreeProvider(List<Catalog> catalogs) {
		if (foos.isEmpty()) {
			makeTempFoo(catalogs);
		}

	}

	private void makeTempFoo(List<Catalog> catalogs) {
		for (Catalog current : catalogs) {
			Foo rootFoo = new Foo(current.getTitle());
			if (!current.getChilds().isEmpty()) {
				List<Catalog> childs = current.getChilds();
				for (Catalog cur : childs) {
					Foo fooAA = new Foo(rootFoo, cur.getTitle());
					for (int i = 0; i < 5; i++)
						new Foo(fooAA, "test_book_" + i);
				}
			}
			foos.add(rootFoo);
		}
	}

	@Override
	public void detach() {
	}

	@Override
	public Iterator<Foo> getRoots() {
		return foos.iterator();
	}

	@Override
	public boolean hasChildren(Foo foo) {
		return foo.getParent() == null || !foo.getFoos().isEmpty();
	}

	@Override
	public Iterator<Foo> getChildren(final Foo foo) {
		return foo.getFoos().iterator();
	}

	@Override
	public IModel<Foo> model(Foo foo) {
		return new FooModel(foo);
	}

	private static Foo getFoo(String id) {
		return findFoo(foos, id);
	}

	private static Foo findFoo(List<Foo> foos, String id) {
		for (Foo foo : foos) {
			if (foo.getId().equals(id)) {
				return foo;
			}

			Foo temp = findFoo(foo.getFoos(), id);
			if (temp != null) {
				return temp;
			}
		}

		return null;
	}

	private static class FooModel extends LoadableDetachableModel<Foo> {
		private static final long serialVersionUID = 1L;

		private final String id;

		public FooModel(Foo foo) {
			super(foo);
			id = foo.getId();
		}

		@Override
		protected Foo load() {

			return getFoo(id);
		}

		@Override
		public boolean equals(Object obj) {
			if (obj instanceof FooModel) {
				return ((FooModel) obj).id.equals(id);
			}
			return false;
		}

		@Override
		public int hashCode() {
			return id.hashCode();
		}
	}
}
