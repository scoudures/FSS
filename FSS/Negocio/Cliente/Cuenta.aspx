<%@ Page Title="FSS" Language="vb" AutoEventWireup="false"  MasterPageFile="~/Maestra.Master" CodeBehind="Cuenta.aspx.vb" Inherits="FSS.Cuenta" EnableEventValidation = "false" %>
<%@ Register assembly="FSS" namespace="FSS" TagPrefix="fss" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Titulo" ContentPlaceHolderID="Titulo" runat="server">
    <fss:mietiqueta ID="menuCuenta" runat="server" Text="Cuenta"></fss:mietiqueta>
</asp:Content>
<asp:Content ID="Contenido" ContentPlaceHolderID="Contenido" runat="server">
    <article>
   <div style="text-align:left"> <asp:Label ID="lblPedidos" runat="server" Text="Pedidos Realizados:" CssClass="titulo"></asp:Label></div>
        <asp:panel id="PanelPedidos" runat="server" Visible="true" CssClass="panelTexto">
            <div style="text-align:left">
                <br />
                <asp:Label ID="lblFiltro" runat="server" Text="Mostrar pedidos por estado: " CssClass="panelTexto"></asp:Label>
                <asp:DropDownList ID="lstEstadoPedido" runat="server" AutoPostBack="true"></asp:DropDownList>
                <br />
            </div>
            <br />
            <br />

            <table runat ="server" height="100%" border="0" style="width: 586px">
                <tr runat ="server" valign="top">
                <td runat ="server" width="550">
                <asp:GridView ID="grdPedidos" CssClass="grilla" runat="server" AllowPaging="true" AutoGenerateColumns="False" CellPadding="5" ForeColor="#333333" GridLines="None" PageSize="8">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="pedido" HeaderText="Numero" />
                        <asp:BoundField DataField="fechaEmision" HeaderText="Fecha Emision" DataFormatString="{0:d}" />
                        <asp:BoundField DataField="EstadoFormulario" HeaderText="Estado" />
                        <asp:TemplateField HeaderText="Detalle">
                               <ItemTemplate><asp:Button runat="server" Text="Ver" CssClass="btn btn-default" CommandName="Detalle" CommandArgument='<%# Eval("Numero")%>' /></ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>        
                </td>
                </tr>
             </table>
        </asp:panel>
        <br />
        <br />
        <asp:Panel ID="PanelDetalle" runat="server" Visible="false" CssClass="panelTexto">
            <table>
                <tr>
                    <td><div style="text-align:left"> <asp:Label ID="lblDetalle" runat="server" Text="Detalle del Pedido:" CssClass="subtitulo"></asp:Label></div></td>
                    <td><div style="text-align:right"><asp:Label ID="lblPedido" runat="server" CssClass="subsubtitulo"></asp:Label></div></td>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="3">
                    <asp:GridView ID="grdDetalle" DataKeyNames="numeroItem" CssClass="grilla" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="numeroItem" HeaderText="Item" />
                                <asp:BoundField DataField="inventario" HeaderText="Codigo" />
                                <asp:BoundField DataField="descripcion" HeaderText="Producto" />
                                <asp:BoundField DataField="cantidad" HeaderText="Cantidad" />
                                <asp:BoundField DataField="precioUnitario" HeaderText="Precio Unitario" />
                                <asp:BoundField DataField="SubTotal" HeaderText="SubTotal" />
                            </Columns>    
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td>
                        <div style="text-align:right"><asp:Label class="subtitulo" id="Subtotal" runat="server" Text="SubTotal: " EnableViewState="false" Enabled="false"></asp:Label></div>
                    </td>
                    <td>
                        <%--<div style="text-align:right"><span class="subtitulo"  >SubTotal: </span></div>--%>
                        <asp:Label class="subtitulo" id="lblTotal" runat="server" EnableViewState="false"></asp:Label></div>
                    </td>
                    <td style="width:10%" ></td>
                </tr>
            </table>
            <br/>
            <br/>
            <br/>
                <asp:Button ID="btnEnvio" CssClass="btn btn-default" runat="server" Text="Agregar Envio" Width="120px" />
                <asp:Button ID="btnPago" CssClass="btn btn-default" runat="server" Text="Pagar" Visible="false"/>
                <asp:Button ID="btnFactura" CssClass="btn btn-default" runat="server" Text="Emitir Factura" Width="120px" Visible="false" />
                <asp:Button ID="btnEliminar" CssClass="btn btn-default" runat="server" Text="Eliminar" Visible="false" />
                <asp:Button ID="imprPantalla" runat="server" Text="Imprimir Pantalla" CssClass="btn btn-default" CausesValidation="false" />
                <asp:Button ID="verFactura" runat="server" Text="ver Factura" CssClass="btn btn-default" CausesValidation="false" Visible="false" />    
                <br /><br />
                <%--ESTO PASA A LA PAGINA ORDENES
                <asp:Button ID="btnRectificar" CssClass="botoncito" runat="server" Text="Rectificar" Visible="false" />
                <asp:Button ID="btnDespachar" CssClass="botoncito" runat="server" Text="Despachado" Visible="false" />
                <asp:Button ID="btnEntregar" CssClass="botoncito" runat="server" Text="Entregado" Visible="false" />
                <br/>
                <br />--%>
    </asp:Panel>
    <br />
    <br />
    <asp:Panel ID="Panel1" runat="server" Width="600px" HorizontalAlign="Center"></asp:Panel><br /><br />
</article>
</asp:Content>
<asp:Content ID="Menu" ContentPlaceHolderID="Menu" runat="server">
</asp:Content>
 