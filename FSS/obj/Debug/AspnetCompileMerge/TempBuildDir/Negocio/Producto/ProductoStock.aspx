<%@ Page Title="FSS" Language="vb" AutoEventWireup="false" MasterPageFile="~/Maestra.Master" CodeBehind="ProductoStock.aspx.vb" Inherits="FSS.ProductoStock" %>
<%@ Register assembly="FSS" namespace="FSS" TagPrefix="fss" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Titulo" ContentPlaceHolderID="Titulo" runat="server">
<asp:label ID="menuProductoStock" runat="server" Text="Producto Stock"></asp:label>
</asp:Content>
<asp:Content ID="Contenido" ContentPlaceHolderID="Contenido" runat="server">
<article>
    <div style="text-align:left"> <asp:Label ID="lblStock" runat="server" Text="Actualizar Stock" CssClass="titulo"></asp:Label></div>
    <asp:Panel ID="PanelDatos" runat="server">
        <br />
                    <asp:DataGrid id="grdDetalle" runat="server" AutoGenerateColumns="False" DataKeyField="Inventario" ShowFooter="True" Font-Size="8pt" Font-Name="Verdana" cellpadding="4" GridLines="None" Font-Names="Verdana" ForeColor="#333333" Width="548px" CellSpacing="5" CssClass="table table-responsive table-bordered">
                    <AlternatingItemStyle CssClass="CartListItemAlt" BackColor="White" />
                    <Columns>
                    <asp:TemplateColumn HeaderText="Inventario">
                        <ItemTemplate><asp:Label ID="Inventario" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Inventario")%>' width="40px"></asp:Label></ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn HeaderText="Talle">
                        <ItemTemplate><asp:Label ID="Talle" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Talle")%>' width="40px"></asp:Label></ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:TemplateColumn HeaderText="Stock">
                        <ItemTemplate><asp:TextBox ID="Stock" runat="server" Columns="4" MaxLength="4" Text='<%# DataBinder.Eval(Container.DataItem, "Stock")%>' width="40px" /></ItemTemplate>
                    </asp:TemplateColumn>
                    </Columns>
                    <EditItemStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" CssClass="CartListFooter" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" CssClass="CartListHead" Font-Bold="True" ForeColor="White" />
                    <ItemStyle BackColor="#EFF3FB" CssClass="CartListItem" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    </asp:DataGrid>
                    <br/>
                    <br />
    </asp:Panel>
    <br />
    <br />
    <div style="align-items:center"> 
        <br />
        </div>
        <asp:Panel ID="Panel1" runat="server" Width="600px" HorizontalAlign="Center">
        <asp:Label ID="lblMsg" runat="server" Text="" CssClass="panelTexto" ForeColor="Red"></asp:Label>
        </asp:Panel><br /><br />
            <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" CssClass="btn btn-success" />
            &nbsp;&nbsp;
            <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-danger" />
        <br />
        
</article>

</asp:Content>
<asp:Content ID="Menu" ContentPlaceHolderID="Menu" runat="server">
</asp:Content>