package com.example.borrow.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.example.borrow.bean.BorrowBean;
import com.example.borrow.bo.BorrowBO;
import com.example.borrow.form.BorrowForm;
import com.example.borrow.form.BorrowInfoForm;
import com.example.borrow.service.BorrowService;
import com.example.common.CommonUtil;
import com.example.common.Constants;
import com.example.common.DataTableResults;
import com.example.common.Response;
import com.example.user.entity.UserBean;
import com.example.user.entity.UserForm;

@Controller
@RequestMapping("/borrow")
public class BorrowController {
    @Autowired
    private BorrowService borrowService;
    
    
    @GetMapping(path = "/search-history")
    public @ResponseBody DataTableResults<BorrowBean> searchHistory(HttpServletRequest req, BorrowForm form) {
        return borrowService.searchHistory(form);
    }
    
    @GetMapping(path = "/search-borrow")
    public @ResponseBody DataTableResults<BorrowBean> searchBorrow(HttpServletRequest req, BorrowForm form) {
        return borrowService.searchBorrow(form);
    }
    
    
    @PostMapping(path = "")
    @ResponseStatus(HttpStatus.CREATED)
    public @ResponseBody Response saveOrUpdate(HttpServletRequest req, @RequestBody BorrowInfoForm form) throws Exception {
        if(!CommonUtil.isNullOrEmpty(form.getLstBorrow())) {
            List<Long> lstId = new ArrayList<>();
            for (BorrowForm borrowForm : form.getLstBorrow()) {
                Long id = CommonUtil.NVL(borrowForm.getId());
                BorrowBO bo;
                if (id > 0L) {
                    bo = borrowService.findById(id);
                    if (bo == null) {
                        return Response.warning(Constants.RESPONSE_CODE.RECORD_DELETED);
                    }
                } else {
                    bo = new BorrowBO();
                }
                bo.setMemberId(form.getMemberId());
                bo.setBookId(borrowForm.getBookId());
                bo.setFromDate(borrowForm.getFromDate());
                bo.setToDate(borrowForm.getToDate());
                if(CommonUtil.NVL(borrowForm.getPay()) == 1L) {
                    bo.setStatus(3L);
                    bo.setToDate(new Date());
                } else {
                    bo.setStatus(borrowForm.getStatus());
                }
                bo.setAdjourn(borrowForm.getAdjourn());
                borrowService.saveOrUpdate(bo);
                lstId.add(bo.getId());
                
                //xóa bản ghi
//                borrowService.deleteAfterSave(bo.getMemberId(), lstId);
            }   
        }
        
        return Response.success(Constants.RESPONSE_CODE.SUCCESS).withData(null);
    }
    
    @GetMapping(path = "/auto-complete-member/{search}")
    public @ResponseBody Response searchAutoComplete(HttpServletRequest req,  @PathVariable String search){
        return Response.success().withData(borrowService.searchMemberAutoComplete(search));
    }
    
    @GetMapping(path = "/search")
    public @ResponseBody DataTableResults<BorrowBean> listStudents(HttpServletRequest req,BorrowForm formData){
        return borrowService.search(formData);
    }
}
