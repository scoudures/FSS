<%@ Page Title="FSS" Language="vb" AutoEventWireup="false" MasterPageFile="~/Maestra.Master" CodeBehind="NoAutenticado.aspx.vb" Inherits="FSS.NoAutenticado" %>

<%@ Register assembly="FSS" namespace="FSS" TagPrefix="fss" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Titulo" ContentPlaceHolderID="Titulo" runat="server">
<fss:mietiqueta ID="menuNoAutenticado" runat="server" Text="No Autenticado"></fss:mietiqueta>
</asp:Content>
<asp:Content ID="Contenido" ContentPlaceHolderID="Contenido" runat="server">
<article>
    <asp:Panel runat="server" CssClass="panelTexto" HorizontalAlign="Center">
     <fss:mietiqueta ID="titNoAutenticado" runat="server" Text="" CssClass="titulo" Style="color:red">ACCESO RESTRINGIDO</fss:mietiqueta> <br />
      <fss:mietiqueta ID="subtitNoAutenticado" runat="server" Text="" CssClass="subtitulo">No cuenta con permiso para acceder al contenido seleccionado.</fss:mietiqueta> <br />
      <fss:mietiqueta ID="subsubtitNoAutenticado" runat="server" Text="" CssClass="subsubtitulo">Si necesita asistencia, por favor contacte al soporte tecnico soporte@fss.com.ar</fss:mietiqueta>
      </asp:Panel>
        <asp:Panel ID="Panel1" runat="server" Width="600px" HorizontalAlign="Center"></asp:Panel><br /><br />
</article>
</asp:Content>
<asp:Content ID="Menu" ContentPlaceHolderID="Menu" runat="server">
</asp:Content>
