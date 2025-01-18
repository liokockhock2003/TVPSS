package com.service;

import com.entity.News;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class NewsService {
    @Autowired
    private NewsDao newsDao;

    @Transactional
    public void saveNews(News news) {
        newsDao.saveNews(news);
    }

    @Transactional(readOnly = true)
    public News getNews(Long id) {
        return newsDao.getNews(id);
    }

    @Transactional(readOnly = true)
    public List<News> getAllNews() {
        return newsDao.getAllNews();
    }

    @Transactional
    public void deleteNews(Long id) {
        newsDao.deleteNews(id);
    }
}
