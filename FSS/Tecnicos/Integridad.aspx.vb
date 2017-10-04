Imports neg = _02_Negocio
Imports ent = _03_Entidades
Public Class Integridad
    Inherits PaginaBase
    Private Sub Page_Error(sender As Object, e As EventArgs) Handles Me.Error
        TratarErrorSinTry("Integridad")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If CInt(Session("Inconsistente")) = 1 Then
            Session("Integridad") = 1
            lblDVH.Text = controlarH()
            lblDVV.Text = controlarV()
        Else
            If Not IsPostBack Then
                Try
                    ControlarAutenticacion("Integridad")
                    ControlarConsistencia("Integridad")
                    If Not IsPostBack And Session("Inconsistente") = 1 Then
                        lblDVV.Text = controlarV()
                        lblDVH.Text = controlarH()
                    End If
                Catch ex As ent.miClaseExcepcion
                    TratarErrorEnCatch("Integridad", ex)
                Catch ex2 As Exception
                    TratarErrorEnCatch("Integridad", ex2)
                End Try
            End If
        End If
    End Sub

    Public Function controlarV() As String
            Dim tablaErrores As New StringBuilder
            Dim resultado As String = ""
            Try
                If Not miVerificador.controlaTablasV(tablaErrores) Then
                    resultado = "Error controlando DVV en: " + vbCrLf + tablaErrores.ToString
                Else
                    resultado = "TODO OK en DVV"
                End If
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Integridad", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Integridad", ex2)
        End Try

            Return resultado
    End Function
    Public Function controlarH() As String
        Dim tablaErrores As New StringBuilder
        Dim FilaErrores As New StringBuilder
        Dim resultado As String = ""
        Try
            If Not miVerificador.controlaTablasH(tablaErrores, FilaErrores) Then
                resultado = "Error controlando DVH en: " + vbCrLf + tablaErrores.ToString + vbCrLf
            Else
                resultado = "TODO OK en DVH"
            End If
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Integridad", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Integridad", ex2)
        End Try
        Return resultado
    End Function

    Protected Sub btnControlarDVV_Click(sender As Object, e As EventArgs) Handles btnControlarDVV.Click
        Try
            miMensajero.EscribirBitacora("Consultando Digitos", miUsuario.login, "Consultado DV...")
            lblDVV.Text = controlarV()
            lblDVH.Text = controlarH()
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Integridad", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Integridad", ex2)
        End Try
    End Sub

    Protected Sub btnGenerarDVV_Click(sender As Object, e As EventArgs) Handles btnGenerarDVV.Click
        Try
            miMensajero.EscribirBitacora("Generando Digitos", miUsuario.login, "Generando DV...")
            lblDVV.Text = ""
            lblDVH.Text = ""
            miVerificador.generarDigitos()
            lblDVV.Text = controlarV()
            lblDVH.Text = controlarH()
            Session("Inconsistente") = Nothing
            Session("Integridad") = Nothing
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Integridad", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Integridad", ex2)
        End Try
    End Sub
End Class