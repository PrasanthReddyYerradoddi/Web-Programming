package gapp.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import gapp.model.Departments;
import gapp.model.Programs;
import gapp.model.dao.DepartmentDao;

@Repository
public class DepartmentDaoImpl implements DepartmentDao {

	@PersistenceContext
    private EntityManager entityManager;

	@Override
	public List<Departments> getDepartments() {
		return entityManager.createQuery( "from Departments order by id", Departments.class )
	            .getResultList();
	}

	@Override
	public List<Departments> getDepartment(String department, String term) {
		return entityManager.createQuery( "select d from Departments d JOIN d.application a where d.department= :department and a.term= :term", Departments.class )
	            .setParameter("department", department).setParameter("term", term).getResultList();
	}

	@Override
	public Departments getDepartment(Integer id) {
		
		return entityManager.find(Departments.class,id);
	}

	@Override
	@Transactional
	public Departments addDepartment(Departments dept) {
		
		return entityManager.merge(dept);
	}

	@Override
	public List<Departments> getProgram(Integer id) {
		return entityManager
				.createQuery(
						"Select d from Departments d JOIN d.programs p where d.department_id= :id",
						Departments.class).setParameter("department_id", id).getResultList();
	}

}
