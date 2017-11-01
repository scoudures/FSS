<%@ Page Title="FSS" Language="vb" AutoEventWireup="false" CodeBehind="CalculoCIPA.aspx.vb" Inherits="FSS.CalculoCIPA" %>
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
	<%-- header de la master --%>
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
                        <li runat="server"><fss:miLink ID="linkQuienesSomos" runat="server" PostBackUrl="QuienesSomos.aspx" CssClass="linkboton" CausesValidation="false" Width="150px">Quienes Somos</fss:miLink></li>
                        <li runat="server"><fss:miLink ID="LinkValores" runat="server" PostBackUrl="Valores.aspx" CssClass="linkboton" CausesValidation="false" Width="150px">Nuestros Valores</fss:miLink></li>
						<%--<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button">
								Categorias <span class="caret"></span>
							</a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="#">Categoria #1</a></li>
								<li class="divider"></li>
								<li><a href="#">Categoria #2</a></li>
								<li><a href="#">Categoria #3</a></li>
								<li><a href="#">Categoria #4</a></li>
							</ul>
						</li>--%>
					</ul>
				</div>
			</div>
		</nav>
	</header>
		<%-- Separador --%>
	<section class="jumbotron-custom">
			<h3 class="text-primary"><fss:miEtiqueta id="encabezado" runat="server" Text="FSS La tienda on-line para el patinador" CssClass="titulo"></fss:miEtiqueta></h3>
	</section>
