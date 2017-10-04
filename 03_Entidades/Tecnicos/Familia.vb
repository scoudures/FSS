Public Class Familia
    Inherits PermisoAbs

    Public Overrides Function RealizarOperacion() As Integer
        Dim resultado As Integer = 0
        For Each perm As PermisoAbs In misPermisos
            If perm.QueSos = 2 Then 'permiso
                DirectCast(perm, Permiso).RealizarOperacion()
                resultado = 3
            ElseIf perm.QueSos = 1 Then 'familia
                DirectCast(perm, Familia).RealizarOperacion()
                resultado = 4
            End If
        Next
        Return resultado
    End Function

    Public Function AgregarPermiso(ByRef unPermiso As PermisoAbs) As Integer
        Dim resultado As Integer = 0
        If Not unPermiso Is Nothing Then
            misPermisos.Add(unPermiso)
            resultado = 1
        End If
        Return resultado
    End Function

    Public Function QuitarPermiso(ByRef unPermiso As PermisoAbs) As Integer
        Dim resultado As Integer = 0
        If Not unPermiso Is Nothing Then
            misPermisos.Remove(unPermiso)
            resultado = 1
        End If
        Return resultado
    End Function

    Public Function BuscarPermiso(ByRef unPermiso As Permiso) As Permiso
        Dim elPermiso As New Permiso
        If Not unPermiso Is Nothing Then
            For Each perm As PermisoAbs In misPermisos
                If perm.QueSos = 2 Then 'permiso
                    elPermiso = DirectCast(perm, Permiso)
                ElseIf perm.QueSos = 1 Then 'familia
                    elPermiso = DirectCast(perm, Familia).BuscarPermiso(unPermiso)
                End If
            Next
        End If
        Return elPermiso
    End Function
    Public Overrides Function QueSos() As Integer
        Return 1
    End Function
    Sub New()

    End Sub
End Class
