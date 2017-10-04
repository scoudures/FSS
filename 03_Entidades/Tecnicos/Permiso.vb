Public Class Permiso
    Inherits PermisoAbs

    Public Overrides Function RealizarOperacion() As Integer
        Dim resultado As Integer = 0
        If visible Then
            visible = False
            resultado = 2
        Else
            visible = True
            resultado = 1
        End If
        Return resultado
    End Function

    Public Overrides Function QueSos() As Integer
        Return 2
    End Function
    Sub New()

    End Sub
End Class
