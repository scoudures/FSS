Public Class Recomendado
    Inherits Producto
    Implements IComparer(Of Producto)
    Public Function Compare(x As Producto, y As Producto) As Integer Implements IComparer(Of Producto).Compare
        Dim rta As Integer
        If x.cantidadVendida < y.cantidadVendida Then rta = -1
        If x.cantidadVendida = y.cantidadVendida Then rta = 0
        If x.cantidadVendida > y.cantidadVendida Then rta = 1
        Return rta * (-1) 'Si fuer ascendente eliminar el menos 1, como es descendente le puse el menos uno (quiero el mas vendido primero)
    End Function
    Sub New()
        Me.linea = New Linea
        Me.marca = New Marca
        Me.color = New Color
        Me.talle = New Talle
        Me.precio = New Precio
    End Sub
    Sub New(ByRef unProducto As Producto)
        Me.cantidadVendida = unProducto.cantidadVendida
        Me.cantMaxPorPedido = unProducto.cantMaxPorPedido
        Me.color = unProducto.color
        Me.descripcion = unProducto.descripcion
        Me.imagen = unProducto.imagen
        Me.inventario = unProducto.inventario
        Me.linea = unProducto.linea
        Me.marca = unProducto.marca
        Me.nivel = unProducto.nivel
        Me.precio = unProducto.precio
        Me.stock = unProducto.stock
        Me.talle = unProducto.talle
    End Sub
End Class
