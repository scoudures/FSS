<%@ Page Title="FSS" Language="vb" AutoEventWireup="false" CodeBehind="Bienvenida.aspx.vb" MasterPageFile="~/Maestra.Master" Inherits="FSS.Bienvenida" %>
<%@ Register assembly="FSS" namespace="FSS" TagPrefix="fss" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Titulo" ContentPlaceHolderID="Titulo" runat="server">
    <fss:mietiqueta ID="menuBienvenida" runat="server" Text="Bienvenida"></fss:mietiqueta>
</asp:Content>
<asp:Content ID="Contenido" ContentPlaceHolderID="Contenido" runat="server">
    <article style="text-align:center">
        <asp:Panel ID="Panel1" runat="server" Width="600px" HorizontalAlign="Center" CssClass="panelTexto">
            <fss:mietiqueta ID="lblBienvenida" Font-Bold="true" runat="server" CssClass="panelTexto" Width="561px"  HorizontalAlign="Center" Text="Bienvenido a FSS, un lugar donde los patinadores encuentran todo lo que necesitan."></fss:mietiqueta>
        </asp:Panel>
        <br />
        <asp:Panel ID="PanelCliente" runat="server" Visible="false" >
            <asp:Label ID="lblRecomendacion" runat="server" Text="Si quiere que lo guiemos en su compra, por favor acceda a nuestras  "></asp:Label>
            <asp:LinkButton ID="LinkRecomendacion" runat="server" PostBackUrl="Recomendacion.aspx" CssClass="btn-link btn-primary" CausesValidation="false" Width="170px">Recomendaciones</asp:LinkButton>
            <br />
            <br />
            <asp:Label ID="lblContacto" runat="server" Text="Cualquier duda o sugerencia que tenga por favor póngase en   "></asp:Label>
            <asp:LinkButton ID="LinkContacto" runat="server" PostBackUrl="Contacto.aspx" CssClass="btn-link btn-primary" CausesValidation="false" Width="100px">Contacto</asp:LinkButton>
            <asp:Label ID="Label1" runat="server" Text="   con nosotros."></asp:Label>
            <br />
            <br />
            <asp:Label ID="lblCuenta" runat="server" Text="Puede ver el estado de sus pedidos accediendo a su   "></asp:Label>
            <asp:button ID="linkCuenta" runat="server" Text="Cuenta" CssClass="btn-link btn-primary" CausesValidation="false" Width="100px" />
            <br />
            <br />
            <asp:Label ID="lblAjustes" runat="server" Text="Si lo desea puede cambiar sus opciones personales en   "></asp:Label>
            <asp:button ID="linkAjustes" runat="server" Text="Ajustes" CssClass="btn-link btn-primary" CausesValidation="false" Width="100px" />
        </asp:Panel>
        <asp:Panel ID="PanelVendedor" runat="server" Visible="false" >
            <asp:Label ID="lblClientes" runat="server" Text="Acceder a la nómina de  "></asp:Label>
            <asp:LinkButton ID="LinkClientes" runat="server" PostBackUrl="~/Negocio/Cliente.aspx" CssClass="btn btn-primary" CausesValidation="false" Width="100px">Clientes</asp:LinkButton>
            <br />
            <br />
            <asp:Label ID="lblVendedores" runat="server" Text="Acceder a la nómina de  "></asp:Label>
            <asp:LinkButton ID="LinkVendedores" runat="server" PostBackUrl="~/Negocio/Vendedor.aspx" CssClass="btn btn-primary" CausesValidation="false" Width="100px">Vendedores</asp:LinkButton>
            <br />
            <br />
            <asp:Label ID="lblProducto" runat="server" Text="Editar el Catálogo de  "></asp:Label>
            <asp:LinkButton ID="LinkProducto" runat="server" PostBackUrl="~/Negocio/Producto.aspx" CssClass="btn btn-primary" CausesValidation="false" Width="100px">Productos</asp:LinkButton>
            <br />
            <br />
            <asp:Label ID="lblOrdenes" runat="server" Text="Listar todas las  "></asp:Label>
            <asp:LinkButton ID="LinkOrdenes" runat="server" PostBackUrl="~/Negocio/Ordenes.aspx" CssClass="btn btn-primary" CausesValidation="false" Width="100px">Ordenes</asp:LinkButton>
            <br />
            <br />
            <asp:Panel ID="PanelSupervisor" runat="server" GroupingText=" ">
            <%--<asp:label ID="lblParametrizacion" Font-Bold="true" runat="server" CssClass="panelTexto" Width="561px"  HorizontalAlign="left" Text="Parametrización"></asp:label>
            <br /><br />
            <asp:LinkButton ID="LinkColor" runat="server" PostBackUrl="~/Negocio/Color.aspx" CssClass="btn btn-primary" CausesValidation="false" Width="100px">Color</asp:LinkButton>&nbsp;&nbsp;
            <asp:LinkButton ID="LinkLinea" runat="server" PostBackUrl="~/Negocio/Linea.aspx" CssClass="btn btn-primary" CausesValidation="false" Width="100px">Línea</asp:LinkButton>&nbsp;&nbsp;
            <asp:LinkButton ID="LinkMarca" runat="server" PostBackUrl="~/Negocio/Marca.aspx" CssClass="btn btn-primary" CausesValidation="false" Width="100px">Marca</asp:LinkButton>&nbsp;&nbsp;
            <asp:LinkButton ID="LinkNivel" runat="server" PostBackUrl="~/Negocio/Nivel.aspx" CssClass="btn btn-primary" CausesValidation="false" Width="100px">Nivel</asp:LinkButton>&nbsp;&nbsp;
            <asp:LinkButton ID="LinkTalle" runat="server" PostBackUrl="~/Negocio/Talle.aspx" CssClass="btn btn-primary" CausesValidation="false" Width="100px">Talle</asp:LinkButton>--%>
            <br />
            <br />
            </asp:Panel>
        </asp:Panel>
        <asp:Panel ID="PanelAdministrador" runat="server" Visible="false" >
            <asp:Panel ID="Panel2" runat="server" GroupingText=" ">
                <asp:label ID="lblAdmin" Font-Bold="true" runat="server" CssClass="panelTexto" Width="561px"  HorizontalAlign="left" Text="Administración"></asp:label>
                <br /><br />
                <asp:LinkButton ID="LinkBackup" runat="server" PostBackUrl="~/Tecnicos/Backup.aspx" CssClass="btn btn-primary" CausesValidation="false" Width="150px">Backup/Restore</asp:LinkButton>&nbsp;&nbsp;
                <asp:LinkButton ID="LinkBitacora" runat="server" PostBackUrl="~/Tecnicos/Bitacora.aspx" CssClass="btn btn-primary" CausesValidation="false" Width="100px">Bitácora</asp:LinkButton>&nbsp;&nbsp;
                <asp:LinkButton ID="LinkIdioma" runat="server" PostBackUrl="~/Tecnicos/Idioma.aspx" CssClass="btn btn-primary" CausesValidation="false" Width="100px">Idioma</asp:LinkButton>
                <br /><br />
                <asp:LinkButton ID="LinkPerfiles" runat="server" PostBackUrl="~/Tecnicos/Perfil.aspx" CssClass="btn btn-primary" CausesValidation="false" Width="100px">Perfiles</asp:LinkButton>&nbsp;&nbsp;
                <asp:LinkButton ID="LinkUsuario" runat="server" PostBackUrl="~/Tecnicos/Usuario.aspx" CssClass="btn btn-primary" CausesValidation="false" Width="100px">Usuarios</asp:LinkButton>
                <br /><br />
            </asp:Panel>
            <br />
            <%--<asp:Panel ID="PanelParametrizacion" runat="server" GroupingText=" ">
            <asp:label ID="lblParam" Font-Bold="true" runat="server" CssClass="panelTexto" Width="561px"  HorizontalAlign="left" Text="Parametrización"></asp:label>
            <br /><br />
                <asp:LinkButton ID="LinkEmpresa" runat="server" PostBackUrl="~/Negocio/Empresa.aspx" CssClass="btn btn-primary" CausesValidation="false" Width="100px">Empresa</asp:LinkButton>&nbsp;&nbsp;
                <asp:LinkButton ID="LinkFormaEnvio" runat="server" PostBackUrl="~/Negocio/FormaEnvio.aspx" CssClass="btn btn-primary" CausesValidation="false" Width="170px">Forma de Envio</asp:LinkButton>&nbsp;&nbsp;
                <asp:LinkButton ID="LinkLocalidad" runat="server" PostBackUrl="~/Negocio/Localidad.aspx" CssClass="btn btn-primary" CausesValidation="false" Width="100px">Localidad</asp:LinkButton>
                <br /><br />
                <asp:LinkButton ID="LinkMedioContacto" runat="server" PostBackUrl="~/Negocio/MedioContacto.aspx" CssClass="btn btn-primary" CausesValidation="false" Width="170px">Medio de Contacto</asp:LinkButton>&nbsp;&nbsp;
                <asp:LinkButton ID="LinkMedioPago" runat="server" PostBackUrl="~/Negocio/MedioPago.aspx" CssClass="btn btn-primary" CausesValidation="false" Width="150px">Medio de Pago</asp:LinkButton>&nbsp;&nbsp;
                <asp:LinkButton ID="LinkProvincia" runat="server" PostBackUrl="~/Negocio/Provincia.aspx" CssClass="btn btn-primary" CausesValidation="false" Width="100px">Provincia</asp:LinkButton>&nbsp;&nbsp;
                <asp:LinkButton ID="LinkSucursal" runat="server" PostBackUrl="~/Negocio/Sucursal.aspx" CssClass="btn btn-primary" CausesValidation="false" Width="100px">Sucural</asp:LinkButton>&nbsp;&nbsp;
                <br /><br />
            </asp:Panel>
            <br />--%>
            <asp:Panel ID="PanelContenido" runat="server">
                <asp:label ID="lblContenido" Font-Bold="true" runat="server" CssClass="panelTexto" Width="561px"  HorizontalAlign="left" Text="Publicaciones"></asp:label>
                <br /><br />
                <asp:LinkButton ID="LinkNoticias" runat="server" PostBackUrl="~/Negocio/GestorNoticias.aspx" CssClass="btn btn-primary" CausesValidation="false" Width="100px">Noticias</asp:LinkButton>&nbsp;&nbsp;
                <asp:LinkButton ID="LinkVideos" runat="server" PostBackUrl="~/Negocio/GestorVideos.aspx" CssClass="btn btn-primary" CausesValidation="false" Width="100px">Videos</asp:LinkButton>
                <br /><br />
            </asp:Panel>
        </asp:Panel>
        <br />
        <br />
     </article>
</asp:Content>
<asp:Content ID="Menu" ContentPlaceHolderID="Menu" runat="server">
    
</asp:Content>
