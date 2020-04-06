package com.example.member.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.core.MediaType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.example.common.CommonUtil;
import com.example.common.Constants;
import com.example.common.DataTableResults;
import com.example.common.Response;
import com.example.fileStorage.FileStorageService;
import com.example.member.bean.MemberBean;
import com.example.member.bo.MemberBO;
import com.example.member.form.MemberForm;
import com.example.member.service.MemberService;
import com.example.user.entity.UserForm;

@RestController
@RequestMapping("/members")
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	@Autowired
    FileStorageService storageService;

	@GetMapping(path = "")
	public @ResponseBody List<MemberBO> apiGetAllBook(HttpServletRequest req, UserForm user) {
		List<MemberBO> list = memberService.getALl();
		return list;
	}

	@GetMapping(path = "/{id}")
	public @ResponseBody Response apiGetById(HttpServletRequest req, @PathVariable Long id) {
		MemberBO bo = memberService.getById(id);
		return Response.success().withData(bo);
	}

	@DeleteMapping(path = "/{id}")
	public @ResponseBody Response delete(HttpServletRequest req, @PathVariable Long id) {
		MemberBO bo = memberService.getById(id);
		if (bo == null) {
			return Response.warning(Constants.RESPONSE_CODE.RECORD_NOT_EXISTED);
		}
		memberService.deleteById(bo.getId());
		return Response.success().withData(bo);
	}

	@GetMapping(path = "/search")
	public @ResponseBody DataTableResults<MemberBean> apiSearch(HttpServletRequest req, MemberForm form) {
		DataTableResults<MemberBean> list = memberService.search(form);
		return list;
	}
	
	@PostMapping(path = "", produces=MediaType.APPLICATION_JSON)
//	, consumes = "multipart/form-data" ,
//    produces = { "application/json", "application/xml"}
	@ResponseStatus(HttpStatus.CREATED)
	public @ResponseBody Response saveOrUpdate(HttpServletRequest req,   MemberForm form) throws Exception {
		Long id = CommonUtil.NVL(form.getId());
		MemberBO bo;
		if (id > 0L) {
			bo = memberService.getById(id);
			if (bo == null) {
				return Response.warning(Constants.RESPONSE_CODE.RECORD_DELETED);
			}
		} else {
			bo = new MemberBO();
		}
		bo.setAddress(form.getAddress());
//		bo.setAvatarUrl(form.getAvatarUrl());
		bo.setCode(form.getCode());
//		bo.setDateOfBirth(form.getDateOfBirth());
		bo.setDateOfBirth(new Date(Long.valueOf(form.getDateOfBirthStr())));
		bo.setEmail(form.getEmail());
		bo.setFullName(form.getFullName());
		bo.setGender(form.getGender());
		bo.setPhoneNumber(form.getPhoneNumber());
		// lưu file avatar
		if( form.getFile() !=null && form.getFile().getOriginalFilename() != null) {
            String url = storageService.store(form.getFile());
            bo.setAvatarUrl(url);
		}
		 
		memberService.saveOrUpdate(bo);
		return Response.success(Constants.RESPONSE_CODE.SUCCESS).withData(bo);
	}
}
