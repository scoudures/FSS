<%@ Page Title="FSS" Language="vb" AutoEventWireup="false" MasterPageFile="~/Maestra.Master" CodeBehind="Producto.aspx.vb" Inherits="FSS.Producto" %>
<%@ Register assembly="FSS" namespace="FSS" TagPrefix="fss" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Titulo" ContentPlaceHolderID="Titulo" runat="server">
    <fss:mietiqueta ID="menuProducto" runat="server" Text="Producto"></fss:mietiqueta>
</asp:Content>
<asp:Content ID="Contenido" ContentPlaceHolderID="Contenido" runat="server">
    <article>
    <div style="text-align:left"> <asp:Label ID="lblProd" runat="server" Text="Productos" CssClass="titulo"></asp:Label></div>
    <asp:GridView ID="grdProducto" runat="server" CssClass="grilla" Font-Size="Small"  SelectedRowStyle-BackColor="Violet" autogenerateselectbutton="True"
       selectedindex="0"
       onselectedindexchanged="grdCliente_SelectedIndexChanged"
       onselectedindexchanging="grdCliente_SelectedIndexChanged" AutoPostBack ="false" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>

        <br /> <br />
        
        <asp:Panel ID="Panel1" runat="server" Width="600px" HorizontalAlign="Center">
        <asp:Label ID="lblMsg" runat="server" Text="" ForeColor="Red" CssClass="panelTexto"></asp:Label>
        </asp:Panel>
        <br />
            <br />
            <asp:Button ID="btnAlta" runat="server" Text="Nuevo" CssClass="boton" />
            &nbsp;&nbsp;
            <asp:Button ID="btnBaja" runat="server" Text="Eliminar" CssClass="boton" OnClientClick="return confirm('Está seguro que quiere eliminar el producto?')" CausesValidation="false" Visible="false" />
            &nbsp;&nbsp;
            <asp:Button ID="btnModificacion" runat="server" Text="Modificar" CssClass="boton" Visible="false" />
            &nbsp;&nbsp;
            <asp:Button ID="btnStock" runat="server" Text="Stock" CssClass="boton" Visible="false" />
            <br />
            <br />
        
        <asp:Label ID="lblImagen" runat="server" Text="Para subir archivos de Imágenes se debe acceder al   " CssClass="panelTexto"></asp:Label>
        <asp:LinkButton ID="LinkImagen" runat="server" PostBackUrl="~/Negocio/GestorImagenes.aspx" CssClass="linkboton" CausesValidation="false" Width="200px">Gestor de Imágenes</asp:LinkButton>
        <br />
    <br /><br />
</article>
</asp:Content>
<asp:Content ID="Menu" ContentPlaceHolderID="Menu" runat="server">
</asp:Content>