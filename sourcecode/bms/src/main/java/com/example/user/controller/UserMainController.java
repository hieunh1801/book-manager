package com.example.user.controller;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.example.common.CommonUtil;
import com.example.common.Constants;
import com.example.common.DataTableResults;
import com.example.common.Response;
import com.example.exception.SysException;
import com.example.fileStorage.FileStorageService;
import com.example.user.entity.RoleBO;
import com.example.user.entity.RoleForm;
import com.example.user.entity.UserBO;
import com.example.user.entity.UserBean;
import com.example.user.entity.UserBean2;
import com.example.user.entity.UserForm;
import com.example.user.service.JwtService;
import com.example.user.service.RoleService;
import com.example.user.service.UserService;



@RestController
@RequestMapping("/user")
public class UserMainController {
    
    @Autowired
    private JwtService jwtService;
    
    @Autowired
    private UserService userService;
    
    @Autowired
    FileStorageService storageService;
    
    @Autowired
    private PasswordEncoder passwordEncoder;
    
    @Autowired
    private RoleService roleService;

    @RequestMapping(value="/users", method = RequestMethod.GET)
    public List<UserBO> listUser(){
        return userService.findAll();
    }
    @GetMapping(path = "/search")
    public @ResponseBody DataTableResults<UserBean> listStudents(HttpServletRequest req,UserForm user){
        return userService.getStudentList(user, req);
    }
    
    @GetMapping(path = "/search-user")
    public @ResponseBody DataTableResults<UserBean2> getDatatables(HttpServletRequest req, UserForm user){
        return userService.getDatatable(user, req);
    }
    
    
    @GetMapping(path = "/get-roles")
    public List<RoleBO> getAllRole(){
        return userService.findAllRole();
    }

//    @RequestMapping(value = "/user", method = RequestMethod.POST)
//    public UserBO create(@RequestBody UserBO user){
//        return userService.save(user);
//    }

//    @RequestMapping(value = "/user/{id}", method = RequestMethod.GET)
//    public UserBO findOne(@PathVariable Long id){
//        return userService.findById(id);
//    }
    
    @GetMapping(path = "/{id}")
    public @ResponseBody Response findById(HttpServletRequest req, @PathVariable Long id) throws Exception {
        UserBO bo = userService.findById(id);
        if (bo == null) {
            return Response.warning(Constants.RESPONSE_CODE.RECORD_DELETED);
        }
        if(!CommonUtil.isNullOrEmpty(bo.getRoles())) {
            List<Long> ids = CommonUtil.string2ListLong(bo.getRoles(), ",");
            List<RoleForm> lst = new ArrayList<RoleForm>();
            for (Long roleId : ids) {
                RoleBO roleBO = roleService.findById(roleId);
                RoleForm form = new RoleForm();
                CommonUtil.copyProperties(form, roleBO);
                lst.add(form);
            }
            bo.setLstRole(lst);
        }
        return Response.success().withData(bo);
    }
    
    @PostMapping()
    @ResponseStatus(HttpStatus.CREATED)
    public @ResponseBody Response create(HttpServletRequest req, UserForm form) 
            throws Exception, SysException {
        Long userId = CommonUtil.NVL(form.getId());
        UserBO bo;
        if(userId > 0L) {
            bo = userService.findById(userId);
            if(bo == null) {
                return Response.warning(Constants.RESPONSE_CODE.RECORD_DELETED);
            }
//            if (!permissionChecker.hasPermission("action.update", adResouceKey, req)) {
//                return Response.invalidPermission();
//            }
        } else {
            bo = new UserBO();
            bo.setPassword(passwordEncoder.encode(form.getPassword()));
//            if (!permissionChecker.hasPermission("action.insert", adResouceKey, req)) {
//                return Response.invalidPermission();
//            }
//            bo.setCreatedDate(new Date());
//            bo.setCreatedBy(CommonUtil.getUserLoginName(req));
        }
        bo.setAccount(form.getAccount());
        bo.setFullName(form.getFullName());
        bo.setDateOfBirth(new Date(Long.valueOf(form.getDateOfBirthStr())));
        bo.setGender(form.getGender());
        bo.setEmail(form.getEmail());
        bo.setPhoneNumber(form.getPhoneNumber());
        bo.setCode(form.getCode());
        if(!CommonUtil.isNullOrEmpty(form.getLstRole())) {
            List<Long> ids = new ArrayList<Long>();
            for (RoleForm roleForm : form.getLstRole()) {
                ids.add(roleForm.getId());
            }
            bo.setRoles(StringUtils.join(ids,","));
        }
        
        // lưu file avatar
        if( form.getFile() !=null && form.getFile().getOriginalFilename() != null) {
            String url = storageService.store(form.getFile());
            bo.setAvatarUrl(url);
        }
        
        userService.saveOrUpdate(bo);
        return Response.success(Constants.RESPONSE_CODE.SUCCESS).withData(bo);
    }

    
    @DeleteMapping(path = "/{id}")
    @ResponseStatus(HttpStatus.OK)
    public @ResponseBody Response delete(HttpServletRequest req,@PathVariable Long id) throws SysException, InstantiationException, IllegalAccessException {
        if(id > 0L) {
            UserBO bo = userService.findById(id);
            if (bo != null) {
//                if (!permissionChecker.hasPermission("action.delete", adResouceKey, req)) {
//                    return Response.invalidPermission();
//                 }
                userService.delete(bo);
                return Response.success(Constants.RESPONSE_CODE.DELETE_SUCCESS);
            } else {
                return Response.warning(Constants.RESPONSE_CODE.RECORD_DELETED);
            }
        } else {
            return Response.error(Constants.RESPONSE_CODE.ERROR);
        }
    }
    
    @RequestMapping(value = "/login", method = RequestMethod.POST,consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
    public ResponseEntity<String> login(HttpServletRequest request,  UserForm user) {
        String result = "";
        HttpStatus httpStatus = null;
        try {
            if (userService.checkLogin(user)) {
                result = jwtService.generateTokenLogin(user.getAccount());
                httpStatus = HttpStatus.OK;
            } else {
                result = "Wrong userId and password";
                httpStatus = HttpStatus.BAD_REQUEST;
            }
        } catch (Exception ex) {
            result = "Server Error";
            httpStatus = HttpStatus.INTERNAL_SERVER_ERROR;
        }
        return new ResponseEntity<String>(result, httpStatus);
    }

    @RequestMapping(value = "/currentUserInfo", method = RequestMethod.GET)
    public UserBean getCurrentUserInfo() {
        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication()
                .getPrincipal();
        return userService.getUserByUsername(userDetails.getUsername());
    }
    
    @RequestMapping(value = "/userInfo/{userId}", method = RequestMethod.GET)
    public UserBean getUserInfo(@PathVariable Long userId) {
        return userService.getUserInfoById(userId);
    }

}
