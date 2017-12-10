<%@ Page Title="FSS" Language="vb" AutoEventWireup="false" MasterPageFile="~/Maestra.Master" CodeBehind="ProductoDetalle.aspx.vb" Inherits="FSS.ProductoDetalle" %>
<%@ Register assembly="FSS" namespace="FSS" TagPrefix="fss" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Titulo" ContentPlaceHolderID="Titulo" runat="server">
<asp:label ID="menuDetalleProducto" runat="server" Text="Detalle Producto"></asp:label>
</asp:Content>
<asp:Content ID="Contenido" ContentPlaceHolderID="Contenido" runat="server">
<article>
    <asp:Label ID="lblDetalleProducto" runat="server" Text="Detalle del Producto " CssClass="subtitulo"></asp:Label> <br /><br />
    <asp:Panel ID="PanelProducto" runat="server" Width="600px" HorizontalAlign="Center">
    <asp:DataList id="lstProducto" RepeatColumns="1" runat="server">
        <ItemTemplate>
            <table border="0" style="margin:5px" class="table table-responsive">
                <tr>
                    <td width="25px">&nbsp</td>
                    <td valign="middle" align="right">    
                    <img src='<%# DataBinder.Eval(Container.DataItem, "imagen")%>' border="0" class="mediana" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td valign="middle">
                        <span class="ProductListHead"><%# DataBinder.Eval(Container.DataItem, "descripcion")%></span>           
                        <br/>
                        <span class="ProductListItem"><asp:Label ID="LblPrecio" runat="server" Text="Precio:" Font-Bold="True"></asp:Label><%# DataBinder.Eval(Container.DataItem, "precio.precioUnitario", "{0:c}")%></span>
                        <br/>
                        <%--<asp:HyperLink ID="Agregaralpedido" CssClass="botoncito" runat="server" Text="Seleccionar"  NavigateUrl='<%#"~/Negocio/Pedido.aspx?ProductoID=" & DataBinder.Eval(Container.DataItem, "inventario").ToString%>' ></asp:HyperLink>--%>
                    </td>
                </tr>
            </table>
        </ItemTemplate>
        </asp:DataList>
        </asp:Panel>
        <asp:Panel ID="PanelVenta" runat="server" Width="600px" HorizontalAlign="Center">
        <table border="0" style="margin:5px" class="table table-responsive">
            <tr>
                <td><asp:Label ID="lblTalle" runat="server" Text="Talle: " CssClass="panelTexto"></asp:Label>
                    <asp:DropDownList ID="lstTalle" runat="server"></asp:DropDownList><br /><br />
                </td>
            </tr>
            <tr>
                <td><asp:Label ID="lblCantidad" runat="server" Text="Cantidad: " CssClass="panelTexto"></asp:Label>
                    <asp:TextBox ID="txtCantidad" runat="server" Text="1" MaxLength="1"></asp:TextBox> <br /><br />
                </td>
                <td style="width:170px"><asp:RequiredFieldValidator ForeColor="red" ID="RequiredFieldValidatorCant" ValidationGroup="ValidarTarjeta" ControlToValidate="txtCantidad"  runat="server" ErrorMessage="Ingrese una cantidad"></asp:RequiredFieldValidator><br />
                    <asp:RegularExpressionValidator runat="server" ForeColor="red" ValidationExpression="^\d{1}$"  ControlToValidate="txtCantidad" ErrorMessage ="sólo se aceptan números"></asp:RegularExpressionValidator><br />
                </td>
            </tr>
            <tr>
                <td><asp:button ID="Agregaralpedido" CssClass="btn btn-success" Width="200px" runat="server" Text="Agregar Al Pedido" ></asp:button> <br/></td>
            </tr>
        </table>
        </asp:Panel>
        <table border="0" style="margin:5px" class="table table-responsive">
                <td><br/><br/><asp:Label ID="lblNiveles" runat="server" Text="Se recomienda para los Niveles de Competencia: " CssClass="panelTexto"></asp:Label><br />
                    <asp:GridView ID="grdNiveles" runat="server" CssClass="table table-bordered table-responsive" ShowHeader="false"></asp:GridView>
                    <br /><br />
                </td>
            </tr>
        </table>
        <br /><br />
<asp:Panel ID="Panel1" runat="server" Width="600px" HorizontalAlign="Center"></asp:Panel><br /><br />
</article>
</asp:Content>
<asp:Content ID="Menu" ContentPlaceHolderID="Menu" runat="server">
</asp:Content>