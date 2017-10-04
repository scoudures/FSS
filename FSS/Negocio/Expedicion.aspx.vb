Imports neg = _02_Negocio
Imports ent = _03_Entidades
Public Class Expedicion
    Inherits PaginaBase

    Private Sub Expedicion_Error(sender As Object, e As EventArgs) Handles Me.Error
        TratarErrorSinTry("Expedicion")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'no imlementado, se listan los pedidos facturados
    End Sub

    Private Sub Expedicion_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        Try
            ControlarAutenticacion("Expedicion")
            ControlarConsistencia("Expedicion")
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Expedicion", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Expedicion", ex2)
        End Try

    End Sub
End Class