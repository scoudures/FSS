Imports ent = _03_Entidades
Public Class miBoton
    Inherits System.Web.UI.WebControls.Button
    Implements iPresentable
    Implements iTraducible

    Public Sub mostrate() Implements iPresentable.mostrate
        Me.Visible = True
    End Sub

    Public Sub ocultate() Implements iPresentable.ocultate
        Me.Visible = False
    End Sub

    Public Overrides Function ToString() As String
        Return Me.ID
    End Function

    Public Sub Cambiar(tuLeyenda As ent.Leyenda) Implements iTraducible.Cambiar
        Me.Text = tuLeyenda.texto
    End Sub
End Class