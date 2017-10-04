<%@ Page Title="FSS" Language="vb" AutoEventWireup="false" CodeBehind="Login.aspx.vb" MasterPageFile="~/Maestra.Master" Inherits="FSS.Login" %>
<%@ Register assembly="FSS" namespace="FSS" TagPrefix="fss" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Titulo" ContentPlaceHolderID="Titulo" runat="server">
    <fss:mietiqueta ID="menuLogin" runat="server" Text="Login"></fss:mietiqueta>
</asp:Content>
<asp:Content ID="Contenido" ContentPlaceHolderID="Contenido" runat="server">
    <article style="text-align:center">
        <asp:Panel runat="server" CssClass="panelTexto" HorizontalAlign="Center">
        <fss:mietiqueta ID="lblLogin" runat="server" Text="Usuario" CssClass="subtitulo"></fss:mietiqueta>&nbsp;&nbsp;
        <asp:TextBox ID="txtLogin" runat="server" Text="Administrador"></asp:TextBox> 
        <br /> <br />  
        <fss:mietiqueta ID="lblPassword" runat="server" Text="Contraseña" CssClass="subtitulo"></fss:mietiqueta>&nbsp;&nbsp;
        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Text="123"></asp:TextBox> 
        <br /> <br />
        <fss:miboton ID="btnAceptar" runat="server" Text="Aceptar" CssClass="boton"/>&nbsp;&nbsp;
        <fss:miboton ID="btnCancelar" runat="server" Text="Cancelar" CssClass="boton"/>
        <br />
        <br />
        <asp:LinkButton ID="lnkRecuperar" runat="server" PostBackUrl="~/RecuperarCuenta.aspx">Olvidé mi contraseña</asp:LinkButton>
        <br />
        <br />
        </asp:Panel>
        <asp:Panel ID="Panel1" runat="server" Width="600px" HorizontalAlign="Center"></asp:Panel>
     </article>
</asp:Content>
<asp:Content ID="Menu" ContentPlaceHolderID="Menu" runat="server">
</asp:Content>
