<!DOCTYPE html>
<html>
<head>
<title>insert title here</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<%@page import="webshop.Auto"%>
	<%@page import="webshop.AutoLijst"%>
	<%
		AutoLijst autos = new AutoLijst();
	%>
	<form>
		<select name="merk">
			<option value="alle">Alle merken</option>
			<option value="Ford">Ford</option>
			<option value="Opel">Opel</option>
			<option value="Subaru">Subaru</option>
			<option value="Mercedes">Mercedes</option>
			<option value="Ferrari">Ferrari</option>
			<option value="Citroen">Citroen</option>
			<option value="Mini">Mini</option>
		</select> Minimum prijs <input type="text" name="min"> Maximum prijs <input
			type="text" name="max"> <input type="submit" name="submit"
			value="OK">
	</form>
	<br>
	<%
		if (request.getParameter("submit") != null) {
			int min = 0;
			int max = 1000000;
			try {
				if (!request.getParameter("min").equals("")) {
					min = Integer.parseInt(request.getParameter("min"));
				}
				if (!request.getParameter("max").equals("")) {
					max = Integer.parseInt(request.getParameter("max"));
				}
			} catch (NumberFormatException e) {
				out.print("Voer een geldig getal in.<br>");
			}
			for (Auto auto : autos.getLijst()) {
				if (request.getParameter("merk").equals(auto.getMerk())
						|| request.getParameter("merk").equals("alle")) {
					if (auto.getPrijs() >= min && auto.getPrijs() <= max) {
						out.println("<div class=\"box\">");
						out.println("<div class=\"box_naam\">");
						out.println(auto.getMerk() + " " + auto.getType());
						out.println("</div>");
						out.println("<div class=\"box_content\">");
						out.println("<img src=" + auto.getFoto() + " width=\"200\" height=\"120\">");
						out.println("<div class=\"box_price\">");
						out.println("<p> &euro;" + auto.getPrijs() + "</p>");
						out.println("</div>");
						out.println("</div>");
						out.println("</div>");
					}
				}
			}
		} else {
			for (Auto auto : autos.getLijst()) {
				out.println("<div class=\"box\">");
				out.println("<div class=\"box_naam\">");
				out.println(auto.getMerk() + " " + auto.getType());
				out.println("</div>");
				out.println("<div class=\"box_content\">");
				out.println("<img src=" + auto.getFoto() + " width=\"200\" height=\"120\">");
				out.println("<div class=\"box_price\">");
				out.println("<p> &euro;" + auto.getPrijs() + "</p>");
				out.println("</div>");
				out.println("</div>");
				out.println("</div>");

			}
		}
	%>
</body>
</html>