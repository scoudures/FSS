Imports neg = _02_Negocio
Imports ent = _03_Entidades

Public Class Color
    Inherits PaginaBase

    Private Sub Color_Error(sender As Object, e As EventArgs) Handles Me.Error
        TratarErrorSinTry("Color")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            'para que no fallen los validadores
            Page.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Color", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Color", ex2)
        End Try

    End Sub

    Private Sub Color_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        Try

            ControlarConsistencia("Color")
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Color", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Color", ex2)
        End Try

    End Sub
End Class