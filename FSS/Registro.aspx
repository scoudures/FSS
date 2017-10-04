<%@ Page Title="FSS" Language="vb" AutoEventWireup="false" MasterPageFile="~/Maestra.Master" CodeBehind="Registro.aspx.vb" Inherits="FSS.Registro" %>
<%@ Register assembly="FSS" namespace="FSS" TagPrefix="fss" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Titulo" ContentPlaceHolderID="Titulo" runat="server">
    <fss:mietiqueta2 ID="menuRegistro" runat="server" Text="Registrarse"></fss:mietiqueta2>
</asp:Content>
<asp:Content ID="Contenido" ContentPlaceHolderID="Contenido" runat="server">
    <article>
     <div style="text-align:left"  >
         <br />
        <h1 style="background-color:gray; color:white; font-weight:bold" class="text-uppercase"><fss:mietiqueta2 ID="LblRegistro" runat="server" Text="Registro " style="padding-left:25px;font-size:large " CssClass="titulo"></fss:mietiqueta2></h1>
    </div> 
    <asp:Panel runat="server" CssClass="panelTexto" HorizontalAlign="Left">
    <div style="margin-left:100px">
    <table height="100%" cellspacing="0" cellpadding="0" width="500" border="0">
                                        <tr valign="top">
                                            <td width="550">
                                                <br/>
                                                <br/>
                                                <fss:mietiqueta2 ID="LblUsuario" runat="server" Text="Usuario" CssClass="subtitulo"></fss:mietiqueta2>
                                                <br/>
                                                <asp:TextBox size="25" id="Name" runat="server" />
                                                &nbsp;
                                                <asp:RequiredFieldValidator ControlToValidate="Name" Display="dynamic" Font-Name="verdana" Font-Size="9pt" ForeColor="Red" ErrorMessage="'Campo Usuario' no puede estar en vacio" runat="server" id="RequiredFieldValidator1"></asp:RequiredFieldValidator>
                                                <br/>
                                                <br/>
                                                
                                                <fss:mietiqueta2 ID="LblEmail" runat="server" Text="Correo electronico" CssClass="subtitulo"></fss:mietiqueta2>
                                                <br/>
                                                <asp:TextBox size="25" id="Email" runat="server" />
                                                &nbsp;
                                                <asp:RegularExpressionValidator ControlToValidate="Email" ValidationExpression="[\w\.-]+(\+[\w-]*)?@([\w-]+\.)+[\w-]+" Display="Dynamic" Font-Name="verdana" Font-Size="9pt" ForeColor="Red" ErrorMessage="email invalido" runat="server" id="RegularExpressionValidator1"></asp:RegularExpressionValidator>
                                                <asp:RequiredFieldValidator ControlToValidate="Email" Display="dynamic" Font-Name="verdana" Font-Size="9pt" ForeColor="Red" ErrorMessage="'Campo Email' no puede estar vacio" runat="server" id="RequiredFieldValidator2"></asp:RequiredFieldValidator>
                                                <br/>
                                                <br/>
                                                
                                                <fss:mietiqueta2 ID="lblPassword" runat="server" Text="Contraseña" CssClass="subtitulo"></fss:mietiqueta2>
                                                <br/>
                                                <asp:TextBox size="25" id="Password" TextMode="Password" runat="server" />
                                                &nbsp;
                                                <asp:RequiredFieldValidator ControlToValidate="Password" Display="dynamic" Font-Name="verdana" Font-Size="9pt" ForeColor="Red" ErrorMessage="no puede estar vacio." runat="server" id="RequiredFieldValidator3"></asp:RequiredFieldValidator>
                                                <br/>
                                                <br/>
                                                
                                                <fss:mietiqueta2 ID="LblConfirmar" runat="server" Text="Confirmar contraseña" CssClass="subtitulo"></fss:mietiqueta2>
                                                <br/>
                                                <asp:TextBox size="25" id="ConfirmPassword" TextMode="Password" runat="server" />
                                                &nbsp;
                                                <asp:RequiredFieldValidator ControlToValidate="ConfirmPassword" Display="dynamic" Font-Name="verdana" Font-Size="9pt" ForeColor="Red" ErrorMessage=" no puede estar vacio " runat="server" id="RequiredFieldValidator4"></asp:RequiredFieldValidator>
                                                <asp:CompareValidator ControlToValidate="ConfirmPassword" ControlToCompare="Password" Display="Dynamic" Font-Name="verdana" Font-Size="9pt" ErrorMessage="No coincide la confirmacion" Style="color:red" runat="server" id="CompareValidator1"></asp:CompareValidator>
                                                <br/>
                                                <br/>
                                                <fss:mietiqueta2 ID="lblPregunta" runat="server" Text="Pregunta secreta para recuperar contraseña" CssClass="subtitulo"></fss:mietiqueta2><br />
                                                <asp:ListBox ID="LstPregunta" runat="server" Width="296px">
                                                    <asp:ListItem Value="0" Text="">Lugar de nacimiento de la madre</asp:ListItem>
                                                    <asp:ListItem Value="1">Mejor amigo de la infancia</asp:ListItem>
                                                    <asp:ListItem Value="2">Nombre de la primer mascota</asp:ListItem>
                                                    <asp:ListItem Value="3">Profesor favorito</asp:ListItem>
                                                    <asp:ListItem Value="4">Ocupacion del abuelo</asp:ListItem>
                                                </asp:ListBox>
                                                <asp:RequiredFieldValidator ControlToValidate="LstPregunta" Display="dynamic" Font-Name="verdana" Font-Size="9pt" ForeColor="Red" ErrorMessage=" seleccione una pregunta " runat="server" id="RequiredFieldValidator6"></asp:RequiredFieldValidator>

                                                <br />
                                                <br />
                                                 <fss:mietiqueta2 ID="LblRespuesta" runat="server" Text="Respuesta secreta" CssClass="subtitulo"></fss:mietiqueta2><br />
                                                <asp:TextBox ID="TxtRespuesta" runat="server" Width="225px"></asp:TextBox>
                                                <asp:RequiredFieldValidator ControlToValidate="TxtRespuesta" Display="dynamic" Font-Name="verdana" Font-Size="9pt" ForeColor="Red" ErrorMessage=" no puede estar vacio " runat="server" id="RequiredFieldValidator5"></asp:RequiredFieldValidator>
                                                <br />
                                                <br />

                                                <fss:miBoton2 ID="btnAceptar" runat="server" CausesValidation="true" CssClass="botoncito" style="margin-left:50px" Text="Registrar" />
                                                &nbsp;&nbsp;&nbsp;

                                                <fss:miboton2 ID="btnCancelar" CssClass="botoncito" runat="server" Text="Volver" CausesValidation="false"></fss:miboton2>
                                                <br/>
                                                <br/>

                                            </td>
                                        </tr>
                                    </table>
    </div>
        </asp:Panel>
<asp:Panel ID="Panel1" runat="server" Width="600px" HorizontalAlign="Center"></asp:Panel><br /><br />
</article>
</asp:Content>
<asp:Content ID="Menu" ContentPlaceHolderID="Menu" runat="server">
</asp:Content>