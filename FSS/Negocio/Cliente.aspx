<%@ Page Title="FSS" Language="vb" AutoEventWireup="false" MasterPageFile="~/Maestra.Master" CodeBehind="Cliente.aspx.vb" Inherits="FSS.Cliente" %>
<%@ Register assembly="FSS" namespace="FSS" TagPrefix="fss" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Titulo" ContentPlaceHolderID="Titulo" runat="server">
<fss:mietiqueta ID="menuCliente" runat="server" Text="Cliente"></fss:mietiqueta>
</asp:Content>
<asp:Content ID="Contenido" ContentPlaceHolderID="Contenido" runat="server">
<article>
     <div style="text-align:center">
    <asp:label ID="lblCliente" runat="server" Text="Clientes" CssClass="supertitulo"></asp:label>
         <br />
    </div>
    <div style="text-align:center" >
        <br /><br />
        <asp:GridView ID="grdCliente" runat="server" CssClass="grilla" Font-Size="Medium"  SelectedRowStyle-BackColor="Violet" autogenerateselectbutton="True"
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
        <br /><br />
        <asp:Label ID="lblMsg" CssClass="panelTexto" runat="server" Text=""> </asp:Label><br /><br />
    <asp:Button ID="btnNuevo" CssClass="btn btn-default" runat="server" Text="Nuevo"  />
    <asp:button runat="server" ID="btnModificar" Text="Modificar" CssClass="btn btn-default" Visible="false"></asp:button>
    <asp:button runat="server" ID="btnEliminar" Text="Eliminar" CssClass="btn btn-default" ClientClick="return confirm('Realmente desea eliminar el Cliente?')" Visible="false"></asp:button>
    </div>
    <asp:Panel ID="Panel1" runat="server" Width="600px" HorizontalAlign="Center"></asp:Panel><br /><br />
</article>
</asp:Content>
<asp:Content ID="Menu" ContentPlaceHolderID="Menu" runat="server">
</asp:Content>
