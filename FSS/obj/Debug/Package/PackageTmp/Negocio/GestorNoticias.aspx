<%@ Page Title="FSS" Language="vb" AutoEventWireup="false" MasterPageFile="~/Maestra.Master" CodeBehind="GestorNoticias.aspx.vb" Inherits="FSS.GestorNoticias" %>
<%@ Register assembly="FSS" namespace="FSS" TagPrefix="fss" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Titulo" ContentPlaceHolderID="Titulo" runat="server">
<asp:label ID="menuGestorNoticias" runat="server" Text="Gestor de Noticias"></asp:label>
</asp:Content>

<asp:Content ID="Contenido" ContentPlaceHolderID="Contenido" runat="server">
<article>
    <div style="text-align:center">
    <asp:label ID="lblNoti" runat="server" Text="Noticias" CssClass="supertitulo"></asp:label>
    </div>
    <div >
       <asp:GridView HorizontalAlign="Center"   ID="GridViewNoticias" runat="server" AutoGenerateColumns="False" CssClass="grilla" ForeColor="Black" BackColor="#FFF4D5" BorderWidth="0px" AllowPaging="True" PageSize="5" CellSpacing="5" ShowFooter="True" EmptyDataText="No se encontraron noticias" ShowHeaderWhenEmpty="True">
        <Columns>
            <asp:BoundField HeaderText="CódigoNoticia" DataField="CodigoNoticia" ItemStyle-Width="10%" Visible="false" >
                <ItemStyle Width="10%"></ItemStyle>
            </asp:BoundField>
            <asp:TemplateField HeaderText="Titulo">
                <ItemTemplate>
                  <asp:TextBox ID="txtTitulo" Enabled="false"   MaxLength="50" TextMode="MultiLine" Rows="8"  runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "titulo") %>'></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="Ruta Imagen" DataField="RutaImagen" ItemStyle-Width="50px" >
                <ItemStyle Width="10%"></ItemStyle>
            </asp:BoundField>
            <asp:TemplateField HeaderText="Imagen">
                <ItemTemplate >
                    <asp:Image ID="Image1" runat="server" width="150px" ImageUrl ='<%# Eval("rutaImagen","~/Imagenes/{0}") %>'/>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Operación" >
                <ItemTemplate>
                    <asp:button runat="server" ID="btnModificar" ClientIDMode="Static" Text="Modificar" CssClass="btn btn-success" CommandName="modificar" CommandArgument='<%# Eval("CodigoNoticia")%>'></asp:button>
                    <asp:button runat="server" ID="btnEliminar" ClientIDMode="Static" Text="Eliminar" CssClass="btn btn-danger" CommandName="eliminar" CommandArgument='<%# Eval("CodigoNoticia")%>' OnClientClick="return confirm('Realmente desea eliminar la noticia?')"></asp:button>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="center"   />
                <FooterTemplate>
                    <asp:Button ID="btnNuevo" CssClass="btn btn-success" runat="server" Text="Nueva" CommandName="nuevo"   />
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