Public Class Precio
    Private _FechaDesde As Date
    Public Property FechaDesde() As Date
        Get
            Return _FechaDesde
        End Get
        Set(ByVal value As Date)
            _FechaDesde = value
        End Set
    End Property
    Private _costo As Double
    Public Property costo() As Double
        Get
            Return _costo
        End Get
        Set(ByVal value As Double)
            _costo = value
        End Set
    End Property
    Private _precioUnitario As Double
    Public Property precioUnitario() As Double
        Get
            Return _precioUnitario
        End Get
        Set(ByVal value As Double)
            _precioUnitario = value
        End Set
    End Property
    Private _maxPorcentajeDto As Integer
    Public Property maxPorcentajeDto() As Integer
        Get
            Return _maxPorcentajeDto
        End Get
        Set(ByVal value As Integer)
            _maxPorcentajeDto = value
        End Set
    End Property
    Sub New()

    End Sub
End Class
