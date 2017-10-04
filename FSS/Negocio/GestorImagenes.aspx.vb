Imports neg = _02_Negocio
Imports ent = _03_Entidades
Imports System.IO
Imports System.Data

Public Class GestorImagenes
    Inherits PaginaBase
    Private Sub GestorImagenes_Error(sender As Object, e As EventArgs) Handles Me.Error
        TratarErrorSinTry("GestorImagenes")
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try

        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("GestorImagenes", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("GestorImagenes", ex2)
        End Try
    End Sub

    Private Sub GestorImagenes_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        Try
            ControlarAutenticacion("GestorImagenes")
            ControlarConsistencia("GestorImagenes")
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("GestorImagenes", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("GestorImagenes", ex2)
        End Try
    End Sub

    Protected Sub btnEnviar_Click(sender As Object, e As EventArgs) Handles btnEnviar.Click
        Try
            If FileUpload1.HasFile Then
                Dim fileName As String = FileUpload1.FileName
                FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Negocio/ImagenesProductos/") & fileName)
                miMensajero.EscribirBitacora("Insert", miUsuario.login, "Se cargó una nueva imagen: " & FileUpload1.FileName)
            End If

            Dim dt As New DataTable()
            dt.Columns.Add("File")
            dt.Columns.Add("Size")
            dt.Columns.Add("Type")

            For Each strfile As String In Directory.GetFiles(Server.MapPath("~/Negocio/ImagenesProductos"))
                Dim fi As New FileInfo(strfile)
                dt.Rows.Add(fi.Name, fi.Length.ToString(), GetFileTypeByExtension(fi.Extension))
            Next

            GridView1.DataSource = dt
            GridView1.DataBind()
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("GestorImagenes", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("GestorImagenes", ex2)
        End Try
    End Sub

    Private Function GetFileTypeByExtension(fileExtension As String) As String
        Try
            Select Case fileExtension.ToLower()
                Case ".docx", ".doc"
                    Return "Microsoft Word Document"
                Case ".xlsx", ".xls"
                    Return "Microsoft Excel Document"
                Case ".txt"
                    Return "Text Document"
                Case ".jpg", ".png", ".bmp", ".gif", ".png"
                    Return "Image"
                Case ".txt"
                    Return "text"
                Case Else
                    Return "Unknown"
            End Select
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("GestorImagenes", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("GestorImagenes", ex2)
        End Try
    End Function

    Protected Sub GridView1_RowCommand(sender As Object, e As GridViewCommandEventArgs)
        Try
            Response.Clear()
            Response.ContentType = "application/octet-stream"
            Response.AppendHeader("Content-Disposition", "filename=" + e.CommandArgument)
            Response.TransmitFile(Server.MapPath("~/Negocio/ImagenesProductos/") + e.CommandArgument)
            Response.[End]()
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("GestorImagenes", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("GestorImagenes", ex2)
        End Try
    End Sub


End Class