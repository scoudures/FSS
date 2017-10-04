Imports System.Data.SqlClient
Imports ent = _03_Entidades
Public Class IdiomaM
    Dim miAcceso As New Acceso
    Dim miVerificador As New Verificador
    Function listar() As List(Of ent.Idioma)
        Dim lista As New List(Of ent.Idioma)
        Try

            Dim unIdioma As ent.Idioma
            Dim dt As DataTable = miAcceso.leer("Idioma_SelectAll", Nothing)
            For Each fila As DataRow In dt.Rows
                unIdioma = New ent.Idioma
                unIdioma.nombre = fila("nombre").ToString
                lista.Add(unIdioma)
            Next
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return lista
    End Function

    Function listarLeyendasDe(ByRef unIdioma As ent.Idioma) As List(Of ent.Leyenda)
        Dim lista As New List(Of ent.Leyenda)
        Try
            Dim unaLeyenda As ent.Leyenda
            Dim param(0) As SqlParameter
            param(0) = miAcceso.constructor("@idioma", unIdioma.nombre)
            Dim dt As DataTable = miAcceso.leer("Idioma_SelectLeyenda", param)
            For Each fila As DataRow In dt.Rows
                unaLeyenda = New ent.Leyenda
                unaLeyenda.tag = fila("Etiqueta").ToString
                unaLeyenda.textodefault = fila("TextoDefault").ToString
                unaLeyenda.texto = fila("Texto").ToString
                lista.Add(unaLeyenda)
            Next
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return lista
    End Function
    Public Function guardar(ByRef unIdioma As ent.Idioma) As Integer
        Dim resultado As Integer
        Try
            Dim param(0) As SqlParameter
            param(0) = miAcceso.constructor("@idioma", unIdioma.nombre)
            resultado = miAcceso.Escribir("Idioma_Insert", param)
            miVerificador.DigitosPorTabla("Idioma")
            miVerificador.DigitosPorTabla("Traduccion")
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return resultado
    End Function
    Public Function borrar(ByRef unIdioma As ent.Idioma) As Integer
        Dim resultado As Integer
        Try
            Dim param(0) As SqlParameter
            param(0) = miAcceso.constructor("@idioma", unIdioma.nombre)
            resultado = miAcceso.Escribir("Idioma_Delete", param)
            miVerificador.DigitosPorTabla("Idioma")
            miVerificador.DigitosPorTabla("Traduccion")
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return resultado
    End Function
    Public Function actualizarTraduccion(ByRef unIdioma As ent.Idioma, ByRef unaLeyenda As ent.Leyenda, ByVal unTexto As String) As Integer
        Dim resultado As Integer
        Try
            Dim param(2) As SqlParameter
            param(0) = miAcceso.constructor("@idioma", unIdioma.nombre)
            param(1) = miAcceso.constructor("@leyenda", unaLeyenda.tag)
            param(2) = miAcceso.constructor("@texto", unTexto)
            resultado = miAcceso.Escribir("Idioma_UpdateTraduccion", param)
            miVerificador.DigitosPorTabla("Idioma")
            miVerificador.DigitosPorTabla("Traduccion")
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return resultado

    End Function
End Class
