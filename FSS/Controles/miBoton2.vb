Imports ent = _03_Entidades
Public Class miBoton2
    Inherits System.Web.UI.WebControls.Button
    Implements iTraducible

    Private _Target As String
    Public Property Target() As String
        Get
            Return _Target
        End Get
        Set(ByVal value As String)
            _Target = value
        End Set
    End Property

    Public Overrides Function ToString() As String
        Return Me.ID
    End Function

    Public Sub Cambiar(tuLeyenda As ent.Leyenda) Implements iTraducible.Cambiar
        Me.Text = tuLeyenda.texto
    End Sub
End Class
