<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>美食信息管理</title>
<link rel="stylesheet" type="text/css" href="../jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="../jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="../jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="../jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
	var url;
	
	function searchFood(){
	   // alert($('#s_foodname').val());
		$('#dg').datagrid('load',{
			foodname:$('#s_foodname').val(),
		    sellerid:$('#s_sellerid').combobox("getValue"),
			kindid:$('#s_kindid').combobox("getValue"),
			tasteid:$('#s_tasteid').combobox("getValue"),
			styleid:$('#s_styleid').combobox("getValue")
		  
			
		});
	}
	
	function deleteFood(){
		var selectedRows=$("#dg").datagrid('getSelections');
		if(selectedRows.length==0){
			$.messager.alert("系统提示","请选择要删除的数据！");
			return;
		}
		var strIds=[];
		for(var i=0;i<selectedRows.length;i++){
			strIds.push(selectedRows[i].foodid);
		}
		var ids=strIds.join(",");
		$.messager.confirm("系统提示","您确认要删掉这<font color=red>"+selectedRows.length+"</font>条数据吗？",function(r){
			if(r){
				$.post("../foodDelete",{delIds:ids},function(result){
					if(result.success){
						$.messager.alert("系统提示","您已成功删除<font color=red>"+result.delNums+"</font>条数据！");
						$("#dg").datagrid("reload");
					}else{
						$.messager.alert('系统提示','<font color=red>'+selectedRows[result.errorIndex].FoodName+'</font>'+result.errorMsg);
					}
				},"json");
			}
		});
	}
	
	
	function openFoodAddDialog(){
		$("#dlg").dialog("open").dialog("setTitle","添加美食信息");
		url="../foodSave";
	}
	
	function openFoodModifyDialog(){
		var selectedRows=$("#dg").datagrid('getSelections');
		if(selectedRows.length!=1){
			$.messager.alert("系统提示","请选择一条要编辑的数据！");
			return;
		}
		var row=selectedRows[0];
		$("#dlg").dialog("open").dialog("setTitle","编辑美食信息");
		$('#fm').form('load',{
				foodname:row.foodname,
				foodprice:row.foodprice,
				remark:row.remark,
				updatetime:row.updatetime});
		url="../foodSave?foodid="+row.foodid;
	}
	
	function closeFoodDialog(){
		$("#dlg").dialog("close");
		resetValue();
	}
	
	function resetValue(){
		$("#sellerid").combobox("setValue","");
		$("#foodname").val("");
		$("#kindid").combobox("setValue","");
		$("#tasteid").combobox("setValue","");
		$("#styleid").combobox("setValue","");
		$("#foodpicture").val("");
		$("#foodprice").val("");
		$("#remark").val("");
		$("#updatetime").datebox("setValue","");
		
	}
	
	
	function saveFood(){
		$("#fm").form("submit",{
			url:url,
			onSubmit:function(){
				return $(this).form("validate");
			},
			success:function(result){
				if(result.errorMsg){
					$.messager.alert("系统提示",result.errorMsg);
					return;
				}else{
					$.messager.alert("系统提示","保存成功");
					resetValue();
					$("#dlg").dialog("close");
					$("#dg").datagrid("reload");
				}
			}
		});
	}
	
	
