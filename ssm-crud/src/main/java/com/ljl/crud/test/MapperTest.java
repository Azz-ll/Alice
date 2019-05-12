package com.ljl.crud.test;

import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ljl.crud.bean.Department;
import com.ljl.crud.bean.Employee;
import com.ljl.crud.dao.DepartmentMapper;
import com.ljl.crud.dao.EmployeeMapper;
/**
 * 测试dao
 * @param args
 * Spring项目的单元测试，可以自动注入我们的组件
 * 1、导入Springtest模块
 * 2、@ContextConfiguration指定spring配置文件的位置
 * 3、直接autowired要使用的组件即可
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:applicationContext.xml"})
public class MapperTest {
	@Autowired
	DepartmentMapper departmentMapper;
	@Autowired
	SqlSession sqlSession;
	/**
	 * 测试DepartmentMapper5
	 */
	@Test
	public void testCRUD() {
//		ApplicationContext ioc =new ClassPathXmlApplicationContext("ApplicationContext.xml");
//		DepartmentMapper bean=ioc.getBean(DepartmentMapper.class);
			System.out.println(departmentMapper);
	
//		departmentMapper.insertSelective(new Department(null,"开发部"));
//		departmentMapper.insertSelective(new Department(null,"测试部"));
//		departmentMapper.deleteByPrimaryKey(1);
		EmployeeMapper mapper=sqlSession.getMapper(EmployeeMapper.class);
		for(int i=0;i<1000;i++) {
			String uid = UUID.randomUUID().toString().substring(0, 5)+i;
			mapper.insertSelective(new Employee(null, uid, "M", uid+"@gmail.com", 1));
		}
		System.out.println("批量完成！");
	}
}
