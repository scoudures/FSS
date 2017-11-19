<%@ Page Title="FSS" Language="vb" AutoEventWireup="false" MasterPageFile="~/Maestra.Master" CodeBehind="Perfil.aspx.vb" Inherits="FSS.Perfil" %>

<%@ Register Assembly="FSS" Namespace="FSS" TagPrefix="fss" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 15%;
            height: 160px;
        }
        .auto-style2 {
            width: 30%;
            height: 160px;
            vertical-align:top;
        }
        .auto-style3 {
            width: 10%;
            height: 160px;
        }
    </style>
</asp:Content>
<asp:Content ID="Titulo" ContentPlaceHolderID="Titulo" runat="server">
    <fss:miEtiqueta ID="menuPerfiles" runat="server" Text="Perfiles"></fss:miEtiqueta>
</asp:Content>
<asp:Content ID="Contenido" ContentPlaceHolderID="Contenido" runat="server">
    <article>
        <table style="align-items:initial" style="width:630px">
            <tr><td><h5><fss:miEtiqueta ID="lblFamilia" runat="server" Text="Familias:"></fss:miEtiqueta></h5><br /></td>
                <td></td>
                <td></td>
                <td></td>
                <td style="align-items:flex-end"><fss:miLink ID="lnkUsuario" runat="server" PostBackUrl="Usuario.aspx" CssClass="linkboton">Ver Usuarios</fss:miLink></td>
            </tr>
            <tr><td rowspan ="3"><asp:ListBox ID="lstFamilia" runat="server" Width="210px" Height="100px" AutoPostBack="true" EnableViewState="true"></asp:ListBox><br /></td>
                <td style="width:30px"></td>
                <td colspan="3" rowspan ="2"><asp:TextBox ID="txtFamilia" runat="server" Text="Ingrese nombre..." AutoPostBack="true" Width="188px"></asp:TextBox><br /></td>
            </tr>
            <tr><td></td></tr>
            <tr>
                <td></td>
                <td><fss:miBoton ID="btnNuevo" runat="server" Text="Nuevo" CssClass="botoncito" /><br /></td>
                <td><fss:miBoton ID="btnEliminar" runat="server" Text="Eliminar" CssClass="botoncito" /></td>
                <td><fss:miBoton ID="btnModificar" runat="server" Text="Modificar" CssClass="botoncito" /></td>
            </tr>
        </table>
        <br />
        <asp:Panel ID="panelPermisos" runat="server" Visible="false" Width="635px" Height="350px">
            <br />
            <table style="width:630px">
                <tr>
                    <td style="width:15%"></td>
                    <td style="width:30%"><h5>
                        <fss:miEtiqueta ID="lblAditivos" runat="server" Text="Permisos Aditivos"></fss:miEtiqueta></h5></td>
                    <td style="width:10%"></td>
                    <td style="width:30%"><h5>
                        <fss:miEtiqueta ID="lblSustractivos" runat="server" Text="Permisos Sustractivos"></fss:miEtiqueta></h5></td>
                    <td style="width:15%"></td>
                </tr>
                </table>
                <asp:Panel ID="panelArboles" runat="server" Visible="false" ScrollBars="Vertical" Width="630px" Height="200px">
                <table style="width:630px">
                    <tr>
                    <td class="auto-style1"></td>
                    <td class="auto-style2">
                        <asp:Panel runat="server" ScrollBars="Vertical" Width="200px" Height="180px">
                        <asp:TreeView ID="treePermisos" runat="server" ImageSet="Arrows" ShowCheckBoxes="Root" ShowLines="True">
                            <HoverNodeStyle Font-Underline="True" ForeColor="#5555DD" />
                            <NodeStyle Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" HorizontalPadding="5px" NodeSpacing="0px" VerticalPadding="0px" />
                            <ParentNodeStyle Font-Bold="False" />
                            <SelectedNodeStyle Font-Underline="True" ForeColor="#5555DD" HorizontalPadding="0px" VerticalPadding="0px" />
                        </asp:TreeView>
                        </asp:Panel>
                    </td>
                    <td class="auto-style3"></td>
                    <td class="auto-style2">
                        <asp:Panel runat="server" ScrollBars="Vertical"  Width="200px" Height="180px">
                        <asp:TreeView ID="treePatentes" runat="server" ImageSet="Arrows" ShowCheckBoxes="Leaf" ShowLines="True">
                            <HoverNodeStyle Font-Underline="True" ForeColor="#5555DD" />
                            <NodeStyle Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" HorizontalPadding="5px" NodeSpacing="0px" VerticalPadding="0px" />
                            <ParentNodeStyle Font-Bold="False" />
                            <SelectedNodeStyle Font-Underline="True" ForeColor="#5555DD" HorizontalPadding="0px" VerticalPadding="0px" />
                        </asp:TreeView>
                        </asp:Panel>
                    </td>
                    <td class="auto-style1"></td>
                    </tr>
                </table>
                </asp:Panel>
            <table style="width:630px">
                <tr>
                    <td></td>
                    <td><fss:miBoton ID="btnTodas" runat="server" Text="Todos" CssClass="botoncitito" />
                        <fss:miBoton ID="btnNinguna" runat="server" Text="Ninguno" CssClass="botoncitito" /></td>
                    <td></td>
                    <td><fss:miBoton ID="btnTodos" runat="server" Text="Todos" CssClass="botoncitito" />
                        <fss:miBoton ID="btnNinguno" runat="server" Text="Ninguno" CssClass="botoncitito" /></td>
                </tr>
                <tr>
                    <td colspan="5">
                        <fss:miBoton ID="btnActualizar" runat="server" Text="Actualizar" CssClass="botoncito" /></td>
                </tr>
            </table>
            <br />
        </asp:Panel>
        <br />
        <br />
        <asp:Panel ID="Panel1" runat="server" Width="600px" HorizontalAlign="Center"></asp:Panel><br /><br />
    </article>
</asp:Content>
<asp:Content ID="Menu" ContentPlaceHolderID="Menu" runat="server">
</asp:Content>
