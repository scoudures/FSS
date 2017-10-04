Imports neg = _02_Negocio
Imports ent = _03_Entidades

Public Class Videos
    Inherits PaginaBase
    Private _videoN As New neg.VideoN
    Public Property videoN() As neg.VideoN
        Get
            Return _videoN
        End Get
        Set(ByVal value As neg.VideoN)
            _videoN = value
        End Set
    End Property

    Private Sub Videos_Error(sender As Object, e As EventArgs) Handles Me.Error
        TratarErrorSinTry("Videos")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            enlazarRepeater()
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Videos", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Videos", ex2)
        End Try
    End Sub

    Private Sub Videos_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        Try
            ControlarConsistencia("Videos")
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Videos", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Videos", ex2)
        End Try
    End Sub
    Public Sub enlazarRepeater()
        'Repeater1.DataSource = noticiaN.listarInicio
        Repeater1.DataSource = videoN.listarTodo
        Repeater1.DataBind()
    End Sub
End Class