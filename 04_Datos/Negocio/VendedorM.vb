Imports System.Data.SqlClient
Imports ent = _03_Entidades
Public Class VendedorM
    Dim miAcceso As New Acceso
    Dim miVerificador As New Verificador
    Dim miEncriptador As New Encriptador
    Public Function Existe(ByRef miVendedor As ent.Vendedor) As Boolean
        Dim resultado As Boolean
        Try
            Dim param(0) As SqlParameter
            param(0) = miAcceso.constructor("@login", miVendedor.login)
            Dim dt As DataTable = miAcceso.leer("Usuario_Existe", param)
            For Each fila As DataRow In dt.Rows
                resultado = CBool(fila("existe"))
            Next
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return resultado
    End Function

    Public Function Nuevo(ByRef unVendedor As ent.Vendedor) As Integer
        Dim resultado As Integer = 0
        Try
            Dim params(6) As SqlParameter
            params(0) = miAcceso.constructor("@login", isNull(unVendedor.login))
            params(1) = miAcceso.constructor("@dni", isNull(unVendedor.DNI))
            params(2) = miAcceso.constructor("@pass", isNull(miEncriptador.EncriptarMD5(unVendedor.pass)))
            params(3) = miAcceso.constructor("@idioma", isNull(unVendedor.idioma))
            params(4) = miAcceso.constructor("@nombre", isNull(unVendedor.nombre))
            params(5) = miAcceso.constructor("@apellido", isNull(unVendedor.apellido))
            params(6) = miAcceso.constructor("@email", isNull(unVendedor.email))
            resultado = miAcceso.Escribir("Vendedor_Insert", params)
            miVerificador.DigitosPorTabla("Usuario")
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return resultado
    End Function
    Public Function Eliminar(ByRef unVendedor As ent.Vendedor) As Integer
        Dim resultado As Integer = 0
        Try
            Dim params(0) As SqlParameter
            params(0) = miAcceso.constructor("@login", isNull(unVendedor.login))
            resultado = miAcceso.Escribir("Vendedor_Delete", params)
            miVerificador.DigitosPorTabla("Usuario")
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return resultado
    End Function

    Public Function Modificar(ByRef unVendedor As ent.Vendedor) As Integer
        Dim resultado As Integer = 0
        Try
            Dim params(6) As SqlParameter
            params(0) = miAcceso.constructor("@login", isNull(unVendedor.login))
            params(1) = miAcceso.constructor("@dni", isNull(unVendedor.DNI))
            params(2) = miAcceso.constructor("@pass", isNull(miEncriptador.EncriptarMD5(unVendedor.pass)))
            params(3) = miAcceso.constructor("@idioma", isNull(unVendedor.idioma))
            params(4) = miAcceso.constructor("@nombre", isNull(unVendedor.nombre))
            params(5) = miAcceso.constructor("@apellido", isNull(unVendedor.apellido))
            params(6) = miAcceso.constructor("@email", isNull(unVendedor.email))
            resultado = miAcceso.Escribir("Vendedor_Update", params)
            miVerificador.DigitosPorTabla("Usuario")
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return resultado
    End Function
    Private Function isNull(ByRef unObjeto As Object) As Object
        Dim resultado As Object = 0
        If Not unObjeto Is Nothing Then
            resultado = unObjeto
        End If
        Return resultado
    End Function
    Public Function Mostrar2(ByRef unVendedor As ent.Vendedor) As ent.Vendedor
        Dim miVendedor As New ent.Vendedor
        Try
            Dim params(0) As SqlParameter
            params(0) = miAcceso.constructor("@DNI", unVendedor.DNI)
            Dim dt As DataTable = miAcceso.leer("Vendedor_Select", params)
            For Each fila As DataRow In dt.Rows
                miVendedor.DNI = fila("DNI").ToString
                miVendedor.login = fila("login").ToString
                miVendedor.pass = fila("password").ToString
                miVendedor.nombre = fila("Nombre").ToString
                miVendedor.apellido = fila("Apellido").ToString
                miVendedor.idioma = fila("Idioma").ToString
                miVendedor.email = fila("email").ToString
            Next
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return miVendedor
    End Function
    

    Public Function ModificarPass(ByRef unVendedor As ent.Vendedor) As Integer
        Dim resultado As Integer = 0
        Try
            Dim params(1) As SqlParameter
            params(0) = miAcceso.constructor("@dni", isNull(unVendedor.DNI))
            params(1) = miAcceso.constructor("@pass", isNull(miEncriptador.EncriptarMD5(unVendedor.pass)))
            resultado = miAcceso.Escribir("Vendedor_UpdatePass", params)
            miVerificador.DigitosPorTabla("Usuario")
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return resultado
    End Function
    Public Function Listar() As List(Of ent.Vendedor)
        Dim milista As New List(Of ent.Vendedor)
        Try
            Dim dt As DataTable = miAcceso.leer("Vendedor_SelectAll")
            For Each fila In dt.Rows
                Dim miVendedor As New ent.Vendedor
                miVendedor.DNI = fila("DNI").ToString
                miVendedor.login = fila("login").ToString
                miVendedor.pass = fila("password").ToString
                miVendedor.nombre = fila("Nombre").ToString
                miVendedor.apellido = fila("Apellido").ToString
                miVendedor.idioma = fila("Idioma").ToString
                miVendedor.email = fila("email").ToString
                milista.Add(miVendedor)
            Next
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return milista
    End Function

End Class
