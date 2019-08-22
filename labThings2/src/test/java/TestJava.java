import org.hibernate.SessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.xiaochuang.labThings.entity.Category;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class TestJava extends HibernateDaoSupport {

    @Autowired
    @Qualifier("sessionFactory")
    public void init(SessionFactory sessionFactory) {
        super.setSessionFactory(sessionFactory);
    }

    @Test
    public void test() {
        System.out.println("asdf");
        Category category = this.getHibernateTemplate().get(Category.class, (long)1);

        System.out.println("a: " + category.getName());
    }
}
