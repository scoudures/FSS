<%@ Page Title="FSS" Language="vb" AutoEventWireup="false" MasterPageFile="~/Maestra.Master" CodeBehind="ProductoModificacion.aspx.vb" Inherits="FSS.ProductoModificacion" %>
<%@ Register assembly="FSS" namespace="FSS" TagPrefix="fss" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Titulo" ContentPlaceHolderID="Titulo" runat="server">
<asp:label ID="menuProductoModificacion" runat="server" Text="Producto Modificación"></asp:label>
</asp:Content>
<asp:Content ID="Contenido" ContentPlaceHolderID="Contenido" runat="server">
<article>
    <div style="text-align:left">
    <asp:label ID="lblProdModificar" runat="server" Text="Modificar Producto" CssClass="supertitulo"></asp:label>
    </div>
    <asp:Panel ID="PanelDatos" runat="server" CssClass="panelTexto">
        <div style="align-items:center"> 
        <table>
            <tr>
                <td><asp:Label ID="lblInventario" runat="server" Text="Inventario: "></asp:Label></td>
                <td><asp:TextBox ID="txtInventario" runat="server" Enabled="false"></asp:TextBox></td>
            </tr>
            
            <tr>
                <td><asp:Label ID="lblLinea" runat="server" Text="Linea: "></asp:Label></td>
                <td><asp:DropDownList ID="listaLinea" runat="server" AutoPostBack="false" ></asp:DropDownList></td>
            </tr>
            <tr>
                <td><asp:Label ID="lblMarca" runat="server" Text="Marca: "></asp:Label></td>
                <td><asp:DropDownList ID="listaMarca" runat="server" AutoPostBack="false" ></asp:DropDownList></td>
            </tr>
            <tr>
                <td><asp:Label ID="lblColor" runat="server" Text="Color: "></asp:Label></td>
                <td><asp:DropDownList ID="listaColor" runat="server" AutoPostBack="false" ></asp:DropDownList></td>
            </tr>
            <tr>
                <td><asp:Label ID="lblImagen" runat="server" Text="Imagen: "></asp:Label></td>
                <td><asp:DropDownList ID="listaImagen" runat="server" AutoPostBack="false" ></asp:DropDownList></td>
            </tr>
            <tr>
                <td><asp:Label ID="lblCosto" runat="server" Text="Costo: "></asp:Label></td>
                <td><asp:TextBox ID="txtCosto" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label ID="lblPrecio" runat="server" Text="Precio: "></asp:Label></td>
                <td><asp:TextBox ID="txtPrecio" runat="server"></asp:TextBox></td>
            </tr>
        </table>
            </div>
    </asp:Panel>
    <div style="align-items:center"> 
        <table>

        </table>
        <br />
            <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" CssClass="boton" />
            &nbsp;&nbsp;
            <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="boton" />
        <br />
        </div>
    <br />
<asp:Panel ID="Panel1" runat="server" Width="600px" HorizontalAlign="Center">
    <asp:Label ID="lblMsg" runat="server" Text="" CssClass="panelTexto" ForeColor="Red"></asp:Label>

</asp:Panel><br /><br />
    <asp:Label ID="Label1" runat="server" Text="Para subir archivos de Imágenes se debe acceder al   " CssClass="panelTexto"></asp:Label>
    <asp:LinkButton ID="LinkImagen" runat="server" PostBackUrl="~/Negocio/GestorImagenes.aspx" CssClass="linkboton" CausesValidation="false" Width="200px">Gestor de Imágenes</asp:LinkButton>
</article>
</asp:Content>
<asp:Content ID="Menu" ContentPlaceHolderID="Menu" runat="server">
</asp:Content>