<%@ Page Title="FSS" Language="vb" AutoEventWireup="false" MasterPageFile="~/Maestra.Master" CodeBehind="Envio.aspx.vb" Inherits="FSS.Envio" %>
<%@ Register assembly="FSS" namespace="FSS" TagPrefix="fss" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    </asp:Content>
<asp:Content ID="Titulo" ContentPlaceHolderID="Titulo" runat="server">
<fss:mietiqueta ID="menuEnvio" runat="server" Text="Envio"></fss:mietiqueta>
</asp:Content>
<asp:Content ID="Contenido" ContentPlaceHolderID="Contenido" runat="server">
<article>
    <div style="text-align:left"><asp:Label ID="LblDatosEnvio" runat="server" cssClass="titulo" Text="Ingrese los datos de Envío:"></asp:Label></div>
    <asp:Panel runat="server" CssClass="panelTexto" HorizontalAlign="Left">
    <table width="650" border="0">
        <tr><td><div style="text-align:left"> <asp:Label ID="lblControleDatos" runat="server" Text="Por Favor, controle los datos de su pedido antes de confirmar el envío." CssClass="subsubtitulo"></asp:Label></div></td></tr>
        <tr><td><asp:Panel ID="PanelDetalle" runat="server" Visible="false" CssClass="panelTexto">
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
                    <td>
                        <div style="text-align:right">
                        <span class="subtitulo"  >SubTotal: </span>
                        <asp:Label class="subtitulo" id="lblTotal" runat="server" EnableViewState="false"></asp:Label></div>
                    </td>
                    <td style="width:10%" ></td>
                </tr>
            </table>    
            <br/>
            <br/>
            </asp:Panel></td></tr>
        <tr><td><asp:Panel ID="PanelDireccion" runat="server" GroupingText= "Envío" CssClass="panelTexto" >
                <table style="margin-left:15px">
                <tr><td colspan="2"><asp:Label ID="LblFormaEnvio" runat="server" Text="Seleccione una Forma de Envío: " Font-Bold="true" CssClass="subsubtitulo"></asp:Label> &nbsp;&nbsp;&nbsp;
                                    <asp:DropDownList ID="lstFormaEnvio" runat="server" style="width:200px"></asp:DropDownList>
                </td></tr>
                <tr><td>&nbsp;&nbsp;</td></tr>
                <tr><td><asp:Label ID="LblDomicilioTipo" runat="server" Text="Domicilio Tipo: " CssClass="subsubtitulo"></asp:Label></td>
                    <td><asp:DropDownList ID="lstTipoDomicilio" runat="server" style="width:200px"></asp:DropDownList></td>
                </tr>
                <tr><td>&nbsp;&nbsp;</td></tr>
                <tr><td><asp:Label ID="LblCalle" runat="server" Text="Calle: " CssClass="subsubtitulo"></asp:Label></td>
                    <td><asp:TextBox ID="txtCalle" runat="server" style="width:400px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Debe ingresar la calle" ControlToValidate="txtCalle" CssClass="subsubtitulo" ForeColor="Red" ></asp:RequiredFieldValidator></td>
                </tr>
                <tr><td><asp:Label ID="LblNumero" runat="server" Text="Numero: " CssClass="subsubtitulo"></asp:Label></td>
                    <td><asp:TextBox ID="txtNumero" runat="server" style="width:100px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Debe ingresar el numero" ControlToValidate="txtNumero" CssClass="subsubtitulo" ForeColor="Red" ></asp:RequiredFieldValidator></td>
                    <td>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" Text="Debe ingresar numeros" runat="server" ErrorMessage="Debe ingresar numeros" ValidationExpression="^\d+" ControlToValidate="txtNumero" CssClass="subsubtitulo" ForeColor="Red"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td><asp:Label ID="lblPiso" runat="server" Text="Piso: " CssClass="subsubtitulo"></asp:Label></td>
                    <td><asp:TextBox ID="txtPiso" runat="server" style="width:100px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td><asp:Label ID="lblDepto" runat="server" Text="Departamento: " CssClass="subsubtitulo"></asp:Label></td>
                    <td><asp:TextBox ID="txtDepto" runat="server" style="width:100px"></asp:TextBox></td>
                </tr>
                <tr><td>&nbsp;&nbsp;</td></tr>
                <tr><td><asp:Label ID="lblLocalidad" runat="server" Text="Localidad: " CssClass="subsubtitulo"></asp:Label></td>
                    <td><asp:DropDownList ID="lstLocalidad" runat="server" style="width:400px"></asp:DropDownList></td>
                 </tr>
                <tr><td>&nbsp;&nbsp;</td></tr>
                <tr><td><asp:Label ID="lblProvincia" runat="server" Text="Provincia: " CssClass="subsubtitulo"></asp:Label></td>
                    <td><asp:DropDownList ID="lstProvincia" runat="server" style="width:400px"></asp:DropDownList></td>
                </tr>
                <tr><td>&nbsp;&nbsp;</td></tr>
                <tr><td><asp:Label ID="lblCP" runat="server" Text="Codigo Postal: " CssClass="subsubtitulo"></asp:Label></td>
                    <td><asp:DropDownList ID="lstCodigoPostal" runat="server"></asp:DropDownList></td>
                </tr>
                <tr><td>&nbsp;&nbsp;</td></tr>
        </table>
        </asp:Panel></td></tr>
        <tr><td>
            <asp:Button ID="btnConfirmar" CssClass="btn btn-success" runat="server" Text="Confirmar" CausesValidation="true" style="margin-left:50px" Width="98px" />&nbsp;
            <asp:Button ID="btnCancelar" CssClass="btn btn-danger" runat="server"  Text="Cancelar" CausesValidation="false" style="margin-left:50px; height: 31px;"  Width="98px"/><br />
            <br />
            <br />
        </td></tr>
    </table>              
        </asp:Panel>                  
    <asp:Panel ID="Panel1" runat="server" Width="600px" HorizontalAlign="Center"></asp:Panel><br /><br />
</article>
</asp:Content>
<asp:Content ID="Menu" ContentPlaceHolderID="Menu" runat="server">
</asp:Content>
