<%@ Page Title="FSS" Language="vb" AutoEventWireup="false" CodeBehind="Bitacora.aspx.vb" MasterPageFile="~/Maestra.Master" Inherits="FSS.Bitacora" %>
<%@ Register assembly="FSS" namespace="FSS" TagPrefix="fss" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Titulo" ContentPlaceHolderID="Titulo" runat="server">
    <fss:mietiqueta ID="menuBitacora" runat="server" Text="Bitacora"></fss:mietiqueta>
</asp:Content>
<asp:Content ID="Contenido" ContentPlaceHolderID="Contenido" runat="server">
     <article>
        <fss:mietiqueta ID="lblFecha" runat="server" Text="Ingresar la Fecha:"></fss:mietiqueta>&nbsp;&nbsp;
        [<fss:mietiqueta ID="lblAnio" runat="server" Text="AÑO"></fss:mietiqueta>]&nbsp;&nbsp;&nbsp;
        [ <fss:mietiqueta ID="lblMes" runat="server" Text="MES"></fss:mietiqueta>]&nbsp;&nbsp;&nbsp;
        [<fss:mietiqueta ID="lblDia" runat="server" Text="DIA"></fss:mietiqueta>]
        

        <br />
        <br />
        <fss:mietiqueta ID="lblFechaDesde" runat="server" Text="Fecha Desde:"></fss:mietiqueta>&nbsp;&nbsp;
        <asp:DropDownList ID="lstAnioDesde" runat="server" AutoPostBack="false"></asp:DropDownList>&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="lstMesDesde" runat="server" AutoPostBack="true"></asp:DropDownList>&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="lstDiaDesde" runat="server" AutoPostBack="false"></asp:DropDownList>
        <br />
        <br />
        <fss:mietiqueta ID="lblFechaHasta" runat="server" Text="Fecha Hasta:"></fss:mietiqueta>&nbsp;&nbsp;
        <asp:DropDownList ID="lstAnioHasta" runat="server" AutoPostBack="false"></asp:DropDownList>&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="lstMesHasta" runat="server" AutoPostBack="true"></asp:DropDownList>&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="lstDiaHasta" runat="server" AutoPostBack="false"></asp:DropDownList>
    
    <br />
    <br />
        
    <fss:mietiqueta ID="lblSuceso" runat="server" Text="Suceso:"></fss:mietiqueta> &nbsp;&nbsp;
    <asp:DropDownList ID="lstSuceso" runat="server" AutoPostBack="false"></asp:DropDownList>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <fss:mietiqueta ID="lblUsuario" runat="server" Text="Usuario:"></fss:mietiqueta> &nbsp;&nbsp;
    <asp:DropDownList ID="lstUsuario" runat="server" AutoPostBack="false"></asp:DropDownList>

    <br />
    <br />
    <fss:miBoton ID="btnEnviar" runat="server" Text="Enviar" CssClass="boton"> </fss:miBoton><br />
    <br />
    <asp:GridView ID="grdBitacora" runat="server" CssClass="grilla" AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None" >
        <AlternatingRowStyle BackColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
         </asp:GridView>
    <br />
        <asp:Panel ID="Panel1" runat="server" Width="600px" HorizontalAlign="Center"></asp:Panel><br /><br />
        </article>
</asp:Content>
<asp:Content ID="Menu" ContentPlaceHolderID="Menu" runat="server">
</asp:Content>
