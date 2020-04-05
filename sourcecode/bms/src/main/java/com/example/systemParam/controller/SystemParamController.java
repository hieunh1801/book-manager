package com.example.systemParam.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.example.borrow.form.BorrowInfoForm;
import com.example.common.CommonUtil;
import com.example.common.Constants;
import com.example.common.Response;
import com.example.systemParam.bo.SystemParamBO;
import com.example.systemParam.form.SystemParamForm;
import com.example.systemParam.service.SystemParamService;

@Controller
@RequestMapping("/system-param")
public class SystemParamController {
    @Autowired
    private SystemParamService systemParamService;
    
    @PostMapping(path = "")
    @ResponseStatus(HttpStatus.CREATED)
    public @ResponseBody Response saveOrUpdate(HttpServletRequest req, @RequestBody BorrowInfoForm form) throws Exception {
        if(!CommonUtil.isNullOrEmpty(form.getLstParam())) {
            List<Long> lstId = new ArrayList<>();
            // phai sua lai
            systemParamService.deleteAll();
            for (SystemParamForm systemParamForm : form.getLstParam()) {
                Long id = CommonUtil.NVL(systemParamForm.getId());
                SystemParamBO bo = new SystemParamBO();
//                if (id > 0L) {
//                    bo = systemParamService.findById(id);
//                    if (bo == null) {
//                        return Response.warning(Constants.RESPONSE_CODE.RECORD_DELETED);
//                    }
//                } else {
//                    bo = new SystemParamBO();
//                }
                bo.setCode(systemParamForm.getCode());
                bo.setName(systemParamForm.getName());
                bo.setSvalue(systemParamForm.getSvalue());
                
                systemParamService.saveOrUpdate(bo);
                lstId.add(bo.getId());
                
            }   
          //xóa bản ghi
//            systemParamService.deleteAfterSave(lstId);
        }
        
        return Response.success(Constants.RESPONSE_CODE.SUCCESS).withData(null);
    }
    
    @GetMapping(path = "/find-all")
    public @ResponseBody Response findAll(HttpServletRequest req){
        return Response.success().withData(systemParamService.findAll());
    }
    
    @GetMapping(path = "/get-param")
    public @ResponseBody Response getParam(HttpServletRequest req){
        List<SystemParamBO> lst = systemParamService.findAll();
        Map<String, String> map = new HashMap<String, String>();
        if(!CommonUtil.isNullOrEmpty(lst)) {
            for (SystemParamBO systemParamBO : lst) {
                map.put(systemParamBO.getCode(), systemParamBO.getSvalue());
            }
        }
        return Response.success().withData(map);
    }
}
