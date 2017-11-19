<%@ Page Title="FSS" Language="vb" AutoEventWireup="false" MasterPageFile="~/Maestra.Master" CodeBehind="QuienesSomos.aspx.vb" Inherits="FSS.QuienesSomos" %>

<%@ Register Assembly="FSS" Namespace="FSS" TagPrefix="fss" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Titulo" ContentPlaceHolderID="Titulo" runat="server">
    <fss:mietiqueta2 ID="menuQuienesSomos" runat="server" Text="Quienes Somos"></fss:mietiqueta2>
</asp:Content>
<asp:Content ID="Contenido" ContentPlaceHolderID="Contenido" runat="server">
    <article class="post clearfix">
        <h2 class="post-title">
            <fss:mietiqueta2 ID="lblTituloQS" runat="server" Text="Quiénes Somos?" CssClass="titulo"></fss:mietiqueta2>
        </h2>
        <br />
        <img class="center-block img-responsive img-rounded img-thumbnail" src="Imagenes/oldfashion.jpg" />
        <br />
        <br />
        <p class="post-contenido text-justify">
            <fss:mietiqueta2 ID="lblTexto1QS" runat="server" Text="Figure Skating Shop es una empresa familiar, que ofrece productos deportivos a patinadores de toda la República Argentina. 

Nuestros integrantes cuentan con una larga trayectoria personal dentro del mundo del patinaje artístico sobre ruedas. Ellos son muy conocidos en el ambiente y respetados por sus 30 años juzgando y enseñando el deporte.

Hemos comprobado que muchos patinadores argentinos confían plenamente en las recomendaciones que les damos a la hora de comprar insumos. Esto ha motivado la creación de empresa.

Debido a la cantidad de conocidos que tenemos a lo largo y a lo ancho del país, necesitamos organizarnos de manera tal que nuestros clientes puedan efectuar y consultar en todo momento el estado de sus pedidos. 

Llevamos adelante este Micro-emprendimiento para mejorar la experiencia de nuestros clientes."
                CssClass="panelTexto"></fss:mietiqueta2>
            <br />
        </p>
    </article>

    <article class="post clearfix">
        <img src="Imagenes/campeon.jpg" class="center-block img-responsive img-rounded img-thumbnail" />
        <br />
        <br />
        <p class="post-contenido text-justify">
            <fss:mietiqueta2 ID="lblTexto2QS" runat="server" Text="La confianza que depositan nuestros clientes en nuestras recomendaciones no sólo se basa en los precios ofrecidos sino también en la experiencia de nuestros integrantes.

Nuestra presencia e intervención en los eventos realizados en nuestro país ha fomentado una constante actualización en lo que hace al catálogo de productos ofrecidos y ha beneficiado considerablemente nuestra relación con los mejores fabricantes de patines."
                CssClass="panelTexto"></fss:mietiqueta2>
            <br />
        </p>
    </article>
    <article class="post clearfix">
        <img src="Imagenes/seleccionado.jpg" class="center-block img-responsive img-rounded img-thumbnail" />
        <br />
        <br />
        <p class="post-contenido text-justify">
            <fss:mietiqueta2 ID="lblTexto3QS" runat="server" Text="Somos únicos porque conocemos el deporte desde todos los puntos de vista (patinador, técnico y juez). 

No somos simples vendedores de productos deportivos, sino que analizamos cada caso en particular y proporcionamos recomendaciones estrictamente técnicas que benefician el rendimiento de nuestros clientes.

Nos diferenciamos del resto porque estudiamos cada caso puntual como si se tratara de un atleta de elite (que muchas veces lo son). Porque tenemos la convicción de que un deportista con la herramienta adecuada puede llegar a ser un atleta.
"
                CssClass="panelTexto"></fss:mietiqueta2>
            <br />
        </p>
    </article>
    <article class="post clearfix">
        <img src="Imagenes/Argentina.jpg" class="center-block img-responsive img-rounded img-thumbnail" />
        <br />
        <br />
        <p class="post-contenido text-justify">
            <fss:mietiqueta2 ID="lblTexto4QS" runat="server" Text="El fuerte lazo que nos une a nuestros clientes es la responsabilidad de proporcionar/cuidar de su más preciado recurso: sus patines e indumentaria deportiva. Buscamos la redefinición de la experiencia del cliente, poniendo el foco en la experiencia completa. Muchos de ellos están cansados de esperar por sus pedidos, o de tener que llamar constantemente al vendedor para consultar por el avance de los mismos. 

Nuestra empresa asegurará que los pedidos estarán disponibles para su consulta las 24hs, además de disponer de un medio de contacto para realizar consultas y reclamos.

La combinación lograda entre las recomendaciones de los expertos y su disponibilidad tecnológica (on-line las 24hs) ofrece una opción sólida y de calidad para el mercado."
                CssClass="panelTexto"></fss:mietiqueta2>
            <br />
        </p>
    </article>
</asp:Content>
<asp:Content ID="Menu" ContentPlaceHolderID="Menu" runat="server">
</asp:Content>
