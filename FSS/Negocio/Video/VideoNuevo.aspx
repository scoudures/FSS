<%@ Page Title="FSS" Language="vb" AutoEventWireup="false" MasterPageFile="~/Maestra.Master" CodeBehind="VideoNuevo.aspx.vb" Inherits="FSS.VideoNuevo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Titulo" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Contenido" runat="server">
   <article>
     <div style="text-align:center">
    <asp:label ID="lblNuevoVideo" runat="server" Text="Video Nuevo" CssClass="supertitulo"></asp:label>
    </div>
    <asp:Panel ID="Panel1" runat="server" CssClass="panelTexto" style="text-align:center">

                    <table class="table table-responsive">
                        <tr>
                            <td style="width:150px"> <asp:Label ID="LblTitulo" runat="server" Text="Titulo" Font-Bold="True"></asp:Label></td>
                            <td style="width:350px "><asp:TextBox Width="100%"  ID="TxtTitulo" runat="server" Rows="2" TextMode="MultiLine"></asp:TextBox></td>    
                            <td><asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="TxtTitulo" runat="server" Text="*" ErrorMessage="" ForeColor="red"></asp:RequiredFieldValidator> </td>        
                        </tr>
                        <tr>
                               <td style="width:150px"> <asp:Label ID="LblArchivo" runat="server" Text="Archivo" Font-Bold="True"></asp:Label></td>
                             <td style="width:350px "><asp:FileUpload ID="FileUpload1" runat="server" CssClass="btn btn-default" Width="300px" /> </td>    
                             <td><asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="FileUpload1" runat="server" Text="*" ErrorMessage="" ForeColor="red" ></asp:RequiredFieldValidator> </td>          

                        </tr>
                    <tr>
                        <td colspan="3" s>
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="red" HeaderText="Complete los campos"  /> </td>
                    </tr>

                    </table>

                        <br />
                       

                   <div id="divBotones" style="width:100%">
                       <br />
                    <asp:Button ID="btnGuardar" runat="server" CssClass="btn btn-default" Text="Guardar"  OnClick="btnGuardar_Click"/>
                        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                    <asp:Button ID="btnCancelar" runat="server" CssClass="btn btn-default" CausesValidation="false" Text="Cancelar" />
                       <br />
                       <br />
                  </div>

</asp:Panel>
</article>    
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Menu" runat="server">
</asp:Content>
