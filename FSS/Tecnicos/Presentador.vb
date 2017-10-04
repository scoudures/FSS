Imports neg = _02_Negocio
Imports ent = _03_Entidades
Public Class Presentador

    Private Sub mostrarPara(ByRef c As Control, ByRef unUsuario As ent.Usuario)
        For Each perm As ent.Permiso In unUsuario.misPermisos
            If TypeOf c Is iPresentable And c.ID = perm.nombre Then
                Dim Ctrl As iPresentable = DirectCast(c, iPresentable)
                Ctrl.mostrate()
            End If
        Next
    End Sub

    Sub mostrarPaginaPara(ByRef parent As Control, ByRef unUsuario As ent.Usuario)
        For Each c As Control In parent.Controls
            'mostrar controles
            If Not c.ID Is Nothing Then

                If TypeOf c Is iPresentable Then
                    'If c.ID = "menuBienvenida" Then
                    mostrarPara(c, unUsuario)
                    'End If
                End If

            End If

            'si el control contiene otros controles itero sobre ellos
            If (c.Controls.Count > 0) Then
                'llamada recursiva
                mostrarPaginaPara(c, unUsuario)
            End If
        Next
    End Sub


    Sub ocultarTodo(ByRef parent As Control)
        For Each c As Control In parent.Controls
            'ocultar controles
            If Not c.ID Is Nothing Then
                If TypeOf c Is iPresentable Then
                    'oculto todo menos los mensajes del login fallido
                    If c.ID <> "msgVerificar" And c.ID <> "msgIngresarDatos" And c.ID <> "msgAlUsuario" Then
                        ocultar(c)
                    End If
                End If
            End If
            'si el control contiene otros controles itero sobre ellos
            If (c.Controls.Count > 0) Then
                'llamada recursiva
                ocultarTodo(c)
            End If
        Next
    End Sub

    Private Sub ocultar(ByRef c As Control)
        If TypeOf c Is iPresentable Then
            Dim Ctrl As iPresentable = TryCast(c, iPresentable)
            Ctrl.ocultate()
        End If
    End Sub
End Class
