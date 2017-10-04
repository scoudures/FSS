Imports ent = _03_Entidades
Imports data = _04_Datos
Public Class LineaN

    Private _miMapper As New data.LineaM
    Public Property miMapper() As data.LineaM
        Get
            Return _miMapper
        End Get
        Set(ByVal value As data.LineaM)
            _miMapper = value
        End Set
    End Property

    Private _miLinea As New ent.Linea
    Public Property miLinea() As ent.Linea
        Get
            Return _miLinea
        End Get
        Set(ByVal value As ent.Linea)
            _miLinea = value
        End Set
    End Property

    Public Function listar() As List(Of ent.Linea)
        Try
            Dim miLista As New List(Of ent.Linea)
            Dim unaLista As New List(Of ent.Linea)
            unaLista = miMapper.listar
            For Each lin As ent.Linea In unaLista
                If lin.descripcion <> "Otros" Then
                    miLista.Add(lin)
                End If
            Next
            Return miLista
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function getByCodigo(ByRef unaLinea As ent.Linea) As ent.Linea
        Try
            Return miMapper.getByCodigo(unaLinea)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function Nuevo(ByRef unaLinea As ent.Linea) As Integer
        Try
            Return miMapper.Nuevo(unaLinea)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function Modificar(ByRef unaLinea As ent.Linea) As Integer
        Try
            Return miMapper.Modificar(unaLinea)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function Eliminar(ByRef unaLinea As ent.Linea) As Integer
        Try
            Return miMapper.Eliminar(unaLinea)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function

End Class
