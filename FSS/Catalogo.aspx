<%@ Page Title="FSS"  Language="vb" AutoEventWireup="false" MasterPageFile="~/Maestra.Master" CodeBehind="Catalogo.aspx.vb" Inherits="FSS.Catalogo" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register assembly="FSS" namespace="FSS" TagPrefix="fss" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Titulo" ContentPlaceHolderID="Titulo" runat="server">
<fss:mietiqueta ID="menuCatalogo" runat="server" Text="Catalogo"></fss:mietiqueta>
</asp:Content>
<asp:Content ID="Contenido" ContentPlaceHolderID="Contenido" runat="server">
    <h1 style="background-color:gray; color:white; font-weight:bold" class="text-uppercase"><fss:mietiqueta ID="lblCatalogo" runat="server" Text="CATALOGO"></fss:mietiqueta></h1><br />
 <article>
     <asp:Panel runat="server" CssClass="panelTexto" HorizontalAlign="Center">
     <asp:Repeater ID="RepeaterLinea" runat="server">
         <HeaderTemplate><table>
             <tr>
        </HeaderTemplate>
             <ItemTemplate>
                 <%--&nbsp;&nbsp;<asp:HyperLink ID="LinkLinea" CssClass="botoncito" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "descripcion")%>' NavigateUrl='<%#"Catalogo.aspx?Linea=" & DataBinder.Eval(Container.DataItem, "descripcion")%>' ></asp:HyperLink>&nbsp;&nbsp;--%>
                 &nbsp;&nbsp;<fss:miLink2 ID="LinkLinea" Target='<%#DataBinder.Eval(Container.DataItem, "descripcion")%>' CssClass="botoncito" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "descripcion")%>' NavigateUrl='<%#"Catalogo.aspx?Linea=" & DataBinder.Eval(Container.DataItem, "descripcion")%>' Font-Size="Large" ></fss:miLink2>&nbsp;&nbsp;

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
            <table border="0" width="300px" style="margin:5px">
                <tr>
                    <td width="25px">&nbsp</td>
                    <td width="100px" valign="middle" align="right">    
                    <img src='<%# DataBinder.Eval(Container.DataItem, "imagen")%>' width="100" height="75" border="0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td width="200px" valign="middle">
                        <span class="ProductListHead"><%# DataBinder.Eval(Container.DataItem, "descripcion")%></span>           
                        <br/>
                        <span class="ProductListItem"><asp:Label ID="LblPrecio" runat="server" Text="Precio:" Font-Bold="True"></asp:Label><%# DataBinder.Eval(Container.DataItem, "precio.precioUnitario", "{0:c}")%></span>
                        <br/>
                       <%-- DA ERROR <a ID="lnkAgregar" href='~/Negocio/Pedido.aspx?ProductoID=<%# DataBinder.Eval(Container.DataItem, "inventario").ToString%>'>
                        <asp:Label CssClass="ProductListItem" ID="LblAgregaralpedido" runat="server" ForeColor="#00005D" Text="Agregar al pedido" Font-Bold="True"></asp:Label>
                        </a>--%>
                        <asp:HyperLink ID="Agregaralpedido" CssClass="botoncito" runat="server" Text="Seleccionar"  NavigateUrl='<%#"~/Negocio/ProductoDetalle.aspx?ProductoID=" & DataBinder.Eval(Container.DataItem, "inventario").ToString%>' ></asp:HyperLink>
                    </td>
                </tr>
                <tr ></tr>
            </table>
      </ItemTemplate>
   </asp:DataList>
         
     </asp:Panel>
     <asp:Panel ID="Panel1" runat="server" Width="600px" HorizontalAlign="Center"></asp:Panel><br /><br />
 </article>
</asp:Content>
<asp:Content ID="Menu" ContentPlaceHolderID="Menu" runat="server"></asp:Content>