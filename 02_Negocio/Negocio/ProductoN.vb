Imports ent = _03_Entidades
Imports data = _04_Datos

Public Class ProductoN

    Private _miMapper As New data.ProductoM
    Public Property miMapper() As data.ProductoM
        Get
            Return _miMapper
        End Get
        Set(ByVal value As data.ProductoM)
            _miMapper = value
        End Set
    End Property

    Private _miProducto As New ent.Producto
    Public Property miProducto() As ent.Producto
        Get
            Return _miProducto
        End Get
        Set(ByVal value As ent.Producto)
            _miProducto = value
        End Set
    End Property

    Public Function listarUno() As List(Of ent.Producto)
        Try
            Return miMapper.listarUno(miProducto)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function listar() As List(Of ent.Producto)
        Try
            Return miMapper.listar
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function listarVista() As List(Of ent.ProductoVista)
        Try
            Dim miLista As New List(Of ent.ProductoVista)
            Dim lista As New List(Of ent.Producto)
            lista = miMapper.listar
            For Each prod As ent.Producto In lista
                Dim unProd As New ent.ProductoVista
                unProd.inventario = prod.inventario
                unProd.descripcion = prod.descripcion
                miLista.Add(unProd)
            Next
            Return miLista
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function listarConNiveles() As List(Of ent.Producto)
        Try
            Return miMapper.listarConNiveles
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function listar(ByRef unaLinea As ent.Linea) As List(Of ent.Producto)
        Try
            Return miMapper.listar(unaLinea)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function Nuevo() As Integer
        Try
            Return miMapper.Nuevo(miProducto)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function Modificar() As Integer
        Try
            Return miMapper.Modificar(miProducto)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function Modificar2() As Integer
        Try
            Return miMapper.Modificar2(miProducto)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function Eliminar() As Integer
        Try
            Return miMapper.Eliminar(miProducto)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function DameStockDe(ByRef unProducto As ent.Producto) As Integer
        Try
            Return miMapper.DameStockDe(unProducto)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function DescontarStockDe(ByRef unProducto As ent.Producto) As Integer
        Try
            Return miMapper.DescontarStockDe(unProducto)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function ActualizarStock() As Integer
        Try
            Return miMapper.ActualizarStockDe(Me.miProducto)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
End Class
