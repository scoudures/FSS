<%@ Page Title="FSS" Language="vb" AutoEventWireup="false" MasterPageFile="~/Maestra.Master" CodeBehind="ProductoAlta.aspx.vb" Inherits="FSS.ProductoAlta" %>
<%@ Register assembly="FSS" namespace="FSS" TagPrefix="fss" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Titulo" ContentPlaceHolderID="Titulo" runat="server">
<asp:label ID="menuProductoAlta" runat="server" Text="Producto Nuevo"></asp:label>
</asp:Content>
<asp:Content ID="Contenido" ContentPlaceHolderID="Contenido" runat="server">
<article>
    <div style="text-align:left"> <asp:Label ID="lblProdNuevo" runat="server" Text="Producto Nuevo" CssClass="titulo"></asp:Label></div>
    <asp:Panel ID="PanelDatos" runat="server" CssClass="panelTexto">
        <table>
            <tr>
                <td><asp:Label ID="lblLinea" runat="server" Text="Línea: "></asp:Label></td>
                <td><asp:DropDownList ID="listaLinea" runat="server" AutoPostBack="false"></asp:DropDownList></td>
            </tr>
            <tr>
                <td><asp:Label ID="lblMarca" runat="server" Text="Marca: "></asp:Label></td>
                <td><asp:DropDownList ID="listaMarca" runat="server" AutoPostBack="false"></asp:DropDownList></td>
            </tr>
            <tr>
                <td><asp:Label ID="lblColor" runat="server" Text="Color: "></asp:Label></td>
                <td><asp:DropDownList ID="listaColor" runat="server" AutoPostBack="false"></asp:DropDownList></td>
            </tr>
            <tr>
                <td><asp:Label ID="lblNivel" runat="server" Text="Nivel: "></asp:Label></td>
                <td><asp:DropDownList ID="listaNivel" runat="server" AutoPostBack="false"></asp:DropDownList></td>
            </tr>
            <tr>
                <td><asp:Label ID="lblImagen" runat="server" Text="Imagen"></asp:Label></td>
                <td><asp:DropDownList ID="listaImagen" runat="server" AutoPostBack="false"></asp:DropDownList></td>
            </tr>
            <tr>
                <td><asp:Label ID="lblCantMax" runat="server" Text="Cant Máx: "></asp:Label></td>
                <td><asp:TextBox ID="txtCantMax" runat="server"></asp:TextBox></td>
                
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
    </asp:Panel>
    
    <div style="align-items:center"> 
        <br />
            <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" CssClass="btn btn-success" />
            &nbsp;&nbsp;
            <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-danger" />
        <br />
        </div>
    
    <br />
    <asp:Panel ID="Panel1" runat="server" Width="600px" HorizontalAlign="Center">
    <asp:Label ID="lblMsg" runat="server" Text="" CssClass="panelTexto" ForeColor="Red"></asp:Label>
        <br />
        <br />
        <asp:Label ID="lblImg" runat="server" Text="Para subir archivos de Imágenes se debe acceder al   " CssClass="panelTexto"></asp:Label>
        <asp:LinkButton ID="LinkImagen" runat="server" PostBackUrl="~/Negocio/GestorImagenes.aspx" CssClass="linkboton" CausesValidation="false" Width="200px">Gesto de Imágenes</asp:LinkButton>
    
</asp:Panel><br /><br />
</article>
</asp:Content>
<asp:Content ID="Menu" ContentPlaceHolderID="Menu" runat="server">
</asp:Content>