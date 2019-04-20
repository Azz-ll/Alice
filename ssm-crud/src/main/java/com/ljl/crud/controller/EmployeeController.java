package com.ljl.crud.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ljl.crud.bean.Employee;
import com.ljl.crud.bean.Msg;
import com.ljl.crud.service.EmployeeService;

/**
 *   处理员工的CRUD请求
 * @author acer
 *
 */
@Controller
public class EmployeeController {
	
	@Autowired
	EmployeeService employeeService;
	
	//@RequestMapping("/emps")
	@ResponseBody
	public Msg getEmpWithJson(@RequestParam(value="pn",defaultValue="1")Integer pn, Model model){
		//引入PageHelper分页插件
				//在查询之前需要调用PageHelper.startPage()传入页码以及分页大小
				PageHelper.startPage(pn,5);
				//startPage后紧跟的查询就是一个分页查询
				List<Employee> emps=employeeService.getAll();
				//PageInfo包装查询后的结果，只需要将PageInfo交给页面
				//其中封装了详细的分页信息，包括查询出来的信息，连续显示的页数
				PageInfo page = new PageInfo(emps,5);
				return Msg.success().add("pageInfo",page);
	}
	/**
	  *  查询员工数据（分页查询）
	 * @return
	 */
	@RequestMapping("/emps")
	public String getEmps(@RequestParam(value="pn",defaultValue="1")Integer pn, Model model) {
		//引入PageHelper分页插件
		//在查询之前需要调用PageHelper.startPage()传入页码以及分页大小
		PageHelper.startPage(pn,5);
		//startPage后紧跟的查询就是一个分页查询
		List<Employee> emps=employeeService.getAll();
		//PageInfo包装查询后的结果，只需要将PageInfo交给页面
		//其中封装了详细的分页信息，包括查询出来的信息，连续显示的页数
		PageInfo page = new PageInfo(emps,5);
		model.addAttribute("pageInfo",page);
		return "list";
	}
}
