<%@ Page Title="FSS" Language="vb" AutoEventWireup="false" MasterPageFile="~/Maestra.Master" CodeBehind="Videos.aspx.vb" Inherits="FSS.Videos" %>
<%@ Register assembly="FSS" namespace="FSS" TagPrefix="fss" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Titulo" ContentPlaceHolderID="Titulo" runat="server">
    <fss:mietiqueta2 ID="menuVideos" runat="server" Text="Videos"></fss:mietiqueta2>
</asp:Content>
<asp:Content ID="Contenido" ContentPlaceHolderID="Contenido" runat="server">
    
    <asp:Panel runat="server" CssClass="panelTexto" HorizontalAlign="Center" >
    <div style="text-align:center">
    <h2><asp:label ID="lblVideo" runat="server" Text="VIDEOS" CssClass="supertitulo"></asp:label><br /></h2>
    <h3><fss:mietiqueta2 ID="lblTextoVideo" runat="server" Text="Si querés que publiquemos tu video escribinos a contacto.fsskate@gmail.com " CssClass="titulo"></fss:mietiqueta2></h3>
    </div>

    <br />
    <%--<asp:Label ID="lblVideo1" Text="Roller Games 2017" runat="server" CssClass="titulo" ></asp:Label><br /><br />
    <video width="360" height="240" controls= "controls" > 
        <source src="Videos/RollerGames2017.mp4" controls="controls" />
        <fss:mietiqueta2 ID="lblNoSoporta" runat="server" Text="Su navegador no soporta esta funcionalidad."></fss:mietiqueta2>
    </video>
    <br />
    <br />
    <asp:Label ID="lblVideo2" Text="Novara" runat="server" CssClass="titulo"></asp:Label><br /><br />
    <video width="360" height="240" controls= "controls" > 
        <source src="Videos/Novara.mp4" controls="controls" />
        <asp:Label ID="lblNoSoporta2" runat="server" Text="Su navegador no soporta esta funcionalidad."></asp:Label>
    </video>
    <br />--%>
        <br />
        <div id="divVideos">
        <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
                <article>
                <asp:Label ID="LblTitulo" runat="server" Text='<%# Eval("titulo")%>' CssClass="titulo"></asp:Label><br /><br />
                <video width="360" height="240" controls= "controls" > 
                <source src='<%# Eval("Archivo","Videos/{0}") %>' controls="controls" />
                <asp:Label ID="lblNoSoporta2" runat="server" Text="Su navegador no soporta esta funcionalidad."></asp:Label>
                </video>
                <br />
                <br />
                </article>
            </ItemTemplate>
        </asp:Repeater>
        </div>
    </asp:Panel>
    <asp:Panel ID="Panel1" runat="server" Width="600px" HorizontalAlign="Center"></asp:Panel><br /><br />

</asp:Content>
<asp:Content ID="Menu" ContentPlaceHolderID="Menu" runat="server">
</asp:Content>

