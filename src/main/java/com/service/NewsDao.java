package com.service;

import com.entity.News;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public class NewsDao {
    @Autowired
    private SessionFactory sessionFactory;

    private Session getCurrentSession() {
        return sessionFactory.getCurrentSession();
    }

    @Transactional
    public void saveNews(News news) {
        getCurrentSession().saveOrUpdate(news);
    }

    @Transactional(readOnly = true)
    public News getNews(Long id) {
        return getCurrentSession().get(News.class, id);
    }

    @Transactional(readOnly = true)
    public List<News> getAllNews() {
        return getCurrentSession()
                .createQuery("from News order by datePublished desc", News.class)
                .list();
    }

    @Transactional
    public void deleteNews(Long id) {
        News news = getNews(id);
        if (news != null) {
            getCurrentSession().delete(news);
        }
    }
}
