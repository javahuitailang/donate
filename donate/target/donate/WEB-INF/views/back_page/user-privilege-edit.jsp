<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>管理用户角色</title>
<link href="<%=path%>/back/css/style.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript" src="<%=path%>/back/js/authority.js"></script>
</head>

<body>
	<div class="title">系统首页&gt;&gt;管理员管理&gt;&gt;修改用户权限</div>
	<div id="layout_multiSelect">
		<form name="userRoleUpdateForm" method="post"
			action="<%=path%>/manage/saveUserPrivilege">
			<input type="hidden" name="user_id" value="${user_id}"/>
			<table>
				<tr>
					<td>所有功能列表</td>
					<td>&nbsp;</td>
					<td>已选择功能列表</td>
				</tr>
				<tr>
					<td width="45%"><select name="allRoleIds" multiple="multiple"
						id="select_left" class="multiSelect_left">
							<c:forEach items="${noPrivileges}" var="noPrivilege">
								<option value="${noPrivilege.id}">${noPrivilege.name}</option>
							</c:forEach>
					</select></td>
					<td width="10%"><input class="btn" type="button"
						value="&gt;&gt;&gt;&gt;" onclick="moveOption('toRight')"><br>
					<br>
					<br>
					<br>
					<br> <input class="btn" type="button" value="&lt;&lt;&lt;&lt;"
						onclick="moveOption('toLeft')"></td>
					<td width="45%"><select name="selectedPrivileges"
						multiple="multiple" id="select_right" class="multiSelect_left">
							<c:forEach items="${hasPrivileges}" var="hasPrivilege">
								<option value="${hasPrivilege.id}">${hasPrivilege.name}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td><input type="button" class="btn" value="保存"
						onclick="selectAllCommit();" />
					</td>

					<td>&nbsp;</td>
					<td><input class="btn" type="button" value="取消"
						onClick="history.back(1)" /></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
