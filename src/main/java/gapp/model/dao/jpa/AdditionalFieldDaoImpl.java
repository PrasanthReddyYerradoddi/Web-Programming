package gapp.model.dao.jpa;

import java.util.List;

import gapp.model.ApplicationAdditionalFields;
import gapp.model.Departments;
import gapp.model.Programs;
import gapp.model.dao.AdditionalFieldDao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class AdditionalFieldDaoImpl implements AdditionalFieldDao{

	@PersistenceContext
    private EntityManager entityManager;
	
	@Override
	@Transactional
	public ApplicationAdditionalFields addField(ApplicationAdditionalFields add) {
		
		return entityManager.merge(add);
	}

	@Override
	public ApplicationAdditionalFields getField(Integer id) {
		return entityManager.find(ApplicationAdditionalFields.class, id);
	}

	@Override
	public List<ApplicationAdditionalFields> getDepartments(
			Departments department) {
		return entityManager.createQuery("from ApplicationAdditionalFields where department = :department", ApplicationAdditionalFields.class).setParameter("department", department).getResultList();
	}

	@Override
	@Transactional
	public void removefield(Integer id) {
		ApplicationAdditionalFields a = entityManager.createQuery("from ApplicationAdditionalFields where field_id =:id",ApplicationAdditionalFields.class).setParameter("id", id).getSingleResult();
		entityManager.remove(a);
		
	}

}
