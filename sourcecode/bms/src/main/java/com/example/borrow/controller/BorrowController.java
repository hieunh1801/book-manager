package com.example.borrow.controller;

import java.awt.print.Book;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.Session;
import org.hibernate.Transaction;
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

import com.example.book.entity.BookBO;
import com.example.book.service.BookService;
import com.example.borrow.bean.BorrowBean;
import com.example.borrow.bo.BorrowBO;
import com.example.borrow.form.BorrowForm;
import com.example.borrow.form.BorrowInfoForm;
import com.example.borrow.service.BorrowService;
import com.example.common.CommonUtil;
import com.example.common.Constants;
import com.example.common.DataTableResults;
import com.example.common.Response;
import com.example.common.UttData;

@Controller
@RequestMapping("/borrow")
public class BorrowController {
    @Autowired
    private BorrowService borrowService;

    @Autowired
    private BookService bookService;

    @Autowired
    private UttData uttData;
    
    
    @GetMapping(path = "/search-history")
    public @ResponseBody
    DataTableResults<BorrowBean> searchHistory(HttpServletRequest req, BorrowForm form) {
        return borrowService.searchHistory(form);
    }

    @GetMapping(path = "/search-borrow")
    public @ResponseBody
    DataTableResults<BorrowBean> searchBorrow(HttpServletRequest req, BorrowForm form) {
        return borrowService.searchBorrow(form);
    }


    @PostMapping(path = "")
    @ResponseStatus(HttpStatus.CREATED)
    public @ResponseBody
    Response saveOrUpdate(HttpServletRequest req, @RequestBody BorrowInfoForm form) throws Exception {
        if (!CommonUtil.isNullOrEmpty(form.getLstBorrow())) {
            List<Long> lstId = new ArrayList<>();
            Session session = uttData.getSession();
            Transaction transaction = session.beginTransaction();
//            transaction.begin();
            for (BorrowForm borrowForm : form.getLstBorrow()) {
                Long id = CommonUtil.NVL(borrowForm.getId());
                BorrowBO bo;
                //cap nhat so luong sach cho muon
                if(CommonUtil.NVL( borrowForm.getBookId()) == 0L) {
                    continue;
                }
                BookBO bookBO = uttData.get(BookBO.class, borrowForm.getBookId());  //bookService.getById(borrowForm.getBookId());
                if (id > 0L) {
                    bo = uttData.get(BorrowBO.class, id); // borrowService.findById(id);
                    
                    if (bo == null) {
                        transaction.rollback();
                        return Response.warning(Constants.RESPONSE_CODE.RECORD_DELETED);
                    }
                } else {
                    bo = new BorrowBO();

                    if(bookBO.getAmount() < bookBO.getAmountBorrow()+1L) {
                        transaction.rollback();
                        return Response.warning(String.format("Số lượng sách %s không đủ", bookBO.getName()));
                    }
                    bookBO.setAmountBorrow(CommonUtil.NVL(bookBO.getAmountBorrow()) + 1L);
                }
                bo.setMemberId(form.getMemberId());
                bo.setBookId(borrowForm.getBookId());
                bo.setFromDate(borrowForm.getFromDate());
                bo.setToDate(borrowForm.getToDate());
                if (CommonUtil.NVL(borrowForm.getPay()) == 1L) {
                    bo.setStatus(3L);
                    bo.setToDate(new Date());
                    bookBO.setAmountBorrow(CommonUtil.NVL(bookBO.getAmountBorrow()) - 1L);
                } else {
                    bo.setStatus(borrowForm.getStatus());
                }
                bo.setAdjourn(borrowForm.getAdjourn());

//                bookService.saveOrUpdate(bookBO);
//                borrowService.saveOrUpdate(bo);
                uttData.saveOrUpdate(bookBO);
                uttData.saveOrUpdate(bo);
                uttData.flushSession();
                lstId.add(bo.getId());

                //xóa bản ghi
//                borrowService.deleteAfterSave(bo.getMemberId(), lstId);
            }
            transaction.commit();
        }

        return Response.success(Constants.RESPONSE_CODE.SUCCESS).withData(null);
    }

    @GetMapping(path = "/auto-complete-member/{search}")
    public @ResponseBody
    Response searchAutoComplete(HttpServletRequest req, @PathVariable String search) {
        return Response.success().withData(borrowService.searchMemberAutoComplete(search));
    }

    @GetMapping(path = "/search")
    public @ResponseBody
    DataTableResults<BorrowBean> listStudents(HttpServletRequest req, BorrowForm formData) {
        return borrowService.search(formData);
    }
}
