<%@ Page Title="GestorImagenes" Language="vb" AutoEventWireup="false" MasterPageFile="~/Maestra.Master" CodeBehind="GestorImagenes.aspx.vb" Inherits="FSS.GestorImagenes" %>
<%@ Register assembly="FSS" namespace="FSS" TagPrefix="fss" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Titulo" ContentPlaceHolderID="Titulo" runat="server">
<fss:mietiqueta ID="menuImagenes" runat="server" Text="Gestor Imagenes"></fss:mietiqueta>
</asp:Content>
<asp:Content ID="Contenido" ContentPlaceHolderID="Contenido" runat="server">
<article>
 <div style="font-family:Arial">
 <asp:FileUpload ID="FileUpload1" runat="server" CssClass="boton" />
 <fss:miboton ID="btnEnviar" runat="server" Text="Enviar" CssClass="boton"/>
 <br />
 <br />
   <asp:Panel ID="Panel1" runat="server" ScrollBars="Vertical" Width ="600px" Height="300px">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" CssClass="grilla" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField HeaderText="Archivo" ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandArgument='<%# Eval("File") %>' CommandName="Download" Text='<%# Eval("File") %>'>
                    </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Size" HeaderText="Bytes" />
                    <asp:BoundField DataField="Type" HeaderText="Tipo" />
                    <asp:ImageField ControlStyle-Height="100px" ControlStyle-Width="100px" DataImageUrlField="File" DataImageUrlFormatString="~\Negocio\ImagenesProductos\{0}" HeaderText="Imagen">
                        <ControlStyle Height="100px" Width="100px" />
                    </asp:ImageField>
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <PagerStyle HorizontalAlign="Center" BackColor="#2461BF" ForeColor="White" />
    <RowStyle BackColor="#EFF3FB" />
    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
    <SortedAscendingCellStyle BackColor="#F5F7FB" />
    <SortedAscendingHeaderStyle BackColor="#6D95E1"/>
    <SortedDescendingCellStyle BackColor="#E9EBEF" />
    <SortedDescendingHeaderStyle BackColor="#4870BE"/>
    </asp:GridView>
  </asp:Panel>
 </div>
</article>
</asp:Content>
<asp:Content ID="Menu" ContentPlaceHolderID="Menu" runat="server">
</asp:Content>