<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Maestra.Master" CodeBehind="Restore.aspx.vb" Inherits="FSS.Restore" %>
<%@ Register assembly="FSS" namespace="FSS" TagPrefix="fss" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Titulo" ContentPlaceHolderID="Titulo" runat="server">
    <fss:mietiqueta ID="menuBackup" runat="server" Text="Restore"></fss:mietiqueta>
</asp:Content>
<asp:Content ID="Contenido" ContentPlaceHolderID="Contenido" runat="server">
        <asp:Panel ID="Panel1" runat="server" HorizontalAlign="Center">
            <asp:Label ID="blbResultado" runat="server" Text="" CssClass="danger" ></asp:Label>
            <br />  <br />
            <asp:Label ID="lblDanger" runat="server" Text="Si usted realiza un restore, todos estos cambios se perderán:" CssClass="danger" ></asp:Label> <br />
            <br />
            <asp:GridView ID="grdCambios" runat="server" CssClass="table table-responsive table-bordered"></asp:GridView> <br /> <br />
            <fss:miBoton ID="btnRestoreOK" runat="server" Text="Restaurar de todas maneras" CssClass="btn btn-success"/> 
            <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-danger" />
            <br />
            <br />
        
    </asp:Panel><br /><br />
        
</asp:Content>
<asp:Content ID="Menu" ContentPlaceHolderID="Menu" runat="server">
</asp:Content>
