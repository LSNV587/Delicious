<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>推荐信息管理</title>
<link rel="stylesheet" type="text/css" href="../jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="../jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="../jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="../jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
	var url;
	function openSysRecModifyDialog(){
		var selectedRows=$("#dg").datagrid('getSelections');
		if(selectedRows.length!=1){
			$.messager.alert("系统提示","请选择一条要编辑的数据！");
			return;
		}
		var row=selectedRows[0];
		$("#dlg").dialog("open").dialog("setTitle","编辑推荐信息");
		$('#fm').form('load',{
		        recid:row. recid,
				foodname:row.foodname,
				//picurl:row.picurl,
				fooddesc:row.fooddesc
				
    });
		url="../sysRecommendSave?recid="+row.recid;
	}
	
	function closeFoodDialog(){
		$("#dlg").dialog("close");
		resetValue();
	}
	
	function resetValue(){
		
		$("#foodname").val("");
		$("#picurl").val("");
		$("#fooddesc").val("");
	
		
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
	<table id="dg" title="推荐信息" class="easyui-datagrid" fitColumns="true"
	 pagination="true" rownumbers="true" url="../recommendList" fit="true" toolbar="#tb">
		<thead>
			<tr>
				<th field="cb" checkbox="true"></th>
				<th field="recid" width="20">推荐编号</th>
				 <th field="foodid"  hidden="true">美食ID</th>
				<th field="foodname" width="50">美食名</th>
				 <th field="picurl"  width="100">图片</th>
				<th field="fooddesc" width="100">推荐语</th>
			</tr>
		</thead>
	</table>
		<div id="tb">
		<div>  
			<a href="javascript:openSysRecModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>			
		</div>
		</div>

	
	<div id="dlg" class="easyui-dialog" style="width: 570px;height: 300px;padding: 10px 20px"
		closed="true" buttons="#dlg-buttons">
		<form id="fm" method="post">
			<table>
				<tr>
					<td>推荐编号：</td>
					<td><input type="text" name="recid" id="recid" class="easyui-validatebox" required="true" readonly="true"/></td>
					<td>菜名：</td>
					<td><input type="text" name="foodname" id="foodname" class="easyui-validatebox" required="true"/></td>
				</tr>
				<tr>
					<td>图片：</td>		
					<td>
					  <input type="file"  id="picurl" name="picurl"  />
					</td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td valign="top">推荐语：</td>
					<td colspan="4"><textarea rows="7" cols="60" name="fooddesc" id="fooddesc"></textarea></td>
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