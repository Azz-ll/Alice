package com.ljl.crud.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	
	@ResponseBody
	@RequestMapping(value="/emp/{ids}",method=RequestMethod.DELETE)
	public Msg deleteEmp(@PathVariable("ids")String ids) {
		if(ids.contains("-")) {
			List<Integer> del_ids = new ArrayList<Integer>();
			String[] str_ids = ids.split("-");
			for (String string : str_ids) {
				del_ids.add(Integer.parseInt(string));
			}
			employeeService.deleteBatch(del_ids);
		}else {
			Integer id = Integer.parseInt(ids);
			employeeService.deleteEmp(id);
		}
		return Msg.success();
	}
	
	/**
	 * 员工更新
	 * @param employee
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/emp/{empId}",method=RequestMethod.PUT)
	public Msg saveEmp(Employee employee) {
		employeeService.updateEmp(employee);
		return Msg.success();
	}
	
	/**
	 * 获取员工信息，方便更新
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/emp/{id}",method=RequestMethod.GET)
	@ResponseBody
	public Msg getEmp(@PathVariable("id")Integer id) {
		
		Employee employee = employeeService.getEmp(id);
		return Msg.success().add("emp", employee);
	}
	
	@ResponseBody
	@RequestMapping("/checkuser")
	public Msg checkuser(@RequestParam("empName")String empName) {
		String regx = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,3})";
		if(!empName.matches(regx)) {
			return Msg.fail().add("va_msg", "用户名是6-16位字母组合或者2-3位汉字!");
		}
		
		boolean b = employeeService.checkUser(empName);
		if(b) {
			return Msg.success();
		}else {
			return Msg.fail().add("va_msg", "用户名不可用！");
		}
	}
	
	@RequestMapping(value="/emp",method=RequestMethod.POST)
	@ResponseBody
	public Msg saveEmp(@Valid Employee employee,BindingResult result) {
		if(result.hasErrors()) {
			Map<String, Object> map = new HashMap<String, Object>();
			List<FieldError> errors = result.getFieldErrors();
			for(FieldError fieldError : errors) {
				map.put(fieldError.getField(), fieldError.getDefaultMessage());
			}
			return Msg.fail().add("errorField", map);
		}else {
			employeeService.saveEmp(employee);
			return Msg.success();
		}
	}
	
	/**
	 * 使用json发送数据
	 * @param pn
	 * @param model
	 * @return
	 */
	@RequestMapping("/emps")
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
}
