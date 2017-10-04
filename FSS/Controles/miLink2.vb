Imports ent = _03_Entidades
Public Class miLink2

    Inherits System.Web.UI.WebControls.HyperLink

    Implements iTraducible

    Public Overrides Function ToString() As String
        Return Me.ID
    End Function

    Public Sub Cambiar(tuLeyenda As ent.Leyenda) Implements iTraducible.Cambiar
        Me.Text = tuLeyenda.texto
    End Sub
End Class

