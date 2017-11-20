Imports neg = _02_Negocio
Imports ent = _03_Entidades

Public Class Inicio
    Inherits PaginaBase
    Private _noticiaN As New neg.NoticiaN
    Public Property noticiaN() As neg.NoticiaN
        Get
            Return _noticiaN
        End Get
        Set(ByVal value As neg.NoticiaN)
            _noticiaN = value
        End Set
    End Property

    Private Sub Inicio_Error(sender As Object, e As EventArgs) Handles Me.Error
        TratarErrorSinTry("Inicio")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            If Not IsPostBack And Session("Autenticado") Is Nothing Then
                Me.Autenticado = 0
            End If
            enlazarRepeater()
        Catch ex As Exception
            TratarErrorEnCatch("Inicio", ex)
        End Try

    End Sub

    Private Sub Inicio_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        'PONGO EL CONTROL DE DV EN EL PRE-RENDER PORQUE SE EJECUTA ANTES EL LOAD DE ESTA PAGINA Y DESPUES EL DE LA MASTER
        'ESO DA ERROR PORQUE LA VARIABLE DE SESION DEL USUARIO SE SETEA EN EL LOAD DE LA MASTER
        Try
            ControlarConsistencia("Inicio")
            If Not IsPostBack Then
                'limpio la tabla Suceso y mando los sucesos viejos al histórico
                'esto lo hago para que no se culeguen las páginas (si es necesario se comenta la linea siguiente)
                miMensajero.Reset()
            End If
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Inicio", ex)
            'Catch ex2 As Exception
            '    TratarErrorEnCatch("Inicio", ex2)
        End Try

    End Sub
    Public Sub enlazarRepeater()
        'Repeater1.DataSource = noticiaN.listarInicio
        Repeater1.DataSource = noticiaN.listarTodo
        Repeater1.DataBind()
    End Sub
End Class