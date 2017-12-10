<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Pedido.aspx.vb" Inherits="FSS.Pedido" %>
<%@ Register assembly="FSS" namespace="FSS" TagPrefix="fss" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Pedido</title>
    <link href="~/Estilos/misestilos.css" rel="stylesheet" />
    <script type="text/javascript" >

        function cerrarpagina() {
            window.opener = top;
            window.close();
            return false;
        }
        </script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="contenedor">
            <header id="cabecera">
                <fss:miEtiqueta id="encabezado" runat="server" Text="FSS La tienda on-line para el patinador" CssClass="titulo"></fss:miEtiqueta>
            </header>
            <%-- menú de navegación --%>
                <nav id="menu">
                    <ul runat="server">
                        <li runat="server"><fss:miLink ID="menuInicio" runat="server" PostBackUrl="Inicio.aspx" CssClass="linkboton">Inicio</fss:miLink></li>
                        <li runat="server"><fss:miLink ID="menuCatalogo" runat="server" PostBackUrl="Catalogo.aspx" CssClass="linkboton">Catalogo</fss:miLink></li>
                        <li runat="server"><fss:miLink ID="menuCIPA" runat="server" PostBackUrl="CalculoCIPA.aspx" CssClass="linkboton">CIPA</fss:miLink></li>
                        <li runat="server"><fss:miLink ID="menuVideos" runat="server" PostBackUrl="Videos.aspx" CssClass="linkboton">Videos</fss:miLink></li>
                        <li runat="server"><fss:miLink ID="menuContacto" runat="server" PostBackUrl="Contacto.aspx" CssClass="linkboton">Contacto</fss:miLink></li>
                    </ul>
                </nav>
            <asp:Panel ID="Panel1" runat="server" Width="600px" HorizontalAlign="Center"></asp:Panel><br /><br />
            <footer id="pie"> </footer>
    </div>
    </form>
</body>
</html>
