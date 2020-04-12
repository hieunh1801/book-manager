package com.example.user.controller;

import java.util.ArrayList;
import java.util.List;

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

import com.example.common.CommonUtil;
import com.example.common.Constants;
import com.example.common.Response;
import com.example.systemParam.bo.SystemParamBO;
import com.example.user.entity.RoleBO;
import com.example.user.entity.RoleForm;
import com.example.user.entity.UserForm;
import com.example.user.service.RoleService;

@Controller
@RequestMapping("/role")
public class RoleController {
    @Autowired
    private RoleService roleService;
    
    @PostMapping(path = "")
    @ResponseStatus(HttpStatus.CREATED)
    public @ResponseBody Response saveOrUpdate(HttpServletRequest req, @RequestBody UserForm form) throws Exception {
        if(!CommonUtil.isNullOrEmpty(form.getLstRole())) {
            List<Long> lstId = new ArrayList<>();

            for (RoleForm roleForm : form.getLstRole()) {
                Long id = CommonUtil.NVL(roleForm.getId());
                RoleBO bo;
                if (id > 0L) {
                    bo = roleService.findById(id);
                    if (bo == null) {
                        return Response.warning(Constants.RESPONSE_CODE.RECORD_DELETED);
                    }
                } else {
                    bo = new RoleBO();
                }
                bo.setCode(roleForm.getCode());
                bo.setName(roleForm.getName());
                
                roleService.saveOrUpdate(bo);
                lstId.add(bo.getId());
                
            }   
          //xóa bản ghi
            roleService.deleteAfterSave(lstId);
        }
        
        return Response.success(Constants.RESPONSE_CODE.SUCCESS).withData(null);
    }
    
    @GetMapping(path = "/find-all")
    public @ResponseBody Response findAll(HttpServletRequest req){
        return Response.success().withData(roleService.findAll());
    }
}
