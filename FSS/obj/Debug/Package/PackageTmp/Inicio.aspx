<%@ Page Title="FSS" Language="vb" AutoEventWireup="false" MasterPageFile="~/Maestra.Master" CodeBehind="Inicio.aspx.vb" Inherits="FSS.Inicio" %>
<%@ Register assembly="FSS" namespace="FSS" TagPrefix="fss" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Titulo" ContentPlaceHolderID="Titulo" runat="server">
    <fss:mietiqueta2 ID="menuInicio" runat="server" Text="Inicio"></fss:mietiqueta2>
</asp:Content>
<asp:Content ID="Contenido" ContentPlaceHolderID="Contenido" runat="server">
    <asp:Panel runat="server" CssClass="panelTexto" HorizontalAlign="Center">
    
    <div style="text-align:center">
    <h1 style="background-color:gray; color:white; font-weight:bold" class="text-uppercase"><fss:mietiqueta ID="lblNoti" runat="server" Text="ÚLTIMAS NOVEDADES"></fss:mietiqueta></h1><br />
    <h3><fss:mietiqueta ID="lblTexto" runat="server" Text="FSS te mantiene informado de todo lo que pasa en el mundo del patínaje artístico sobre ruedas!!!"></fss:mietiqueta></h3>
    </div>
    <div id="divNoticias">
        <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
                <article>
                <header>
                    <%--<h2 style="background-color:gray; color:white; font-weight:bold"><fss:miEtiqueta2 ID="tituloNoticia" runat="server" CssClass="Titulo_<%# Eval("CodigoNoticia")%>-" Text='<%# Eval("titulo")%>'></fss:miEtiqueta2></h2><br /><br />--%>
                    <h2 style="background-color:gray; color:white; font-weight:bold"><fss:miLink2 ID="TituloNoticia" Enabled="false" Font-Underline="false" ForeColor="White"  runat="server" Target='<%# Eval("CodigoNoticia")%>' Text='<%# Eval("titulo")%>' ></fss:miLink2></h2><br /><br />
                    <h4><fss:miLink2 ID="SubtituloNoticia" Enabled="false" Font-Underline="false" runat="server" Target='<%# Eval("CodigoNoticia")%>' Text='<%# Eval("subtitulo")%>'></fss:miLink2></h4><br /><br />
                </header>
                <p><fss:miLink2 ID="TextoNoticia" Enabled="false" Font-Underline="false" runat="server" Target='<%# Eval("CodigoNoticia")%>' Text='<%# Eval("texto")%>' ></fss:miLink2></p><br /><br />
                    <asp:Image ID="Image1" runat="server" CssClass="center-block img-responsive img-rounded img-thumbnail" ImageUrl='<%# Eval("rutaImagen","~/Imagenes/{0}") %>' /><br />
                <br />
                <hr />
                </article>
            </ItemTemplate>
        </asp:Repeater>
    </div>
        </asp:Panel>
        <asp:Panel ID="Panel1" runat="server" Width="600px" HorizontalAlign="Center"></asp:Panel><br /><br />
</asp:Content>
<asp:Content ID="Menu" ContentPlaceHolderID="Menu" runat="server">
</asp:Content>

