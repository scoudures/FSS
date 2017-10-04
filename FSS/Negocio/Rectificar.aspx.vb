Imports neg = _02_Negocio
Imports ent = _03_Entidades

Public Class Rectificar
    Inherits PaginaBase

    Private Sub Rectificar_Error(sender As Object, e As EventArgs) Handles Me.Error
        TratarErrorSinTry("Rectificar")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'no implementado, será una página donde el vendedor modificará los items de un pedido
    End Sub

    Private Sub Rectificar_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        Try
            ControlarAutenticacion("Rectificar")
            ControlarConsistencia("Rectificar")
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Rectificar", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Rectificar", ex2)
        End Try

    End Sub
End Class