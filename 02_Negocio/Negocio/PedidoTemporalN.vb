Imports ent = _03_Entidades
Imports data = _04_Datos

Public Class PedidoTemporalN

    Private _miMapper As New data.PedidoTemporalM
    Public Property miMapper() As data.PedidoTemporalM
        Get
            Return _miMapper
        End Get
        Set(ByVal value As data.PedidoTemporalM)
            _miMapper = value
        End Set
    End Property

    Private _miPedidoTmp As New ent.PedidoTemporal
    Public Property miPedidoTmp() As ent.PedidoTemporal
        Get
            Return _miPedidoTmp
        End Get
        Set(ByVal value As ent.PedidoTemporal)
            _miPedidoTmp = value
        End Set
    End Property


    Public Function listar() As List(Of ent.ItemTemporal)
        Try
            Return miMapper.Listar(miPedidoTmp)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function AgregarItem() As Integer
        Try
            Return miMapper.AgregarItem(miPedidoTmp)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function RemoverItem() As Integer
        Try
            Return miMapper.RemoverItem(miPedidoTmp)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function ActualizarItem() As Integer
        Try
            Return miMapper.ActualizarItem(miPedidoTmp)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function ContarItems() As Integer
        Try
            Return miMapper.ContarItems(miPedidoTmp)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function Total() As Double
        Try
            Return miMapper.Total(miPedidoTmp)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
End Class
