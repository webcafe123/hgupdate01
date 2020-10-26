package com.pr.project.controller;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.pr.project.model.Cate;
import com.pr.project.service.CateService;

@Controller
public class CateController {
	@Autowired
	private CateService cs;
	
	@RequestMapping("cate/cate")
	public String cate(Model model) {
		List<Cate> list = cs.list();
		model.addAttribute("list", list);
		return "cate/cate";
	}
	
	@RequestMapping("cate/cateList")
	public String cateList(Model model, Cate cate) {
		List<Cate> list = cs.list();
		model.addAttribute("list", list);
		model.addAttribute("cate", cate);
		return "/cate/cateList";
	}
	@RequestMapping("cate/insertCateForm")
	public String insertCateForm(String nm, Model model) {
		int ref=0,c_level=0,c_step=0,c_num=0;
		if (nm != null && !nm.equals("") ) {
			c_num = Integer.parseInt(nm);
			Cate cate = cs.select(c_num);
			ref = cate.getRef();
			c_level = cate.getC_level();
			c_step = cate.getC_step();
		}
		model.addAttribute("ref", ref);
		model.addAttribute("c_level", c_level);
		model.addAttribute("c_step", c_step);
		model.addAttribute("c_num", c_num);
		return "/cate/insertCateForm";
	}
	@RequestMapping("cate/insertCate")
	public String insertCate(Cate cate, Model model) {
		int number = cs.maxNum();
		if (cate.getC_num() != 0) {		// 추가항목이면
			// c_step을 정리
			cs.updateC_step(cate);
			cate.setC_level(cate.getC_level()+1); 
			cate.setC_step(cate.getC_step()+1);
		} else cate.setRef(number);	// 추가항목이 아니면 ref와 num은 같다
		cate.setC_num(number);
		int result = cs.insert(cate);
		model.addAttribute("result", result);
		return "cate/insertCate";
	}
	@RequestMapping("cate/cBoard")
	public String cBoard(int c_num, Model model) {
		Cate cate = cs.select(c_num);
		model.addAttribute("cate", cate);
		return "/cate/cBoard";
	}
	@RequestMapping("cate/updateForm")
	public String updateForm(int c_num, Model model) {
		Cate cate = cs.select(c_num);
		model.addAttribute("cate", cate);
		return "cate/updateForm";
	}
	@RequestMapping("cate/updateCate")
	public String updateCate(Cate cate, Model model) {
		int result = cs.update(cate);
		model.addAttribute("result", result);
		model.addAttribute("cate", cate);
		return "cate/updateCate";
	}
//	@RequestMapping("cate/deleteForm")
//	public String deleteForm(int c_num, Model model) {
//		Cate cate = cs.select(c_num);
//		model.addAttribute("cate", cate);
//		return "cate/deleteForm";
//	}
	@RequestMapping("cate/deleteCate")
	public String deleteCate(int c_num, Model model) {
		int result = cs.delete(c_num);
		model.addAttribute("result", result);
		return "cate/deleteCate";
	}
	/*
	 * @RequestMapping("cate/boardList") public String boardList(int c_num, Model
	 * model) { Cate cate = cs.select(c_num); model.addAttribute("cate", cate);
	 * return "cate/boardList"; }
	 */


}






