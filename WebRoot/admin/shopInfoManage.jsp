<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>商家信息管理</title>
<link rel="stylesheet" type="text/css" href="../jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="../jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="../jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="../jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
	var url;
	
	function searchSeller(){
		$('#dg').datagrid('load',{
			shopname:$('#s_shopname').val(),
			shopkepper:$('#s_shopkepper').val(),
			tel:$('#s_tel').val(),
		});
	}
	
	function deleteSeller(){
		var selectedRows=$("#dg").datagrid('getSelections');
		if(selectedRows.length==0){
			$.messager.alert("系统提示","请选择要删除的数据！");
			return;
		}
		var strIds=[];
		for(var i=0;i<selectedRows.length;i++){
			strIds.push(selectedRows[i].sellerid);
		}
		var ids=strIds.join(",");
		$.messager.confirm("系统提示","您确认要删掉这<font color=red>"+selectedRows.length+"</font>条数据吗？",function(r){
			if(r){
				$.post("../sellerDelete",{delIds:ids},function(result){
					if(result.success){
						$.messager.alert("系统提示","您已成功删除<font color=red>"+result.delNums+"</font>条数据！");
						$("#dg").datagrid("reload");
					}else{
						$.messager.alert('系统提示','<font color=red>'+selectedRows[result.errorIndex].shopname+'</font>'+result.errorMsg);
					}
				},"json");
			}
		});
	}
	
	
	function openSellerAddDialog(){
		$("#dlg").dialog("open").dialog("setTitle","添加商家信息");
		url="../sellerSave";
	}
	
	function openSellerModifyDialog(){
		var selectedRows=$("#dg").datagrid('getSelections');
		if(selectedRows.length!=1){
			$.messager.alert("系统提示","请选择一条要编辑的数据！");
			return;
		}
		var row=selectedRows[0];
		$("#dlg").dialog("open").dialog("setTitle","编辑商家信息");
		//$("#fm").form("load",row);
		$('#fm').form('load',{
				shopname:row.shopname,
				shopkepper:row.shopkepper,
				tel:row.tel,
				//logo:row.logo,
				distance:row.distance,
				slogan:row.slogan,
				updatetime:row.updatetime});
		url="../sellerSave?id="+row.sellerid;
	}
	
	function closeSellerDialog(){
		$("#dlg").dialog("close");
		resetValue();
	}
	
	function resetValue(){
		$("#shopname").val("");
		$("#shopkepper").val("");
	    $("#tel").val("");
		$("#logo").val("");
		$("#distance").val("");
		$("#slogan").val("");
		$("#updatetime").datebox("setValue","");
	}
	
	
	function saveSeller(){
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
	<table id="dg" title="商家信息" class="easyui-datagrid" fitColumns="true"
	 pagination="true" rownumbers="true" url="../sellerList" fit="true" toolbar="#tb">
		<thead>
			<tr>
				<th field="cb" checkbox="true"></th>
				<th field="sellerid" width="30">商户编号</th>
				<th field="shopname" width="50">商家名称</th>
				<th field="shopkepper" width="50">店主</th>
				<th field="tel" width="40">联系电话</th>
				<th field="logo" width="70">商户图标</th>
				<th field="distance" width="40">距离</th>
				<th field="slogan" width="100">标语</th>
				<th field="updatetime" width="50">更新时间</th>
			</tr>
		</thead>
	</table>
	
	<div id="tb">
		<div>
			<a href="javascript:openSellerAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>   
			<a href="javascript:openSellerModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
			<a href="javascript:deleteSeller()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
		</div>
		<div>&nbsp;商家名称：&nbsp;<input type="text" name="s_shopname" id="s_shopname" size=20/>&nbsp;
		店主：&nbsp;<input type="text" name="s_shopkepper" id="s_shopkepper" size=20/>&nbsp;
		联系电话：&nbsp;<input type="text" name="s_tel" id="s_tel" size=20/>&nbsp;
		
		<a href="javascript:searchSeller()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a></div>
	</div>
	
	<div id="dlg" class="easyui-dialog" style="width: 570px;height: 400px;padding: 10px 20px"
		closed="true" buttons="#dlg-buttons">
		<form id="fm" method="post">
			<table>
				<tr>
					<td>商家名称</td>
					<td><input type="text" name="shopname" id="shopname" class="easyui-validatebox" required="true"/></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>店主</td>
					<td><input type="text" name="shopkepper" id="shopkepper" class="easyui-validatebox" required="true"/></td>
				</tr>
			   <br>
				<tr>
					<td>联系电话</td>
				    <td><input type="text" name="tel" id="tel" class="easyui-validatebox" required="true"/></td>
					<td></td>
					<td>Logo</td>
				   <td><input type="file"  id="logo" name="logo" /></td>				
				</tr>
				<tr>
					<td>距离</td>
					<td><input  type="text"  name="distance" id="distance" class="easyui-validatebox" required="true"/></td>
					<td></td>
					<td>更新时间</td>
					<td><input class="easyui-datebox" name="updatetime" id="updatetime" required="true" editable="false" /></td>
				</tr>
				<tr>
				<br>
					<td valign="top">标语：</td>
					<td colspan="4"><textarea rows="7" cols="60" name="slogan" id="slogan"></textarea></td>
				</tr>
			</table>
		</form>
	</div>
	
	<div id="dlg-buttons">
		<a href="javascript:saveSeller()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		<a href="javascript:closeSellerDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
</body>
</html>