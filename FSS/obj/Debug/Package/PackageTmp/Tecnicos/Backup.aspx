<%@ Page Title="FSS" Language="vb" AutoEventWireup="false" CodeBehind="Backup.aspx.vb" MasterPageFile="~/Maestra.Master" Inherits="FSS.Backup" %>
<%@ Register assembly="FSS" namespace="FSS" TagPrefix="fss" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Titulo" ContentPlaceHolderID="Titulo" runat="server">
    <fss:mietiqueta ID="menuBackup" runat="server" Text="Backup"></fss:mietiqueta>
</asp:Content>
<asp:Content ID="Contenido" ContentPlaceHolderID="Contenido" runat="server">
    <asp:Panel ID="Panel1" runat="server" HorizontalAlign="Center">
    <%--<img src="../Imagenes/Backup.jpg" class="diminuta" />--%>
    <img src="../Imagenes/Backup.jpg" class="img-responsive center-block" /><br />  <br />

    <fss:miBoton ID="btnBackup" runat="server" Text="Backup" CssClass="boton"/>
    <fss:miBoton ID="btnRestore" runat="server" Text="Restore" CssClass="boton"/>
    <br /><br />
    <asp:TextBox ID="txtArchivo" runat="server" Width="400px" CssClass="center-block"></asp:TextBox><br /><br />

    <asp:ListBox ID="lstBKP" runat="server" OnSelectedIndexChanged="lstBKP_SelectedIndexChanged" AutoPostBack="true"></asp:ListBox> <br /><br />
    </asp:Panel><br /><br />
    <fss:mietiqueta ID="lblMensajeRestore" runat="server" visible="false" BackColor="White" Font-Bold="True"></fss:mietiqueta><br /><br />
</asp:Content>
<asp:Content ID="Menu" ContentPlaceHolderID="Menu" runat="server">
</asp:Content>
