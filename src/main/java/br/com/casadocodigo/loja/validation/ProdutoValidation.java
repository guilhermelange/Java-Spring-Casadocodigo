package br.com.casadocodigo.loja.validation;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;

import br.com.casadocodigo.loja.models.Produto;

public class ProdutoValidation implements org.springframework.validation.Validator {

@Override
	public boolean supports(Class<?> clazz) {
		return Produto.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		
		ValidationUtils.rejectIfEmpty(errors, "titulo", "field.required");
		ValidationUtils.rejectIfEmpty(errors, "descricao", "field.required");
		
		Produto produto = (Produto) target;
		
		if (produto.getPaginas() <= 0) {
			errors.rejectValue("paginas", "field.required");
		}
			
	
		
	}
}
