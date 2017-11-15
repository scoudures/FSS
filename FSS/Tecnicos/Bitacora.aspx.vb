
Imports neg = _02_Negocio
Imports ent = _03_Entidades
Public Class Bitacora
    Inherits PaginaBase

    Private _miSuceso As New neg.SucesoN
    Public Property miSuceso() As neg.SucesoN
        Get
            Return _miSuceso
        End Get
        Set(ByVal value As neg.SucesoN)
            _miSuceso = value
        End Set
    End Property

    Private _miUsuario As New neg.UsuarioN
    Public Property mi_Usuario() As neg.UsuarioN
        Get
            Return _miUsuario
        End Get
        Set(ByVal value As neg.UsuarioN)
            _miUsuario = value
        End Set
    End Property

    Private _miBitacora As New neg.BitacoraN
    Public Property miBitacora() As neg.BitacoraN
        Get
            Return _miBitacora
        End Get
        Set(ByVal value As neg.BitacoraN)
            _miBitacora = value
        End Set
    End Property

    Private Sub Bitacora_Error(sender As Object, e As EventArgs) Handles Me.Error
        TratarErrorSinTry("Bitacora")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            ControlarAutenticacion("Bitacora")
            ControlarConsistencia("Bitacora")
            If Not Page.IsPostBack Then
                'Listar años
                For i As Integer = 2017 To 2020
                    lstAnioDesde.Items.Add(i.ToString())
                    lstAnioHasta.Items.Add(i.ToString())
                Next
                Dim numero As Integer = 0
                Dim numeroEnStr As String
                Dim numeroFinal As String
                lstAnioHasta.SelectedIndex = 1
                'ListarMeses
                For i As Integer = 1 To 12
                    numero = i + 100
                    numeroEnStr = numero.ToString
                    numeroFinal = numeroEnStr.Substring(1, 2)
                    lstMesDesde.Items.Add(numeroFinal)
                    lstMesHasta.Items.Add(numeroFinal)
                Next
                Dim anio As String = System.DateTime.Now.Year.ToString()
                Dim mes As String = System.DateTime.Now.Month.ToString()
                Dim dia As String = System.DateTime.Now.Day.ToString()
                If mes.Length = 1 Then
                    mes = "0" & mes
                End If
                If dia.Length = 1 Then
                    dia = "0" & dia
                End If
                'Listar dias
                ListarDiasDesde()
                ListarDiasHasta()
                ListarSuceso()
                lstSuceso.SelectedValue = "Todos"
                ListarUsuario()
                lstUsuario.SelectedValue = "Todos"
                ListarBitacora()
                DataBind()
            End If
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Bitacora", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Bitacora", ex2)
        End Try
    End Sub
    Protected Sub lstAnioDesde_SelectedIndexChanged(sender As Object, e As EventArgs) Handles lstAnioDesde.SelectedIndexChanged
        Try
            ListarDiasDesde()
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Bitacora", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Bitacora", ex2)
        End Try
    End Sub

    Protected Sub lstMesDesde_SelectedIndexChanged(sender As Object, e As EventArgs) Handles lstMesDesde.SelectedIndexChanged
        Try
            ListarDiasDesde()
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Bitacora", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Bitacora", ex2)
        End Try
    End Sub
    Public Sub ListarDiasDesde()
        Try
            lstDiaDesde.Items.Clear()
            'el numero de dias depende del mes
            Dim nrodias As Integer = DateTime.DaysInMonth(Convert.ToInt32(lstAnioDesde.SelectedValue), Convert.ToInt32(lstMesDesde.SelectedValue))

            'Listar Dias
            For i As Integer = 1 To nrodias
                lstDiaDesde.Items.Add((i + 100).ToString.Substring(1, 2))
            Next
            'lstDiaDesde.Items.FindByValue("01").Selected = True 'el 1 por default, porque hay meses que tienen menos de 30 días
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Bitacora", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Bitacora", ex2)
        End Try
    End Sub
    Public Sub ListarDiasHasta()
        Try
            lstDiaHasta.Items.Clear()
            'el numero de dias depende del mes
            Dim nrodias As Integer = DateTime.DaysInMonth(Convert.ToInt32(lstAnioHasta.SelectedValue), Convert.ToInt32(lstMesHasta.SelectedValue))

            'Listar Dias
            For i As Integer = 1 To nrodias
                lstDiaHasta.Items.Add((i + 100).ToString.Substring(1, 2))
            Next
            'lstDiaHasta.Items.FindByValue("01").Selected = True 'el 1 por default, porque hay meses que tienen menos de 30 días
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Bitacora", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Bitacora", ex2)
        End Try
    End Sub

    Protected Sub lstAnioHasta_SelectedIndexChanged(sender As Object, e As EventArgs) Handles lstAnioHasta.SelectedIndexChanged
        Try
            ListarDiasHasta()
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Bitacora", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Bitacora", ex2)
        End Try
    End Sub

    Protected Sub lstMesHasta_SelectedIndexChanged(sender As Object, e As EventArgs) Handles lstMesHasta.SelectedIndexChanged
        Try
            ListarDiasHasta()
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Bitacora", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Bitacora", ex2)
        End Try
    End Sub


    Private Sub ListarSuceso()
        Try
            lstSuceso.DataSource = miSuceso.ListarBitacora()
            lstSuceso.DataValueField = "descripcion"
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Bitacora", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Bitacora", ex2)
        End Try
    End Sub

    Private Sub ListarUsuario()
        Try
            lstUsuario.DataSource = mi_Usuario.listar2
            lstUsuario.DataValueField = "login"
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Bitacora", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Bitacora", ex2)
        End Try
    End Sub

    Private Sub ListarBitacora(ByVal fechaDesde As String, ByVal fechaHasta As String, ByVal suceso As String, ByVal usuario As String)
        Try
            grdBitacora.DataSource = miBitacora.Listar(fechaDesde, fechaHasta, suceso, usuario)
            miMensajero.EscribirBitacora("Consulta Bitacora", miUsuario.login, "Consulta Desde:" & fechaDesde & " Hasta:" & fechaHasta & " Suceso:" & suceso & " Usuario:" & usuario)

        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Bitacora", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Bitacora", ex2)
        End Try

    End Sub
    Private Sub ListarBitacora()
        Try
            grdBitacora.DataSource = miBitacora.Listar("20170101", "20180101", "Todos", "Todos")
            miMensajero.EscribirBitacora("Consulta Bitacora", miUsuario.login, "Accediento a Bitacora...")
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Bitacora", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Bitacora", ex2)
        End Try
    End Sub
    Protected Sub btnEnviar_Click(sender As Object, e As EventArgs) Handles btnEnviar.Click
        Try
            Dim fechaDesde As String
            fechaDesde = lstAnioDesde.SelectedValue & lstMesDesde.SelectedValue & lstDiaDesde.SelectedValue
            Dim fechaHasta As String
            fechaHasta = lstAnioHasta.SelectedValue & lstMesHasta.SelectedValue & lstDiaHasta.SelectedValue
            If fechaDesde < fechaHasta Then
                ListarBitacora(fechaDesde, fechaHasta, lstSuceso.SelectedValue, lstUsuario.SelectedValue)
            Else
                EnviarMensaje(Panel1, "La fecha HASTA debe ser mayor que la fecha DESDE.", True)
            End If
            DataBind()
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Bitacora", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Bitacora", ex2)
        End Try
    End Sub

    Protected Sub grdBitacora_PageIndexChanging(sender As Object, e As GridViewPageEventArgs) Handles grdBitacora.PageIndexChanging
        Try
            grdBitacora.PageIndex = e.NewPageIndex
            Dim fechaDesde As String
            fechaDesde = lstAnioDesde.SelectedValue & lstMesDesde.SelectedValue & lstDiaDesde.SelectedValue
            Dim fechaHasta As String
            fechaHasta = lstAnioHasta.SelectedValue & lstMesHasta.SelectedValue & lstDiaHasta.SelectedValue
            ListarBitacora(fechaDesde, fechaHasta, lstSuceso.SelectedValue, lstUsuario.SelectedValue)
            DataBind()
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Bitacora", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Bitacora", ex2)
        End Try
    End Sub
End Class