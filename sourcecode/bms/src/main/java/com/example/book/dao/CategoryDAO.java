package com.example.book.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.book.entity.CategoryBO;

@Transactional
@Repository
public interface CategoryDAO  extends CrudRepository<CategoryBO, Long>{
	
	@Query(value = "select * from category c", nativeQuery = true)
    public List<CategoryBO> getALl();
	
}
