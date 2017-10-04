Imports System.Data.SqlClient
Imports ent = _03_Entidades
Public Class BitacoraM
    Dim miVerificador As New Verificador
    Dim miAcceso As New Acceso
    Public Function listar() As List(Of ent.Bitacora)
        Dim lista As New List(Of ent.Bitacora)
        Try
            Dim param(3) As SqlParameter
            Dim i As Integer = 0

            Dim unaBitacora As ent.Bitacora
            Dim dt As DataTable = miAcceso.leer("Bitacora_Select")
            For Each fila As DataRow In dt.Rows
                unaBitacora = New ent.Bitacora
                unaBitacora.fecha = fila("Fecha")
                unaBitacora.suceso = fila("suceso").ToString
                unaBitacora.usuario = fila("usuario").ToString
                unaBitacora.descripcion = fila("descripcion").ToString
                lista.Add(unaBitacora)
            Next
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return lista
    End Function
    Public Function listar(ByVal fechaDesde As String, ByVal fechaHasta As String, ByVal suceso As String, ByVal usuario As String) As List(Of _03_Entidades.Bitacora)
        Dim lista As New List(Of ent.Bitacora)
        Try
            Dim param(3) As SqlParameter
            Dim i As Integer = 0

            If Not fechaDesde = Nothing Then
                param(i) = miAcceso.constructor("@desde", fechaDesde)
                i = i + 1
            End If
            If Not fechaHasta = Nothing Then
                param(i) = miAcceso.constructor("@hasta", fechaHasta)
                i = i + 1
            End If

            If Not suceso = Nothing Then
                param(i) = miAcceso.constructor("@suceso", suceso)
                i = i + 1
            End If
            If Not usuario = Nothing Then
                param(i) = miAcceso.constructor("@usuario", usuario)
                i = i + 1
            End If

            Dim unaBitacora As ent.Bitacora

            Dim dt As DataTable = miAcceso.leer("Bitacora_Select", param)
            For Each fila As DataRow In dt.Rows
                unaBitacora = New ent.Bitacora
                unaBitacora.fecha = fila("Fecha")
                unaBitacora.suceso = fila("suceso").ToString
                unaBitacora.usuario = fila("usuario").ToString
                unaBitacora.descripcion = fila("descripcion").ToString
                lista.Add(unaBitacora)
            Next
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return lista
    End Function

    Public Function guardar(ByRef unaBitacora As ent.Bitacora) As Integer
        Dim resultado As Integer
        'Try

        Dim param(3) As SqlParameter
        param(0) = miAcceso.constructor("@suceso", unaBitacora.suceso)
        param(1) = miAcceso.constructor("@login ", unaBitacora.usuario)
        param(2) = miAcceso.constructor("@descripcion", unaBitacora.descripcion)
        param(3) = miAcceso.constructor("@dvh", "Prueba")
        resultado = miAcceso.Escribir("Bitacora_Insert", param)
        miVerificador.DigitosPorTabla("Suceso")
        'Catch ex As ent.miClaseExcepcion
        'Throw ex
        'Catch ex2 As Exception
        'Throw ex2
        'End Try
        Return resultado
    End Function
    Public Function reset()
        Dim resultado As Integer
        'Try
        resultado = miAcceso.Escribir("Suceso_Reset")
        miVerificador.DigitosPorTabla("Suceso")
        'Catch ex As ent.miClaseExcepcion
        'Throw ex
        'Catch ex2 As Exception
        'Throw ex2
        'End Try
        Return resultado
    End Function
End Class
