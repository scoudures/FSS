<%@ Page Title="FSS" Language="vb" AutoEventWireup="false" MasterPageFile="~/Maestra.Master"  CodeBehind="GestorVideos.aspx.vb" Inherits="FSS.GestorVideos" %>
<%@ Register assembly="FSS" namespace="FSS" TagPrefix="fss" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Titulo" ContentPlaceHolderID="Titulo" runat="server">
<asp:label ID="menuGestorVideos" runat="server" Text="Gestor de Videos"></asp:label>
</asp:Content>
<asp:Content ID="Contenido" ContentPlaceHolderID="Contenido" runat="server">
<article>
    <div style="text-align:center">
    <asp:label ID="lblVideos" runat="server" Text="Videos" CssClass="supertitulo"></asp:label>
    </div>
    <div >
       <asp:GridView HorizontalAlign="Center"   ID="grdVideos" runat="server" AutoGenerateColumns="False" CssClass="grilla" ForeColor="Black" BackColor="#FFF4D5" BorderWidth="0px" AllowPaging="True" PageSize="5" CellSpacing="5" ShowFooter="True" EmptyDataText="No se encontraron videos" ShowHeaderWhenEmpty="True">
        <Columns>
            <asp:BoundField HeaderText="CódigoVideo" DataField="CodigoVideo" ItemStyle-Width="10%" Visible="false" >
                <ItemStyle Width="10%"></ItemStyle>
            </asp:BoundField>
            <asp:TemplateField HeaderText="Titulo">
                <ItemTemplate>
                  <asp:TextBox ID="txtTitulo" Enabled="false"   MaxLength="50" TextMode="MultiLine" Rows="8"  runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "titulo") %>'></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="Archivo" DataField="Archivo" ItemStyle-Width="50px" >
                <ItemStyle Width="10%"></ItemStyle>
            </asp:BoundField>
            <asp:TemplateField HeaderText="Operación" >
                <ItemTemplate>
                    <asp:button runat="server" ID="btnModificar" ClientIDMode="Static" Text="Modificar" CssClass="btn btn-success" CommandName="modificar" CommandArgument='<%# Eval("CodigoVideo")%>'></asp:button>
                    <asp:button runat="server" ID="btnEliminar" ClientIDMode="Static" Text="Eliminar" CssClass="btn btn-danger" CommandName="eliminar" CommandArgument='<%# Eval("CodigoVideo")%>' OnClientClick="return confirm('Realmente desea eliminar el video?')"></asp:button>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="center"   />
                <FooterTemplate>
                    <asp:Button ID="btnNuevo" CssClass="btn btn-success" runat="server" Text="Nuevo" CommandName="nuevo"   />
                </FooterTemplate>
                <FooterStyle HorizontalAlign="Center" />
                <HeaderStyle HorizontalAlign="Center" />
            </asp:TemplateField>
         </Columns>
         <EditRowStyle ForeColor="Black" />
         <FooterStyle BackColor="#337AB7" ForeColor="black" Height="30px" />
         <HeaderStyle BackColor="#337AB7" ForeColor="White" Height="30px" />
       </asp:GridView>
     </div>
<asp:Panel ID="Panel1" runat="server" Width="600px" HorizontalAlign="Center"></asp:Panel><br /><br />
</article>
</asp:Content>
<asp:Content ID="Menu" ContentPlaceHolderID="Menu" runat="server">
</asp:Content>
