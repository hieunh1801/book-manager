package com.example.borrow.dao;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.borrow.bean.BorrowBean;
import com.example.borrow.bo.BorrowBO;
import com.example.borrow.form.BorrowForm;
import com.example.common.CommonUtil;
import com.example.common.DataTableResults;
import com.example.common.UttData;
import com.example.member.bean.MemberBean;

@Transactional
@Repository
public interface BorrowDAO extends JpaRepository<BorrowBO, Long> {
    public default DataTableResults<BorrowBean> searchHistory(UttData uttData, BorrowForm formData) {
        List<Object> paramList = new ArrayList<>();
        String sql = " SELECT b.id as id "
                + "  ,b.from_date as fromDate   "
                + "  ,b.to_date as toDate   "
                + "  ,concat(bk.code,'-',bk.name)  as bookName   "
                + "  ,b.status as status    "
                + " ,b.adjourn as adjourn "
                + " from borrow b   "
                + "  inner join book bk on b.book_id = bk.id  ";

        StringBuilder strCondition = new StringBuilder(" WHERE 1 ");
        CommonUtil.filter(formData.getMemberId(), strCondition, paramList, "b.member_id");
        
        String selectFields = " order by id ";
        
        return uttData.findPaginationQuery(sql + strCondition.toString(), selectFields, paramList, BorrowBean.class);
    }
    
    
    public default DataTableResults<BorrowBean> search(UttData uttData, BorrowForm formData) {
        List<Object> paramList = new ArrayList<>();
        String sql = " SELECT b.id as id "
                + "  ,b.from_date as fromDate   "
                + "  ,b.to_date as toDate   "
//                + "  ,concat(bk.code,'-',bk.name)  as bookName   "
                + "  ,bk.name  as bookName   "
                + "  ,b.status as status    "
                + " ,b.adjourn as adjourn "
                + " ,m.id as memberId "
                + " ,m.code as memberCode   "
                + " ,m.full_name as memberName  "
                + " ,c.name as categoryName  "
                + " from borrow b   "
                + "  inner join book bk on b.book_id = bk.id   "
                + "  inner join member m on m.id = b.member_id  "
                + "  inner join category c on c.id = bk.category_id   ";

        StringBuilder strCondition = new StringBuilder(" WHERE 1 ");
        CommonUtil.filter(formData.getMemberId(), strCondition, paramList, "b.member_id");
        CommonUtil.filter(formData.getStatus(), strCondition, paramList, "b.status");
        CommonUtil.filter(formData.getMemberCode(), strCondition, paramList, "m.code");
        CommonUtil.filter(formData.getMemberName(), strCondition, paramList, "m.full_name");
        CommonUtil.filter(formData.getCategoryId(), strCondition, paramList, "bk.category_id");
        CommonUtil.filter(formData.getBookName(), strCondition, paramList, "bk.name");
        
        
        String selectFields = " order by id ";
        
        return uttData.findPaginationQuery(sql + strCondition.toString(), selectFields, paramList, BorrowBean.class);
    }
    
    
    
    public default List<MemberBean> searchMemberAutoComplete(UttData uttData,String search) {
        List<Object> paramList = new ArrayList<>();
        String sql = " SELECT    "
                + " m.id as id   "
                + " ,m.code as code   "
                + " ,m.full_name as   fullName   "
                + " ,concat(m.code,'-',m.full_name) as nameCode  "
                + " ,m.gender as gender   "
                + " ,m.email as email   "
                + " ,m.phone_number as phoneNumber    "
                + " ,m.avatar_url as avatarUrl   "
                + " ,m.address as address "
                + " ,m.date_of_birth as dateOfBirth "
         + " from member m   "
         + "  where 1=1   "
         + "  and (1=0 OR LOWER(m.code) LIKE " +"'%" +search.toLowerCase() + "%'"
         + "     OR LOWER(m.full_name) LIKE " +"'%" +search.toLowerCase() + "%')";
        

//        StringBuilder strCondition = new StringBuilder(" WHERE 1=1 ");
//        CommonUtil.filter(search, strCondition, paramList, "m.code");   
//        CommonUtil.filter(search, strCondition, paramList, "m.full_name");
        
        String selectFields = " order by id ";
        
        return uttData.list(sql, paramList, MemberBean.class);
    }
    
    public default DataTableResults<BorrowBean> searchBorrow(UttData uttData, BorrowForm formData) {
        List<Object> paramList = new ArrayList<>();
        String sql = " SELECT b.id as id "
                + "  ,b.book_id as bookId   "
                + "  ,b.member_id as memberId   "
                + "  ,b.from_date as fromDate   "
                + "  ,b.to_date as toDate   "
                + "  ,concat(bk.code,'-',bk.name) as nameCode   "
                + "  ,b.status as status    "
                + " ,b.adjourn as adjourn "
                + " from borrow b   "
                + "  inner join book bk on b.book_id = bk.id  ";

        StringBuilder strCondition = new StringBuilder(" WHERE 1 and b.status <>3 ");
        CommonUtil.filter(formData.getMemberId(), strCondition, paramList, "b.member_id");
        
        String selectFields = " order by id ";
        
        return uttData.findPaginationQuery(sql + strCondition.toString(), selectFields, paramList, BorrowBean.class,1000);
    }
    
    @Query("DELETE BorrowBO b WHERE b.memberId = :memberId AND b.id NOT IN (:ids) ")
    public void deleteAfterSave(@Param("memberId") Long memberId, @Param("ids") List<Long> ids);
}
