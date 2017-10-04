Imports System.Data.SqlClient
Imports ent = _03_Entidades

Public Class ClienteM
    Dim miAcceso As New Acceso
    Dim miVerificador As New Verificador
    Public Function Existe(ByRef miCliente As ent.Cliente) As Boolean
        Dim resultado As Boolean
        Try
            Dim param(0) As SqlParameter
            param(0) = miAcceso.constructor("@login", miCliente.login)
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

    Public Function Nuevo(ByRef unCliente As ent.Cliente) As Integer
        Dim resultado As Integer = 0
        Try
            Dim params(8) As SqlParameter
            params(0) = miAcceso.constructor("@login", isNull(unCliente.login))
            params(1) = miAcceso.constructor("@dni", isNull(unCliente.DNI))
            params(2) = miAcceso.constructor("@pass", isNull(unCliente.pass))
            params(3) = miAcceso.constructor("@idioma", isNull(unCliente.idioma))
            params(4) = miAcceso.constructor("@nombre", isNull(unCliente.nombre))
            params(5) = miAcceso.constructor("@apellido", isNull(unCliente.apellido))
            params(6) = miAcceso.constructor("@email", isNull(unCliente.email))
            params(7) = miAcceso.constructor("@pregunta", isNull(unCliente.pregunta))
            params(8) = miAcceso.constructor("@respuesta", isNull(unCliente.respuesta))
            resultado = miAcceso.Escribir("Cliente_Insert", params)
            miVerificador.DigitosPorTabla("Usuario")
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return resultado
    End Function
    Public Function Eliminar(ByRef unCliente As ent.Cliente) As Integer
        Dim resultado As Integer = 0
        Try
            Dim params(0) As SqlParameter
            params(0) = miAcceso.constructor("@login", isNull(unCliente.login))
            resultado = miAcceso.Escribir("Cliente_Delete", params)
            miVerificador.DigitosPorTabla("Usuario")
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return resultado
    End Function

    Public Function Modificar(ByRef unCliente As ent.Cliente) As Integer
        Dim resultado As Integer = 0
        Try
            Dim params(8) As SqlParameter
            params(0) = miAcceso.constructor("@login", isNull(unCliente.login))
            params(1) = miAcceso.constructor("@dni", isNull(unCliente.DNI))
            params(2) = miAcceso.constructor("@pass", isNull(unCliente.pass))
            params(3) = miAcceso.constructor("@idioma", isNull(unCliente.idioma))
            params(4) = miAcceso.constructor("@nombre", isNull(unCliente.nombre))
            params(5) = miAcceso.constructor("@apellido", isNull(unCliente.apellido))
            params(6) = miAcceso.constructor("@email", isNull(unCliente.email))
            params(7) = miAcceso.constructor("@pregunta", isNull(unCliente.pregunta))
            params(8) = miAcceso.constructor("@respuesta", isNull(unCliente.respuesta))
            resultado = miAcceso.Escribir("Cliente_Update", params)
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
    Public Function Mostrar(ByRef unCliente As ent.Cliente) As ent.Cliente
        Dim miCliente As New ent.Cliente
        Try
            Dim params(0) As SqlParameter
            params(0) = miAcceso.constructor("@login", unCliente.login)
            Dim dt As DataTable = miAcceso.leer("Cliente_Select", params)
            For Each fila As DataRow In dt.Rows
                miCliente.DNI = fila("DNI").ToString
                miCliente.login = fila("login").ToString
                miCliente.pass = fila("password").ToString
                miCliente.nombre = fila("Nombre").ToString
                miCliente.apellido = fila("Apellido").ToString
                miCliente.idioma = fila("Idioma").ToString
                miCliente.email = fila("email").ToString
                miCliente.pregunta = fila("pregunta").ToString
                miCliente.respuesta = fila("respuesta").ToString
            Next
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return miCliente
    End Function
    Public Function Mostrar2(ByRef unCliente As ent.Cliente) As ent.Cliente
        Dim miCliente As New ent.Cliente
        Try
            Dim params(0) As SqlParameter
            params(0) = miAcceso.constructor("@DNI", unCliente.DNI)
            Dim dt As DataTable = miAcceso.leer("Cliente_Select2", params)
            For Each fila As DataRow In dt.Rows
                miCliente.DNI = fila("DNI").ToString
                miCliente.login = fila("login").ToString
                miCliente.pass = fila("password").ToString
                miCliente.nombre = fila("Nombre").ToString
                miCliente.apellido = fila("Apellido").ToString
                miCliente.idioma = fila("Idioma").ToString
                miCliente.email = fila("email").ToString
                miCliente.pregunta = fila("pregunta").ToString
                miCliente.respuesta = fila("respuesta").ToString
            Next
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return miCliente
    End Function
    Public Function ValidarPregunta(ByRef unCliente As ent.Cliente) As Boolean
        Dim resultado As Boolean = False
        Try
            Dim params(3) As SqlParameter
            params(0) = miAcceso.constructor("@DNI", unCliente.DNI)
            params(1) = miAcceso.constructor("@Pregunta", unCliente.pregunta)
            params(2) = miAcceso.constructor("@Respuesta", unCliente.respuesta)
            params(3) = miAcceso.constructor("@Valida", CInt(0))
            params(3).Direction = ParameterDirection.Output
            Dim dt As DataTable = miAcceso.leer("Cliente_ValidarPregunta", params)
            resultado = CBool(params(3).Value)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return resultado
    End Function

    Public Function ModificarPass(ByRef unCliente As ent.Cliente) As Integer
        Dim resultado As Integer = 0
        Try
            Dim params(1) As SqlParameter
            params(0) = miAcceso.constructor("@dni", isNull(unCliente.DNI))
            params(1) = miAcceso.constructor("@pass", isNull(unCliente.pass))
            resultado = miAcceso.Escribir("Cliente_UpdatePass", params)
            miVerificador.DigitosPorTabla("Usuario")
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return resultado
    End Function
    Public Function Listar() As List(Of ent.Cliente)
        Dim milista As New List(Of ent.Cliente)
        Try
            Dim dt As DataTable = miAcceso.leer("Cliente_SelectAll")
            For Each fila In dt.Rows
                Dim miCliente As New ent.Cliente
                miCliente.DNI = fila("DNI").ToString
                miCliente.login = fila("login").ToString
                miCliente.pass = fila("password").ToString
                miCliente.nombre = fila("Nombre").ToString
                miCliente.apellido = fila("Apellido").ToString
                miCliente.idioma = fila("Idioma").ToString
                miCliente.email = fila("email").ToString
                miCliente.pregunta = fila("pregunta").ToString
                miCliente.respuesta = fila("respuesta").ToString
                milista.Add(miCliente)
            Next
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return milista
    End Function
End Class
