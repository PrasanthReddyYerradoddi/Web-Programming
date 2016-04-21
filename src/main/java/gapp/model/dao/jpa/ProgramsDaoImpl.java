package gapp.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import gapp.model.Departments;
import gapp.model.Programs;
import gapp.model.dao.ProgramsDao;

@Repository
public class ProgramsDaoImpl implements ProgramsDao {

	@PersistenceContext
	private EntityManager entityManager;

	@Override
	@Transactional
	public Programs setPrograms(Programs pgm) {
		return entityManager.merge(pgm);
	}

	@Override
	public Programs getProgram(Integer id) {
		return entityManager.find(Programs.class, id);
	}

	@Override
	public List<Programs> getDepartments(Departments department) {
		
		return entityManager.createQuery(" from Programs where department = :department", Programs.class).setParameter("department", department).getResultList();
	}

	@Override
	public List<Programs> getPrograms() {
		
		return entityManager.createQuery("from Programs order by id",Programs.class).getResultList();
	}

	@Override
	public List<Programs> getPrograms(Departments id) {
		return entityManager.createQuery("from Programs where department = :id",	Programs.class)
				.setParameter("id", id).getResultList();
	}

	@Override
	@Transactional
	public void removeProgram(Integer id) {
		Programs a = entityManager.createQuery("from Programs where program_id = :id",Programs.class).setParameter("id", id).getSingleResult();
		entityManager.remove(a);
		
	}
}
