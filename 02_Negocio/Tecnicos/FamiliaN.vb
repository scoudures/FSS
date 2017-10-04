Imports ent = _03_Entidades
Imports data = _04_Datos
Imports System.Web.UI.WebControls
Public Class FamiliaN

    Private _miMapper As New data.FamiliaM
    Public Property miMapper() As data.FamiliaM
        Get
            Return _miMapper
        End Get
        Set(ByVal value As data.FamiliaM)
            _miMapper = value
        End Set
    End Property

    Private _miFamilia As New ent.Familia
    Public Property miFamilia() As ent.Familia
        Get
            Return _miFamilia
        End Get
        Set(ByVal value As ent.Familia)
            _miFamilia = value
        End Set
    End Property

    Public Function Listar(ByRef unaFamilia As ent.Familia, ByVal suma As Boolean) As List(Of ent.PermisoAbs)
        Try
            Return miMapper.Listar(unaFamilia, suma)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function Listar() As List(Of ent.Familia)
        Try
            Return miMapper.Listar
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function ListarTodos() As List(Of ent.PermisoAbs)
        Try
            Return miMapper.ListarTodos()
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function

    
    Public Function Insert(ByRef unaFamilia As ent.Familia) As Integer
        Try
            Return miMapper.Insert(unaFamilia)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function Delete(ByRef unaFamilia As ent.Familia) As Integer
        Try
            Return miMapper.Delete(unaFamilia)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function Update(ByRef unaFamilia As ent.Familia, ByRef nodos As TreeNodeCollection, ByVal suma As Boolean) As Integer
        Try
            Dim resultado As Integer = 0
            For Each node As TreeNode In nodos
                If node.Parent Is Nothing Then
                    'es un permiso compuesto
                    Dim unPermiso As New ent.Permiso
                    unPermiso.nombre = node.Text
                    unPermiso.seleccionado = node.Checked
                    resultado = miMapper.Asignar(unaFamilia, unPermiso)
                Else
                    'es un permiso simple
                    For Each nodito As TreeNode In node.ChildNodes
                        If Not suma And node.Value > 500 Then
                            Dim unPermiso As New ent.Permiso
                            unPermiso.nombre = nodito.Text
                            unPermiso.seleccionado = nodito.Checked
                            resultado = miMapper.Asignar(unaFamilia, unPermiso)
                        End If
                    Next
                End If
            Next
            Return resultado
        Catch ex2 As ent.miClaseExcepcion
            Throw ex2
        Catch ex As Exception
            Throw ex
        End Try
    End Function
#Region "Codigo OLD"
    'Public Function ListarIN(ByRef miFamilia As ent.Familia) As List(Of ent.Familia)
    '    Try
    '        Return miMapper.ListarIN(miFamilia)
    '    Catch ex As ent.miClaseExcepcion
    '        Throw ex
    '    End Try
    'End Function
    'Public Function ListarNOTIN(ByRef miFamilia As ent.Familia) As List(Of ent.Familia)
    '    Try
    '        Return miMapper.ListarNOTIN(miFamilia)
    '    Catch ex As ent.miClaseExcepcion
    '        Throw ex
    '    End Try
    'End Function
    'Public Sub Asignar(ByRef unaFamilia As ent.Familia, ByRef unPermiso As ent.Permiso)
    '    Try
    '        miMapper.Asignar(unaFamilia, unPermiso)
    '    Catch ex As ent.miClaseExcepcion
    '        Throw ex
    '    End Try
    'End Sub
    'Public Sub Asignar(ByRef unaFamilia As ent.Familia, ByRef otraFamilia As ent.Familia)
    '    Try
    '        miMapper.Asignar(unaFamilia, otraFamilia)
    '    Catch ex As ent.miClaseExcepcion
    '        Throw ex
    '    End Try
    'End Sub
    'Public Sub Quitar(ByRef unaFamilia As ent.Familia, ByRef unPermiso As ent.Permiso)
    '    Try
    '        miMapper.Quitar(unaFamilia, unPermiso)
    '    Catch ex As ent.miClaseExcepcion
    '        Throw ex
    '    End Try
    'End Sub
    'Public Sub Quitar(ByRef unaFamilia As ent.Familia, ByRef otraFamilia As ent.Familia)
    '    Try
    '        miMapper.Quitar(unaFamilia, otraFamilia)
    '    Catch ex As ent.miClaseExcepcion
    '        Throw ex
    '    End Try
    'End Sub
#End Region
End Class
