<%@ Page Title="FSS" Language="vb" AutoEventWireup="false" CodeBehind="Backup.aspx.vb" MasterPageFile="~/Maestra.Master" Inherits="FSS.Backup" %>
<%@ Register assembly="FSS" namespace="FSS" TagPrefix="fss" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Titulo" ContentPlaceHolderID="Titulo" runat="server">
    <fss:mietiqueta ID="menuBackup" runat="server" Text="Backup"></fss:mietiqueta>
</asp:Content>
<asp:Content ID="Contenido" ContentPlaceHolderID="Contenido" runat="server">
    <%--<img src="../Imagenes/Backup.jpg" class="diminuta" />--%>
    <img src="../Imagenes/Backup.jpg" class="diminuta" /><br />  <br />

    <fss:miBoton ID="btnBackup" runat="server" Text="Backup" CssClass="boton"/>
    <fss:miBoton ID="btnRestore" runat="server" Text="Restore" CssClass="boton"/>
    <asp:Panel ID="Panel1" runat="server" Width="600px" HorizontalAlign="Center"></asp:Panel><br /><br />
    <asp:TextBox ID="txtArchivo" Width="300px" runat="server"></asp:TextBox><br /><br />

    <asp:ListBox ID="lstBKP" Width="300px" runat="server" OnSelectedIndexChanged="lstBKP_SelectedIndexChanged" AutoPostBack="true"></asp:ListBox> <br /><br />
    
    <fss:mietiqueta ID="lblMensajeRestore" Width="300px" runat="server" visible="false" BackColor="White" Font-Bold="True"></fss:mietiqueta><br /><br />
</asp:Content>
<asp:Content ID="Menu" ContentPlaceHolderID="Menu" runat="server">
</asp:Content>
