<%@ Page Title="FSS" Language="vb" AutoEventWireup="false" MasterPageFile="~/Maestra.Master" CodeBehind="Error_OLD.aspx.vb" Inherits="FSS._Error" %>
<%@ Register assembly="FSS" namespace="FSS" TagPrefix="fss" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Titulo" ContentPlaceHolderID="Titulo" runat="server">
    <fss:mietiqueta ID="menuError" runat="server" Text="Error"></fss:mietiqueta>
</asp:Content>
<asp:Content ID="Contenido" ContentPlaceHolderID="Contenido" runat="server">
    <article>
      <asp:Panel runat="server" CssClass="panelTexto" HorizontalAlign="Center">
      <fss:mietiqueta ID="titError" runat="server" Text="" CssClass="titulo" Style="color:red">ERROR DE APLICACION</fss:mietiqueta> <br />
      <fss:mietiqueta ID="subtitError" runat="server" Text="" CssClass="subtitulo">Ha ocurrido un error inesperado, lamentamos los inconvenientes ocasionados.</fss:mietiqueta> <br />
      <fss:mietiqueta ID="subsubtitError" runat="server" Text="" CssClass="subsubtitulo">Si necesita asistencia, por favor contacte al soporte tecnico soporte@fss.com.ar</fss:mietiqueta>
      </asp:Panel>
      <asp:Panel ID="Panel1" runat="server" Width="600px" HorizontalAlign="Center"></asp:Panel><br /><br />
    </article>
</asp:Content>
<asp:Content ID="Menu" ContentPlaceHolderID="Menu" runat="server">
</asp:Content>
