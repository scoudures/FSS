Imports System.Data.SqlClient
Imports System.Text
Imports ent = _03_Entidades

Public Class Verificador
    Dim miAcceso As New Acceso
    Dim miEncriptador As New Encriptador
    Private Shared tablasBD() As String = {"Usuario", "Suceso"}

    Public Sub generarDigitos()
        Try
            For i = 0 To tablasBD.Count - 1
                DigitosPorTabla(tablasBD(i))
            Next
        Catch ex As ent.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Sub

    Public Function DigitosPorTabla(ByVal nombreTabla As String) As Boolean
        Dim resultado As Boolean
        Try
            Dim queryString As String = "select * from " + nombreTabla
            Dim ds As New DataSet
            Dim da As New SqlDataAdapter
            miAcceso.Abrir()
            da.SelectCommand = New SqlCommand(queryString, miAcceso.cn)
            Dim builder As SqlCommandBuilder = New SqlCommandBuilder(da)
            da.Fill(ds, nombreTabla)

            Dim cadenaH As String = ""
            Dim digitoH As String = ""
            Dim cadenaV As String = ""
            Dim digitoV As String = ""

            'Por cada registro de la tabla concateno los valores de los campos
            'Luego le aplico md5 y obtengo el digitoH

            For Each fila As DataRow In ds.Tables(nombreTabla).Rows
                For x = 0 To fila.ItemArray.Count - 2
                    cadenaH &= String.Concat(fila.Item(x))
                Next
                'Calculo md5 de toda la fila
                digitoH = miEncriptador.AplicaMD5(cadenaH)
                fila.Item("DVH") = digitoH

                'Concateno los digitosH para armar el digito Vertical
                cadenaV &= String.Concat(digitoH)
                cadenaH = ""
            Next

            da.Update(ds, nombreTabla)

            'Calculo md5 de la cadenaV para obtener el digito vertical de la tabla
            digitoV = miEncriptador.AplicaMD5(cadenaV)

            Dim strInsertDigitV As String = "update digitosV set digitoV='" + digitoV + "' where NombreTabla='" + nombreTabla + "'"
            Dim cm As New SqlCommand(strInsertDigitV, miAcceso.cn)
            cm.CommandType = CommandType.Text

            cm.ExecuteNonQuery()
            miAcceso.Cerrar()
            resultado = True
        Catch ex As ent.miClaseExcepcion
            resultado = False
            'Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return resultado
    End Function
    Public Function controlaTablasV(ByRef tablaErr As StringBuilder) As Boolean
        Dim tablaOK As Boolean = True
        Dim resultado As Boolean
        Try
            Dim TablasErrores As New StringBuilder
            For i = 0 To tablasBD.Count - 1
                If Not ControlaDigitosVerticales(tablasBD(i)) Then
                    TablasErrores.Append(tablasBD(i) + vbCrLf)
                    tablaOK = False
                End If
            Next
            If Not tablaOK Then
                tablaErr = TablasErrores
                resultado = False
            Else
                resultado = True
            End If
        Catch ex As ent.miClaseExcepcion
            'Throw ex
            resultado = False
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return resultado
    End Function
    Public Function controlaTablasH(ByRef tablaErr As StringBuilder, ByRef filaError As StringBuilder) As Boolean
        Dim tablaOK As Boolean = True
        Dim resultado As Boolean
        Try
            Dim TablasErrores As New StringBuilder
            For i = 0 To tablasBD.Count - 1
                If Not ControlarDigitosH(tablasBD(i), filaError) Then
                    TablasErrores.AppendLine(tablasBD(i) + ": " + filaError.ToString)
                    tablaOK = False
                End If
            Next
            If Not tablaOK Then
                tablaErr = TablasErrores
                resultado = False
            Else
                resultado = True
            End If
        Catch ex As ent.miClaseExcepcion
            'Throw ex
            resultado = False
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return resultado
    End Function
    Public Function ControlaDigitosVerticales(ByVal nombreTabla As String) As Boolean
        Dim resultado As Boolean
        Try
            Dim queryString As String = "select * from " + nombreTabla
            Dim ds As New DataSet
            Dim da As New SqlDataAdapter
                miAcceso.Abrir()
                da.SelectCommand = New SqlCommand(queryString, miAcceso.cn)
                Dim builder As SqlCommandBuilder = New SqlCommandBuilder(da)
                da.Fill(ds, nombreTabla)
                Dim cadenaH As String = ""
                Dim cadenaV As String = ""
                Dim digitoV As String = ""
                For Each fila As DataRow In ds.Tables(nombreTabla).Rows
                    cadenaV &= fila.Item("DVH")
                Next
                digitoV = miEncriptador.AplicaMD5(cadenaV)
                Dim digitoVGuardado As String = ""
                Dim strSelectDigitV As String = "select digitoV from digitosV where NombreTabla='" + nombreTabla + "'"
                Dim cm As New SqlCommand(strSelectDigitV, miAcceso.cn)
                cm.CommandType = CommandType.Text
                digitoVGuardado = cm.ExecuteScalar()
                miAcceso.Cerrar()
                If digitoVGuardado <> digitoV Then
                    Return False
                End If
                resultado = True
            Catch ex As ent.miClaseExcepcion
                resultado = False
            'Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
            Return resultado
    End Function
    Public Function ControlarDigitosH(ByVal nombreTabla As String, ByRef FilaError As StringBuilder) As Boolean
        Dim resultado As Boolean
        Try
            Dim queryString As String = "select * from " + nombreTabla
            Dim ds As New DataSet
            Dim da As New SqlDataAdapter
            miAcceso.Abrir()
            da.SelectCommand = New SqlCommand(queryString, miAcceso.cn)
            Dim builder As SqlCommandBuilder = New SqlCommandBuilder(da)
            da.Fill(ds, nombreTabla)
            Dim cadenaH As String = ""
            Dim digitoH As String = ""
            Dim cadenaV As String = ""
            Dim digitoV As String = ""
            Dim FilaErrores As New StringBuilder
            'Por cada registro de la tabla concateno los valores de los campos
            'Luego le aplico md5 y obtengo el digitoH
            For Each fila As DataRow In ds.Tables(nombreTabla).Rows
                For x = 0 To fila.ItemArray.Count - 2
                    cadenaH &= String.Concat(fila.Item(x))
                    FilaErrores.Append(CStr(fila.Item(x)) + " ")
                Next
                'Calculo md5 de toda la fila
                digitoH = miEncriptador.AplicaMD5(cadenaH)

                If fila.Item("DVH") <> digitoH Then
                    FilaError = FilaErrores
                    Return False
                End If
                cadenaH = ""
                FilaErrores.Clear()
            Next
            miAcceso.Cerrar()
            resultado = True
        Catch ex As ent.miClaseExcepcion
            resultado = False
            'Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return resultado
    End Function
End Class
