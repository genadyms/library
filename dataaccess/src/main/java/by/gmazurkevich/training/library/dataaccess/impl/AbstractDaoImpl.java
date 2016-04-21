package by.gmazurkevich.training.library.dataaccess.impl;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

public class AbstractDaoImpl {

    @PersistenceContext
    private EntityManager entityManager;

}
