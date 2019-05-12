<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>员工列表</title>
<%
	pageContext.setAttribute("APP_PATH",request.getContextPath());
%>
<script type="text/javascript" src="${APP_PATH}/static/js/jquery-3.4.0.min.js"></script>
<link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
	<!-- 员工修改的模态框 -->
	<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title">员工修改</h4>
	      </div>
	      <div class="modal-body">
	      	<form class="form-horizontal">
			  <div class="form-group">
			    <label class="col-sm-2 control-label">empName</label>
			    <div class="col-sm-10">
			      <p class="form-control-static" id="empName_update_static"></p>
			    </div>
			  </div>
			  <div class="form-group">
			   <label class="col-sm-2 control-label">email</label>
			    <div class="col-sm-10">
			      <input type="text" name="email" class="form-control" id="email_update_input" placeholder="email@gmail.com">
			      <span  class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			   <label class="col-sm-2 control-label">gender</label>
			    <div class="col-sm-10">
			      <label class="radio-inline">
				 	<input type="radio" name="gender" id="gender1_update_input" value="M" checked="checked"> 男
				  </label>
				  <label class="radio-inline">
				  	<input type="radio" name="gender" id="gender2_update_input" value="F"> 女
				  </label>
			    </div>
			  </div>
			  <div class="form-group">
			   <label class="col-sm-2 control-label">deptName</label>
			    <div class="col-sm-4">
			     <select class="form-control" name="dId" id="dept_update_select">
				 	<!-- select from dataBase-->
				 </select>
			    </div>
			  </div>
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary" id="emp_update_btn">Update</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- 添加员工 -->
	<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">新增员工</h4>
	      </div>
	      <div class="modal-body">
	      	<form class="form-horizontal">
			  <div class="form-group">
			    <label class="col-sm-2 control-label">empName</label>
			    <div class="col-sm-10">
			      <input type="text" name="empName" class="form-control" id="empName_add_input" placeholder="empName">
			      <span  class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			   <label class="col-sm-2 control-label">email</label>
			    <div class="col-sm-10">
			      <input type="text" name="email" class="form-control" id="email_add_input" placeholder="email@gmail.com">
			      <span  class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			   <label class="col-sm-2 control-label">gender</label>
			    <div class="col-sm-10">
			      <label class="radio-inline">
				 	<input type="radio" name="gender" id="gender1_add_input" value="M" checked="checked"> 男
				  </label>
				  <label class="radio-inline">
				  	<input type="radio" name="gender" id="gender2_add_input" value="F"> 女
				  </label>
			    </div>
			  </div>
			  <div class="form-group">
			   <label class="col-sm-2 control-label">deptName</label>
			    <div class="col-sm-4">
			     <select class="form-control" name="dId" id="dept_add_select">
				 	<!-- select from dataBase-->
				 </select>
			    </div>
			  </div>
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary" id="emp_save_btn">Save</button>
	      </div>
	    </div>
	  </div>
	</div>

	<div class="container">
		<div class="row">
			<div calss="col-md-12">
				<h1>员工管理</h1>
			</div>
		</div>
		<div class="row">
			<div class="col-md-4 col-md-offset-8">
				<button class="btn btn-primary" id="emp_add_modal_btn">新增</button>
				<button class="btn btn-danger" id="emp_del_all_btn">删除</button>
			</div>
		</div>
		
		
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover" id="emps_table">
					<thead>
						<tr>
							<th><input type="checkbox" id="check_all"></th>
							<th>#</th>
							<th>empName</th>
							<th>gender</th>
							<th>email</th>
							<th>deptName</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
					
					</tbody>
				</table>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6" id="page_info_area">
				
			</div>
			<div class="col-md-6" id="page_nav_area">
				
			</div>
		</div>
	</div>
	<script type="text/javascript">
	
		var totalRecord,currentPage;
		//加载完页面，发送一个ajax请求，拿到分页数据
		$(function(){
			to_page(1);
		});
		
		function to_page(pn){
			$.ajax({
				url:"${APP_PATH}/emps",
				data:"pn="+pn,
				type:"GET",
				success:function(result){
					//console.log(result);
					//解析显示员工数据
					build_emps_table(result);
					//解析显示分页数据
					build_page_info(result);
					//解析显示分页条数据
					build_page_nav(result);
				}
			});
		}
		
		function build_emps_table(result){
			//在数据加载前清空数据
			$("#emps_table tbody").empty();
			var emps = result.extend.pageInfo.list;
			$.each(emps,function(index,item){
				var checkBoxTd = $("<td><input type='checkBox' class='check_item'/></td>");
				var empIdTd = $("<td></td>").append(item.empId);
				var empNameTd = $("<td></td>").append(item.empName);
				var genderTd = $("<td></td>").append(item.gender=="M"?"男":"女");
				var emailTd = $("<td></td>").append(item.email);
				var deptNameTd = $("<td></td>").append(item.department.deptName);
				/**
				<button class="btn btn-primary btn-sm">
								<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
								编辑
							</button>
							<button class="btn btn-danger btn-sm">
								<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
								删除
							</button>
				*/
				var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
								.append("<span></span>").addClass("glyphicon glyphicon-pencil")
								.append("编辑");
				//给编辑按钮添加一个自定义的属性来表示员工id，方便使用id进行数据库查询
				editBtn.attr("edit-id",item.empId);
				var deleBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
								.append("<span></span>").addClass("glyphicon glyphicon-trash")
								.append("删除");
				deleBtn.attr("del-id",item.empId);
				var btnTd = $("<td></td>").append(editBtn).append(" ").append(deleBtn);
				$("<tr></tr>").append(checkBoxTd)
							 .append(empIdTd)
							 .append(empNameTd)
							 .append(genderTd)
							 .append(emailTd)
							 .append(deptNameTd)
							 .append(btnTd)
							 .appendTo("#emps_table tbody");
			});
		}
		function build_page_info(result){
			$("#page_info_area").empty();
			$("#page_info_area").append("当前"+result.extend.pageInfo.pageNum+"页,总"+
					result.extend.pageInfo.pages+"页,总"+result.extend.pageInfo.total+"条记录");
			totalRecord = result.extend.pageInfo.total;
			currentPage = result.extend.pageInfo.pageNum;
		}
		function build_page_nav(result){
			$("#page_nav_area").empty();
			var ul = $("<ul></ul>").addClass("pagination");
			
			var fristPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("herf","#"));
			var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
			if(!result.extend.pageInfo.hasPreviousPage){
				fristPageLi.addClass("disabled");
				prePageLi.addClass("disabled");
			}else{
				fristPageLi.click(function(){
					to_page(1);
				});
				prePageLi.click(function(){
					to_page(result.extend.pageInfo.pageNum -1);
				});
			}
			
			var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
			var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("herf","#"));
			if(!result.extend.pageInfo.hasNextPage){
				nextPageLi.addClass("disabled");
				lastPageLi.addClass("disabled");
			}else{
				nextPageLi.click(function(){
					to_page(result.extend.pageInfo.pageNum +1);
				});
				lastPageLi.click(function(){
					to_page(result.extend.pageInfo.pages);
				});
			}
			
			
			ul.append(fristPageLi).append(prePageLi);
			$.each(result.extend.pageInfo.navigatepageNums,function(index,item){
				var numLi = $("<li></li>").append($("<a></a>").append(item));
				if(result.extend.pageInfo.pageNum == item){
					numLi.addClass("active");
				}
				numLi.click(function(){
					to_page(item);
				})
				ul.append(numLi);
			});
			ul.append(nextPageLi).append(lastPageLi);
			
			var navEle = $("<nav></nav>").append(ul);
			navEle.appendTo("#page_nav_area");
		}
		
		function reset_form(ele){
			$(ele)[0].reset();
			$(ele).find("*").removeClass("has-error has-success");
			$(ele).find(".help-block").text("");
		}
		
		$("#emp_add_modal_btn").click(function(){
			//重置表单
			reset_form("#empAddModal form");
			//发出ajax请求，取得部门信息放在下拉列表中
			getDepts("#dept_add_select");
			//弹出模态框
			$("#empAddModal").modal({
				backdrop:"static"
			});
		}); 
		
		//部门信息
		function getDepts(ele){
			$(ele).empty();
			$.ajax({
				url:"${APP_PATH}/depts",
				typr:"GET",
				success:function(result){
					//$("#dept_add_select")
					$.each(result.extend.depts,function(){
						var optionEle = $("<option></option>").append(this.deptName).attr("value",this.deptId);
						optionEle.appendTo(ele);
					});
				}
			});
		}
		
		//校验表单数据
		function validate_add_form(){
			var empName = $("#empName_add_input").val();
			var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,3})/;
			if(!regName.test(empName)){
				//alert(regName.test(empName)+"用户名是6-16位-、_、字母组合或者2-3位汉字");
				show_vaildate_msg("#empName_add_input","error","用户名可以是6-16位-、_、字母组合或者2-3为汉字！");
				return false;
			}else{
				show_vaildate_msg("#empName_add_input","success","");
			}
			
			var email = $("#email_add_input").val();
			var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
			if(!regEmail.test(email)){
				//alert("邮箱格式不正确");
				show_vaildate_msg("#email_add_input","error","邮箱格式不正确！");
				return false;
			}else{
				show_vaildate_msg("#email_add_input","success","");
			}
			return true;
		}

		//抽取出来的显示信息的方法
		function show_vaildate_msg(ele,status,msg){
			$(ele).parent().removeClass("has-success has-error");
			$(ele).next("span").text("");
			if("success" == status){
				$(ele).parent().addClass("has-success");
				$(ele).next("span").text(msg);
			}else if("error" == status){
				$(ele).parent().addClass("has-error");
				$(ele).next("span").text(msg);
			}
		}
		
		//校验用户名
		$("#empName_add_input").change(function(){
			var empName = this.value;
			$.ajax({
				url:"${APP_PATH}/checkuser",
				data:"empName="+empName,
				type:"POST",
				success:function(result){
					if(result.code == 100){
						show_vaildate_msg("#empName_add_input","success","用户名可用！");
						$("#emp_save_btn").attr("ajax-va","success");
					}else{
						show_vaildate_msg("#empName_add_input","error",result.extend.va_msg);
						$("#emp_save_btn").attr("ajax-va","error");
					}
				}
			});
		});
		
		$("#emp_save_btn").click(function(){
			//对提交数据校验进行前端校验
			if(!validate_add_form()){
				return false;
			}
			//后端校验
			if($(this).attr("ajax-va")=="error"){
				return false;
			}
			
			$.ajax({
				url:"${APP_PATH}/emp",
				type:"POST",
				data:$("#empAddModal form").serialize(),
				success:function(result){
					if(result.code == 100){
						$("#empAddModal").modal('hide');
						
						to_page(totalRecord);
					}else{
						if(underfind != result.extend.errorFields.email){
							show_vaildate_msg("#email_add_input","error",result.extend.errorFields.email);
						}
						if(underfind != result.extend.errorFields.empName){
							show_vaildate_msg("#empName_add_input","error",result.extend.errorFields.empName);
						}
					}
					
				}
			});
		});
		
		//jQuery新版on方法进行事件绑定
		$(document).on("click",".edit_btn",function (){
			//员工信息
			fetEmp($(this).attr("edit-id"));
			//部门信息
			getDepts("#dept_update_select")
			//将员工id传递给更新按钮
			$("#emp_update_btn").attr("edit-id",$(this).attr("edit-id"));
			
			$("#empUpdateModal").modal({
				backdrop:"static"
			});
		});
		
		function fetEmp(id){
			$.ajax({
				url:"${APP_PATH}/emp/"+id,
				type:"GET",
				success:function(result){
					var empData = result.extend.emp;
					$("#empName_update_static").text(empData.empName);
					$("#email_update_input").val(empData.email);
					$("#empUpdateModal [name=gender]").val([empData.gender]);
					$("#dept_update_select").val([empData.dId]);
				}
			});
		}
		
		//更新员工信息
		$("#emp_update_btn").click(function(){
			var email = $("#email_update_input").val();
			var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
			if(!regEmail.test(email)){
				//alert("邮箱格式不正确");
				show_vaildate_msg("#email_update_input","error","邮箱格式不正确！");
				return false;
			}else{
				show_vaildate_msg("#email_update_input","success","");
			}
			
			$.ajax({
				url:"${APP_PATH}/emp/"+$(this).attr("edit-id"),
				type:"POST",
				data:$("#empUpdateModal form").serialize()+"&_method=PUT",
				success:function(result){
					$("#empUpdateModal").modal('hide');
					to_page(currentPage);
				}
			});
		});
		
		//删除
		$(document).on("click",".delete_btn",function(){
			//alert($(this).parents("tr").find("td:eq(1)").text());
			var empName = $(this).parents("tr").find("td:eq(2)").text();
			var empId = $(this).attr("del-id");
			if(confirm("确认删除【"+empName+"】吗？")){
				$.ajax({
					url:"${APP_PATH}/emp/"+empId,
					type:"DELETE",
					success:function(result){
						//alert(result.msg);
						to_page(currentPage);
					}
				});
			}
		});
			
		$("#check_all").click(function(){
			//全选
			$(".check_item").prop("checked",$(this).prop("checked"));
		});
		
		$(document).on("click",".check_item",function(){
			var flag = $(".check_item:checked").length == $(".check_item").length;
			$("#check_all").prop("checked",flag);
		});
		
		$("#emp_del_all_btn").click(function(){
			var empNames = "";
			var del_idstr="";
			$.each($(".check_item:checked"),function(){
				empNames += $(this).parents("tr").find("td:eq(2)").text()+",";
				del_idstr += $(this).parents("tr").find("td:eq(1)").text()+"-";
			});
			empNames = empNames.substring(0,empNames.length-1);
			del_idstr = del_idstr.substring(0,del_idstr.length-1);
			if(confirm("确认删除【"+empNames+"】吗？"));
			$.ajax({
				url:"${APP_PATH}/emp/"+del_idstr,
				type:"DELETE",
				success:function(result){	
					to_page(currentPage);
				}
			});
		});
	</script>
</body>
</html>