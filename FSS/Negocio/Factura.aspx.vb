Imports iTextSharp.text
Imports iTextSharp.text.pdf
Imports iTextSharp.text.html.simpleparser
Imports System.IO
Imports ent = _03_Entidades
Imports neg = _02_Negocio
Public Class Factura
    Inherits PaginaBase
    Public Property unPedido() As ent.Pedido
        Get
            Return DirectCast(Session("Pedido"), ent.Pedido)
        End Get
        Set(ByVal value As ent.Pedido)
            Session("Pedido") = value
        End Set
    End Property
    Private _PedidoNeg As New neg.PedidoN
    Public Property PedidoNeg() As neg.PedidoN
        Get
            Return _PedidoNeg
        End Get
        Set(ByVal value As neg.PedidoN)
            _PedidoNeg = value
        End Set
    End Property
    Dim listaDetalle As New List(Of ent.PedidoDetalleVista)
    Dim miPedido As New ent.PedidoCabeceraVista
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim usuarioNeg As New neg.UsuarioN
        If usuarioNeg.EsCliente(miUsuario) Then
            If Not Session("Pedido") Is Nothing Then
                unPedido = DirectCast(Session("Pedido"), ent.Pedido)
                generarFactura()
            End If
        Else
            Response.Redirect("~/NoAutenticado.aspx")
        End If
    End Sub
    Private Sub generarFactura()
        ' Creo el documento
        Dim document = New Document(PageSize.A4, 50, 50, 25, 25)

        ' Creo el PdfWrite para uar un MemoryStream
        Dim output = New MemoryStream()
        Dim writer = PdfWriter.GetInstance(document, output)
        ' abro el documento
        document.Open()

        'Obtengo la cabecera de la factura
        PedidoNeg.miPedido = unPedido
        miPedido = PedidoNeg.DameEstadoDe()
        unPedido.numero = miPedido.numero
        unPedido.codigoSucursal = miPedido.codigoSucursal
        PedidoNeg.miPedido = unPedido
        PedidoNeg.DameEnvio()
        ' Leo el contenido del archivo HTML que uso como template
        Dim contents As String = File.ReadAllText(Server.MapPath("~/HTMLTemplate/Factura.html"))

        ' remplazo los valores de la factura en el html
        contents = contents.Replace("[NUMERO]", PedidoNeg.armarNumeroFactura)
        contents = contents.Replace("[FECHA]", PedidoNeg.miPedido.fechaEmision.ToShortDateString())
        contents = contents.Replace("[EMPRESA]", PedidoNeg.miPedido.empresa.nombre)
        contents = contents.Replace("[IIBB]", PedidoNeg.miPedido.empresa.nroIngresosBrutos)
        contents = contents.Replace("[CUIT]", PedidoNeg.miPedido.empresa.CUIT)
        contents = contents.Replace("[CLIENTE]", PedidoNeg.miPedido.cliente.apellido & ", " & PedidoNeg.miPedido.cliente.nombre)
        contents = contents.Replace("[DIRCLIENTE]", PedidoNeg.miPedido.domicilio.calle & " " & PedidoNeg.miPedido.domicilio.numero.ToString & " " & PedidoNeg.miPedido.domicilio.piso.ToString & " " & PedidoNeg.miPedido.domicilio.departamento)
        contents = contents.Replace("[LOCALIDAD]", PedidoNeg.miPedido.domicilio.localidad.localidad)
        contents = contents.Replace("[PROVINCIA]", PedidoNeg.miPedido.domicilio.provincia.provincia)
        contents = contents.Replace("[CP]", PedidoNeg.miPedido.domicilio.codigoPostal.CPA)
        contents = contents.Replace("[DNI]", PedidoNeg.miPedido.cliente.DNI.ToString)

        Dim itemsTable As String = "<table border='1' style=style='border-collapse:collapse;border:1px solid black;'><tr><th width='10%' style='padding:5px;vertical-align:top;text-align:left;font-weight:bold;'>Inventario</th><th style='padding:5px;vertical-align:top;text-align:left;font-weight:bold;'>Descripción</th><th width='10%' style='padding:5px;vertical-align:top;text-align:center;font-weight:bold;'>Cantidad</th><th width='20%' style='padding:5px;vertical-align:top;text-align:center;font-weight:bold;'>Precio Unit</th><th width='20%' style='padding:5px;vertical-align:top;text-align:center;font-weight:bold;background:#eee;'>Precio Total</th></tr>"

        'Obtengo el detalle
        listaDetalle = PedidoNeg.ListarDetalleDe()
        For Each item As ent.PedidoDetalleVista In listaDetalle
            Dim fila As String = "<tr><td width='10%' style='padding:5px;vertical-align:top;text-align:left'>" & item.inventario.ToString & "</td><td style='padding:5px;vertical-align:top;text-align:left'>" & item.descripcion & "</td><td width='10%' style='padding:5px;vertical-align:top;text-align:center'>" & item.cantidad.ToString & "</td><td width='20%' style='padding: 5px;vertical-align: top;text-align:center'>" & item.precioUnitario.ToString & "</td><td width='20%' style='padding: 5px;vertical-align: top;text-align:center'>" & item.SubTotal.ToString & "</td></tr>"
            itemsTable += fila
        Next
        itemsTable += "</table><table>"
        Dim subtotal As Double = 0
        subtotal = PedidoNeg.Total(listaDetalle)
        PedidoNeg.DamePago()
        Dim cantCuotas As Integer = 0
        cantCuotas = PedidoNeg.DameCantCuotasDe()
        Dim porcRecargo As Integer = 0
        porcRecargo = PedidoNeg.miPedido.pago.porcentRecargo
        Dim recargo As Double = 0
        recargo = (subtotal * porcRecargo) / 100
        Dim iva As Double = 0
        iva = ((subtotal + recargo) * 21) / 100
        Dim total As Double = 0
        total = subtotal + recargo + iva
        'pongo el total
        itemsTable += "<tr id='subtotal' style='text-align:right;background:#eee;font-weight:bold;padding-bottom:20px;border-top:2px solid #eee;'><td colspan='3' style='padding:5px;vertical-align:top;'></td><td width='20%' style='font-weight:bold;text-align:right;'>SubTotal: </td><td width='20%' style='text-align:right'>" & subtotal.ToString & "</td></tr>"
        itemsTable += "<tr id='recargo' style='text-align:right;background:#eee;font-weight:bold;padding-bottom:20px;border-top:2px solid #eee;'><td colspan='3' style='padding:5px;vertical-align:top;'></td><td width='20%' style='font-weight:bold;text-align:right;'>Recargo Tarjeta(" & porcRecargo.ToString & "%): </td><td width='20%' style='text-align:right'>" & recargo.ToString & "</td></tr>"
        itemsTable += "<tr id='iva' style='text-align:right;background:#eee;font-weight:bold;padding-bottom:20px;border-top:2px solid #eee;'><td colspan='3' style='padding:5px;vertical-align:top;'></td><td width='20%' style='font-weight:bold;text-align:right;'>IVA (21%): </td><td width='20%' style='text-align:right'>" & iva.ToString & "</td></tr>"
        itemsTable += "<tr id='total' style='text-align:right;background:#eee;font-weight:bold;padding-bottom:20px;border-top:2px solid #eee;'><td colspan='3' style='padding:5px;vertical-align:top;'></td><td width='20%' style='font-weight:bold;text-align:right;'>Total: </td><td width='20%' style='text-align:right'>" & total.ToString & "</td></tr>"
        itemsTable += "</table>"
        contents = contents.Replace("[ITEMS]", itemsTable)
        'string pruebaItem = "<table><tr><td width='10%' style='padding:5px;vertical-align:top;text-align:left'>101</td><td colspan='2' style='padding:5px;vertical-align:top;text-align:left'>Bota Risport Blanca</td><td width='10%' style='padding:5px;vertical-align:top;text-align:center'>2</td><td width='20%' style='padding: 5px;vertical-align: top;text-align:center'>7.000,00</td><td width='20%' style='padding: 5px;vertical-align: top;text-align:center'>14.000,00</td></tr></table>";
        'contents = contents + pruebaItem;
        Dim vto As Date = PedidoNeg.miPedido.fechaEmision.AddDays(30)
        contents = contents & "Fecha de Vencimiento " & vto.ToShortDateString() & "<br/>"
        contents = contents & "Fecha de Impresión " & DateTime.Now.ToShortDateString()
        Dim parsedHtmlElements = HTMLWorker.ParseToList(New StringReader(contents), Nothing)
        For Each htmlElement In parsedHtmlElements
            document.Add(TryCast(htmlElement, IElement))
        Next
        ' Agrego el logo
        Dim logo = iTextSharp.text.Image.GetInstance(Server.MapPath("~\Imagenes\logoFSS_peque.png"))
        logo.SetAbsolutePosition(40, 750)
        logo.ScaleAbsolute(80, 50)
        document.Add(logo)

        document.Close()

        Response.ContentType = "application/pdf"
        Response.AddHeader("Content-Disposition", String.Format("attachment;filename=Factura_Nro{0}.pdf", PedidoNeg.armarNumeroFactura))
        Response.BinaryWrite(output.ToArray())
        miMensajero.EscribirBitacora("Impresion", miUsuario.login, "Se generó el PDF de la factura " & PedidoNeg.armarNumeroFactura)
    End Sub
