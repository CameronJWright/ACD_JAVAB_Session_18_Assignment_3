<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Validation</title>
</head>
<body>
	<form action="Validate.jsp">
		<table>
			<tr>
				<td>Name:</td>
				<td><input type="text" name="name" value=""></td>
			</tr>
			<tr>
				<td>Address:</td>
				<td><input type="text" name="address" value=""></td>
			</tr>
			<tr>
				<td>Phone Number:</td>
				<td><input type="text" name="number" value=""></td>
			</tr>
			<tr>
				<td><input type="submit" value="Validate"></td>
			</tr>
		</table>
	</form>
	<br>
	<%
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String snumber = request.getParameter("number");
		if (name == null && address == null && snumber == null) {
			//when page is first loaded
		} else if (name.length() == 0 || address.length() == 0 || snumber.length() == 0) {
			//when a field is left blank
	%>
	<p style="color: red;">
		<b>A field was left empty! All fields required</b>
	</p>
	<%
		} else if (!isNumber(snumber)) {
			//if phone number isnt a number
	%>
	<p style="color: red;">
		<b>Your number cannot include any characters!</b>
	</p>
	<%
		} else {
			int number = Integer.valueOf(snumber);
	%>
	<b>Your name is <%=name%>.
	</b>
	<br />
	<b>Your address is <%=address%>.
	</b>
	<br />
	<b>Your number is <%=number%>.
	</b>
	<br />
	<br />
	<b>If correct, click to submit. Otherwise re-enter your information.
	</b>
	<br />
	<!-- Form to send correct info wherever -->
	<form action="SENDING.jsp">
		<input type="submit" value="Submit">
	</form>
	<%
		}
	%>
	<%!public static boolean isNumber(String snumber) {
		try {
			double d = Double.parseDouble(snumber);
		} catch (NumberFormatException | NullPointerException e) {
			return false;
		}
		return true;
	}%>
</body>
</html>