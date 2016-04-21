package gapp.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import gapp.model.Application;
import gapp.model.Programs;
import gapp.model.Users;
import gapp.model.dao.ApplicationDao;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class ApplicationDaoImpl implements ApplicationDao {

	@PersistenceContext
    private EntityManager entityManager;
	
	@Override
	public List<Application> getApplications(Integer id) {
		
		return entityManager.createQuery("from Application where user = :id",Application.class).setParameter("id", id).getResultList();
	}

	@Override
	public Application getApplication(Integer id) {
		
		return entityManager.find(Application.class,id);
	}

	@Override
	@Transactional
	public Application newApplication(Application app) {
		
		return entityManager.merge(app);
	}

	@Override
	public List<Application> getAppPgm(Programs pgm) {
		return entityManager.createQuery("from Application where program = :pgm",Application.class).setParameter("pgm", pgm).getResultList();
	}

	

}
