<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Inexistente.aspx.vb" Inherits="FSS.Inexistente" %>
<%@ Register assembly="FSS" namespace="FSS" TagPrefix="fss" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>FSS</title>
    <link href="Estilos/misestilos.css" rel="stylesheet" />
    <script type="text/javascript" >
        function cerrarpagina() {
            window.opener = top;
            window.close();
            return false;
        }
        </script>
    <style>
        #contenedor_ {
  width: 990px;
  margin: 5px auto 5px auto; /* superior, derecho, inferior, izquierdo*/
  text-align: center;
  align-items:center;
}

#cabecera_ {
  background: #FFFBB9;
  border: 1px solid #999999;
  border-radius: 5px; /* esquinas redondeadas */
  box-shadow: rgb(150,150,150) 5px 5px 10px;
  margin: 5px auto 5px 5px; /* superior, derecho, inferior, izquierdo*/
  padding: 5px; /* superior, derecho, inferior, izquierdo (si solo se define un valor, sera asignado a todos los espacios alrededor del contenido del elemento)*/
  width: 990px;

}
#menu_ {
  background: #CCCCCC;
  margin: 5px auto 5px 5px; /* superior, derecho, inferior, izquierdo*/
  padding: 5px;
  width: 990px;
  border: 1px solid #999999;
  border-radius: 5px; /* esquinas redondeadas */
  box-shadow: rgb(150,150,150) 5px 5px 10px;
}
#menu_ li {
  display: inline-block; /* los convierto en cajas inline pero sin salto de linea, se pueden tratar como bloques */
  list-style: none; /* sin la viñeta */
  padding: 5px;
  font: bold 14px verdana, sans-serif;
}

article {
  background: #FFFBCC;
  border: 1px solid #999999;
  padding: 10px;
  margin-bottom: 10px;
  overflow:scroll;
    width: 990px;
}
        #pie_ {
  clear: both; /* restaura el flujo normal del documento, empuja los elementos haciendo que las cajas flotantes ocupen un area real de la pantalla */
  text-align: center;
  border-top: 2px solid #999999;
  border-radius: 10px; /* esquinas redondeadas */
  width: 1009px;
  height:80px;
  background: url('../Imagenes/logosabajo.jpg') no-repeat right 50%;
  background-size: cover;  
}</style>
    </head>
<body>
    <form id="form1" runat="server">
    <div id="contenedor_">
        <asp:Panel ID="PanelCont" runat="server">
                <%--la pagina actual--%>
                <h3><fss:mietiqueta ID="menuError" runat="server" Text="Error"></fss:mietiqueta></h3>
                
                <%-- Cabecera de la pagina --%>
                <header id="cabecera_">
                <asp:label id="encabezado" runat="server" Text="FSS La tienda on-line para el patinador" CssClass="titulo"></asp:label>
                </header>
                <%-- menú de navegación --%>
                <nav id="menu_">
                    <ul runat="server">
                        <li runat="server"><fss:miLink ID="menuInicio" runat="server" PostBackUrl="Inicio.aspx" CssClass="linkboton" CausesValidation="false" >Inicio</fss:miLink></li>
                        <li runat="server"><fss:miLink ID="menuCatalogo" runat="server" PostBackUrl="Catalogo.aspx?Linea=Botas" CssClass="linkboton" CausesValidation="false">Catalogo</fss:miLink></li>
                        <li runat="server"><fss:miLink ID="menuCIPA" runat="server" PostBackUrl="CalculoCIPA.aspx" CssClass="linkboton" CausesValidation="false" >CIPA</fss:miLink></li>
                        <li runat="server"><fss:miLink ID="menuVideos" runat="server" PostBackUrl="Videos.aspx" CssClass="linkboton" CausesValidation="false" >Videos</fss:miLink></li>
                        <li runat="server"><fss:miLink ID="linkQuienesSomos" runat="server" PostBackUrl="QuienesSomos.aspx" CssClass="linkboton" CausesValidation="false" Width="150px">Quienes Somos</fss:miLink></li>
                        <li runat="server"><fss:miLink ID="LinkValores" runat="server" PostBackUrl="Valores.aspx" CssClass="linkboton" CausesValidation="false" Width="150px">Nuestros Valores</fss:miLink></li>
                    </ul>
                </nav>
            <section id="seccion">
                    <article>
                        <asp:Panel runat="server" CssClass="panelTexto" HorizontalAlign="Center">
                            <fss:mietiqueta ID="titError404" runat="server" Text="" CssClass="titulo" Style="color:red">ERROR 404</fss:mietiqueta> <br />
                            <fss:mietiqueta ID="subtitError404" runat="server" Text="" CssClass="subtitulo">La pagina a la que intenta acceder no existe.</fss:mietiqueta> <br />
                            <fss:mietiqueta ID="subsubtitError" runat="server" Text="" CssClass="subsubtitulo">Si necesita asistencia, por favor contacte al soporte tecnico soporte@fss.com.ar</fss:mietiqueta>
                            <br />
                            <br />
                            <fss:mietiqueta ID="Mietiqueta1" runat="server" Text="" CssClass="titulo" Style="color:red">ERROR 404</fss:mietiqueta> <br />
                            <fss:mietiqueta ID="Mietiqueta2" runat="server" Text="" CssClass="subtitulo">The page you are trying to access does not exist.</fss:mietiqueta> <br />
                            <fss:mietiqueta ID="Mietiqueta3" runat="server" Text="" CssClass="subsubtitulo">If you need assistance, please contact the technical support soporte@fss.com.ar</fss:mietiqueta>
                            <br />
                            <br />
                            <fss:mietiqueta ID="Mietiqueta4" runat="server" Text="" CssClass="titulo" Style="color:red">ERRO 404</fss:mietiqueta> <br />
                            <fss:mietiqueta ID="Mietiqueta5" runat="server" Text="" CssClass="subtitulo">A página que você está tentando acessar não existe.</fss:mietiqueta> <br />
                            <fss:mietiqueta ID="Mietiqueta6" runat="server" Text="" CssClass="subsubtitulo">Se precisar de ajuda, entre em contato soporte@fss.com.ar suporte técnico</fss:mietiqueta>
                            <br />
                            <br />
                        </asp:Panel>
                        <asp:Panel ID="Panel1" runat="server"></asp:Panel><br /><br />
                    </article>
               </section>                
        <footer id="pie_"> </footer>
</asp:Panel>
</div>
</form>
</body>
</html>