<%-------------------------------------------------------------------------------------------------------%>
	<%-- Contenido de cada pagina --%>
	<section id="seccionCIPA"class="posts col-md-12 col-lg-12 text-primary hidden-xs hidden-sm">
    <asp:Panel ID="PanelCIPA" runat="server">
	<div id="ContenedorCIPA">
	    
    </div>
	</asp:Panel>
    </section>

        <br />
        <table style="width:930px">
            <tr>
                <td style="width:8%"></td>
                <td><h2><asp:Label ID="lblIntro" runat="server" Text="Estés donde estés, FSS te ayuda a realizar el Cálculo CIPA de todas tus competencias como si fueras un calculista oficial. TOTALMENTE GRATIS!!!" CssClass="small"></asp:Label></h2></td>
            </tr>
        </table>
        <br /><br />
        <div id="titulo" style="background-color:#0094ff;color:white ;padding:20px,10px,20px,20px;height:30px;font-size:20px;text-align:center">    
            <asp:Label ID="LblTitulo" runat="server" Text="Clasificaciones" ></asp:Label>
        </div>
        
        <table border="0" style="border-collapse: collapse ; width:930px;margin-right:30px" >
            <tr style="height:40px">
                <td style="width:5%"></td>
                <td style="width:15%"><asp:Label ID="Torneo" runat="server" Text="Torneo" Font-Bold="True"></asp:Label></td>
                <td colspan="3" > <asp:TextBox style="width:97%" ID="txtTorneo" runat="server" TabIndex="1"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Text="*" ErrorMessage="Ingrese el Torneo" ControlToValidate="txtTorneo" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>                
                

            </tr>
            <tr style="height:40px">
                <td ></td>
                <td ><asp:Label ID="LblCompetencia" runat="server" Text="Competencia" Font-Bold="True"></asp:Label></td>
                <td colspan ="3" > <asp:TextBox style="width:97%" ID="txtCompetencia" runat="server" TabIndex="2"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Text="*" ErrorMessage="Ingrese la Competencia" ControlToValidate="txtCompetencia" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>                
                
            </tr>
            <tr style="height:40px">
                <td></td>
                <td><asp:Label ID="LblOrden" runat="server" Text="Orden" Font-Bold="True"> </asp:Label>  </td>
                <td style="width:20% "><asp:TextBox ID="TxtOrden" runat="server" Style="width:93%" TabIndex="3" onkeydown = "return (!(event.keyCode>=65) && event.keyCode!=32);"></asp:TextBox></td>
                <td style="width:20%;text-align:right "><asp:Label ID="LblParticipante" runat="server" Text="Participante" Font-Bold="True"> </asp:Label>&nbsp;&nbsp;&nbsp; </td>
                <td><asp:TextBox ID="txtPatinador" Style="width:93%" runat="server" TabIndex="4"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Text="*" ErrorMessage="Ingrese el Patinador" ControlToValidate="txtPatinador" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td></td>
                <td colspan="3"><asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" /></td>
            </tr>
        </table>
        <hr />
        <br />

        <div id="divPuntajes" style ="text-align:center">
            <div style="display:inline-block ;width:50px">
                <table>
                    <tr><td><asp:Label ID="Label4" runat="server" Text="Puntaje"></asp:Label><br /></td> </tr>
                    <tr><td><asp:Label ID="Label1" runat="server" Text="A"></asp:Label><br /></td> </tr>
                    <tr><td><asp:Label ID="Label2" runat="server" Text="B"></asp:Label><br /></td> </tr>
                    <tr><td><asp:Label ID="Label3" runat="server" Text="SUMA" Visible="false"></asp:Label><br /></td></tr>
                </table>  
            </div>
            <div id="divJuez1" style="display:inline-block;width:100px; text-align:center;margin-left:15px" >
                <table style="width:auto" >
                    <tr><td  colspan="2"  ><asp:Label ID="LblJuez1" runat="server" Text="Juez 1" ></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="width:50px"><asp:TextBox ID="TxtJ1A"  runat="server" MaxLength="1" Style="width:100%" TabIndex="4" onkeydown = "return (!(event.keyCode>=65) && event.keyCode!=32);" ></asp:TextBox></td>
                        <td style="width:50px"><asp:TextBox ID="TXTJ1AA" runat="server" MaxLength="1" Style="width:100%" TabIndex="5" onkeydown = "return (!(event.keyCode>=65) && event.keyCode!=32);" ></asp:TextBox></td>
                    </tr>
                    <tr>                
                        <td> <asp:TextBox ID="TXTJ1B"  runat="server" MaxLength="1" Style="width:100%" TabIndex="14" onkeydown = "return (!(event.keyCode>=65) && event.keyCode!=32);" ></asp:TextBox> </td>
                         <td> <asp:TextBox ID="Txtj1BB" runat="server" MaxLength="1" Style="width:100%" TabIndex="15" onkeydown = "return (!(event.keyCode>=65) && event.keyCode!=32);"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td colspan="2"><asp:TextBox ID="txtJ1Suma" runat="server" style="width:100%" Visible="false"></asp:TextBox> </td>                                               
                    </tr>
                </table>                                       
            </div>

<%----------------JUEZ 2-------------------------------------------------------------------%>
 <div id="divJuez2" style="display:inline-block;width:100px; text-align:center;margin-left:15px" >
                <table style="width:auto" >
                    <tr><td  colspan="2"  ><asp:Label ID="Label5" runat="server" Text="Juez 2" ></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="width:50px"><asp:TextBox ID="txtJ2A"  runat="server" MaxLength="1" Style="width:100%" TabIndex="6"  onkeydown = "return (!(event.keyCode>=65) && event.keyCode!=32);" ></asp:TextBox></td>
                        <td style="width:50px"><asp:TextBox ID="txtJ2AA" runat="server" MaxLength="1" Style="width:100%" TabIndex="7" onkeydown = "return (!(event.keyCode>=65) && event.keyCode!=32);" ></asp:TextBox></td>
                    </tr>
                    <tr>                
                        <td> <asp:TextBox ID="txtJ2B"  runat="server" MaxLength="1" Style="width:100%" TabIndex="16" onkeydown = "return (!(event.keyCode>=65) && event.keyCode!=32);"></asp:TextBox> </td>
                         <td> <asp:TextBox ID="txtJ2BB" runat="server" MaxLength="1" Style="width:100%" TabIndex="17" onkeydown = "return (!(event.keyCode>=65) && event.keyCode!=32);"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td colspan="2"><asp:TextBox ID="txtJ2Suma" runat="server" style="width:100%" Visible="false"></asp:TextBox> </td>                                               
                    </tr>
                </table>                                       
            </div>