</script>
</head>
<body style="margin: 5px;">
	<table id="dg" title="美食信息" class="easyui-datagrid" fitColumns="true"
	 pagination="true" rownumbers="true" url="../foodList" fit="true" toolbar="#tb">
		<thead>
			<tr>
				<th field="cb" checkbox="true"></th>
				<th field="foodid" width="20">编号</th>
				<th field="shopname" width="50">商家</th>
			    <th field="sellerid"  hidden="true">商家ID</th>
				<th field="foodname" width="50">菜品名</th>
				<th field="kindname" width="40">菜式</th>
				 <th field="kindid"  hidden="true">菜式ID</th>
				<th field="tastename" width="40">口味</th>
				 <th field="tasteid"  hidden="true">口味ID</th>
				<th field="stylename" width="40">菜系</th>
				 <th field="styleid"  hidden="true">菜系ID</th>
				<th field="foodpicture" width="100">图片</th>
				<th field="foodprice" width="40">价格</th>
				<th field="remark" width="60">备注</th>
				<th field="updatetime" width="50">更新时间</th>
			</tr>
		</thead>
	</table>
	
	<div id="tb">
		<div>
			<a href="javascript:openFoodAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>   
			<a href="javascript:openFoodModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
			<a href="javascript:deleteFood()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
		</div>
		<div>&nbsp;美食名称：&nbsp;<input type="text" name="s_foodname" id="s_foodname"/>
			&nbsp;店名：&nbsp;<input class="easyui-combobox" id="s_sellerid" name="s_sellerid" size="10" 
			data-options="panelHeight:'auto',editable:false,valueField:'sellerid',textField:'shopname',url:'../shopComboList'"/>
			&nbsp;菜式：&nbsp;<input class="easyui-combobox" id="s_kindid" name="s_kindid" size="10" 
			data-options="panelHeight:'auto',editable:false,valueField:'kindid',textField:'kindname',url:'../foodKindComboList'"/>
			&nbsp;口味：&nbsp;<input class="easyui-combobox" id="s_tasteid" name="s_tasteid" size="10" 
			data-options="panelHeight:'auto',editable:false,valueField:'tasteid',textField:'tastename',url:'../foodTasteComboList'"/>
			&nbsp;菜系：&nbsp;<input class="easyui-combobox" id="s_styleid" name="s_styleid" size="10" 
			data-options="panelHeight:'auto',editable:false,valueField:'styleid',textField:'stylename',url:'../foodStyleComboList'"/>
		<a href="javascript:searchFood()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a></div>
	</div>
	<div id="dlg" class="easyui-dialog" style="width: 570px;height: 400px;padding: 10px 20px"
		closed="true" buttons="#dlg-buttons">
		<form id="fm" method="post">
			<table>
				<tr>
					<td>菜名：</td>
					<td><input type="text" name="foodname" id="foodname" class="easyui-validatebox" required="true"/></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>店家：</td>
					<td><input class="easyui-combobox" id="sellerid" name="sellerid"  data-options=
					"panelHeight:'auto',
					editable:false,
					valueField:'sellerid',
					textField:'shopname', 
					url:'../shopComboList'"/>
					</td>				
				</tr>
				<tr>
					<td>菜式：</td>
				<td><input class="easyui-combobox" id="kindid" name="kindid"  data-options=
					"panelHeight:'auto',
					editable:false,
					valueField:'kindid',
					textField:'kindname', 
					url:'../foodKindComboList'"/>
					</td>				
					<td></td>
					<td>口味：</td>
				   <td><input class="easyui-combobox" id="tasteid" name="tasteid"  data-options=
					"panelHeight:'auto',
					editable:false,
					valueField:'tasteid',
					textField:'tastename', 
					url:'../foodTasteComboList'"/>
					</td>				
				</tr>
				<tr>
					<td>菜系：</td>
				   <td><input class="easyui-combobox" id="styleid" name="styleid"  data-options=
					"panelHeight:'auto',
					editable:false,
					valueField:'styleid',
					textField:'stylename', 
					url:'../foodStyleComboList'"/>
					</td>				
					<td></td>
					<td>图片：</td>		
					<td>
				   <input type="file"    id="foodpicture" name="foodpicture"  /> 
					</td>
				</tr>
				<tr>
					<td>价格：</td>
					<td><input class="easyui-validatebox" name="foodprice" id="foodprice" class="easyui-validatebox" required="true"/></td>
					<td></td>
					<td>时间：</td>
					<td><input class="easyui-datebox" name="updatetime" id="updatetime" required="true" editable="false" /></td>
				</tr>
				<tr>
				<br>
					<td valign="top">备注：</td>
					<td colspan="4"><textarea rows="7" cols="60" name="remark" id="remark"></textarea></td>
				</tr>
			</table>
		</form>
	</div>
	
	<div id="dlg-buttons">
		<a href="javascript:saveFood()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		<a href="javascript:closeFoodDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
</body>
</html>