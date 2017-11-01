<%@ Page Title="FSS" Language="vb" AutoEventWireup="false" MasterPageFile="~/Maestra.Master" CodeBehind="VendedorModificar.aspx.vb" Inherits="FSS.VendedorModificar" %>
<%@ Register assembly="FSS" namespace="FSS" TagPrefix="fss" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Titulo" ContentPlaceHolderID="Titulo" runat="server">
<asp:label ID="menuVendedorModificar" runat="server" Text="Vendedor Modificación"></asp:label>
</asp:Content>
<asp:Content ID="Contenido" ContentPlaceHolderID="Contenido" runat="server">
<article>
    <div style="text-align:center">
    <asp:label ID="lblVendedorModificar" runat="server" Text="Modificación" CssClass="supertitulo"></asp:label>
    </div>

<asp:Panel ID="DetalleRegistro" runat="server" CssClass="panelTexto" HorizontalAlign="Left" >
    <div style="margin-left:10px">
        <table >
            <tr >
                <td>
                    <br/>
                    <asp:Label ID="LblUsuarioRegistro" runat="server" Text="Usuario" CssClass="subtitulo"></asp:Label><br />
                    <asp:TextBox size="25" id="txtLogin" runat="server" Enabled="false" /><br /><br />

                    <asp:label ID="lblDNI" runat="server" Text="DNI" CssClass="subtitulo"></asp:label><br />
                    <asp:TextBox ID="txtDNI" runat="server" Height="20px"></asp:TextBox>&nbsp;
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" Text="*" ErrorMessage="Ingrese el DNI" ForeColor="Red" ControlToValidate="txtDNI"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" text="DNI invalido" ForeColor="Red" ControlToValidate="txtDNI" ValidationExpression="^\d{8}$"></asp:RegularExpressionValidator><br /><br />

                    <asp:label ID="lblNombre" runat="server" Text="Nombre" CssClass="subtitulo"></asp:label><br />
                    <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>&nbsp;
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" Text="*" ErrorMessage="Ingrese el Nombre" ForeColor="Red" ControlToValidate="txtNombre"></asp:RequiredFieldValidator><br /><br />

                    <asp:label ID="lblApellido" runat="server" Text="Apellido" CssClass="subtitulo"></asp:label><br />
                    <asp:TextBox ID="txtApellido" runat="server"></asp:TextBox>&nbsp;
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" Text="*" ErrorMessage="Ingrese el Apellido" ForeColor="Red" ControlToValidate="txtApellido"></asp:RequiredFieldValidator><br /><br />
                                        
                    <asp:Label ID="LblEmailRegistrar" runat="server" Text="Correo electronico" CssClass="subtitulo"></asp:Label><br />
                    <asp:TextBox size="25" id="txtEmail" runat="server" />&nbsp;
                    <asp:RegularExpressionValidator ControlToValidate="txtEmail" ValidationExpression="[\w\.-]+(\+[\w-]*)?@([\w-]+\.)+[\w-]+" ForeColor="Red" Display="Dynamic" Font-Name="verdana" Font-Size="9pt" ErrorMessage="email invalido" runat="server" id="RegularExpressionValidator1"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ControlToValidate="txtEmail" Display="dynamic" Font-Name="verdana" Font-Size="9pt" ForeColor="Red" ErrorMessage="'Campo Email' no puede estar vacio" runat="server" id="RequiredFieldValidator2"></asp:RequiredFieldValidator><br /><br />
                    <br />
                    <br />
                    <asp:Button ID="btnGuardar" CssClass="btn btn-default" runat="server" Text="Guardar" CausesValidation="true" />
                    <asp:Button ID="btnCancelar" CssClass="btn btn-default" runat="server" Text="Cancelar" style="margin-left:20px" CausesValidation="false" />
                    <br/><br/>
                    <asp:Panel ID="Panel1" runat="server" Width="600px" HorizontalAlign="Center">
                    <asp:Label ID="lblMsg" CssClass="panelTexto" runat="server" Text=""> </asp:Label><br /><br />
                    </asp:Panel>
                    
                    <asp:Button ID="btnPass" CssClass="btn btn-default" runat="server" Text="Cambiar Contraseña" style="margin-left:250px" Width="150px" CausesValidation="false"/><br /><br />
                    
                    <br /><br />
                </td>
            </tr>
        </table>
    </div></asp:Panel>
    
    <asp:Panel ID="PanelPass" runat="server" CssClass="panelTexto" GroupingText="Cambiar Contraseña" Visible="false" >
        <table>
            <tr>
                <td>
                    <br /><br />
                    <asp:Label ID="LblClaveRegistro" runat="server" Text="Contraseña" CssClass="subtitulo"></asp:Label><br />
                    <asp:TextBox size="25" id="txtPass" TextMode="Password" runat="server" />&nbsp;
                    <asp:RequiredFieldValidator ControlToValidate="txtPass" Display="dynamic" ForeColor="Red" Font-Name="verdana" Font-Size="9pt" ErrorMessage="no puede estar vacio." runat="server" id="RequiredFieldValidator3"></asp:RequiredFieldValidator><br /><br />
                    <asp:Label ID="LblConfirmarClave" runat="server" Text="Confirmar contraseña" CssClass="subtitulo"></asp:Label><br />
                    <asp:TextBox size="25" id="ConfirmPassword" TextMode="Password" runat="server" />&nbsp;
                    <asp:RequiredFieldValidator ControlToValidate="ConfirmPassword" Display="dynamic" ForeColor="Red" Font-Name="verdana" Font-Size="9pt" ErrorMessage=" no puede estar vacio " runat="server" id="RequiredFieldValidator4"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ControlToValidate="ConfirmPassword" ControlToCompare="txtPass" ForeColor="Red" Display="Dynamic" Font-Name="verdana" Font-Size="9pt" ErrorMessage="No coincide la confirmacion" Style="color:red" runat="server" id="CompareValidator1"></asp:CompareValidator><br /><br />
                    <br />
                    <br />
                    <asp:Button ID="btnGuardarPass" CssClass="botoncito" runat="server" Text="Guardar" CausesValidation="true" />
                    <asp:Button ID="btnCancelPass" CssClass="botoncito" runat="server" Text="Cancelar" CausesValidation="false" />
                    <br /><br />
                </td>
            </tr>
        </table>
    </asp:Panel>
    <br /><br />
</article>
</asp:Content>
<asp:Content ID="Menu" ContentPlaceHolderID="Menu" runat="server">
</asp:Content>