<%----------------JUEZ 3-------------------------------------------------------------------%>
 <div id="divJuez3" style="display:inline-block;width:100px; text-align:center;margin-left:15px" >
                <table style="width:auto;height:100%"  >
                    <tr><td  colspan="2"  ><asp:Label ID="Label6" runat="server" Text="Juez 3" ></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="width:50px"><asp:TextBox ID="txtJ3A"  runat="server" MaxLength="1" Style="width:100%" TabIndex="8" onkeydown = "return (!(event.keyCode>=65) && event.keyCode!=32);" ></asp:TextBox></td>
                        <td style="width:50px"><asp:TextBox ID="txtJ3AA" runat="server" MaxLength="1" Style="width:100%" TabIndex="9" onkeydown = "return (!(event.keyCode>=65) && event.keyCode!=32);" ></asp:TextBox></td>
                    </tr>
                    <tr>                
                        <td> <asp:TextBox ID="txtJ3B"  runat="server" MaxLength="1" Style="width:100%" TabIndex="18" onkeydown = "return (!(event.keyCode>=65) && event.keyCode!=32);"></asp:TextBox> </td>
                         <td> <asp:TextBox ID="txtJ3BB" runat="server" MaxLength="1" Style="width:100%" TabIndex="19" onkeydown = "return (!(event.keyCode>=65) && event.keyCode!=32);"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td colspan="2"><asp:TextBox ID="TxtJ3Suma" runat="server" style="width:100%" Visible="false"></asp:TextBox> </td>                                               
                    </tr>
                </table>                                       
            </div>

       <%----------------JUEZ 4-------------------------------------------------------------------%>

 <div id="divJuez4" style="display:inline-block;width:100px; text-align:center;margin-left:15px" >
                <table style="width:auto" >
                    <tr><td  colspan="2"  ><asp:Label ID="Label7" runat="server" Text="Juez 4" ></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="width:50px"><asp:TextBox ID="txtJ4A"  runat="server" MaxLength="1" Style="width:100%" TabIndex="10" onkeydown = "return (!(event.keyCode>=65) && event.keyCode!=32);" ></asp:TextBox></td>
                        <td style="width:50px"><asp:TextBox ID="txtJ4AA" runat="server" MaxLength="1" Style="width:100%" TabIndex="11" onkeydown = "return (!(event.keyCode>=65) && event.keyCode!=32);" ></asp:TextBox></td>
                    </tr>
                    <tr>                
                        <td> <asp:TextBox ID="txtJ4B"  runat="server" MaxLength="1" Style="width:100%" TabIndex="20" onkeydown = "return (!(event.keyCode>=65) && event.keyCode!=32);" ></asp:TextBox> </td>
                         <td> <asp:TextBox ID="txtJ4BB" runat="server" MaxLength="1" Style="width:100%" TabIndex="21" onkeydown = "return (!(event.keyCode>=65) && event.keyCode!=32);" ></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td colspan="2"><asp:TextBox ID="txtJ4Suma" runat="server" style="width:100%" Visible="false"></asp:TextBox> </td>                                               
                    </tr>
                </table>                                       
            </div>     

    <%----------------JUEZ 5-------------------------------------------------------------------%>
 <div id="divJuez5" style="display:inline-block;width:100px; text-align:center;margin-left:15px" >
                <table style="width:auto""  >
                    <tr><td  colspan="2"  ><asp:Label ID="Label8" runat="server" Text="Juez 5" ></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="width:50px"><asp:TextBox ID="txtJ5A"  runat="server" MaxLength="1" Style="width:100%" TabIndex="12" onkeydown = "return (!(event.keyCode>=65) && event.keyCode!=32);" ></asp:TextBox></td>
                        <td style="width:50px"><asp:TextBox ID="txtj5AA" runat="server" MaxLength="1" Style="width:100%" TabIndex="13" onkeydown = "return (!(event.keyCode>=65) && event.keyCode!=32);" ></asp:TextBox></td>
                    </tr>
                    <tr>                
                        <td> <asp:TextBox ID="txtJ5B"  runat="server" MaxLength="1" Style="width:100%" TabIndex="22" onkeydown = "return (!(event.keyCode>=65) && event.keyCode!=32);" ></asp:TextBox> </td>
                         <td> <asp:TextBox ID="txtJ5BB" runat="server" MaxLength="1" Style="width:100%" TabIndex="23" onkeydown = "return (!(event.keyCode>=65) && event.keyCode!=32);" ></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td colspan="2"><asp:TextBox ID="txtJ5Suma" runat="server" style="width:100%" Visible="false"></asp:TextBox> </td>                                               
                    </tr>
                </table>           
                   
            </div>     
            <div id="divSiguiente" style="display:inline-block;width:100px; text-align:center;margin-left:15px" >
                <table>
                    <tr>
                        <td><asp:Button ID="Button1" runat="server" Text="Siguiente" Height="40px" Width="150px" TabIndex="24" cssClass="btn btn-default"  />
                            <asp:Button ID="btnLimpiar" runat="server" Text="Nueva Competencia" Height="40px" Width="150px" TabIndex="100" cssClass="btn btn-default" CausesValidation="false" />
                        </td>
                    </tr>
                </table>
                
            </div>
            
    </div>   <%--puntajes--%>
        <hr />

        <div id="divGridview" style="width:900px; align-items:center">
                <asp:GridView ID="GridTabla" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="true" style="width:100%" Visible="true">
                <AlternatingRowStyle BackColor="White" />
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333"  />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <br />
            <br />
            <asp:Button ID="BtnCalcular" runat="server" Text="CALCULAR" Style="width:100%;height:50px" Font-Bold="True" cssclass="btn btn-default" CausesValidation="false"/>
        </div> <%--divgrilla--%>
        <br />
        <asp:Panel ID="PanelResultados" runat="server" GroupingText="Podio Competencia" CssClass="titulo" style="width:100%;Height:300px">
            <table style="width:100%;Height:100%">
            <tr style="width:500px">
                <td style="width:20%; text-align:right"> <asp:Label ID="LblClasificacion" runat="server" Text="Clasificacion: " CssClass="subtitulo"></asp:Label></td>
                <td style="width:80%"> <asp:TextBox ID="TxtClasificacion" runat="server" Style="width:100%;height:150px" Enabled="False" TextMode="multiline" BackColor="White" ForeColor="Black"></asp:TextBox></td>
            </tr>
             <tr>
                <td style="text-align:right"> <asp:Label ID="LblSumas" runat="server" Text="Puntos Obtenidos: " CssClass="subtitulo"></asp:Label></td>
                <td > 
                    <asp:TextBox ID="TxtSumas" runat="server" Style="width:100%;height:120px" Enabled="False" TextMode="multiline"  BackColor="White" ForeColor="Black"></asp:TextBox></td>
            </tr>
                <tr>
                <td style="text-align:right"> <asp:Label ID="LblError" runat="server" Text="" Visible="false" CssClass="subsubtitulo"></asp:Label></td>
                <td> <asp:TextBox ID="TxtError" runat="server" Style="width:100%;height:30px; vertical-align:central" Enabled="False" TextMode="multiline" Visible="false" BackColor="White" ForeColor="Red" ></asp:TextBox></td>
            </tr>
        </table>
            <br />
        </asp:Panel>
<%-------------------------------------------------------------------------------------------------------%>
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



