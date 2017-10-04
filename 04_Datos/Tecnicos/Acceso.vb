Imports System.Data.SqlClient
Imports ent = _03_Entidades
Friend Class Acceso

    Friend cn As SqlConnection
    Dim transaction As SqlTransaction

    Friend Sub Abrir(Optional db As String = Nothing)
        Try
            If db Is Nothing Then
                'cn = New SqlConnection("Data Source=" & My.Resources.Servidor & ";Initial Catalog=" & My.Resources.Base & ";Integrated Security=sspi;")
                cn = New SqlConnection("Data Source=" & My.Resources.Servidor & ";Initial Catalog=" & My.Resources.Base & ";User ID=" & My.Resources.Usuario & ";Password=" & My.Resources.Pass & ";")
            Else
                'Cuando necesito conectarme a master para hacer backup y restore
                'cn = New SqlConnection("Data Source=" & My.Resources.Servidor & ";Initial Catalog=" & db & ";Integrated Security=sspi;")
                cn = New SqlConnection("Data Source=" & My.Resources.Servidor & ";Initial Catalog=" & db & ";User ID=" & My.Resources.Usuario & ";Password=" & My.Resources.Pass & ";")
            End If
            cn.Open()
        Catch ex As SqlException
            EscribirLog("DAL EXCEPTION (Abrir " & cn.Database & ") - ", ex)
            Throw New ent.miClaseExcepcion("Excepcion en Capa de Datos (Abrir) - " & cn.Database, ex)
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Sub

    Friend Sub Cerrar()
        Try
            cn.Close()
            cn.Dispose()
        Catch ex As SqlException
            EscribirLog("DAL EXCEPTION (Cerrar " & cn.Database & ") - ", ex)
            Throw New ent.miClaseExcepcion("Excepcion en Capa de Datos (Cerrar) - " & cn.Database, ex)
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Sub

    Public Function leer(nombre As String, Optional parametros() As SqlParameter = Nothing, Optional dbMaster As Boolean = False) As DataTable
        Dim da As New SqlDataAdapter
        Dim dt As New DataTable
        Try
            If dbMaster Then
                'creo y abro la conexion a la base Master (no voy a anidar transacciones en Master)
                Abrir("master")
            Else
                Abrir()
            End If
            'EscribirLog(Now & " Ejecutar => " & nombre)
            da.SelectCommand = New SqlCommand(My.Resources.Servidor)
            da.SelectCommand.Connection = cn
            da.SelectCommand.CommandType = CommandType.StoredProcedure
            da.SelectCommand.CommandText = nombre
            If Not parametros Is Nothing Then
                da.SelectCommand.Parameters.AddRange(parametros)
            End If
            da.Fill(dt)
            Cerrar()
        Catch ex As SqlException
            EscribirLog("DAL EXCEPTION (Leer " & nombre & ") - ", ex)
            Throw New ent.miClaseExcepcion("Excepcion en Capa de Datos (Leer) - Al ejecutar " & nombre, ex)
        Catch ex2 As Exception
            EscribirLog("DAL EXCEPTION (Leer " & nombre & ") - ", ex2)
            'Throw New ent.miClaseExcepcion("Excepcion en Capa de Datos (Leer) - Al ejecutar " & nombre, ex2)
        End Try
        Return dt
    End Function


    Public Function Escribir(nombreSP As String, Optional parametros() As SqlParameter = Nothing, Optional AbreTran As Boolean = True, Optional CierraTran As Boolean = True, Optional dbMaster As Boolean = False) As Integer
        Dim resultado As Integer

        Try
            'Si abre la transaccion
            If AbreTran And Not dbMaster Then
                'creo y abro la conexion
                Abrir()
                'hago el begin y me quedo con la transaccion (porque si no la cierra, la necesito para el objeto que la cierra)
                transaction = cn.BeginTransaction(IsolationLevel.ReadCommitted) 'aislamiento de lecturas confirmadas
            ElseIf dbMaster Then
                'creo y abro la conexion a la base Master (no voy a anidar transacciones en Master)
                Abrir("master")
            End If

            'comando
            Dim cm As New SqlCommand
            cm.Connection = cn
            cm.Transaction = transaction
            cm.CommandType = CommandType.StoredProcedure
            cm.CommandText = nombreSP

            'parametros
            If Not parametros Is Nothing Then
                cm.Parameters.AddRange(parametros)
            End If

            'ejecutar el SP
            resultado = cm.ExecuteNonQuery
            'EscribirLog(Now & " Ejecutar => " & nombreSP)
            'Si cierra la transaccion
            If CierraTran And Not dbMaster Then
                'hago el commit
                transaction.Commit()
                'y cierro la conexion
                Cerrar()
            ElseIf dbMaster Then
                Cerrar()
            End If
        Catch ex As SqlException
            'Si fallo, hago el rollback
            transaction.Rollback()
            'cierro la conexion
            Cerrar()
            'y escribo en el log
            EscribirLog("DAL EXCEPTION (Escribir " & nombreSP & ") - ", ex)
            Throw New ent.miClaseExcepcion("Excepcion en Capa de Datos (Escribir) - Al ejecutar " & nombreSP, ex)
        Catch ex2 As Exception
            EscribirLog("DAL EXCEPTION (Escribir " & nombreSP & ") - ", ex2)
            'Throw New ent.miClaseExcepcion("Excepcion en Capa de Datos (Escribir) - Al ejecutar " & nombreSP, ex2)
        End Try
        Return resultado
    End Function

