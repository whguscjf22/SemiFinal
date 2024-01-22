package com.company.controller;
import java.sql.SQLException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.company.dto.AttachmentFile;
import com.company.dto.Dept;
import com.company.service.AttachmentFileService;
import com.company.service.DeptService;

@Controller
public class DeptController {
	
	private static final Logger logger = LoggerFactory.getLogger(DeptController.class);
	
	@Autowired
	private DeptService service;
	
	@Autowired
	private AttachmentFileService fileService;
	
	// /dept/10
	@RequestMapping(value = "/dept/{deptno}", method = RequestMethod.GET)
	public String getDeptByDeptno(@PathVariable int deptno, Model model) throws Exception {
		AttachmentFile file = null;
		
		Dept dept = service.getDeptByDeptno(deptno);
		file = fileService.getAttachmentFileByDeptno(deptno);
		
		model.addAttribute("dept", dept);
		model.addAttribute("file", file);
		
		return "deptDetail";
	}
	
	// /dept
	@RequestMapping(value = "/dept", method = RequestMethod.GET)
	public String insertDeptForm() {
		return "registerDept";
	}
	
	// /dept
	@RequestMapping(value = "/dept", method = RequestMethod.POST)
	public String insertDept(@ModelAttribute Dept newDept, MultipartFile file) {
		String view = "error";
		boolean deptResult = false;
		boolean fileResult = false;
		System.out.println("name : " + file.getName());
		System.out.println("original name : " + file.getOriginalFilename());
		try {
			deptResult = service.insertDept(newDept);

			
			if(file != null) {
				fileResult = fileService.insertAttachmentFile(file, newDept.getDeptno());
			}
			if(deptResult || fileResult) {
				view = "redirect:/main";
				return view;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			return view;
		}
		
		
		return view;
	}
//		v.1
//	public String insertDept(@ModelAttribute Dept newDept, MultipartFile file) {
//		int deptno = newDept.getDeptno();
//		
//		String savePath = "C:\\muti\\00.spring";
//		String fileName = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
//		
//		try {
//			if(!new File(savePath).exists()) {
//				new File(savePath).mkdir();
//			}
//			file.transferTo(new File(savePath + "\\" + fileName));
//		} catch (IllegalStateException | IOException e1) {
//			e1.printStackTrace();
//		}
//		System.out.println(file.getName());
//		System.out.println(file.getOriginalFilename());
//		try {
//			System.out.println(file.getInputStream());
//		} catch (IOException e1) {
//			// TODO Auto-generated catch block
//			e1.printStackTrace();
//		}
//	
//		String view = "error";
//		boolean result = false;
//		boolean result1 = false;
//		try {
//			result = service.insertDept(newDept);
//			result1 = attachmentservice.insertAttachmentFile(file, deptno);
//			System.out.println(result1);
//			if(result) {
//				view= "redirect:/main";
//				return view;
//			} 
//		} catch (Exception e) {
//			e.printStackTrace();
//			return view;
//		}
//		
//		return view;
//	}
	
	// /modify/dept/10
	@RequestMapping(value = "/modify/dept/{deptno}", method = RequestMethod.GET)
	public String updateDeptForm(@PathVariable int deptno, Model model) throws Exception {
		
		Dept dept = service.getDeptByDeptno(deptno);
		AttachmentFile file = fileService.getAttachmentFileByDeptno(deptno);
		
		model.addAttribute("file", file);
		model.addAttribute("dept", dept);
		
		return "updateDept";
	}
	
	// /dept/10
//	@RequestMapping(value = "/dept/{deptno}", method = RequestMethod.POST)
//	public String updateDeptDnameAndLoc(@PathVariable int deptno, 
//										@ModelAttribute("dname") String dname,
//										@ModelAttribute("loc") String loc) {
//										// @ModelAttribute Dept dept 로 써도 된다
//		String view = "error";
//		// dname, loc 확인 O
//		// deptno로 기존 dept 객체 확인 -> 위에서 확인한 dname, loc 해당 객체 setter
//		// 제대로 update가 되었다고 한다면 -> dept/{deptno} detail 페이지로 이동
//		Dept dept = null;
//		boolean result = false;
//				
//		try {
//			dept = service.getDeptByDeptno(deptno);
//			
//			dept.setDname(dname);
//			dept.setLoc(loc);
//			
//			result = service.updateDnameAndLoc(dept);
//			
//			if(result) {
//				view = "redirect:/dept/" + deptno;
//				return view;
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//			return view;
//		}
//		return view;
//	}
	
	@RequestMapping(value = "/dept/u/{deptno}", method = RequestMethod.POST)
	public String updateDeptDnameAndLoc(@PathVariable int deptno,
										@ModelAttribute Dept newDept,
										MultipartFile file) {
		System.out.println("put>>post");
		System.out.println(file);
		String view = "error";
		
		// 정상 수정 -> /dept/10 GET
		
		Dept dept = null;
		boolean result = false;
		try {
			dept = service.getDeptByDeptno(deptno);
			
			dept.setDname(newDept.getDname());
			dept.setLoc(newDept.getLoc());
			
			result = service.updateDnameAndLoc(dept);
			
			
			if(file != null) {
				fileService.insertAttachmentFile(file, deptno);
			}
			if(result) {
				view = "redirect:/dept/" + deptno;
				return view;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return view;
		}
		return view;
	}
	
	
	// /dept/10
	@RequestMapping(value = "/dept/{deptno}", method = RequestMethod.DELETE)
	public String deleteDept(@PathVariable int deptno,
							 @ModelAttribute Dept delDept) throws SQLException {
		String view = "error";
		boolean result = false;
		boolean fileResult = false;
		AttachmentFile file = fileService.getAttachmentFileByDeptno(deptno);
		
		try {
			if(file != null) {
				fileResult = fileService.deleteFileByFileNo(file.getAttachmentFileNo());
			}
			result = service.deleteDeptByDeptno(deptno);
			if(result) {
				view = "redirect:/main";
				return view;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return view;
	}
	
	@ExceptionHandler(NullPointerException.class)
	public String catchNPE() {
		
		return "";
	}
	
}
