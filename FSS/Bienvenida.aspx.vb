Imports ent = _03_Entidades
Imports neg = _02_Negocio

Public Class Bienvenida
    Inherits PaginaBase
    Private Sub Bienvenida_Error(sender As Object, e As EventArgs) Handles Me.Error
        TratarErrorSinTry("Bienvenida")
    End Sub


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If miUsuario.login.ToUpper = "ADMINISTRADOR" Then
            PanelAdministrador.Visible = True
            miMensajero.EscribirBitacora("Autenticado", miUsuario.login, "Bienvenida para el usuario " & miUsuario.login)
        Else
            Dim usuarioNeg As New neg.UsuarioN
            If usuarioNeg.EsCliente(miUsuario) Then
                PanelCliente.Visible = True
                miMensajero.EscribirBitacora("Autenticado", miUsuario.login, "Bienvenida para el cliente ")
            ElseIf usuarioNeg.EsVendedor(miUsuario) Then
                PanelVendedor.Visible = True
                miMensajero.EscribirBitacora("Autenticado", miUsuario.login, "Bienvenida para el empleado ")
            End If
        End If
        Try
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Bienvenida", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Bienvenida", ex2)
        End Try
    End Sub
    Private Sub Bienvenida_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        Try
            ControlarAutenticacion("Bienvenida")
            ControlarConsistencia("Bienvenida")
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Bienvenida", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Bienvenida", ex2)
        End Try
    End Sub

    Protected Sub linkCuenta_Click(sender As Object, e As EventArgs) Handles linkCuenta.Click
        Response.Redirect("~/Negocio/Cliente/Cuenta.aspx")
    End Sub

    Protected Sub linkAjustes_Click(sender As Object, e As EventArgs) Handles linkAjustes.Click
        Response.Redirect("~/Negocio/Cliente/Ajustes.aspx")
    End Sub

End Class