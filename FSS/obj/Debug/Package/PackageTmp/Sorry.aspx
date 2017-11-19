<%@ Page Title="FSS" Language="vb" AutoEventWireup="false" CodeBehind="Sorry.aspx.vb" Inherits="FSS.Sorry" %>
<%@ Register assembly="FSS" namespace="FSS" TagPrefix="fss" %>
<!DOCTYPE html>
<html lang="es-AR">
<head runat="server">
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<title>FSS</title>
	<script type="text/javascript" >

	    function cerrarpagina() {
	        window.opener = top;
	        window.close();
	        return false;
	    }
		</script>
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<%--<link rel="stylesheet" href="css/misestilos.css">--%>
    <link rel="stylesheet" href="css/estilos.css">
</head>
<body>
	<form id="form1" runat="server">
	<section class="main container">
		<div class="row">       
	<asp:Panel ID="PanelCont" runat="server">
	<header>
		<nav class="navbar navbar-custom navbar-static-top" role="navigation" id="menu">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navegacion-fss">
						<span class="sr-only">Desplegar / Ocultar Menu</span>
						<span class="icon-bar bg-primary"></span>
						<span class="icon-bar bg-primary"></span>
						<span class="icon-bar bg-primary"></span>
					</button>
					<%--<a href="Inicio.aspx" class="navbar-brand">Inici</a>--%>
                    <fss:miLink ID="menuInicio" runat="server" PostBackUrl="Inicio.aspx" CssClass="navbar-brand linkboton" CausesValidation="false" >Inicio</fss:miLink>
				</div>
				<!-- Menu -->
				<div class="collapse navbar-collapse" id="navegacion-fss">
					<ul class="nav navbar-nav">
						<%--<li runat="server"><fss:miLink ID="menuInicio" runat="server" PostBackUrl="Inicio.aspx" CssClass="linkboton" CausesValidation="false" >Inicio</fss:miLink></li>--%>
                        <li runat="server"><fss:miLink ID="menuCatalogo" runat="server" PostBackUrl="Catalogo.aspx?Linea=Botas" CssClass="linkboton" CausesValidation="false">Catalogo</fss:miLink></li>
                        <li runat="server"><fss:miLink ID="menuCIPA" runat="server" PostBackUrl="CalculoCIPA.aspx" CssClass="linkboton hidden-xs hidden-sm" CausesValidation="false" >CIPA</fss:miLink></li>
                        <li runat="server"><fss:miLink ID="menuVideos" runat="server" PostBackUrl="Videos.aspx" CssClass="linkboton" CausesValidation="false" >Videos</fss:miLink></li>
                        <li runat="server"><fss:miLink ID="LinkValores" runat="server" PostBackUrl="Valores.aspx" CssClass="linkboton" CausesValidation="false">Nuestros Valores</fss:miLink></li>
					</ul>
				</div>
			</div>
		</nav>
	</header>
		<%-- Separador --%>
	<section class="jumbotron-custom">
			<h3 class="text-primary"><fss:miEtiqueta id="encabezado" runat="server" Text="FSS La tienda on-line para el patinador" CssClass="titulo"></fss:miEtiqueta></h3>
	</section>
<%-- ------------------------- --%>
	<%-- Contenido de cada pagina --%>
			<section class="posts col-md-9 text-primary">
                <article style="text-align:center">
                                <asp:label ID="titEsp" runat="server" Text="" CssClass="titulo" Style="color:red">LO SENTIMOS</asp:label> <br />
                                <asp:label ID="subtitEsp" runat="server" Text="" CssClass="subtitulo">Ha ocurrido un error inesperado, esta página se encuentra fuera de servicio.</asp:label> <br />
                                <asp:label ID="subsubtitEsp" runat="server" Text="" CssClass="subsubtitulo">Si necesita asistencia, por favor contacte al soporte tecnico soporte@fss.com.ar</asp:label>
                                <br />
                                <br />
                                <asp:label ID="titIng" runat="server" Text="" CssClass="titulo" Style="color:red">WE ARE SORRY</asp:label> <br />
                                <asp:label ID="subtitIng" runat="server" Text="" CssClass="subtitulo">An unexpected error has occurred, this page is out of service.</asp:label> <br />
                                <asp:label ID="subsubtitIng" runat="server" Text="" CssClass="subsubtitulo">If you need assistance, please contact technical support soporte@fss.com.ar</asp:label>
                                <br />
                                <br />
                                <asp:label ID="titPort" runat="server" Text="" CssClass="titulo" Style="color:red">SENTIMOS MUITO</asp:label> <br />
                                <asp:label ID="subtitPort" runat="server" Text="" CssClass="subtitulo">Um erro inesperado ocorreu, esta página está fora de serviço.</asp:label> <br />
                                <asp:label ID="subsubtitPort" runat="server" Text="" CssClass="subsubtitulo">Se precisar de ajuda, entre em contato com o suporte técnico soporte@fss.com.ar</asp:label>
                                <br />
                                <br />
                </article>
			</section>
<%-- ------------------------- --%>
		<%-- Menu lateral --%>
			<aside class="col-md-3 hidden-xs hidden-sm" id="lateral">
				<%--<fss:mietiqueta ID="UsuarioLogueado" runat="server" Text="" CssClass="logueado"></fss:mietiqueta>--%>
				<div class="list-group">
				<asp:Label ID="UsuarioLogueado" runat="server" Text="" CssClass="logueado"></asp:Label>
				<br />
				<br />
				<asp:ListBox ID="lstIdioma" runat="server" AutoPostBack="true" CausesValidation="false" CssClass="btn-block text-center text-primary"></asp:ListBox>
				<br />
				<br />
				<fss:miboton ID="menuLogin" runat="server" Text="Ingresar" CssClass="boton btn btn-primary btn-block"  CausesValidation="false"/>
				<fss:miboton ID="menuSalir" runat="server" Text="Salir" CssClass="boton btn btn-primary btn-block" Visible="false"  CausesValidation="false"/>
				<br />
				<br />
			</aside>
</asp:Panel>
	
			</div>
	</section>
        <div class="container">
			<div class="row">
                <br />
                <br />
                <br />
            </div>
        </div>
<%-- footer de la master --%>
		<footer id="pie">
		<div class="container">
			<div class="row">
                <hr style="border-bottom-color:blue;border-bottom-style:double" />
				<div class="col-xs-6">
					<p class="text-primary">info.fss@gmail.com</p>
				</div>
				<div class="col-xs-6">
					<ul class="list-inline text-right">
						<li><fss:miboton ID="menuRegistro" runat="server" Text="Registrarse" CssClass="boton btn  btn-link" CausesValidation="false"/></li>
						<li><fss:miBoton ID="menuContacto" runat="server"  CssClass="boton btn  btn-link" CausesValidation="false" Text="Contacto"/></li>
						<li><fss:miBoton ID="LinkRecomendacion" runat="server" CssClass="boton btn  btn-link" CausesValidation="false" Text="Recomendaciones"/></li>
					</ul>
				</div>
			</div>
		</div>
	</footer>
		<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
  </form>
</body>
</html>
