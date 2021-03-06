package com.example.user.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.example.common.DataTableResults;
import com.example.user.entity.RoleBO;
import com.example.user.entity.UserBO;
import com.example.user.entity.UserBean;
import com.example.user.entity.UserBean2;
import com.example.user.entity.UserForm;



/**
 * @author TanPTN
 * @since May 3, 2019
 * @version 1.0
 */

public interface UserService {
    UserBO save(UserBO user);
    void saveOrUpdate(UserBO user);
    List<UserBO> findAll();
    UserBO findById(Long id);
    void delete(UserBO bo);
    UserBean loadUserByUsername(String account);
    UserBean getUserByUsername(String username);
    UserBean getUserInfoById(Long userId);
    DataTableResults<UserBean> getStudentList(UserForm userForm, HttpServletRequest req);
    DataTableResults<UserBean2> getDatatable(UserForm userForm, HttpServletRequest req);
    List<UserBO> getListStudentByPositionId(Long positionId);
    UserBO getUserByCode(String userCode);
    boolean checkLogin(UserForm user);
    public List<RoleBO> findAllRole();
}
