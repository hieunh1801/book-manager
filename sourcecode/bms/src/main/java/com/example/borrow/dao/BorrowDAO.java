package com.example.borrow.dao;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.borrow.bo.BorrowBO;

@Transactional
@Repository
public interface BorrowDAO extends JpaRepository<BorrowBO, Long> {

}
