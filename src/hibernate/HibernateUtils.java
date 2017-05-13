package hibernate;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;


/**
 * Created by ZxcHugo on 2017/5/7.
 */
public class HibernateUtils {
    static StandardServiceRegistry registry = null;
    static SessionFactory sessionFactory = null;
    static Session session = null;

    public static Session getSession() {
        registry = new StandardServiceRegistryBuilder().configure().build();
        sessionFactory = new MetadataSources(registry).buildMetadata().buildSessionFactory();
        session = sessionFactory.openSession();
        return session;
    }

    public static void destorySession() {
        session.close();
        sessionFactory.close();
        StandardServiceRegistryBuilder.destroy(registry);
    }
}
