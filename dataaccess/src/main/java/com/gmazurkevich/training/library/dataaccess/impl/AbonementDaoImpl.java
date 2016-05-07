package com.gmazurkevich.training.library.dataaccess.impl;

import com.gmazurkevich.training.library.dataaccess.AbonementDao;
import com.gmazurkevich.training.library.datamodel.Abonement;

public class AbonementDaoImpl extends AbstractDaoImpl<Abonement, Long> implements AbonementDao {

	protected AbonementDaoImpl() {
		super(Abonement.class);
	}

}
