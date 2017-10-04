Imports System.Data.SqlClient
Imports ent = _03_Entidades

Public Class NoticiaM
    Dim miAcceso As New Acceso
    Dim miVerificador As New Verificador

    Public Function getByCodigo(ByRef unaNoticia As ent.Noticia) As ent.Noticia

        Dim noticiabe As New ent.Noticia
        Try

            Dim params(0) As SqlParameter
            params(0) = miAcceso.constructor("@CodigoNoticia", unaNoticia.CodigoNoticia)
            Dim dt As DataTable = miAcceso.leer("Noticia_GetbyCodigo", params)
            If dt.Rows.Count <> 0 Then
                Dim fila As DataRow
                fila = dt.Rows(0)
                noticiabe.Titulo = fila.Item("titulo")
                noticiabe.Subtitulo = fila.Item("subtitulo")
                noticiabe.Texto = fila.Item("texto")
                noticiabe.RutaImagen = fila.Item("rutaImagen")
            End If

        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return noticiabe

    End Function

    Public Function listarTodo() As List(Of ent.Noticia)
        Dim lista As New List(Of ent.Noticia)
        Try
            Dim dt As DataTable = miAcceso.leer("Noticia_SelectAll")
            For Each fila As DataRow In dt.Rows
                Dim unaNoticia As New ent.Noticia
                unaNoticia.CodigoNoticia = CInt(fila("CodigoNoticia"))
                unaNoticia.Titulo = fila("Titulo").ToString
                unaNoticia.Subtitulo = fila("Subtitulo").ToString
                unaNoticia.Texto = fila("Texto").ToString
                unaNoticia.RutaImagen = fila("RutaImagen").ToString
                lista.Add(unaNoticia)
            Next
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return lista
    End Function


    Public Function Nuevo(ByRef unaNoticia As ent.Noticia) As Integer
        Dim resultado As Integer = 0
        Try
            Dim params(3) As SqlParameter
            params(0) = miAcceso.constructor("@titulo", unaNoticia.Titulo)
            params(1) = miAcceso.constructor("@subtitulo", unaNoticia.Subtitulo)
            params(2) = miAcceso.constructor("@texto", unaNoticia.Texto)
            params(3) = miAcceso.constructor("@Rutaimagen", unaNoticia.RutaImagen)
            resultado = miAcceso.Escribir("Noticia_Insert", params)

        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return resultado
    End Function

    Public Function Modificar(ByRef unaNoticia As ent.Noticia) As Integer
        Dim resultado As Integer = 0
        Try
            Dim params(4) As SqlParameter
            params(0) = miAcceso.constructor("@codigoNoticia", unaNoticia.CodigoNoticia)
            params(1) = miAcceso.constructor("@titulo", unaNoticia.Titulo)
            params(2) = miAcceso.constructor("@subtitulo", unaNoticia.Subtitulo)
            params(3) = miAcceso.constructor("@texto", unaNoticia.Texto)
            params(4) = miAcceso.constructor("@Rutaimagen", unaNoticia.RutaImagen)
            resultado = miAcceso.Escribir("Noticia_Update", params)

        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return resultado
    End Function

    Public Function Eliminar(ByRef unaNoticia As ent.Noticia) As Integer
        Dim resultado As Integer = 0
        Try
            Dim params(0) As SqlParameter
            params(0) = miAcceso.constructor("@CodigoNoticia", unaNoticia.CodigoNoticia)
            resultado = miAcceso.Escribir("Noticia_Delete", params)

        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return resultado
    End Function
    Public Function listarInicio() As List(Of ent.Noticia)
        Dim lista As New List(Of ent.Noticia)
        Try
            Dim dt As DataTable = miAcceso.leer("Noticia_SelectInicio")
            For Each fila As DataRow In dt.Rows
                Dim unaNoticia As New ent.Noticia
                unaNoticia.CodigoNoticia = CInt(fila("CodigoNoticia"))
                unaNoticia.Titulo = fila("Titulo").ToString
                unaNoticia.Subtitulo = fila("Subtitulo").ToString
                unaNoticia.Texto = fila("Texto").ToString
                unaNoticia.RutaImagen = fila("RutaImagen").ToString
                lista.Add(unaNoticia)
            Next
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return lista
    End Function
End Class
