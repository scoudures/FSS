<%@ Page Title="FSS" Language="vb" AutoEventWireup="false" MasterPageFile="~/Maestra.Master" CodeBehind="NoticiaNueva.aspx.vb" Inherits="FSS.NoticiaNueva" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Titulo" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Contenido" runat="server">
   <article>
     <div style="text-align:right">
    <asp:label ID="lblNoti" runat="server" Text="Noticia Nueva" CssClass="supertitulo"></asp:label>
    </div>
    <asp:Panel ID="Panel1" runat="server" CssClass="panelTexto" style="text-align:center">

                    <table style="width:90%" >
                        <tr>
                            <td style="width:150px"> <asp:Label ID="LblTitulo" runat="server" Text="Titulo" Font-Bold="True"></asp:Label></td>
                            <td style="width:350px "><asp:TextBox Width="100%"  ID="TxtTitulo" runat="server" Rows="2" TextMode="MultiLine"></asp:TextBox></td>    
                            <td><asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="TxtTitulo" runat="server" Text="*" ErrorMessage="" ForeColor="red"></asp:RequiredFieldValidator> </td>        
                        </tr>
                          <tr>
                            <td style="width:150px"> <asp:Label ID="LblSubtitulo" runat="server" Text="Subtitulo" Font-Bold="True"></asp:Label></td>
                             <td style="width:350px "><asp:TextBox Width="100%"  ID="TxtSubtitulo" runat="server" Rows="2" TextMode="MultiLine"></asp:TextBox></td>    
                            <td><asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="TxtSubtitulo" runat="server" text="*" ErrorMessage="" ForeColor="red"></asp:RequiredFieldValidator> </td>          
                        </tr>
                        <tr>
                            <td style="width:150px"> <asp:Label ID="LblTexto" runat="server" Text="Texto" Font-Bold="True"></asp:Label></td>
                             <td style="width:350px "><asp:TextBox Width="100%"  ID="TxtTexto" runat="server" Rows="10" TextMode="MultiLine"></asp:TextBox></td>    
                            <td><asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="TxtTexto" runat="server" Text="*" ErrorMessage="" ForeColor="red" ></asp:RequiredFieldValidator> </td>          
                        </tr>
                        <tr>
                               <td style="width:150px"> <asp:Label ID="LblRutaImagen" runat="server" Text="Imagen" Font-Bold="True"></asp:Label></td>
                             <td style="width:350px "><asp:FileUpload ID="FileUpload1" runat="server" CssClass="btn btn-default" Width="300px" /> </td>    
                             <td><asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="FileUpload1" runat="server" Text="*" ErrorMessage="" ForeColor="red" ></asp:RequiredFieldValidator> </td>          

                        </tr>
                    <tr>
                        <td colspan="3" s>
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="red" HeaderText="Complete los campos"  /> </td>
                    </tr>

                    </table>
                    <br />
                    <table style="width:90%" >
                        <tr>
                            <td style="width:150px"> <asp:Label ID="lblTitPort" runat="server" Text="Titulo en Portugues" Font-Bold="True"></asp:Label></td>
                            <td style="width:350px "><asp:TextBox Width="100%"  ID="txtTitPort" runat="server" Rows="2" TextMode="MultiLine"></asp:TextBox></td>    
                            <td style="width:150px"> <asp:Label ID="lblTitEng" runat="server" Text="Titulo en Ingles" Font-Bold="True"></asp:Label></td>
                            <td style="width:350px "><asp:TextBox Width="100%"  ID="txtTitEng" runat="server" Rows="2" TextMode="MultiLine"></asp:TextBox></td>    
                        </tr>
                          <tr>
                            <td style="width:150px"> <asp:Label ID="lblSubTitPort" runat="server" Text="Subtitulo en Portugues" Font-Bold="True"></asp:Label></td>
                             <td style="width:350px "><asp:TextBox Width="100%"  ID="txtSubTitPort" runat="server" Rows="2" TextMode="MultiLine"></asp:TextBox></td>    
                              <td style="width:150px"> <asp:Label ID="lblSubTitEng" runat="server" Text="Subtitulo en Ingles" Font-Bold="True"></asp:Label></td>
                             <td style="width:350px "><asp:TextBox Width="100%"  ID="txtSubTitEng" runat="server" Rows="2" TextMode="MultiLine"></asp:TextBox></td>    
                        </tr>
                        <tr>
                            <td style="width:150px"> <asp:Label ID="lblTextoPort" runat="server" Text="Texto en Portugues" Font-Bold="True"></asp:Label></td>
                             <td style="width:350px "><asp:TextBox Width="100%"  ID="txtTextoPort" runat="server" Rows="10" TextMode="MultiLine"></asp:TextBox></td>   
                            <td style="width:150px"> <asp:Label ID="lblTextoEng" runat="server" Text="Texto en Ingles" Font-Bold="True"></asp:Label></td>
                             <td style="width:350px "><asp:TextBox Width="100%"  ID="txtTextoEng" runat="server" Rows="10" TextMode="MultiLine"></asp:TextBox></td>     
                        </tr>
                    </table>
                        <br />
                       

                   <div id="divBotones" style="width:100%">
                       <br />
                    <asp:Button ID="btnGuardar" runat="server" CssClass="btn btn-success" Text="Guardar"  OnClick="btnGuardar_Click"/>
                        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                    <asp:Button ID="btnCancelar" runat="server" CssClass="btn btn-danger" CausesValidation="false" Text="Cancelar" />
                       <br />
                       <br />
                  </div>

</asp:Panel>
</article>    
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Menu" runat="server">
</asp:Content>
