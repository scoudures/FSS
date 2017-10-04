Imports ent = _03_Entidades
Imports data = _04_Datos
Public Class VendedorN
    Private _miMapper As New data.VendedorM
    Public Property miMapper() As data.VendedorM
        Get
            Return _miMapper
        End Get
        Set(ByVal value As data.VendedorM)
            _miMapper = value
        End Set
    End Property

    Private _miVendedor As New ent.Vendedor
    Public Property miVendedor() As ent.Vendedor
        Get
            Return _miVendedor
        End Get
        Set(ByVal value As ent.Vendedor)
            _miVendedor = value
        End Set
    End Property

    Public Function Existe() As Boolean
        Try
            Return miMapper.Existe(Me.miVendedor)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function Nuevo() As Integer
        Try
            Return miMapper.Nuevo(Me.miVendedor)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function Modificar() As Integer
        Try
            Return miMapper.Modificar(Me.miVendedor)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function ModificarPass() As Integer
        Try
            Return miMapper.ModificarPass(Me.miVendedor)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function Mostrar2() As ent.Vendedor
        Try
            Return miMapper.Mostrar2(Me.miVendedor)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function Listar() As List(Of ent.VendedorVista)
        Try
            Dim misVendedores As New List(Of ent.Vendedor)
            misVendedores = miMapper.Listar()
            Dim losVendedors As New List(Of ent.VendedorVista)
            For Each Ven As ent.Vendedor In misVendedores
                Dim unVen As New ent.VendedorVista
                unVen.DNI = Ven.DNI
                unVen.apellido = Ven.apellido
                unVen.nombre = Ven.nombre
                unVen.login = Ven.login
                unVen.email = Ven.email
                losVendedors.Add(unVen)
            Next
            Return losVendedors
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function Eliminar() As Integer
        Try
            Return miMapper.Eliminar(Me.miVendedor)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try

    End Function
End Class
