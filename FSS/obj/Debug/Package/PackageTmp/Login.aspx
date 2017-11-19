<%@ Page Title="FSS" Language="vb" AutoEventWireup="false" CodeBehind="Login.aspx.vb" MasterPageFile="~/Maestra.Master" Inherits="FSS.Login" %>
<%@ Register assembly="FSS" namespace="FSS" TagPrefix="fss" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Titulo" ContentPlaceHolderID="Titulo" runat="server">
    <fss:mietiqueta ID="menuLogin" runat="server" Text="Login"></fss:mietiqueta>
</asp:Content>
<asp:Content ID="Contenido" ContentPlaceHolderID="Contenido" runat="server">

<!-- Modal Si No -->
<div id="modalConfirmar" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">FSS</h4>
      </div>
      <div class="modal-body">
          <asp:Label ID="msgModalSiNo" runat="server" Text="Label"></asp:Label>
      </div>
      <div class="modal-footer">
        <button type="button"  ID="btnModalSi" runat="server" class="btn btn-success" data-dismiss="modal"></button>
        <button type="button"  ID="btnModalNo" runat="server" class="btn btn-danger" data-dismiss="modal"></button>
      </div>
    </div>

  </div>
</div>

<!-- Modal Mensaje -->
<div id="modalMensaje" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">FSS</h4>
      </div>
      <div class="modal-body">
          <asp:Label ID="msgModal" runat="server" Text="Label"></asp:Label>
      </div>
      <div class="modal-footer">
        <button type="button"  ID="OK" runat="server" class="btn btn-success" data-dismiss="modal"></button>
      </div>
    </div>

  </div>
</div>
    <article style="text-align:center">
        <asp:Panel runat="server" CssClass="panelTexto" HorizontalAlign="Center">
    <%--<fss:mietiqueta ID="lblLogin" runat="server" Text="Usuario" CssClass="subtitulo"></fss:mietiqueta>&nbsp;&nbsp;
    <asp:TextBox ID="txtLogin" runat="server" Text="Administrador"></asp:TextBox> 
    <br /> <br />  
    <fss:mietiqueta ID="lblPassword" runat="server" Text="Contraseña" CssClass="subtitulo"></fss:mietiqueta>&nbsp;&nbsp;
    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Text="123"></asp:TextBox> 
    <br /> <br />--%>
        <div id="loginbox" style="margin-top:50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">                    
                <div style="margin-bottom: 25px" class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                        <input id="txtLogin" runat="server" type="text" class="form-control" name="username" value="Administrador" placeholder="username or email">                                        
                                    </div>
                                
                            <div style="margin-bottom: 25px" class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                        <input id="txtPassword" runat="server" type="password" class="form-control" name="password" placeholder="password">
                                    </div>
                                <div style="margin-top:10px" class="form-group">
        <div class="col-sm-12 controls">
        <fss:miboton ID="btnAceptar" runat="server" Text="Aceptar" CssClass="btn btn-success"/>&nbsp;&nbsp;
        <fss:miboton ID="btnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-danger"/>
        </div>
        </div>
        
        </div>
        <br />
        <br />
        <asp:LinkButton ID="lnkRecuperar" runat="server" PostBackUrl="~/RecuperarCuenta.aspx">Olvidé mi contraseña</asp:LinkButton>
        <br />
        <br />
        </asp:Panel>
        <asp:Panel ID="Panel1" runat="server" Width="600px" HorizontalAlign="Center"></asp:Panel>
     </article>
    <%--<article>
          <div class="container">    
        <div id="loginbox" style="margin-top:50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">                    
            <div class="panel panel-info" >
                    <div class="panel-heading">
                        <div class="panel-title">Login</div>
                        <div style="float:right; font-size: 80%; position: relative; top:-10px"><fss:miLink2 ID="lnkRecuperar" runat="server" PostBackUrl="~/RecuperarCuenta.aspx">Olvidé mi contraseña</fss:miLink2></div>
                    </div>     

                    <div style="padding-top:30px" class="panel-body" >

                        <div style="display:none" id="login-alert" class="alert alert-danger col-sm-12"></div>
                            
                        <form id="loginform" class="form-horizontal" role="form">
                                    
                            <div style="margin-bottom: 25px" class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                        <input id="txtLogin" runat="server" type="text" class="form-control" name="username" value="Administrador" placeholder="username or email">                                        
                                    </div>
                                
                            <div style="margin-bottom: 25px" class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                        <input id="txtPassword" runat="server" type="password" class="form-control" name="password" placeholder="password">
                                    </div>
                                <div style="margin-top:10px" class="form-group">
                                    <!-- Button -->
                                    <div class="col-sm-12 controls">
                                      <asp:button ID="btnAceptar" runat="server" Text="Aceptar" CssClass="btn btn-success" />
                                        <fss:miboton ID="btnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-danger"/>
                                    </div>
                                </div>
                            </form>     
                        </div>                     
                    </div>  
        </div>
    </div>
    </article>--%>
</asp:Content>
<asp:Content ID="Menu" ContentPlaceHolderID="Menu" runat="server">
</asp:Content>
