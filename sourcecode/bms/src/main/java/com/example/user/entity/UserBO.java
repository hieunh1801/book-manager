package com.example.user.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "user")
public class UserBO implements Serializable {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "code")
    private String code;

    @Column(name = "account")
    private String account;

    @Column(name = "full_name")
    private String fullName;

    @Column(name = "date_of_birth")
    private Date dateOfBirth;

    @Column(name = "address")
    private String address;

    @Column(name = "phone_number")
    private String phoneNumber;

    @Column(name = "password")
    private String password;

    @Column(name = "email")
    private String email;

    @Column(name = "gender")
    private Long gender;

    @Column(name = "avatar_url")
    private String avatarUrl;

    @Column(name = "roles")
    private String roles;

    @Transient
    private List<RoleForm> lstRole;
    

    public List<RoleForm> getLstRole() {
        return lstRole;
    }

    
    public void setLstRole(List<RoleForm> lstRole) {
        this.lstRole = lstRole;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Long getGender() {
        return gender;
    }

    public void setGender(Long gender) {
        this.gender = gender;
    }

    public String getAvatarUrl() {
        return avatarUrl;
    }

    public void setAvatarUrl(String avatarUrl) {
        this.avatarUrl = avatarUrl;
    }

    
    public String getRoles() {
        return roles;
    }

    
    public void setRoles(String roles) {
        this.roles = roles;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    // @Id
    // @Column(name = "user_id")
    // @GeneratedValue(strategy = GenerationType.IDENTITY)
    // private Long userId;
    //
    // @Column(name = "user_name")
    // private String userName;
    //
    // @Column(name = "password")
    // private String password;
    //
    // @Column(name = "full_name")
    // private String fullName;
    //
    // @Column(name = "date_of_birth")
    // private Date dateOfBirth;
    //
    // @Column(name = "gender")
    // private Long gender;
    //
    // @Column(name = "email")
    // private String email;
    //
    // @Column(name = "mobile_number")
    // private String mobileNumber;
    //
    // @Column(name = "position_id")
    // private Long positionId;
    //
    // @Column(name = "user_code")
    // private String userCode;
    //
    // @Column(name = "role_id")
    // private Long roleId;
    //
    // @Column(name = "created_date")
    // private Date createdDate;
    //
    // @Column(name = "created_by")
    // private String createdBy;
    //
    // public UserBO() {
    // }
    // public UserBO(UserBO bo, String name) throws Exception {
    // if(bo != null) {
    // CommonUtil.copyProperties(this, bo);
    // }
    // this.userName = name;
    // }
    //
    // /**
    // * @return the userId
    // */
    // public Long getUserId() {
    // return userId;
    // }
    //
    // /**
    // * @return the userName
    // */
    // public String getUserName() {
    // return userName;
    // }
    //
    // /**
    // * @return the password
    // */
    // public String getPassword() {
    // return password;
    // }
    //
    // /**
    // * @return the fullName
    // */
    // public String getFullName() {
    // return fullName;
    // }
    //
    // /**
    // * @return the dateOfBirth
    // */
    // public Date getDateOfBirth() {
    // return dateOfBirth;
    // }
    //
    // /**
    // * @return the gender
    // */
    // public Long getGender() {
    // return gender;
    // }
    //
    // /**
    // * @return the email
    // */
    // public String getEmail() {
    // return email;
    // }
    //
    // /**
    // * @return the mobileNumber
    // */
    // public String getMobileNumber() {
    // return mobileNumber;
    // }
    //
    // /**
    // * @return the positionId
    // */
    // public Long getPositionId() {
    // return positionId;
    // }
    //
    // /**
    // * @param userId the userId to set
    // */
    // public void setUserId(Long userId) {
    // this.userId = userId;
    // }
    //
    // /**
    // * @param userName the userName to set
    // */
    // public void setUserName(String userName) {
    // this.userName = userName;
    // }
    //
    // /**
    // * @param password the password to set
    // */
    // public void setPassword(String password) {
    // this.password = password;
    // }
    //
    // /**
    // * @param fullName the fullName to set
    // */
    // public void setFullName(String fullName) {
    // this.fullName = fullName;
    // }
    //
    // /**
    // * @param dateOfBirth the dateOfBirth to set
    // */
    // public void setDateOfBirth(Date dateOfBirth) {
    // this.dateOfBirth = dateOfBirth;
    // }
    //
    // /**
    // * @param gender the gender to set
    // */
    // public void setGender(Long gender) {
    // this.gender = gender;
    // }
    //
    // /**
    // * @param email the email to set
    // */
    // public void setEmail(String email) {
    // this.email = email;
    // }
    //
    // /**
    // * @param mobileNumber the mobileNumber to set
    // */
    // public void setMobileNumber(String mobileNumber) {
    // this.mobileNumber = mobileNumber;
    // }
    //
    // /**
    // * @param positionId the positionId to set
    // */
    // public void setPositionId(Long positionId) {
    // this.positionId = positionId;
    // }
    //
    // /**
    // * @return the userCode
    // */
    // public String getUserCode() {
    // return userCode;
    // }
    //
    // /**
    // * @param userCode the userCode to set
    // */
    // public void setUserCode(String userCode) {
    // this.userCode = userCode;
    // }
    //
    // /**
    // * @return the roleId
    // */
    // public Long getRoleId() {
    // return roleId;
    // }
    //
    // /**
    // * @param roleId the roleId to set
    // */
    // public void setRoleId(Long roleId) {
    // this.roleId = roleId;
    // }
    //
    // /**
    // * @return the createdDate
    // */
    // public Date getCreatedDate() {
    // return createdDate;
    // }
    //
    // /**
    // * @return the createdBy
    // */
    // public String getCreatedBy() {
    // return createdBy;
    // }
    //
    // /**
    // * @param createdDate the createdDate to set
    // */
    // public void setCreatedDate(Date createdDate) {
    // this.createdDate = createdDate;
    // }
    //
    // /**
    // * @param createdBy the createdBy to set
    // */
    // public void setCreatedBy(String createdBy) {
    // this.createdBy = createdBy;
    // }

}
