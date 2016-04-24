package by.gmazurkevich.training.library.dataaccess.impl;

import by.gmazurkevich.training.library.dataaccess.AbonementDao;
import by.gmazurkevich.training.library.datamodel.Abonement;

public class AbonementDaoImpl extends AbstractDaoImpl<Abonement, Long> implements AbonementDao {

	protected AbonementDaoImpl() {
		super(Abonement.class);
	}

}
