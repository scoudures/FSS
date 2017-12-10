Imports Entidades = _03_Entidades
Imports Negocio = _02_Negocio

Public Class CalculoCIPA
    Inherits PaginaBase
    Public Property miMatriz() As Negocio.MatrizDeCalculoN
        Get
            Return DirectCast(Session("miMatriz"), Negocio.MatrizDeCalculoN)
        End Get
        Set(ByVal value As Negocio.MatrizDeCalculoN)
            Session("miMatriz") = value
        End Set
    End Property
    Public Property misJueces() As List(Of Entidades.Juez)
        Get
            Return DirectCast(Session("misJueces"), List(Of Entidades.Juez))
        End Get
        Set(ByVal value As List(Of Entidades.Juez))
            Session("misJueces") = value
        End Set
    End Property

    Public PuntajeA_Entero(4) As TextBox
    Public PuntajeA_decimal(4) As TextBox
    Public PuntajeB_Entero(4) As TextBox
    Public PuntajeB_decimal(4) As TextBox
    Dim CantidadJueces As Integer = 5
    Private Sub CalculoCIPA_Error(sender As Object, e As EventArgs) Handles Me.Error
        TratarErrorSinTry("CalculoCIPA")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            Page.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None
            If Not IsPostBack Then
                misJueces = New List(Of Entidades.Juez)
                miMatriz = New Negocio.MatrizDeCalculoN("Competencia")
                cargarCompetencia()
                cargarDatos()
            End If
        Catch ex As Entidades.miClaseExcepcion
            TratarErrorEnCatch("CalculoCIPA", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("CalculoCIPA", ex2)
        End Try
    End Sub
    Private Sub cargarCompetencia()
        Try
            Dim JUEZ1 As New Entidades.Juez("Juez1")
            Dim JUEZ2 As New Entidades.Juez("Juez2")
            Dim JUEZ3 As New Entidades.Juez("Juez3")
            Dim JUEZ4 As New Entidades.Juez("Juez4")
            Dim JUEZ5 As New Entidades.Juez("Juez5")

            misJueces.Add(JUEZ1)
            misJueces.Add(JUEZ2)
            misJueces.Add(JUEZ3)
            misJueces.Add(JUEZ4)
            misJueces.Add(JUEZ5)
        Catch ex As Entidades.miClaseExcepcion
            TratarErrorEnCatch("CalculoCIPA", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("CalculoCIPA", ex2)
        End Try
    End Sub
    Private Sub cargarDatos()
        Try
            TxtJ1A.Text = "7"
            TXTJ1AA.Text = "7"
            TXTJ1B.Text = "7"
            Txtj1BB.Text = "5"

            txtJ2A.Text = "7"
            txtJ2AA.Text = "7"
            txtJ2B.Text = "7"
            txtJ2BB.Text = "5"

            txtJ3A.Text = "7"
            txtJ3AA.Text = "7"
            txtJ3B.Text = "7"
            txtJ3BB.Text = "5"

            txtJ4A.Text = "7"
            txtJ4AA.Text = "7"
            txtJ4B.Text = "7"
            txtJ4BB.Text = "5"

            txtJ5A.Text = "7"
            txtj5AA.Text = "7"
            txtJ5B.Text = "7"
            txtJ5BB.Text = "5"
            TxtOrden.Text = "1"
        Catch ex As Entidades.miClaseExcepcion
            TratarErrorEnCatch("CalculoCIPA", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("CalculoCIPA", ex2)
        End Try
    End Sub

    Private Sub limpiar()
        Try
            Dim proximo As Integer = CInt(TxtOrden.Text) + 1
            TxtOrden.Text = proximo.ToString
            TxtJ1A.Text = ""
            TXTJ1AA.Text = ""
            TXTJ1B.Text = ""
            Txtj1BB.Text = ""

            txtJ2A.Text = ""
            txtJ2AA.Text = ""
            txtJ2B.Text = ""
            txtJ2BB.Text = ""

            txtJ3A.Text = ""
            txtJ3AA.Text = ""
            txtJ3B.Text = ""
            txtJ3BB.Text = ""

            txtJ4A.Text = ""
            txtJ4AA.Text = ""
            txtJ4B.Text = ""
            txtJ4BB.Text = ""

            txtJ5A.Text = ""
            txtj5AA.Text = ""
            txtJ5B.Text = ""
            txtJ5BB.Text = ""

            LblError.Visible = False
            TxtError.Visible = False

            txtPatinador.Text = ""
            txtPatinador.Focus()
        Catch ex As Entidades.miClaseExcepcion
            TratarErrorEnCatch("CalculoCIPA", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("CalculoCIPA", ex2)
        End Try
    End Sub
    Private Sub Siguiente(ByRef unMensaje As Entidades.Mensaje)
        Try
            Dim patinador As New Entidades.patinador(txtPatinador.Text)
            Dim miCompetencia As New Entidades.Competencia(txtCompetencia.Text)

            miCompetencia.participante = patinador
            miMatriz.patinadores.Add(patinador)

            'armo los puntajes
            Dim miPuntaje As New Entidades.puntaje
            Dim miPuntajeN As New Negocio.PuntajeN
            'Obtener los puntajes de la grilla
            asignarArrayPuntajes()
            For i = 0 To (CantidadJueces - 1)
                'creo el objeto puntaje
                Dim elPuntaje As New Entidades.puntaje
                elPuntaje.idPuntaje = i + 1
                elPuntaje.juez = misJueces.Item(i)
                elPuntaje.patinador = patinador

                'Armo la lista de valores que cuelga del puntaje
                Dim valorA As New Entidades.Valor
                Dim valorB As New Entidades.Valor
                valorA.ParteEntera = CInt(PuntajeA_Entero(i).Text)
                valorA.ParteDecimal = CInt(PuntajeA_decimal(i).Text)
                valorB.ParteEntera = CInt(PuntajeB_Entero(i).Text)
                valorB.ParteDecimal = CInt(PuntajeB_decimal(i).Text)

                'Asigo los valores al puntaje
                elPuntaje.misvalores.Add(valorA)
                elPuntaje.misvalores.Add(valorB)

                miPuntajeN.ArmarValores(elPuntaje)
                miCompetencia.misPuntajes.Add(elPuntaje)

                'para el calculo
                miMatriz.puntajes.Add(New Entidades.puntaje(elPuntaje.valorA, elPuntaje.valorB, patinador, misJueces.Item(i)))
            Next
            'grabo los puntajes en la base 
            If miPuntajeN.Nuevo(miCompetencia) < 0 Then
                unMensaje.texto = "Error al instertar Puntaje"
                unMensaje.Titulo = "ERROR CALCULO"
                miMensajero.EscribirBitacora("Error", miUsuario.login, "Error al insertar un Puntaje")
                LblError.Visible = True
                LblError.Text = unMensaje.Titulo
                TxtError.Visible = True
                TxtError.Text = unMensaje.texto
            End If
            'deberia limpiar los textbox para el proximo puntaje
            'muestra los puntajes en la grilla

            GridTabla.DataSource = miPuntajeN.listar(miCompetencia)
            GridTabla.DataBind()
        Catch ex As Entidades.miClaseExcepcion
            miMensajero.EscribirBitacora("Excepcion", "Sistema", "Ocurrió una excepción en la Pagina CalculoCIPA => " & ex.Descripcion & " (" & ex.laexcepcion.Message & ")")
        Catch ex As Exception
            miMensajero.EscribirBitacora("Excepcion", "Sistema", "Ocurrió una excepción DE ERROR en la Pagina CalculoCIPA => " & ex.Message)
            TxtError.Text = "Error al ingresar datos"
            TxtError.Visible = True
            LblError.Text = "ERROR: "
            LblError.ForeColor = Drawing.Color.Red
            LblError.Visible = True
        End Try

    End Sub
    Private Sub calcular()
        Try
            miMatriz.jueces = misJueces
            'EL CALCULO
            miMatriz.cargarPuntuaciones()
            'miMatriz.mostrarPuntuaciones()
            miMatriz.ObtenerSumaTotalxPatinador()
            Dim msgSumaTotalxPatinador As New Entidades.Mensaje
            miMatriz.MostrarSumaTotalxPatinador(msgSumaTotalxPatinador)
            miMatriz.inicializarVictoriasDerrotas()
            miMatriz.obtenervictorias()
            'miMatriz.mostrarVictorias()
            'miMatriz.mostrarDerrotas()
            miMatriz.obtenerVictoriasMayoritarias()
            'miMatriz.mostrarVictoriasMayoritarias()
            Dim msgClasificacion As New Entidades.Mensaje
            miMatriz.ObtenerClasificacion(msgClasificacion)
            TxtSumas.Text = msgSumaTotalxPatinador.texto
            TxtClasificacion.Text = msgClasificacion.texto
            PanelResultados.GroupingText = PanelResultados.GroupingText & " - " & txtCompetencia.Text
        Catch ex As Entidades.miClaseExcepcion
            TratarErrorEnCatch("CalculoCIPA", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("CalculoCIPA", ex2)
        End Try
    End Sub
    Public Sub asignarArrayPuntajes()
        Try
            'juez 1
            PuntajeA_Entero(0) = TxtJ1A
            PuntajeA_decimal(0) = TXTJ1AA
            PuntajeB_Entero(0) = TXTJ1B
            PuntajeB_decimal(0) = Txtj1BB

            'juez 2
            PuntajeA_Entero(1) = txtJ2A
            PuntajeA_decimal(1) = txtJ2AA
            PuntajeB_Entero(1) = txtJ2B
            PuntajeB_decimal(1) = txtJ2BB

            'juez 3
            PuntajeA_Entero(2) = txtJ3A
            PuntajeA_decimal(2) = txtJ3AA
            PuntajeB_Entero(2) = txtJ3B
            PuntajeB_decimal(2) = txtJ3BB


            'juez 4
            PuntajeA_Entero(3) = txtJ4A
            PuntajeA_decimal(3) = txtJ4AA
            PuntajeB_Entero(3) = txtJ4B
            PuntajeB_decimal(3) = txtJ4BB

            'juez 5
            PuntajeA_Entero(4) = txtJ5A
            PuntajeA_decimal(4) = txtj5AA
            PuntajeB_Entero(4) = txtJ5B
            PuntajeB_decimal(4) = txtJ5BB
        Catch ex As Entidades.miClaseExcepcion
            TratarErrorEnCatch("CalculoCIPA", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("CalculoCIPA", ex2)
        End Try
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Try
            Dim unMensaje As New Entidades.Mensaje
            Siguiente(unMensaje)
            Response.Write(unMensaje.texto)
            limpiar()
        Catch ex As Entidades.miClaseExcepcion
            TratarErrorEnCatch("CalculoCIPA", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("CalculoCIPA", ex2)
        End Try
    End Sub

    Protected Sub BtnCalcular_Click(sender As Object, e As EventArgs) Handles BtnCalcular.Click
        Try
            calcular()
            GridTabla.Visible = False
            txtCompetencia.Text = ""
            txtTorneo.Text = ""
            TxtOrden.Text = ""
            miMensajero.EscribirBitacora("Calculo", miUsuario.login, "Se hizo uso de nuestro servicio gratuito del cálculo CIPA.")
        Catch ex As Entidades.miClaseExcepcion
            TratarErrorEnCatch("CalculoCIPA", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("CalculoCIPA", ex2)
        End Try
    End Sub

    Protected Sub btnLimpiar_Click(sender As Object, e As EventArgs) Handles btnLimpiar.Click
        Response.Redirect("~/CalculoCIPA.aspx")
    End Sub

    Protected Sub menuRegistro_Click(sender As Object, e As EventArgs) Handles menuRegistro.Click
        Response.Redirect("~/Registro.aspx")
    End Sub
    Protected Sub menuContacto_Click(sender As Object, e As EventArgs) Handles menuContacto.Click
        Response.Redirect("~/Contacto.aspx")
    End Sub
    Protected Sub LinkRecomendacion_Click(sender As Object, e As EventArgs) Handles LinkRecomendacion.Click
        Response.Redirect("~/Recomendacion.aspx")
    End Sub
End Class