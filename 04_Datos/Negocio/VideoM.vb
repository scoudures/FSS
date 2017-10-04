Imports System.Data.SqlClient
Imports ent = _03_Entidades


Public Class VideoM
    Dim miAcceso As New Acceso
    Dim miVerificador As New Verificador

    Public Function getByCodigo(ByRef unVideo As ent.Video) As ent.Video
        Dim miVideo As New ent.Video
        Try
            Dim params(0) As SqlParameter
            params(0) = miAcceso.constructor("@CodigoVideo", unVideo.CodigoVideo)
            Dim dt As DataTable = miAcceso.leer("Video_GetbyCodigo", params)
            If dt.Rows.Count <> 0 Then
                Dim fila As DataRow
                fila = dt.Rows(0)
                miVideo.Titulo = fila.Item("titulo")
                miVideo.Archivo = fila.Item("Archivo")
            End If
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return miVideo
    End Function

    Public Function listarTodo() As List(Of ent.Video)
        Dim lista As New List(Of ent.Video)
        Try
            Dim dt As DataTable = miAcceso.leer("Video_SelectAll")
            For Each fila As DataRow In dt.Rows
                Dim unVideo As New ent.Video
                unVideo.CodigoVideo = CInt(fila("CodigoVideo"))
                unVideo.Titulo = fila("Titulo").ToString
                unVideo.Archivo = fila("Archivo").ToString
                lista.Add(unVideo)
            Next
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return lista
    End Function


    Public Function Nuevo(ByRef unVideo As ent.Video) As Integer
        Dim resultado As Integer = 0
        Try
            Dim params(1) As SqlParameter
            params(0) = miAcceso.constructor("@titulo", unVideo.Titulo)
            params(1) = miAcceso.constructor("@Archivo", unVideo.Archivo)
            resultado = miAcceso.Escribir("Video_Insert", params)
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return resultado
    End Function

    Public Function Modificar(ByRef unVideo As ent.Video) As Integer
        Dim resultado As Integer = 0
        Try
            Dim params(2) As SqlParameter
            params(0) = miAcceso.constructor("@codigoVideo", unVideo.CodigoVideo)
            params(1) = miAcceso.constructor("@titulo", unVideo.Titulo)
            params(2) = miAcceso.constructor("@Archivo", unVideo.Archivo)
            resultado = miAcceso.Escribir("Video_Update", params)

        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return resultado
    End Function

    Public Function Eliminar(ByRef unVideo As ent.Video) As Integer
        Dim resultado As Integer = 0
        Try
            Dim params(0) As SqlParameter
            params(0) = miAcceso.constructor("@CodigoVideo", unVideo.CodigoVideo)
            resultado = miAcceso.Escribir("Video_Delete", params)

        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return resultado
    End Function
End Class