#Region "OLD"
    Private Sub prueba()
        ''crea documento itextsharp
        'Dim doc = New Document()

        ''obtiene ruta del archivo PDF
        ''Dim pdf = Server.MapPath("~/PDF/Factura.pdf")
        'Using memorystream As New System.IO.MemoryStream
        '    'crea y abre el archivo PDF
        '    'PdfWriter.GetInstance(doc, New FileStream(pdf, FileMode.Create))
        '    PdfWriter.GetInstance(doc, memorystream)
        '    doc.Open()

        '    'parrafo 0 en reporte
        '    Dim p0 As New Paragraph("FSS - La tienda OnLine para el patinador")
        '    p0.Alignment = Element.ALIGN_CENTER
        '    doc.Add(p0)

        '    'fuente titulo
        '    Dim titulo As iTextSharp.text.Font = FontFactory.GetFont("Verdana", 15, iTextSharp.text.Color.RED)

        '    'titulo
        '    doc.Add(New Paragraph("FACTURA", titulo))

        '    'parrafo 1 en reporte
        '    Dim p1 As New Paragraph("Fecha: " + DateTime.Today.ToShortDateString())
        '    p1.Alignment = Element.ALIGN_LEFT
        '    doc.Add(p1)

        '    'parrafo 2 en reporte
        '    'Dim p2 As New Paragraph("Hora: " + DateTime.Today.ToShortTimeString())
        '    'p2.Alignment = Element.ALIGN_LEFT
        '    'doc.Add(p2)

        '    'parrafo 3 en reporte
        '    Dim p3 As New Paragraph("Usuario: " + "UsuarioPrueba")
        '    p3.Alignment = Element.ALIGN_LEFT
        '    doc.Add(p3)

        '    'parrafo 4 en reporte
        '    Dim p4 As New Paragraph("-------------------------------------------------------------------------------------------------------------------------------")
        '    p4.Alignment = Element.ALIGN_LEFT
        '    doc.Add(p4)

        '    doc.Add(New Paragraph(vbLf))
        '    doc.Add(New Paragraph(vbLf))

        '    'TABLA
        '    'creo tabla
        '    Dim table As New PdfPTable(5)
        '    'creo celda
        '    Dim cell As New PdfPCell(New Phrase("Ventas"))
        '    cell.Colspan = 3
        '    cell.HorizontalAlignment = 1
        '    '0=Left, 1=Centre, 2=Right
        '    'agregar celda a tabla
        '    table.AddCell(cell)

        '    Dim cellFecha As New PdfPCell(New Phrase("Fecha"))
        '    cellFecha.HorizontalAlignment = 1
        '    table.AddCell(cellFecha)

        '    Dim cellVenta As New PdfPCell(New Phrase("Venta"))
        '    cellVenta.HorizontalAlignment = 1

        '    Dim cellCuit As New PdfPCell(New Phrase("CUIT"))
        '    cellCuit.HorizontalAlignment = 1

        '    Dim cellCliente As New PdfPCell(New Phrase("Cliente"))
        '    cellCliente.HorizontalAlignment = 1

        '    Dim cellTotal As New PdfPCell(New Phrase("Total"))
        '    cellTotal.HorizontalAlignment = 1


        '    table.AddCell(cellVenta)
        '    table.AddCell(cellCuit)
        '    table.AddCell(cellCliente)
        '    table.AddCell(cellTotal)

        '    ''itero los datos de la consulta del SP y agrego a la tabla
        '    'For Each c As var In db.Reporte1_TotalxVenta()
        '    '    Dim cell1 As New PdfPCell(New Phrase(c.fecha.ToShortDateString()))
        '    '    cell1.HorizontalAlignment = 1
        '    '    table.AddCell(cell1)

        '    '    Dim cell2 As New PdfPCell(New Phrase(c.venta.ToString()))
        '    '    cell2.HorizontalAlignment = 1
        '    '    table.AddCell(cell2)

        '    '    Dim cell3 As New PdfPCell(New Phrase(c.cuit.ToString()))
        '    '    cell3.HorizontalAlignment = 1
        '    '    table.AddCell(cell3)

        '    '    Dim cell4 As New PdfPCell(New Phrase(c.cliente.ToString()))
        '    '    cell4.HorizontalAlignment = 1
        '    '    table.AddCell(cell4)

        '    '    Dim cell5 As New PdfPCell(New Phrase(c.Total.ToString()))
        '    '    cell5.HorizontalAlignment = 1
        '    '    table.AddCell(cell5)
        '    'Next

        '    'agregar tabla a documento
        '    doc.Add(table)
        '    doc.Add(New Paragraph(""))

        '    'cierra el documento itextsharp
        '    doc.Close()
        '    Dim bytes As Byte() = memorystream.ToArray()
        '    memorystream.Close()
        '    'devuelve el archivo
        '    Response.Clear()
        '    Response.ContentType = "application/pdf"
        '    Response.AddHeader("Content-Disposition", "attachment; filename=Factura.pdf")
        '    Response.Buffer = True
        '    Response.Cache.SetCacheability(HttpCacheability.NoCache)
        '    Response.BinaryWrite(bytes)
        '    Response.[End]()
        '    Response.Close()
        'End Using
    End Sub

#End Region
End Class