#Region "construcParam"
    Public Function constructor(nombre As String, valor As String) As SqlParameter
        Dim par As New SqlParameter
        par.ParameterName = nombre
        par.SqlDbType = SqlDbType.NVarChar
        par.Value = isnull(valor)
        Return par
    End Function

    Public Function constructor(nombre As String, valor As Integer) As SqlParameter
        Dim par As New SqlParameter
        par.ParameterName = nombre
        par.SqlDbType = SqlDbType.Int
        par.Value = valor
        Return par
    End Function

    Public Function constructor(nombre As String, valor As Double) As SqlParameter
        Dim par As New SqlParameter
        par.ParameterName = nombre
        par.SqlDbType = SqlDbType.Money
        par.Value = valor
        Return par
    End Function
    Public Function constructor(nombre As String, valor As Date) As SqlParameter
        Dim par As New SqlParameter
        par.ParameterName = nombre
        par.SqlDbType = SqlDbType.Date
        par.Value = valor
        Return par
    End Function

    Public Function constructor(nombre As String, valor As Boolean) As SqlParameter
        Dim par As New SqlParameter
        par.ParameterName = nombre
        par.SqlDbType = SqlDbType.Bit
        If valor Then
            par.Value = 1
        Else
            par.Value = 0
        End If
        Return par
    End Function

    Private Function isnull(ByVal valor As String) As String
        Dim resultado As String = ""
        If valor Is Nothing Then
            Return resultado
        else 
            Return valor
        End If
    End Function
#End Region

    Private Sub EscribirLog(ByVal unTexto As String, Optional ByRef unaExcepcion As System.Exception = Nothing)
        Try
            Dim fic As String = My.Resources.Log
            Dim permiso As New System.Security.Permissions.FileIOPermission(Security.Permissions.FileIOPermissionAccess.AllAccess, fic)
            permiso.Demand()

            Dim sw As New System.IO.StreamWriter(fic, True)
            sw.WriteLine("")
            sw.WriteLine(unTexto)
            If unaExcepcion IsNot Nothing Then
                sw.WriteLine(Now & " ORIGEN => " & unaExcepcion.Source)
                sw.WriteLine(Now & " MENSAJE => " & unaExcepcion.Message)
                'sw.WriteLine(unaExcepcion.StackTrace)
            End If
            sw.WriteLine("")
            sw.Close()
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Sub
End Class
