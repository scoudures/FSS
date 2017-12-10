<%@ Page Title="FSS" Language="vb" AutoEventWireup="false" MasterPageFile="~/Maestra.Master" CodeBehind="Valores.aspx.vb" Inherits="FSS.Valores" %>
<%@ Register assembly="FSS" namespace="FSS" TagPrefix="fss" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Titulo" ContentPlaceHolderID="Titulo" runat="server">
<fss:mietiqueta2 ID="menuValores" runat="server" Text="Valores"></fss:mietiqueta2>
</asp:Content>
<asp:Content ID="Contenido" ContentPlaceHolderID="Contenido" runat="server">
<article>
    <br />
    <img src="Imagenes/mision.jpg" class="center-block img-responsive img-rounded img-thumbnail" style="width:80%" /><br /><br />
    <h2><fss:mietiqueta2 ID="titMision" runat="server" Text="NUESTRA MISION" CssClass="titulo"></fss:mietiqueta2></h2><br /><br />
    <fss:mietiqueta2 ID="lblMision" runat="server" Text="Brindar Productos Deportivos de calidad a Patinadores de la República Argentina; confiables, a costos competitivos, acompañando las expectativas y requerimientos de nuestros clientes, dentro de un marco de crecimiento y rentabilidad.

Convertirnos en fuente de información y consulta para que patinadores federados, en etapa de competencia, accedan a la última tecnología de calidad disponible.

Para ello deberemos consolidarnos en la Ciudad Autónoma de Buenos Aires y en el Gran Buenos Aires, para luego extendernos a todo el territorio de la República Argentina." CssClass="panelTexto"></fss:mietiqueta2>
    <br />
</article>

<article>
    <br />
    <img src="Imagenes/vision.jpg" class="center-block img-responsive img-rounded img-thumbnail" style="width: 50%;"/><br /><br />
    <h2><fss:mietiqueta2 ID="titVision" runat="server" Text="NUESTRA VISION" CssClass="titulo"></fss:mietiqueta2></h2><br /><br />
    <fss:mietiqueta2 ID="lblVision" runat="server" Text="Constituirnos en un referente para Patinadores Profesionales de la República Argentina, otorgando recomendaciones acordes al nivel de competencia de los mismos. Siempre disponiendo de productos de calidad y tecnología de punta, acompañado de la mano de una capacitación continua de nuestros técnicos." CssClass="panelTexto"></fss:mietiqueta2>
    <br />
</article>

<article>
    <br />
    <img src="Imagenes/valores.jpg" class="center-block img-responsive img-rounded img-thumbnail" style="width: 50%;" /><br /><br />
    <h2><fss:mietiqueta2 ID="titValores" runat="server" Text="NUESTROS VALORES" CssClass="titulo"></fss:mietiqueta2></h2><br /><br />
            
            <br /><fss:miboton class="glyphicon glyphicon-ok"></fss:miboton>&nbsp;&nbsp;&nbsp;<fss:mietiqueta2 ID="item1" Text="Trabajo en equipo" runat="server"></fss:mietiqueta2>
            <br /><fss:miboton class="glyphicon glyphicon-ok"></fss:miboton>&nbsp;&nbsp;&nbsp;<fss:mietiqueta2 ID="item2" Text="Capacitación permanente" runat="server"></fss:mietiqueta2>
            <br /><fss:miboton class="glyphicon glyphicon-ok"></fss:miboton>&nbsp;&nbsp;&nbsp;<fss:mietiqueta2 ID="item3" Text="Flexibilización y adaptación al cambio" runat="server"></fss:mietiqueta2>
            <br /><fss:miboton class="glyphicon glyphicon-ok"></fss:miboton>&nbsp;&nbsp;&nbsp;<fss:mietiqueta2 ID="item4" Text="Actualización Técnica continua" runat="server"></fss:mietiqueta2>
            <br /><fss:miboton class="glyphicon glyphicon-ok"></fss:miboton>&nbsp;&nbsp;&nbsp;<fss:mietiqueta2 ID="item5" Text="Compromiso con la calidad y la nutrición" runat="server"></fss:mietiqueta2>
            <br /><fss:miboton class="glyphicon glyphicon-ok"></fss:miboton>&nbsp;&nbsp;&nbsp;<fss:mietiqueta2 ID="item6" Text="Orientación hacia el cliente" runat="server"></fss:mietiqueta2>
            <br /><fss:miboton class="glyphicon glyphicon-ok"></fss:miboton>&nbsp;&nbsp;&nbsp;<fss:mietiqueta2 ID="item7" Text="Principios y valores cooperativos" runat="server"></fss:mietiqueta2>
    <br />
</article>
</asp:Content>
<asp:Content ID="Menu" ContentPlaceHolderID="Menu" runat="server">
</asp:Content>