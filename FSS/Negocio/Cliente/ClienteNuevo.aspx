<%@ Page Title="FSS" Language="vb" AutoEventWireup="false" MasterPageFile="~/Maestra.Master" CodeBehind="ClienteNuevo.aspx.vb" Inherits="FSS.ClienteNuevo" %>
<%@ Register assembly="FSS" namespace="FSS" TagPrefix="fss" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Titulo" ContentPlaceHolderID="Titulo" runat="server">
<asp:label ID="menuClienteNuevo" runat="server" Text="Cliente Nuevo"></asp:label>
</asp:Content>
<asp:Content ID="Contenido" ContentPlaceHolderID="Contenido" runat="server">
<article>
      <div style="text-align:center">
    <asp:label ID="lblClienteNuevo" runat="server" Text="Nuevo" CssClass="supertitulo"></asp:label>
    </div>
    <asp:Panel ID="Datos" runat="server">
    <asp:Panel ID="DetalleRegistro" runat="server" CssClass="panelTexto" HorizontalAlign="Left" GroupingText="Datos Personales" >
    <table >
            <tr >
                
                <td >
                    <br/>
                    <asp:Label ID="LblUsuarioRegistro" runat="server" Text="Usuario" CssClass="subtitulo"></asp:Label><br />
                    <asp:TextBox size="25" id="txtLogin" runat="server" /><br /><br />

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
                </td>
            </tr>
        </table>
    </asp:Panel>
    <br /><br />

    <asp:Panel ID="PanelPass" runat="server" CssClass="panelTexto" GroupingText="Contraseña">
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
                </td>
            </tr>
        </table>
    </asp:Panel>
    <br /><br />

    <asp:Panel ID="PanelPregunta" runat="server" CssClass="panelTexto" GroupingText="Pregunta Secreta">
        <table>
            <tr>
                <td>
                    <br /><br />
                    <asp:Label ID="lblPregunta" runat="server" Text="Pregunta secreta para recuperar contraseña" CssClass="subtitulo"></asp:Label><br />
                    <asp:ListBox ID="LstPregunta" runat="server" Width="296px">
                        <asp:ListItem Value="0">Lugar de nacimiento de la madre</asp:ListItem>
                        <asp:ListItem Value="1">Mejor amigo de la infancia</asp:ListItem>
                        <asp:ListItem Value="2">Nombre de la primer mascota</asp:ListItem>
                        <asp:ListItem Value="3">Profesor favorito</asp:ListItem>
                        <asp:ListItem Value="4">Ocupacion del abuelo</asp:ListItem>
                    </asp:ListBox>&nbsp;
                    <asp:RequiredFieldValidator ControlToValidate="LstPregunta" Display="dynamic" ForeColor="Red" Font-Name="verdana" Font-Size="9pt" ErrorMessage=" seleccione una pregunta " runat="server" id="RequiredFieldValidator6"></asp:RequiredFieldValidator><br /><br />
                    <asp:Label ID="LblRespuesta" runat="server" Text="Respuesta secreta" CssClass="subtitulo"></asp:Label><br />
                    <asp:TextBox ID="TxtRespuesta" runat="server" Width="225px"></asp:TextBox>&nbsp;
                    <asp:RequiredFieldValidator ControlToValidate="TxtRespuesta" Display="dynamic" ForeColor="Red" Font-Name="verdana" Font-Size="9pt" ErrorMessage=" no puede estar vacio " runat="server" id="RequiredFieldValidator5"></asp:RequiredFieldValidator><br />
                    <br />
                    <br />
                </td>
            </tr>
        </table>
    </asp:Panel>
  </asp:Panel>
    <br /><br />
    <asp:Panel ID="Panel1" runat="server" Width="600px" HorizontalAlign="Center"></asp:Panel><br /><br />
        <asp:Button ID="btnGuardar" CssClass="boton" runat="server" Text="Guardar" CausesValidation="true" />
        <asp:Button ID="btnCancel" CssClass="boton" runat="server" Text="Cancelar" CausesValidation="false" />
        <br /><br />

</article>
</asp:Content>
<asp:Content ID="Menu" ContentPlaceHolderID="Menu" runat="server">
</asp:Content>
