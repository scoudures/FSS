<%@ Page Title="FSS" Language="vb" AutoEventWireup="false" MasterPageFile="~/Maestra.Master" CodeBehind="Pago.aspx.vb" Inherits="FSS.Pago" %>
<%@ Register assembly="FSS" namespace="FSS" TagPrefix="fss" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Titulo" ContentPlaceHolderID="Titulo" runat="server">
<fss:mietiqueta ID="menuPago" runat="server" Text="Pago"></fss:mietiqueta>
</asp:Content>
<asp:Content ID="Contenido" ContentPlaceHolderID="Contenido" runat="server">
<article style="width:650px">
    <div style="text-align:left"><asp:Label ID="LblDatosPAgo" runat="server" cssClass="titulo" Text="Ingrese los datos del Pago:"></asp:Label></div>
    <asp:Panel runat="server" CssClass="panelTexto" HorizontalAlign="Left">
    <table style="height:100%;width:200px;border:0" >
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
        <tr><td><asp:Panel ID="PanelPago" runat="server" CssClass="panelTexto">
                <asp:Label ID="LblMedioPago" runat="server" Text="Ingrese los datos de su tarjeta de crédito:" CssClass="subtitulo"></asp:Label>
                <br />
                </asp:Panel></td></tr>
        <tr><td><asp:Panel ID="PanelTarjeta" runat="server" CssClass="panelTexto" GroupingText="Detalles del Pago">
                <img src="../Imagenes/credit-card-logos.png" class="muypequeña" />
                <img src="../Imagenes/codigo_tarjeta.png" class="muypequeña"/>
                <br />
                <table style="margin-left:50px">
                <tr><td><br /><asp:Label ID="LblNumeroTarjeta" runat="server" Text="Numero:"></asp:Label>&nbsp;&nbsp;
                        <asp:TextBox ID="TxtNroTarjeta" runat="server" Width="300px" text="4444555566667777"></asp:TextBox>&nbsp;&nbsp;</td>
                    <td rowspan="2" colspan="2">
                        <asp:RadioButtonList ID="rbTarjeta" runat="server" >
                            <asp:ListItem Text="  VISA" Value="VISA" />
                            <asp:ListItem Text="  Master Card" Value="Master Card" />
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr><td><asp:Label ID="LblCodigoTarjeta" runat="server" Text="Codigo:"></asp:Label>&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="TxtCodigoTarjeta" runat="server" Width="100px" Text="123" ></asp:TextBox><br /><br />
                </td></tr>
                <tr><td><br /><asp:Label ID="LblVence" runat="server" Text="Vencimiento:"></asp:Label>&nbsp;&nbsp;
                        <asp:DropDownList ID="lstMes" runat="server" Width="50px" AutoPostBack="false">
                            <asp:ListItem Value=""> </asp:ListItem>
                            <asp:ListItem Value="01">01</asp:ListItem>
                            <asp:ListItem Value="02">02</asp:ListItem>
                            <asp:ListItem Value="03">03</asp:ListItem>
                            <asp:ListItem Value="04">04</asp:ListItem>
                            <asp:ListItem Value="05">05</asp:ListItem>
                            <asp:ListItem Value="06">06</asp:ListItem>
                            <asp:ListItem Value="07">07</asp:ListItem>
                            <asp:ListItem Value="08">08</asp:ListItem>
                            <asp:ListItem Value="09">09</asp:ListItem>
                            <asp:ListItem Value="10">10</asp:ListItem>
                            <asp:ListItem Value="11">11</asp:ListItem>
                            <asp:ListItem Value="12">12</asp:ListItem>
                         </asp:DropDownList> &nbsp;&nbsp;&nbsp;
                         <asp:DropDownList ID="lstAnio" runat="server" Width="80px" AutoPostBack="false">
                            <asp:ListItem> </asp:ListItem>
                            <asp:ListItem>2017</asp:ListItem>
                            <asp:ListItem>2018</asp:ListItem>
                            <asp:ListItem>2019</asp:ListItem>
                            <asp:ListItem>2020</asp:ListItem>
                            <asp:ListItem>2021</asp:ListItem>
                            <asp:ListItem>2022</asp:ListItem>
                            <asp:ListItem>2023</asp:ListItem>
                            <asp:ListItem>2024</asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                          </asp:DropDownList><br /><br />
                </td><td></td></tr>
                <tr><td><br /><asp:Label ID="lblCuotas" runat="server" Text="Cantidad de Cuotas:"></asp:Label>&nbsp;&nbsp;
                              <asp:DropDownList ID="lstCuotas" runat="server" Width="50px" AutoPostBack="true">
                                <asp:ListItem Value=""></asp:ListItem>
                                <asp:ListItem Value="01">01</asp:ListItem>
                                <asp:ListItem Value="03">03</asp:ListItem>
                                <asp:ListItem Value="06">06</asp:ListItem>
                                <asp:ListItem Value="12">12</asp:ListItem>
                              </asp:DropDownList><br /><br />
                </td>
                <td></td>
                </tr>
                    <tr>
                        <td> 
                            <div style="text-align:right">
                            <asp:Label class="subsubtitulo" id="lblRec" runat="server" Text="Recargo: " ></asp:Label>
                            </div>
                        </td>
                    <td>
                        <div style="text-align:right">
                        <asp:Label class="subsubtitulo" id="lblRecargo" runat="server"></asp:Label></div>
                    </td>
                    <td style="width:50px"></td>
                </tr>
                    <tr>
                        <td>
                            <div style="text-align:right">
                            <asp:Label class="subsubtitulo" id="lblIv" runat="server" Text="IVA: " ></asp:Label>
                            </div>
                        </td>
                    <td>
                        <div style="text-align:right">
                        <asp:Label class="subsubtitulo" id="lblIva" runat="server"></asp:Label></div>
                    </td>
                    <td style="width:50px"></td>
                </tr>
                <tr>
                    <td> 
                            <div style="text-align:right">
                                <asp:Label class="subtitulo" id="eltotal" runat="server" Text="Total: " ></asp:Label>
                            </div>
                    </td>
                    <td>
                        <div style="text-align:right">
                        <asp:Label class="subtitulo" id="lblTotalPago" runat="server"></asp:Label></div>
                    </td>
                    <td style="width:50px"></td>
                </tr>
                                        <tr>
                        <td> 
                            <div style="text-align:right">
                            <asp:Label class="subsubtitulo" id="lblCantCuotas" runat="server" ></asp:Label>
                            </div>
                        </td>
                    <td>
                        <div style="text-align:right">
                        <asp:Label class="subsubtitulo" id="lblValorCuota" runat="server"></asp:Label></div>
                    </td>
                    <td style="width:50px"></td>
                </tr>
                <tr><td><asp:RequiredFieldValidator ForeColor="red" ID="RequiredFieldValidator2" ValidationGroup="ValidarTarjeta" ControlToValidate="TxtCodigoTarjeta"  runat="server" ErrorMessage="Ingrese el codigo de seguridad"></asp:RequiredFieldValidator><br />
                        <asp:RequiredFieldValidator ForeColor="red" ID="RequiredFieldValidator1" ValidationGroup="ValidarTarjeta" ControlToValidate="TxtNroTarjeta" runat="server" ErrorMessage="Ingrese un numero de tarjeta"></asp:RequiredFieldValidator><br />
                        <asp:RegularExpressionValidator runat="server" ForeColor="red" ValidationExpression="^\d{16}$" ControlToValidate="TxtNroTarjeta" ErrorMessage="Numero de tarjeta invalido"></asp:RegularExpressionValidator><br />
                        <asp:RegularExpressionValidator runat="server" ForeColor="red" ValidationExpression="^\d{3}$"  ControlToValidate="TxtCodigoTarjeta" ErrorMessage ="codigo de seguridad invalido"></asp:RegularExpressionValidator><br />
                </td></tr>
                </table>
                </asp:Panel></td></tr>
        <tr><td>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                <ProgressTemplate>
                    <asp:Label ID="lblValidar" runat="server" Text="Procesando su solicitud, por favor aguarde..." CssClass="subtitulo"></asp:Label>
                    <br /><br />
                    <img src="../Imagenes/avance.gif" alt="Validando tarjeta de Crédito..." class="muypequeña" />
                </ProgressTemplate>
            </asp:UpdateProgress>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:Label ID="lblMsg" runat="server" Text="" ForeColor="Red" CssClass="subtitulo"></asp:Label>
                    <br /> <br />
                    <asp:Button ID="btnConfirmar" CssClass="btn btn-default" runat="server" Text="Confirmar" CausesValidation="true" style="margin-left:50px" Width="90px" />&nbsp;
                    <asp:Button ID="btnCancelar" CssClass="btn btn-default" runat="server"  Text="Cancelar" CausesValidation="false" style="margin-left:50px" Width="90px"/><br />
                    <br />
                </ContentTemplate>
            </asp:UpdatePanel>                
            </td>
        </tr>
        <tr><td>
            <%--<asp:Button ID="btnConfirmar" CssClass="boton" runat="server" Text="Confirmar" CausesValidation="true" style="margin-left:50px" Width="90px" />&nbsp;
            <asp:Button ID="btnCancelar" CssClass="boton" runat="server"  Text="Cancelar" CausesValidation="false" style="margin-left:50px" Width="90px"/><br />
            <br />
            <br />--%>
        </td></tr>
        
    </table>              
        </asp:Panel>       

<asp:Panel ID="Panel1" runat="server" Width="600px" HorizontalAlign="Center"></asp:Panel><br /><br />
</article>
</asp:Content>
<asp:Content ID="Menu" ContentPlaceHolderID="Menu" runat="server">
</asp:Content>
