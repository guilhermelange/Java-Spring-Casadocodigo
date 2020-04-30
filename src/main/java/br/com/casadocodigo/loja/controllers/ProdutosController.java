package br.com.casadocodigo.loja.controllers;

import java.util.List;

import javax.persistence.NoResultException;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.casadocodigo.loja.daos.ProdutoDAO;
import br.com.casadocodigo.loja.infra.FileSaver;
import br.com.casadocodigo.loja.models.Produto;
import br.com.casadocodigo.loja.models.TipoPreco;
import br.com.casadocodigo.loja.validation.ProdutoValidation;

@Controller 
@RequestMapping("/produtos")
public class ProdutosController {

	@Autowired
	private ProdutoDAO produtoDao;
	
	@Autowired
    private FileSaver fileSaver;
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.addValidators(new ProdutoValidation());
	}
	
// Produto está sendo passado como parâmetro para que o Spring gerencie no JSP as informações e que as guarde mesmo recarregando a tela	
//	@RequestMapping("/produtos/form")
	@RequestMapping("/form")
	public ModelAndView form(Produto produto) {
		ModelAndView modelAndView = new ModelAndView("produtos/form");
		modelAndView.addObject("tipos", TipoPreco.values());
		return modelAndView;
	}
//	@CacheEvict(value = "produtosHome", allEntries = true) // Desfaz o cache pq um novo produto foi inserido, o produtosHome está definido no HomeController
//	@RequestMapping(value="/produtos", method = RequestMethod.POST )
	@RequestMapping(method = RequestMethod.POST )
	@CacheEvict(value = "produtosHome", allEntries = true)
	public ModelAndView gravar(MultipartFile sumario, @Valid Produto produto, BindingResult result, RedirectAttributes redirectAttributes) {
		
		//System.out.println(sumario.getOriginalFilename());
		
		if (result.hasErrors()) {
			return form(produto);
		}
		
		String path = "";
		if (!sumario.isEmpty()) {
			path = fileSaver.write("arquivos-sumario", sumario);
		}
		
		produto.setSumarioPath(path);
		produtoDao.gravar(produto);
		
		// Ele manda o sucesso para o listar() como post
		redirectAttributes.addFlashAttribute("sucesso", "Produto Cadastrado com Sucesso!");
		
		//Procura por um mapping
		return new ModelAndView("redirect:produtos");
		
		//Procura por um jsp
//		return new ModelAndView("redirect:produtos");
	}
	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView listar() {
		List<Produto> produtos = produtoDao.listar();
		ModelAndView modelAndView = new ModelAndView("produtos/lista");
		modelAndView.addObject("produtos", produtos);
		
		return modelAndView;
		
	}
	
	@RequestMapping("/detalhe/{id}")
	public ModelAndView detalhe(@PathVariable("id") Integer id){

	    ModelAndView modelAndView = new ModelAndView("/produtos/detalhe");
	    Produto produto = produtoDao.find(id);
	    modelAndView.addObject("produto", produto);
	    
	    return modelAndView;
	}
	
//	@ResponseBody // Tudo que retornar vai ser o corpo da responta
//	@RequestMapping("/{id}")
//	@ResponseBody
//	public Produto detalheJson(@PathVariable("id") Integer id){
//	    return produtoDao.find(id);
//	}
	
//	@ExceptionHandler(Exception.class)
//	public String trataDetalheNaoEncontrato() {
//		return "error";
//	}
	
}
