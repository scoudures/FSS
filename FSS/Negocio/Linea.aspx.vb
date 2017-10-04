Imports neg = _02_Negocio
Imports ent = _03_Entidades

Public Class Linea
    Inherits PaginaBase

    Private Sub Linea_Error(sender As Object, e As EventArgs) Handles Me.Error
        TratarErrorSinTry("Linea")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            'para que no fallen los validadores
            Page.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Linea", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Linea", ex2)
        End Try

    End Sub

    Private Sub Linea_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        Try

            ControlarConsistencia("Linea")
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Linea", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Linea", ex2)
        End Try

    End Sub
End Class