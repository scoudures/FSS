<%@ Page Title="FSS" Language="vb" AutoEventWireup="false" MasterPageFile="~/Maestra.Master" CodeBehind="VideoModificar.aspx.vb" Inherits="FSS.VideoModificar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Titulo" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Contenido" runat="server">
<article>
     <div style="text-align:center">
    <asp:label ID="lblModVideo" runat="server" Text="Modificar Video" CssClass="supertitulo"></asp:label>
    </div>
    <asp:Panel ID="Panel1" runat="server" CssClass="panelTexto" style="text-align:center">
                    <table style="width:90%" >
                        <tr>
                            <td style="width:150px"> <asp:Label ID="LblTitulo" runat="server" Text="Titulo" Font-Bold="True"></asp:Label></td>
                            <td style="width:350px "><asp:TextBox Width="100%"  ID="TxtTitulo" runat="server" Rows="2" TextMode="MultiLine"></asp:TextBox></td>    
                            <td><asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="TxtTitulo" runat="server" Text="*" ErrorMessage="" ForeColor="red"></asp:RequiredFieldValidator> </td>        
                        </tr>
                         <tr>
                               <td style="width:150px"> <asp:Label ID="LblArchivo" runat="server" Text="Archivo" Font-Bold="True"></asp:Label></td>
                             <td style="width:350px ">
                                 <asp:TextBox ID="txtRuta" runat="server" Text="" Visible="false"></asp:TextBox>
                                 <asp:FileUpload ID="FileUpload1" runat="server" CssClass="btn btn-default"  Width="300px" />
                                 <br />
                                 <br />
                             </td>    
                            <td><asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="TxtRuta" runat="server" Text="*" ErrorMessage="" ForeColor="red" ></asp:RequiredFieldValidator> </td>          

                        </tr>
                    <tr>
                        <td colspan="3" s>
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="red" HeaderText="Complete los campos"  /> </td>
                    </tr>

                    </table>

                        <br />
                       

                   <div id="divBotones" style="width:100%">
                       <br />
                    <asp:Button ID="btnGuardar" runat="server" CssClass="btn btn-default" Text="Guardar"  OnClick="btnGuardar_Click" />
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
