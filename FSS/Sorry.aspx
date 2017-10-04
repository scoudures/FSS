<%@ Page Title="FSS" Language="vb" AutoEventWireup="false" CodeBehind="Sorry.aspx.vb" Inherits="FSS.Sorry" %>
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
                <section id="seccion">
                       <article>
                            <asp:Panel runat="server" CssClass="panelTexto" HorizontalAlign="Center">
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
