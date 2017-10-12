Imports neg = _02_Negocio
Imports ent = _03_Entidades
Public Class Traductor
    Dim miTraductor As New neg.TraductorN

    Sub traducirPaginaPara(ByRef parent As Control, ByRef unUsuario As ent.Usuario)
        For Each c As Control In parent.Controls
            'traducir controles
            If Not c.ID Is Nothing Then

                If TypeOf c Is iTraducible Then
                    traducirPara(c, unUsuario)
                End If

            End If

            'si el control contiene otros controles itero sobre ellos
            If (c.Controls.Count > 0) Then
                'llamada recursiva
                traducirPaginaPara(c, unUsuario)
            End If
        Next
    End Sub

    Public Sub traducirPara(ByRef c As Control, ByRef unUsuario As ent.Usuario)
        If TypeOf c Is iTraducible Then
            'Dim Ctrl As iTraducible = TryCast(c, iPresentable)
            Dim Ctrl As iTraducible = TryCast(c, iTraducible)
            Dim leye As New ent.Leyenda
            'If InStr(c.ID, "Contenido_RepeaterLinea_LinkLinea_") > 0 Then
            If InStr(c.ID, "LinkLinea") > 0 Then
                leye.texto = obtenerLeyenda(TryCast(c, System.Web.UI.WebControls.HyperLink).Target, unUsuario)
            ElseIf InStr(c.ID, "Noticia") > 0 Then
                'leye.texto = obtenerLeyenda(TryCast(c, System.Web.UI.WebControls.Label).CssClass, unUsuario
                Dim inicio As String
                inicio = c.ID.Substring(0, InStr(c.ID, "Noticia") - 1)
                leye.texto = obtenerLeyenda(inicio + "_" + TryCast(c, System.Web.UI.WebControls.HyperLink).Target, unUsuario)
            Else
                leye.texto = obtenerLeyenda(c.ID, unUsuario)
            End If
            Ctrl.Cambiar(leye)
        End If
    End Sub
    Function obtenerLeyenda(idControl As String, ByRef unUsuario As ent.Usuario) As String

        Return miTraductor.ObtenerLeyendaBD(idControl, unUsuario)
        'esto lo puedo hacer también con una lista de traducciones para no tener que ir y venir al servidor
    End Function

End Class