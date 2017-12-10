<%@ Page Title="FSS" Language="vb" AutoEventWireup="false" MasterPageFile="~/Maestra.Master" CodeBehind="Integridad.aspx.vb" Inherits="FSS.Integridad" %>

<%@ Register assembly="FSS" namespace="FSS" TagPrefix="fss" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Titulo" ContentPlaceHolderID="Titulo" runat="server">
    <fss:mietiqueta ID="menuDVV" runat="server" Text="Integridad"></fss:mietiqueta>
</asp:Content>
<asp:Content ID="Contenido" ContentPlaceHolderID="Contenido" runat="server">
    <article > 
    <fss:miBoton ID="btnControlarDVV" runat="server" Text="Controlar Digitos" CssClass="btn btn-default"/>
    <fss:miBoton ID="btnGenerarDVV" runat="server" Text="Generar Digitos" CssClass="btn btn-default"/><br /><br />
        <asp:Label ID="lblDVV" runat="server" Text=""></asp:Label> <br />
        <br />
        <asp:Label ID="lblDVH" runat="server" Text=""></asp:Label> <br />
        <asp:Panel ID="Panel1" runat="server" Width="600px" HorizontalAlign="Center"></asp:Panel><br /><br />
        </article>
</asp:Content>
<asp:Content ID="Menu" ContentPlaceHolderID="Menu" runat="server">
</asp:Content>
