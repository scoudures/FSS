<%@ Page Title="FSS" Language="vb" AutoEventWireup="false" MasterPageFile="~/Maestra.Master" CodeBehind="Usuario.aspx.vb" Inherits="FSS.Usuario" %>

<%@ Register assembly="FSS" namespace="FSS" TagPrefix="fss" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 25px;
        }
    </style>
</asp:Content>
<asp:Content ID="Titulo" ContentPlaceHolderID="Titulo" runat="server">
<fss:mietiqueta ID="menuUsuario" runat="server" Text="Usuario"></fss:mietiqueta>
</asp:Content>
<asp:Content ID="Contenido" ContentPlaceHolderID="Contenido" runat="server">
<article>
    <asp:Panel runat="server" CssClass="panelTexto">
    <div style="text-align:left"><asp:Label ID="LblTitulo" runat="server" Text="Gestión  de Usuarios" CssClass="titulo"></asp:Label>
        <br /> <br /> <asp:Label ID="Label1" runat="server" Text="Seleccione un Usuario de la lista" CssClass="subsubtitulo"></asp:Label>
        <br />
    </div>        
    <table style="vertical-align:top" class="table table-responsive">
            <tr>
                <td><fss:mietiqueta ID="lblUsuarios" runat="server" Text="Usuarios:"></fss:mietiqueta></td>
                <td> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</td>
                <td><fss:mietiqueta ID="lblDatos" runat="server" Text="Datos del Usuario:"></fss:mietiqueta></td>
                <td> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</td>
                <td><fss:mietiqueta ID="lblPerfilDisp" runat="server" Text="Perfiles Disponibles:"></fss:mietiqueta></td>
                <td> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</td>
                <td><fss:mietiqueta ID="lblPerfilAsig" runat="server" Text="Perfiles Asignados:" ></fss:mietiqueta></td>
            </tr>
            <tr>
                <td><asp:ListBox ID="lstUsuario" runat="server" AutoPostBack="True" EnableViewState="True" Height="150px" Width="150px"></asp:ListBox></td>
                <td> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</td>
                <td><asp:DetailsView ID="grdUsuarios" runat="server" Height="150px" Width="150px" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                    <EditRowStyle BackColor="#2461BF" />
                    <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    </asp:DetailsView></td>
                <td> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</td>
                <td><asp:ListBox ID="lstPerfilDisp" runat="server" AutoPostBack="False" EnableViewState="True" Height="120px" Width="120px"></asp:ListBox></td>
                <td>  
                    <fss:miboton ID="btnDisp" runat="server" Text="<" CausesValidation="false" CssClass="btn btn-default"/>
                    <br />
                    <fss:miboton ID="btnAsig" runat="server" Text=">" CausesValidation="false" CssClass="btn btn-default"/>
                </td>
                <td><asp:ListBox ID="lstPerfilAsig" runat="server" AutoPostBack="False" EnableViewState="True" Height="120px" Width="120px"></asp:ListBox></td>
            </tr>
            <tr>
                <td><asp:Button ID="btnCrear" runat="server" Text="Crear Usuario" CssClass="btn btn-default" Width="100px"/></td>
                <td colspan="7" style="text-align:right"><fss:miLink ID="lnkPerfil" runat="server" PostBackUrl="Perfil.aspx" CssClass="linkboton" CausesValidation="false">Ver Permisos</fss:miLink></td>
            </tr>
        </table>
    </asp:Panel>
    <asp:Panel ID="PanelDetalle" runat="server" CssClass="panelTexto" Visible="false">
    <div style="text-align:left"><asp:Label ID="lblDetalle" runat="server" Text="Datos del Usuario seleccionado:" CssClass="subtitulo"></asp:Label></div>
    
    <table class="table table-responsive">
        <tr>
            <td><asp:label ID="lblEmail" runat="server" Text="Email:"></asp:label></td>
            <td><asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" Text="*" ErrorMessage="Ingrese el email" ForeColor="Red" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ControlToValidate="txtEmail" ValidationExpression="[\w\.-]+(\+[\w-]*)?@([\w-]+\.)+[\w-]+" Display="Dynamic" ErrorMessage="email invalido" runat="server" id="RegularExpressionValidator2" ForeColor="Red"></asp:RegularExpressionValidator>
            </td>
            <td><asp:label ID="lblIdiomaUsu" runat="server" Text="Idioma:"></asp:label></td>
        </tr>
        <tr>
            <td><fss:mietiqueta ID="lblDNI" runat="server" Text="DNI"></fss:mietiqueta></td>
            <td><asp:TextBox ID="txtDNI" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Text="*" ErrorMessage="Ingrese el DNI" ForeColor="Red" ControlToValidate="txtDNI"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" text="DNI invalido" ForeColor="Red" ControlToValidate="txtDNI" ValidationExpression="^\d{8}$"></asp:RegularExpressionValidator>
            </td>
            <td rowspan="3"><asp:ListBox ID="lstIdiomaUsuario" runat="server" AutoPostBack="false" CausesValidation="false"></asp:ListBox></td>
        </tr>
        <tr>
            <td><fss:mietiqueta ID="lblNombre" runat="server" Text="Nombre"></fss:mietiqueta></td>
            <td><asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Text="*" ErrorMessage="Ingrese el Nombre" ForeColor="Red" ControlToValidate="txtNombre"></asp:RequiredFieldValidator>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td><fss:mietiqueta ID="lblApellido" runat="server" Text="Apellido"></fss:mietiqueta></td>
            <td><asp:TextBox ID="txtApellido" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Text="*" ErrorMessage="Ingrese el Apellido" ForeColor="Red" ControlToValidate="txtApellido"></asp:RequiredFieldValidator>
            </td>
            <td></td>
        </tr>
        <tr>
            <td class="auto-style1"><fss:mietiqueta ID="LblLogin2" runat="server" Text="Login"></fss:mietiqueta></td>
            <td class="auto-style1"><asp:TextBox ID="txtLogin" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Text="*" ErrorMessage="Ingrese el Login" ForeColor="Red" ControlToValidate="txtLogin"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style1"></td>
        </tr>
        <tr>
            <td><fss:mietiqueta ID="lblPassword" runat="server" Text="Password"></fss:mietiqueta></td>
            <td><asp:TextBox ID="txtPass" runat="server" TextMode="Password"></asp:TextBox></td>
            <td></td>
        </tr>
        <tr><td></td><td colspan="2"><asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" /></td></tr>
        <tr><td colspan="3">
            <fss:miboton ID="btnNuevo" runat="server" Text="Nuevo" CssClass="btn btn-default" />
            <fss:miboton ID="btnEliminar" runat="server" Text="Eliminar" CssClass="btn btn-default" OnClientClick="return confirm('Está seguro que quiere eliminar el usuario?')" CausesValidation="false"/>
            <fss:miboton ID="btnModificar" runat="server" Text="Modificar" CssClass="btn btn-default"/>
            <asp:Button ID="btnLimpiar" runat="server" Text="Limpiar" CssClass="btn btn-default" CausesValidation="false" />
            </td></tr>
        <tr><td colspan="3"><asp:Label ID="lblResult" runat="server" Text=""></asp:Label></td></tr>
    </table>
</asp:Panel>
        <asp:Panel ID="Panel1" runat="server" Width="600px" HorizontalAlign="Center"></asp:Panel><br /><br />
</article>
</asp:Content>
<asp:Content ID="Menu" ContentPlaceHolderID="Menu" runat="server">
</asp:Content>
