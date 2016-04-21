package gapp.model.dao.jpa;

import gapp.model.Degree;
import gapp.model.dao.DegreeDao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class DegreeDaoImpl implements DegreeDao {

	@PersistenceContext
    private EntityManager entityManager;

	@Override
	@Transactional
	public Degree newDegree(Degree degree) {
		return entityManager.merge(degree);
	}

	@Override
	public Degree getDegree(Integer id) {
		
		return entityManager.find(Degree.class, id);
	}

	@Override
	@Transactional
	public void delDegree(Integer id) {
		Degree d = entityManager.find(Degree.class, id);
		entityManager.remove(d);
	}
}
