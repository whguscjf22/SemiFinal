package com.company.common.exception;

import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@ControllerAdvice
//@RestController 비동기식으로 처리할때 사용
public class GlobalExceptionHandler {

	@ResponseStatus(code = HttpStatus.NOT_FOUND, reason = "페이지가 없어 ㅠㅠ")
	@ExceptionHandler(Exception.class)
	public String bizExceptionHandler(Exception e, Model model) {
		String view = "error";
		// exception 객체를 error.jsp 에서 활용하려면?
		
		model.addAttribute("exception", e);
		
		return view;
	}
}
