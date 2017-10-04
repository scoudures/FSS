Imports ent = _03_Entidades
Imports data = _04_Datos

Public Class ClienteN
    Private _miMapper As New data.ClienteM
    Public Property miMapper() As data.ClienteM
        Get
            Return _miMapper
        End Get
        Set(ByVal value As data.ClienteM)
            _miMapper = value
        End Set
    End Property

    Private _miCliente As New ent.Cliente
    Public Property miCliente() As ent.Cliente
        Get
            Return _miCliente
        End Get
        Set(ByVal value As ent.Cliente)
            _miCliente = value
        End Set
    End Property

    Public Function Existe() As Boolean
        Try
            Return miMapper.Existe(Me.miCliente)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function Nuevo() As Integer
        Try
            Return miMapper.Nuevo(Me.miCliente)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function Modificar() As Integer
        Try
            Return miMapper.Modificar(Me.miCliente)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function ModificarPass() As Integer
        Try
            Return miMapper.ModificarPass(Me.miCliente)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function Mostrar() As ent.Cliente
        Try
            Return miMapper.Mostrar(Me.miCliente)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function Mostrar2() As ent.Cliente
        Try
            Return miMapper.Mostrar2(Me.miCliente)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function ValidarPregunta() As Boolean
        Try
            Return miMapper.ValidarPregunta(Me.miCliente)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function Listar() As List(Of ent.ClienteVista)
        Try
            Dim misClientes As New List(Of ent.Cliente)
            misClientes = miMapper.Listar()
            Dim losClientes As New List(Of ent.ClienteVista)
            For Each cli As ent.Cliente In misClientes
                Dim unCli As New ent.ClienteVista
                unCli.DNI = cli.DNI
                unCli.apellido = cli.apellido
                unCli.nombre = cli.nombre
                unCli.login = cli.login
                unCli.email = cli.email
                losClientes.Add(unCli)
            Next
            Return losClientes
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function Eliminar() As Integer
        Try
            Return miMapper.Eliminar(Me.miCliente)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try

    End Function
End Class

