package br.com.casadocodigo.loja.controllers;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

//Controller que observa todos os demais controllers
@ControllerAdvice
public class ExceptionHandlerController {

	@ExceptionHandler(Exception.class)
	public ModelAndView trataExceptionGenerica(Exception exception) {
		ModelAndView modelAndView = new ModelAndView("error");
		modelAndView.addObject("exception", exception);
		return modelAndView;
	}
}
