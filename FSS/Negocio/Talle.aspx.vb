Imports neg = _02_Negocio
Imports ent = _03_Entidades

Public Class Talle
    Inherits PaginaBase

    Private Sub Talle_Error(sender As Object, e As EventArgs) Handles Me.Error
        TratarErrorSinTry("Talle")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            'para que no fallen los validadores
            Page.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Talle", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Talle", ex2)
        End Try

    End Sub

    Private Sub Talle_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        Try

            ControlarConsistencia("Talle")
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Talle", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Talle", ex2)
        End Try

    End Sub
End Class