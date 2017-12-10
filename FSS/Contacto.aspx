<%@ Page Title="FSS" Language="vb" AutoEventWireup="false" MasterPageFile="~/Maestra.Master" CodeBehind="Contacto.aspx.vb" Inherits="FSS.Contacto" %>
<%@ Register assembly="FSS" namespace="FSS" TagPrefix="fss" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Titulo" ContentPlaceHolderID="Titulo" runat="server">
<fss:mietiqueta2 ID="menuContacto" runat="server" Text="Contacto"></fss:mietiqueta2>
</asp:Content>
<asp:Content ID="Contenido" ContentPlaceHolderID="Contenido" runat="server">
<article style="text-align: left; align-items:flex-start">
    <asp:Panel runat="server" CssClass="panelTexto">
    <div style="text-align:left"  >
    <h1 style="background-color:gray; color:white; font-weight:bold" class="text-uppercase"><fss:mietiqueta2 ID="lblContacto" runat="server" Text="Contacto:" Font-Bold="True" Style="font-size:x-large"></fss:mietiqueta2></h1> <br />  
    </div>
    <div style="height: 448px">
        <div style="padding-left:100px">
        <br />
        <fss:mietiqueta2 ID="LblNombre" runat="server" Text="Nombre (Obligatorio)" Font-Bold="True"></fss:mietiqueta2><br />
        <asp:TextBox ID="TxtNombre" runat="server" Width="246px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="TxtNombre" runat="server" ErrorMessage="Ingrese un nombre"  ForeColor ="red">  </asp:RequiredFieldValidator>
        <br />
        <br />
        <fss:mietiqueta2 ID="LblEmail" runat="server" Text="E-mail (Obligatorio)" Font-Bold="True"></fss:mietiqueta2><br />
        <asp:TextBox ID="Txtemail" runat="server" Width="246px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="Txtemail" runat="server" ErrorMessage="Ingrese un email" ForeColor="red">  </asp:RequiredFieldValidator> &nbsp
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtemail" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"  ForeColor="red" ErrorMessage="E-mail invalido"></asp:RegularExpressionValidator>
        <br />
        <br />
        <asp:Panel ID="panelNiveles" runat="server" HorizontalAlign="Left" CssClass="panelTexto">
        <fss:mietiqueta2 ID="lblNivel" runat="server" Font-Bold="True"  Text="Por favor, seleccione su nivel de competencia: " CssClass="panelTexto"></fss:mietiqueta2><br /><br />
        <asp:DropDownList ID="lstNivel" runat="server" AutoPostBack="false"></asp:DropDownList><br /><br />
        </asp:Panel>
        <br />  <br />
        <fss:mietiqueta2 ID="LblAsunto" runat="server" Text="Asunto" Font-Bold="True"></fss:mietiqueta2><br />
        <asp:TextBox ID="txtAsunto" runat="server" Width="246px"></asp:TextBox><br />
        <br />
        <fss:mietiqueta2 ID="LblMensaje" runat="server" Text="Mensaje" Font-Bold="True"></fss:mietiqueta2><br />
        <asp:TextBox ID="TxtMensaje" Width="350px" runat="server" Height="95px" TextMode="MultiLine"></asp:TextBox><br />
        <br /> 
        
        <%--<asp:Button ID="BtnEnviarEmail" CssClass="botonRojo" runat="server" Text="Enviar" Width="162px" Height="42px" style="margin-left:70px"/>--%>
        <fss:miboton2 ID="btnEnviar" runat="server" Text="Enviar" CssClass="btn btn-success"></fss:miboton2><br />
            <asp:Label ID="LblMsg" runat="server" Text=""></asp:Label>
            </div>
        </div>
    <br />
    <br />
    </asp:Panel>
    <asp:Panel ID="Panel1" runat="server" Width="600px" HorizontalAlign="Center"></asp:Panel><br /><br />
</article>
</asp:Content>
<asp:Content ID="Menu" ContentPlaceHolderID="Menu" runat="server">
</asp:Content>
