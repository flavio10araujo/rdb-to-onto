package br.ufpr.dao;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;

import br.ufpr.bean.Instance;

public class InstanceDao extends GenericDao {

	public Instance getByClass(br.ufpr.bean.Class clazz) {
		if (clazz == null) {
			return null;
		}
		
		Criteria criteria = getSession().createCriteria(br.ufpr.bean.Instance.class);
		criteria.add(Restrictions.eq("clazz", clazz));
		
		try {
			return (Instance) criteria.list().get(0);
		}
		catch (Exception e) {
			return null;
		}
	}
}