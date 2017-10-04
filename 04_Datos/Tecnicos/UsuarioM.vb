Imports System.Data.SqlClient
Imports ent = _03_Entidades
Public Class UsuarioM
    Dim miAcceso As New Acceso
    Dim miVerificador As New Verificador
    Public Function listar() As List(Of ent.Usuario)
        Dim lista As New List(Of ent.Usuario)
        Try
            Dim unUsuario As ent.Usuario
            Dim dt As DataTable = miAcceso.leer("Usuario_SelectAll")
            For Each fila As DataRow In dt.Rows
                unUsuario = New ent.Usuario
                unUsuario.DNI = fila("DNI").ToString
                unUsuario.login = fila("login").ToString
                unUsuario.idioma = fila("idioma").ToString
                lista.Add(unUsuario)
            Next
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return lista
    End Function
    Public Function listar2() As List(Of ent.Usuario)
        Dim lista As New List(Of ent.Usuario)
        Try
            Dim unUsuario As ent.Usuario
            Dim dt As DataTable = miAcceso.leer("Usuario_SelectAllBitacora")
            For Each fila As DataRow In dt.Rows
                unUsuario = New ent.Usuario
                unUsuario.DNI = fila("DNI").ToString
                unUsuario.login = fila("login").ToString
                lista.Add(unUsuario)
            Next
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return lista
    End Function

    Public Function listar(ByRef miUsuario As ent.Usuario) As List(Of ent.Usuario)
        Dim lista As New List(Of ent.Usuario)
        Try
            Dim unUsuario As ent.Usuario
            Dim param(0) As SqlParameter
            param(0) = miAcceso.constructor("@login", miUsuario.login)
            Dim dt As DataTable = miAcceso.leer("Usuario_SelectPass", param)
            For Each fila As DataRow In dt.Rows
                unUsuario = New ent.Usuario
                unUsuario.DNI = fila("DNI").ToString
                unUsuario.pass = fila("Password").ToString
                unUsuario.login = fila("login").ToString
                unUsuario.idioma = fila("idioma").ToString
                lista.Add(unUsuario)
            Next
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return lista
    End Function
    Public Function Nuevo(ByRef unUsuario As ent.Usuario) As Integer
        Dim resultado As Integer = 0
        Try
            Dim params(6) As SqlParameter
            params(0) = miAcceso.constructor("@login", unUsuario.login)
            params(1) = miAcceso.constructor("@dni", unUsuario.DNI)
            params(2) = miAcceso.constructor("@pass", unUsuario.pass)
            params(3) = miAcceso.constructor("@idioma", unUsuario.idioma)
            params(4) = miAcceso.constructor("@nombre", unUsuario.nombre)
            params(5) = miAcceso.constructor("@apellido", unUsuario.apellido)
            params(6) = miAcceso.constructor("@email", unUsuario.email)
            resultado = miAcceso.Escribir("Usuario_Insert", params)
            miVerificador.DigitosPorTabla("Usuario")
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return resultado
    End Function

    Public Function Modificar(ByRef unUsuario As ent.Usuario) As Integer
        Dim resultado As Integer = 0
        Try
            Dim params(6) As SqlParameter
            params(0) = miAcceso.constructor("@login", unUsuario.login)
            params(1) = miAcceso.constructor("@dni", unUsuario.DNI)
            params(2) = miAcceso.constructor("@pass", unUsuario.pass)
            params(3) = miAcceso.constructor("@idioma", unUsuario.idioma)
            params(4) = miAcceso.constructor("@nombre", unUsuario.nombre)
            params(5) = miAcceso.constructor("@apellido", unUsuario.apellido)
            params(6) = miAcceso.constructor("@email", unUsuario.email)
            resultado = miAcceso.Escribir("Usuario_Update", params)
            miVerificador.DigitosPorTabla("Usuario")
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return resultado
    End Function
    Public Function ModificarPass(ByRef unUsuario As ent.Usuario) As Integer
        Dim resultado As Integer = 0
        Try
            Dim params(1) As SqlParameter
            params(0) = miAcceso.constructor("@p1", unUsuario.login)
            params(1) = miAcceso.constructor("@p2", unUsuario.pass)

            resultado = miAcceso.Escribir("Usuario_UpdatePass", params)
            miVerificador.DigitosPorTabla("Usuario")
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return resultado
    End Function

    Public Function Eliminar(ByRef unUsuario As ent.Usuario) As Integer
        Dim resultado As Integer = 0
        Try
            Dim params(0) As SqlParameter
            params(0) = miAcceso.constructor("@p1", unUsuario.login)

            resultado = miAcceso.Escribir("Usuario_Delete", params)
            miVerificador.DigitosPorTabla("Usuario")
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return resultado
    End Function

    Public Function Uno(ByRef elUsuario As ent.Usuario) As List(Of ent.Usuario)
        Dim lista As New List(Of ent.Usuario)
        Try
            Dim params(0) As SqlParameter
            params(0) = miAcceso.constructor("@login", elUsuario.login)
            Dim dt As DataTable = miAcceso.leer("Usuario_Select", params)
            For Each fila As DataRow In dt.Rows
                Dim unUsuario As New ent.Usuario
                unUsuario.DNI = fila("DNI").ToString
                unUsuario.login = fila("login").ToString
                unUsuario.pass = fila("password").ToString
                unUsuario.nombre = fila("Nombre").ToString
                unUsuario.apellido = fila("Apellido").ToString
                unUsuario.idioma = fila("Idioma").ToString
                unUsuario.email = fila("email").ToString
                lista.Add(unUsuario)
            Next
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return lista
    End Function

    Public Function Todos() As List(Of ent.Usuario)
        Dim lista As New List(Of ent.Usuario)
        Try
            Dim dt As DataTable = miAcceso.leer("Usuario_SelectAll", Nothing)
            For Each fila As DataRow In dt.Rows
                Dim unUsuario As New ent.Usuario
                unUsuario.DNI = fila("DNI")
                unUsuario.login = fila("login").ToString
                unUsuario.pass = fila("password").ToString
                lista.Add(unUsuario)
            Next
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return lista
    End Function

    Public Function PerfilesIN(ByRef unUsuario As ent.Usuario) As List(Of ent.PermisoAbs)
        Dim miLista As New List(Of ent.PermisoAbs)
        Try
            Dim params(0) As SqlParameter
            params(0) = miAcceso.constructor("@p1", unUsuario.login)
            Dim dt As DataTable = miAcceso.leer("Usuario_PerfilIN", params)

            For Each fila As DataRow In dt.Rows
                Dim unPerfil As New ent.Permiso
                unPerfil.nombre = fila("permiso").ToString
                unPerfil.visible = True
                miLista.Add(unPerfil)
            Next
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return miLista
    End Function

    Public Function PerfilesNOTIN(ByRef unUsuario As ent.Usuario) As List(Of ent.PermisoAbs)
        Dim miLista As New List(Of ent.PermisoAbs)
        Try
            Dim params(0) As SqlParameter
            params(0) = miAcceso.constructor("@p1", unUsuario.login)
            Dim dt As DataTable = miAcceso.leer("Usuario_PerfilNOTIN", params)

            For Each fila As DataRow In dt.Rows
                Dim unPerfil As New ent.Permiso
                unPerfil.nombre = fila("permiso").ToString
                miLista.Add(unPerfil)
            Next
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return miLista
    End Function

    Public Function PerfilAsignar(ByRef unUsuario As ent.Usuario, ByRef unPerfil As ent.Permiso) As Integer
        Dim resultado As Integer = 0
        Try
            Dim params(1) As SqlParameter
            params(0) = miAcceso.constructor("@p1", unUsuario.login)
            params(1) = miAcceso.constructor("@p2", unPerfil.nombre)
            resultado = miAcceso.Escribir("Usuario_PerfilAsignar", params)
            miVerificador.DigitosPorTabla("Usuario")
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return resultado
    End Function

    Public Function PerfilDesasignar(ByRef unUsuario As ent.Usuario, ByRef unPerfil As ent.Permiso) As Integer
        Dim resultado As Integer = 0
        Try
            Dim params(1) As SqlParameter
            params(0) = miAcceso.constructor("@p1", unUsuario.login)
            params(1) = miAcceso.constructor("@p2", unPerfil.nombre)
            resultado = miAcceso.Escribir("Usuario_PerfilDesasignar", params)
            miVerificador.DigitosPorTabla("Usuario")
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return resultado
    End Function

    Public Function BuscarPass(ByRef miUsuario As ent.Usuario) As List(Of ent.Usuario)
        Dim lista As New List(Of ent.Usuario)
        Try
            Dim unUsuario As ent.Usuario
            Dim param(0) As SqlParameter
            param(0) = miAcceso.constructor("@login", miUsuario.login)
            Dim dt As DataTable = miAcceso.leer("Usuario_SelectPass", param)
            For Each fila As DataRow In dt.Rows
                unUsuario = New ent.Usuario
                unUsuario.DNI = fila("DNI").ToString
                unUsuario.pass = fila("Password").ToString
                unUsuario.login = fila("login").ToString
                lista.Add(unUsuario)
            Next
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return lista
    End Function
    Public Function BuscarPermisos(ByRef miUsuario As ent.Usuario) As List(Of ent.PermisoAbs)
        Dim lista As New List(Of ent.PermisoAbs)
        Try
            Dim unPermiso As ent.PermisoAbs
            Dim param(0) As SqlParameter
            param(0) = miAcceso.constructor("@p1", miUsuario.login)
            Dim dt As DataTable = miAcceso.leer("Usuario_Permisos", param)
            For Each fila As DataRow In dt.Rows
                unPermiso = New ent.Permiso
                unPermiso.nombre = fila("PermisoHijo").ToString
                unPermiso.estado = CBool(fila("Estado"))
                unPermiso.seleccionado = CBool(fila("seleccionado"))
                unPermiso.visible = CBool(fila("Mostrar"))
                lista.Add(unPermiso)
            Next
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return lista
    End Function
    Public Function EsCliente(ByRef miUsuario As ent.Usuario) As Boolean
        Dim resultado As Boolean
        Try
            Dim params(0) As SqlParameter
            params(0) = miAcceso.constructor("@login", miUsuario.login)
            Dim dt As DataTable = miAcceso.leer("Usuario_EsCliente", params)
            For Each fila As DataRow In dt.Rows
                resultado = CBool(fila("EsCliente"))
            Next
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return resultado
    End Function
    Public Function EsVendedor(ByRef miUsuario As ent.Usuario) As Boolean
        Dim resultado As Boolean
        Try
            Dim params(0) As SqlParameter
            params(0) = miAcceso.constructor("@login", miUsuario.login)
            Dim dt As DataTable = miAcceso.leer("Usuario_EsVendedor", params)
            For Each fila As DataRow In dt.Rows
                resultado = CBool(fila("EsVendedor"))
            Next
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return resultado
    End Function
End Class
