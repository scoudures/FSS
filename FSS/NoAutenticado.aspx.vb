Imports neg = _02_Negocio
Imports ent = _03_Entidades

Public Class NoAutenticado
    Inherits PaginaBase
    Private Sub NoAutenticado_Error(sender As Object, e As EventArgs) Handles Me.Error
        TratarErrorSinTry("NoAutenticado")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            miMensajero.EscribirBitacora("NoAutenticado", miUsuario.login, "Fue redireccionado a la página de 'No Autenticado'")
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("NoAutenticado", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("NoAutenticado", ex2)
        End Try
    End Sub

    Private Sub NoAutenticado_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        Try
            ControlarConsistencia("NoAutenticado")
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("NoAutenticado", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("NoAutenticado", ex2)
        End Try
    End Sub
End Class