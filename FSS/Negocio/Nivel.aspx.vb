Imports neg = _02_Negocio
Imports ent = _03_Entidades

Public Class Nivel
    Inherits PaginaBase

    Private Sub Nivel_Error(sender As Object, e As EventArgs) Handles Me.Error
        TratarErrorSinTry("Nivel")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            'para que no fallen los validadores
            Page.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Nivel", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Nivel", ex2)
        End Try

    End Sub

    Private Sub Nivel_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        Try

            ControlarConsistencia("Nivel")
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Nivel", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Nivel", ex2)
        End Try

    End Sub
End Class