<%@ Page Title="FSS" Language="vb" AutoEventWireup="false" MasterPageFile="~/Maestra.Master" CodeBehind="Recomendacion.aspx.vb" Inherits="FSS.Recomendacion" %>
<%@ Register assembly="FSS" namespace="FSS" TagPrefix="fss" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Titulo" ContentPlaceHolderID="Titulo" runat="server">
    <fss:mietiqueta2 ID="menuRecomendacion" runat="server" Text="Recomendaciones"></fss:mietiqueta2>
</asp:Content>
<asp:Content ID="Contenido" ContentPlaceHolderID="Contenido" runat="server">
<article>
    <table>
        <tr>
            <td rowspan="3" style="width:50%" >
                <img src="Imagenes/boxes.jpg" class="mediana" />
            </td>
            <td>
                <fss:mietiqueta2 ID="lblIntro" runat="server" Text="Nuestros integrantes cuentan con una larga trayectoria personal dentro del mundo del patinaje artístico sobre ruedas. Ellos son muy conocidos en el ambiente y respetados por sus 30 años juzgando y enseñando el deporte.
                    Hemos comprobado que muchos patinadores argentinos confían plenamente en las recomendaciones que les damos a la hora de comprar insumos." CssClass="panelTexto"></fss:mietiqueta2>
                <br />
            </td>
        </tr>
        <tr>
            <td>
                <fss:mietiqueta2 ID="lblDetalle" runat="server" Text="No somos simples vendedores de productos, sino que analizamos cada caso en particular y proporcionamos recomendaciones estrictamente técnicas que benefician el rendimiento de nuestros clientes.
                    Nos diferenciamos del resto porque estudiamos cada caso puntual como si se tratara de un atleta de elite (que muchas veces lo son). Porque tenemos la convicción de que un deportista con la herramienta adecuada puede llegar a ser un atleta." CssClass="panelTexto"></fss:mietiqueta2>
                <br />
            </td>            
        </tr>
        <tr>
            <td>
                <fss:mietiqueta2 ID="lblVendedores" runat="server" Text="Nuestros Vendedores y Técnicos están calificados para dar recomendaciones de calidad, ofrecer una comunicación fluida con los Clientes y armar patines a medida." CssClass="panelTexto"></fss:mietiqueta2>
                <br />
            </td>            
        </tr>
        <tr>
            <td colspan="2">
                <br />
                <fss:mietiqueta2 ID="lblVenta" runat="server" Text="Las páginas de venta en línea de productos para patinaje artístico ofrecen únicamente opciones preestablecidas o búsquedas lineales.
                    Nosotros ofrecemos un servicio de recomendaciones, donde nuestros clientes se sientan libres de hacer todas las consultas necesarias." CssClass="subsubtitulo"></fss:mietiqueta2>
                <br /><br />    
            </td>            
        </tr>
    </table>
    <asp:Panel ID="panelDatos" runat="server" HorizontalAlign="Left" CssClass="panelTexto">
    <fss:mietiqueta2 ID="LblNombre" runat="server" Text="Nombre (Obligatorio)" Font-Bold="True"></fss:mietiqueta2>&nbsp;
        <asp:TextBox ID="TxtNombre" runat="server" Width="246px"></asp:TextBox>&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtNombre" ErrorMessage="Ingrese un nombre" ForeColor="red">  </asp:RequiredFieldValidator>
        <br />
        <br />
        <fss:mietiqueta2 ID="LblEmail" runat="server" Font-Bold="True" Text="E-mail (Obligatorio)"></fss:mietiqueta2>&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="Txtemail" runat="server" Width="246px"></asp:TextBox>&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Txtemail" ErrorMessage="Ingrese un email" ForeColor="red">  </asp:RequiredFieldValidator>&nbsp;
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtemail" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"  ForeColor="red" ErrorMessage="E-mail invalido"></asp:RegularExpressionValidator>
        <br />
        <br />
    </asp:Panel>
    <asp:Panel ID="panelNiveles" runat="server" HorizontalAlign="Left" CssClass="panelTexto">
    <fss:mietiqueta2 ID="lblNivel" runat="server" Text="Por favor, seleccione su nivel de competencia para recibir nuestra recomendación: " CssClass="panelTexto"></fss:mietiqueta2><br /><br />
    <asp:DropDownList ID="lstNivel" runat="server" AutoPostBack="false"></asp:DropDownList><br /><br />
    <fss:miboton2 ID="btnEnviar" runat="server" Text="Enviar" CssClass="boton"></fss:miboton2> <br />
    </asp:Panel>
    <asp:Panel ID="PanelMensaje" runat="server" Width="600px" HorizontalAlign="Center">
        <fss:mietiqueta2 ID="lblMsg" runat="server" Text="" CssClass="subtitulo"></fss:mietiqueta2>
    </asp:Panel><br /><br />
    <asp:Panel ID="panelRecomendacion" Visible="false" runat="server" CssClass="panelTexto" HorizontalAlign="Center">
     <asp:Repeater ID="RepeaterLinea" runat="server">
         <HeaderTemplate><table>
             <tr>
        </HeaderTemplate>
             <ItemTemplate>
                 &nbsp;&nbsp;<asp:HyperLink ID="LinkLinea" CssClass="btn btn-default" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "descripcion")%>' NavigateUrl='<%#"Catalogo.aspx?Linea=" & DataBinder.Eval(Container.DataItem, "descripcion")%>' ></asp:HyperLink>&nbsp;&nbsp;
                 <%--<asp:Button ID="btnCateg" runat="server" CssClass="botoncito" Text='<%#DataBinder.Eval(Container.DataItem, "descripcion")%>'  OnClick=""/>--%>
                <%--<td  width="100px"> <asp:Button ID="btnCateg" runat="server" CssClass="botoncito" Text='<%#DataBinder.Eval(Container.DataItem, "descripcion")%>' /> </td>--%>
            </ItemTemplate>
        <FooterTemplate>
               </tr>
           </table>
        </FooterTemplate>
     </asp:Repeater>
  <br />
  <asp:DataList id="lstProducto" RepeatColumns="2" runat="server">
    <ItemTemplate>
            <table border="0" width="100%" style="margin:5px" class="table table-responsive">
                <tr>
                    <td width="5%">&nbsp</td>
                    <td width="30%" valign="middle" align="right">    
                    <img src='<%# DataBinder.Eval(Container.DataItem, "imagen")%>' width="100" height="75" border="0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td width="65%" valign="middle">
                        <span class="ProductListHead"><%# DataBinder.Eval(Container.DataItem, "descripcion")%></span>           
                        <br/>
                    </td>
                </tr>
                <tr ></tr>
            </table>
      </ItemTemplate>
   </asp:DataList>
         
     </asp:Panel>
</article>
</asp:Content>
<asp:Content ID="Menu" ContentPlaceHolderID="Menu" runat="server">
</asp:Content>
