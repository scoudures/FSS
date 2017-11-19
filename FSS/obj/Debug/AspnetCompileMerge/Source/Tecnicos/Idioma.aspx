<%@ Page Title="FSS" Language="vb" AutoEventWireup="false" MasterPageFile="~/Maestra.Master" CodeBehind="Idioma.aspx.vb" Inherits="FSS.Idioma" %>
<%@ Register assembly="FSS" namespace="FSS" TagPrefix="fss" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Titulo" ContentPlaceHolderID="Titulo" runat="server">
    <fss:mietiqueta ID="menuIdioma" runat="server" Text="Idioma"></fss:mietiqueta>
</asp:Content><asp:Content ID="Contenido" ContentPlaceHolderID="Contenido" runat="server">
    <article style="text-align:center">
        <asp:Panel ID="PanelIdioma" runat="server" CssClass="panelTexto">
        <fss:mietiqueta ID="lblIdioma" runat="server" Text="Idioma"></fss:mietiqueta>&nbsp;&nbsp;
        <asp:TextBox ID="txtIdioma" runat="server"></asp:TextBox> &nbsp;&nbsp;
        <fss:miboton ID="btnNuevo" runat="server" Text="Nuevo" CssClass="boton"/>&nbsp;&nbsp;
        <br />
        <fss:mietiqueta ID="IdiomaEliminar" runat="server" Text="Eliminar el Idioma: "></fss:mietiqueta>&nbsp;&nbsp;
        <asp:DropDownList ID="listaIdioma2" runat="server" AutoPostBack="false"></asp:DropDownList> &nbsp;&nbsp;
        <fss:miboton ID="btnEliminar" runat="server" Text="Eliminar" CssClass="boton" OnClientClick="return confirm('Esta seguro que desea eliminar el idioma?')" />
        <br />
        <fss:mietiqueta ID="ListarLeyendas" runat="server" Text="Listar las leyendas en: "></fss:mietiqueta>&nbsp;&nbsp;
        <asp:DropDownList ID="listaIdioma" runat="server" AutoPostBack="false"></asp:DropDownList> &nbsp;&nbsp;
        <fss:miboton ID="btnEnviar" runat="server" Text="Listar" CssClass="boton"/>
        <br />
        <asp:GridView ID="grdIdioma" runat="server" CssClass="grilla" AllowPaging="True" PageSize="15" AutoGenerateEditButton="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
             <asp:TemplateField HeaderText="Etiqueta">
                    <FooterTemplate>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblEtiqueta" runat="server" Text='<%# Bind("tag")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="TextoDefault">
                    <FooterTemplate>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblTextoDef" runat="server" Text='<%# Bind("textodefault")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Texto">
                    <FooterTemplate>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblTexto" runat="server" Text='<%# Bind("texto")%>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtTexto" runat="server" Text='<%# Bind("texto")%>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                </Columns>
            
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
        </asp:Panel>
        <asp:Panel ID="Panel1" runat="server" Width="600px" HorizontalAlign="Center"></asp:Panel><br /><br />
    </article>
</asp:Content>
<asp:Content ID="Menu" ContentPlaceHolderID="Menu" runat="server">
</asp:Content>