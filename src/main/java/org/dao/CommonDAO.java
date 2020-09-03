package org.dao;

import org.hibernate.Session;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.util.HibernateTestUtil;
import java.util.List;
public class CommonDAO<T> {

    private SessionFactory factory;
    private Class clazz;
    private String boardName;


    public CommonDAO(Class<?> clazz) {
        factory = HibernateTestUtil.getInstance().getSessionFactory(clazz);
        this.clazz = clazz;
        this.boardName = clazz.getSimpleName().replace("DAO", "");
    }

    public List<?> selectList() {
        Session session = factory.getCurrentSession();
        session.beginTransaction();
        Query query = session.createQuery("from "+boardName);

        List<?> list = query.list();
        session.getTransaction().commit();
        return list;
    }

    public void delete(T member) {
        Session session = factory.getCurrentSession();
        session.beginTransaction();
        session.delete(member);
        session.getTransaction().commit();
    }

    public void update(T selectedMember) {
        Session session = factory.getCurrentSession();
        session.beginTransaction();
        session.update(selectedMember);
        session.getTransaction().commit();
    }

    public T selectById(int id) {
        Session session = factory.getCurrentSession();
        session.beginTransaction();
        T member = (T) session.get(clazz, id);
        session.getTransaction().commit();
        return member;
    }

    public void insert(T member) {
        Session session = factory.getCurrentSession();
        session.beginTransaction();
        session.save(member);
        session.getTransaction().commit();
    }

//    public  void
}
