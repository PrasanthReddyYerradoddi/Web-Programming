package gapp.model.dao.jpa;

import gapp.model.ApplicationStatus;
import gapp.model.dao.ApplicationStatusDao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


@Repository
public class ApplicationStatusDaoImpl implements ApplicationStatusDao {
	
	@PersistenceContext
    private EntityManager entityManager;

	@Override
	@Transactional
	public ApplicationStatus newStatus(ApplicationStatus status) {
		return entityManager.merge(status);
	}

}
