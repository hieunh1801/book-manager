package com.example.member.bean;

import java.util.Date;

public class MemberBean {
    private Long       id;
    private String     code;
    private String     fullName;
    private Date     dateOfBirth;
    private Long       gender;
    private String     email;
    private String     phoneNumber;
    private String     avatarUrl;
    private String     nameCode;
    private String address;
    
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

    public Long getGender() {
        return gender;
    }
    
    public void setGender(Long gender) {
        this.gender = gender;
    }
    
    public String getEmail() {
        return email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    
    public String getPhoneNumber() {
        return phoneNumber;
    }
    
    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }
    
    public String getAvatarUrl() {
        return avatarUrl;
    }
    
    public void setAvatarUrl(String avatarUrl) {
        this.avatarUrl = avatarUrl;
    }

    
    public String getNameCode() {
        return nameCode;
    }

    
    public void setNameCode(String nameCode) {
        this.nameCode = nameCode;
    }
    
    
}
