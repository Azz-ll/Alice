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
 *   ����Ա����CRUD����
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
		//����PageHelper��ҳ���
				//�ڲ�ѯ֮ǰ��Ҫ����PageHelper.startPage()����ҳ���Լ���ҳ��С
				PageHelper.startPage(pn,5);
				//startPage������Ĳ�ѯ����һ����ҳ��ѯ
				List<Employee> emps=employeeService.getAll();
				//PageInfo��װ��ѯ��Ľ����ֻ��Ҫ��PageInfo����ҳ��
				//���з�װ����ϸ�ķ�ҳ��Ϣ��������ѯ��������Ϣ��������ʾ��ҳ��
				PageInfo page = new PageInfo(emps,5);
				return Msg.success().add("pageInfo",page);
	}
	/**
	  *  ��ѯԱ�����ݣ���ҳ��ѯ��
	 * @return
	 */
	@RequestMapping("/emps")
	public String getEmps(@RequestParam(value="pn",defaultValue="1")Integer pn, Model model) {
		//����PageHelper��ҳ���
		//�ڲ�ѯ֮ǰ��Ҫ����PageHelper.startPage()����ҳ���Լ���ҳ��С
		PageHelper.startPage(pn,5);
		//startPage������Ĳ�ѯ����һ����ҳ��ѯ
		List<Employee> emps=employeeService.getAll();
		//PageInfo��װ��ѯ��Ľ����ֻ��Ҫ��PageInfo����ҳ��
		//���з�װ����ϸ�ķ�ҳ��Ϣ��������ѯ��������Ϣ��������ʾ��ҳ��
		PageInfo page = new PageInfo(emps,5);
		model.addAttribute("pageInfo",page);
		return "list";
	}
}
