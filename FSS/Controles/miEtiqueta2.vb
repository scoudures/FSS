﻿Imports ent = _03_Entidades

Public Class miEtiqueta2
    Inherits System.Web.UI.WebControls.Label
    Implements iTraducible

    Public Overrides Function ToString() As String
        Return Me.ID
    End Function

    Public Sub Cambiar(tuLeyenda As ent.Leyenda) Implements iTraducible.Cambiar
        Me.Text = tuLeyenda.texto
    End Sub
    

End Class
