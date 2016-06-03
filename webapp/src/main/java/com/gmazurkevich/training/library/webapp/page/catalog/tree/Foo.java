package com.gmazurkevich.training.library.webapp.page.catalog.tree;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;


public class Foo {

	private static final long serialVersionUID = 1L;

	private String id;

	
	private Foo parent;

	private List<Foo> foos = new ArrayList<>();

	public Foo(String id) {
		this.id = id;
	}

	public Foo(Foo parent, String name) {
		this(name);

		this.parent = parent;
		this.parent.foos.add(this);
	}

	public Foo getParent() {
		return parent;
	}

	public String getId() {
		return id;
	}


	public List<Foo> getFoos() {
		return Collections.unmodifiableList(foos);
	}

	@Override
	public String toString() {
		return id;
	}

}