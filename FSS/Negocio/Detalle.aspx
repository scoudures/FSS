<%@ Page Title="FSS" Language="vb" AutoEventWireup="false" MasterPageFile="~/Maestra.Master" CodeBehind="Detalle.aspx.vb" Inherits="FSS.Detalle" %>
<%@ Register assembly="FSS" namespace="FSS" TagPrefix="fss" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Titulo" ContentPlaceHolderID="Titulo" runat="server">
<fss:mietiqueta ID="menuDetalle" runat="server" Text="Detalle Pedido"></fss:mietiqueta>
</asp:Content>
<asp:Content ID="Contenido" ContentPlaceHolderID="Contenido" runat="server">
<article>
    <div style="text-align:left">
    <asp:Label ID="lblDetalle" runat="server" Text="Detalle Pedido:" CssClass="titulo"></asp:Label></div>
    <asp:Panel ID="PanelDetalle" runat="server" CssClass="panelTexto">
        <table runat ="server" height="100%" cellSpacing="0" cellPadding="0" border="0" style="width: 586px">
            <tr runat ="server" valign="top">
                <td runat ="server" width="550">
                    <asp:DataGrid id="grdDetalle" runat="server" AutoGenerateColumns="False" DataKeyField="Cantidad" AlternatingItemStyle-CssClass="CartListItemAlt" ItemStyle-CssClass="CartListItem" FooterStyle-CssClass="CartListFooter" HeaderStyle-CssClass="CartListHead" ShowFooter="True" Font-Size="8pt" Font-Name="Verdana" cellpadding="4" GridLines="None" Font-Names="Verdana" ForeColor="#333333" Width="548px" CellSpacing="5">
                    <AlternatingItemStyle CssClass="CartListItemAlt" BackColor="White" />
                    <Columns>
                    <asp:TemplateColumn HeaderText="Inventario">
                        <ItemTemplate><asp:Label ID="Inventario" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Inventario")%>' width="40px"></asp:Label></ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:BoundColumn DataField="Producto" HeaderText="Producto" />
                    <asp:TemplateColumn HeaderText="Cantidad">
                        <ItemTemplate><asp:TextBox ID="Cantidad" runat="server" Columns="4" MaxLength="2" Text='<%# DataBinder.Eval(Container.DataItem, "Cantidad") %>' width="40px" /></ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:BoundColumn DataField="PrecioUnitario" DataFormatString="{0:c}" HeaderText="Precio" />
                    <asp:BoundColumn DataField="SubTotal" DataFormatString="{0:c}" HeaderText="SubTotal" />
                    <asp:TemplateColumn HeaderText="Remover">
                        <ItemTemplate><center><asp:CheckBox ID="Remove" runat="server" /></center></ItemTemplate>
                    </asp:TemplateColumn>
                    </Columns>
                    <EditItemStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" CssClass="CartListFooter" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" CssClass="CartListHead" Font-Bold="True" ForeColor="White" />
                    <ItemStyle BackColor="#EFF3FB" CssClass="CartListItem" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    </asp:DataGrid>
                    <div style="text-align:right">
                    <span class="subtitulo"  >SubTotal: </span>
                    <asp:Label class="subtitulo" id="lblTotal" runat="server" EnableViewState="false"></asp:Label></div>
                    <br/>
                    <br/>
                    <asp:Button ID="btnActualizar" CssClass="btn btn-default" runat="server" Text="Actualizar" />
                    <asp:Button ID="btnConfirmar" CssClass="btn btn-default" runat="server" Text="Confirmar" />
                    <asp:Button ID="btnCatalogo" CssClass="btn btn-default" runat="server" Text="Seguir Comprando" Width="150px" />
                    <br/>
                    <br />
                 </td>
            </tr>
        </table>
    </asp:Panel>
    <br />
    <br />
    <asp:Panel ID="Panel1" runat="server" Width="600px" HorizontalAlign="Center"></asp:Panel><br /><br />
</article>
</asp:Content>
<asp:Content ID="Menu" ContentPlaceHolderID="Menu" runat="server">
</asp:Content>
