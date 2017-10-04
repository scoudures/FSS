Imports neg = _02_Negocio
Imports ent = _03_Entidades

Public Class Marca
    Inherits PaginaBase

    Private Sub Marca_Error(sender As Object, e As EventArgs) Handles Me.Error
        TratarErrorSinTry("Marca")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            'para que no fallen los validadores
            Page.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Marca", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Marca", ex2)
        End Try

    End Sub

    Private Sub Marca_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        Try

            ControlarConsistencia("Marca")
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Marca", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Marca", ex2)
        End Try

    End Sub
End Class