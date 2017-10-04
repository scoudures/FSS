Imports System.Data.SqlClient
Imports ent = _03_Entidades

Public Class FamiliaM
    Dim miAcceso As New Acceso
    Dim miPermisoM As New PermisoM
    Public Function Listar(ByRef unaFamilia As ent.Familia, ByVal suma As Boolean) As List(Of ent.PermisoAbs)
        Try
            'con esto voy llenar el tree de permisos
            Dim miLista As New List(Of ent.PermisoAbs)
            Dim parametros(0) As SqlParameter
            parametros(0) = miAcceso.constructor("@familia", unaFamilia.nombre)
            Dim dt_Permisos As DataTable = miAcceso.leer("Familia_SelectByID", parametros)
            'recorro datatable de permisos 
            If dt_Permisos.Rows.Count > 0 Then
                For Each fila As DataRow In dt_Permisos.Rows
                    'es un permiso compuesto??
                    If esPcompuesto(fila("CodigoPermiso"), dt_Permisos) Then
                        'instancio un nuevo permiso compuesto
                        Dim pcompuesto As New ent.Familia
                        pcompuesto.codigo = fila("CodigoPermiso")
                        pcompuesto.nombre = fila("PermisoHijo")
                        pcompuesto.estado = CBool(fila("Estado"))
                        If suma Then
                            'si suma quiero ver el check
                            pcompuesto.seleccionado = CBool(fila("Seleccionado"))
                            'cargo hijos para el permiso compuesto
                            pcompuesto.misPermisos = Listar(pcompuesto, suma)
                            miLista.Add(pcompuesto)
                        Else
                            'si resta no quiero el check
                            pcompuesto.seleccionado = False
                        End If

                        'es un permiso simple?
                    ElseIf esPsimple(fila("CodigoPermiso"), dt_Permisos) Then
                        'instancio un nuevo permiso simple
                        Dim psimple As New ent.Permiso
                        psimple.codigo = fila("CodigoPermiso")
                        psimple.nombre = fila("PermisoHijo")
                        psimple.estado = CBool(fila("Estado"))
                        If Not suma And unaFamilia.codigo > 500 Then
                            'si resta quiero ver el check
                            psimple.seleccionado = CBool(fila("Seleccionado"))
                            miLista.Add(psimple)
                        ElseIf suma And unaFamilia.codigo < 100 Then
                            'si suma no quiero el check
                            psimple.seleccionado = False
                            miLista.Add(psimple)
                        End If
                    End If
                Next
            End If
            Return miLista
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function

    Public Function Listar() As List(Of ent.Familia)
        Dim miLista As New List(Of ent.Familia)
        Dim dt As DataTable = miAcceso.leer("Familia_SelectAll")
        Try
            For Each fila As DataRow In dt.Rows
                Dim unaFamilia As New ent.Familia
                unaFamilia.nombre = fila("permiso").ToString
                unaFamilia.codigo = CInt(fila("CodigoPermiso"))
                unaFamilia.estado = True
                miLista.Add(unaFamilia)
            Next
            'llamada recursiva
            Return miLista
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function

    Public Function ListarTodos() As List(Of ent.PermisoAbs)
        'con esto voy llenar el tree de permisos
        Dim miLista As New List(Of ent.PermisoAbs)
        Dim dt_Permisos As DataTable = miAcceso.leer("PermisoFamilia_SelectAll")
        Dim nombre As String = ""
        Try
            'recorro datatable de permisos 
            If dt_Permisos.Rows.Count > 0 Then
                For Each fila As DataRow In dt_Permisos.Rows
                    'es un permiso compuesto??
                    If String.Compare(fila("PermisoPadre"), "Sistema") = 0 Then
                        'instancio permiso Compuesto
                        Dim pcompuesto As New ent.Familia
                        pcompuesto.codigo = fila("CodigoPermiso")
                        pcompuesto.nombre = fila("PermisoHijo")
                        pcompuesto.estado = True
                        cargarHijos2(dt_Permisos, pcompuesto.codigo, pcompuesto.misPermisos)
                        'agrego permiso a la lista
                        miLista.Add(pcompuesto)
                    End If
                Next
            End If
            Return miLista
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Shared Function cargarHijos2(ByVal Dt_Permisos As DataTable, ByVal idPadre As String, ByRef listaHijos As List(Of ent.PermisoAbs)) As Integer
        Dim dt_hijos As New DataTable
        Dim cadenaFiltro As String = ""
        Dim cant_Filas As Integer
        Dim i As Integer = 0
        Try
            cant_Filas = Dt_Permisos.Rows.Count
            'obtengo todos los permisos contenidos en un permiso compuesto
            cadenaFiltro = "CodigoPadre = '" & idPadre & "'"
            'creo un dataview
            Dim dv_Permisos As New DataView(Dt_Permisos)
            'filtro los hijos 
            dv_Permisos.RowFilter = cadenaFiltro
            cant_Filas = dv_Permisos.Count
            'recorro los hijos
            For i = 0 To dv_Permisos.Count - 1
                'es un permisos compuesto?
                If esPcompuesto(dv_Permisos(i)("CodigoPermiso"), Dt_Permisos) Then
                    'instancio un nuevo permiso compuesto
                    Dim pcompuesto As New ent.Familia
                    pcompuesto.codigo = dv_Permisos(i)("CodigoPermiso")
                    pcompuesto.nombre = dv_Permisos(i)("PermisoHijo")
                    pcompuesto.estado = True
                    'cargo hijos para el permiso compuesto
                    cargarHijos2(Dt_Permisos, pcompuesto.codigo, pcompuesto.misPermisos)
                    listaHijos.Add(pcompuesto)
                    'es un permiso simple?
                ElseIf esPsimple(dv_Permisos(i)("CodigoPermiso"), Dt_Permisos) Then
                    'instancio un nuevo permiso simple
                    Dim psimple As New ent.Permiso
                    psimple.codigo = dv_Permisos(i)("CodigoPermiso")
                    psimple.nombre = dv_Permisos(i)("PermisoHijo")
                    psimple.estado = True
                    listaHijos.Add(psimple)
                End If
            Next
        Catch ex2 As Exception
            Throw ex2
        End Try
        Return 0
    End Function
    Public Shared Function esPsimple(ByVal codigo As String, ByVal Dt_Permisos As DataTable) As Boolean
        Dim result As Boolean = False
        Dim dv_psimples As New DataView(Dt_Permisos)
        Dim cadena As String = ""
        Try
            cadena = "Simple=1"
            'filtro el dataview con la cadena
            dv_psimples.RowFilter = cadena
            For i = 0 To dv_psimples.Count - 1
                If dv_psimples(i)("CodigoPermiso") = codigo Then
                    Return True
                End If
            Next
            Return result
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Shared Function esPcompuesto(ByVal codigo As String, ByVal dt_Permisos As DataTable) As Boolean
        Dim dv_pcompuestos As New DataView(dt_Permisos)
        Dim cadena As String = ""
        Dim i As Integer = 0
        Dim result As Boolean = False
        Try
            'filtro el dataview con la cadena
            cadena = "Simple=0"
            dv_pcompuestos.RowFilter = cadena
            For i = 0 To dv_pcompuestos.Count - 1
                If dv_pcompuestos(i)("CodigoPermiso") = codigo Then
                    Return True
                End If
            Next
            Return result
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function

    Public Function Insert(ByRef unaFamilia As ent.Familia) As Integer
        Try
            Dim parametros(0) As SqlParameter
            parametros(0) = miAcceso.constructor("@p1", unaFamilia.nombre)

            Return miAcceso.Escribir("Familia_Insert", parametros)
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function Delete(ByRef unaFamilia As ent.Familia) As Integer
        Try
            Dim parametros(0) As SqlParameter
            parametros(0) = miAcceso.constructor("@p1", unaFamilia.nombre)

            Return miAcceso.Escribir("Familia_Delete", parametros)
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function Asignar(ByRef unaFamilia As ent.Familia, ByRef unPermiso As ent.PermisoAbs) As Integer
        Try
            Dim parametros(2) As SqlParameter
            parametros(0) = miAcceso.constructor("@p1", unaFamilia.nombre)
            parametros(1) = miAcceso.constructor("@p2", unPermiso.nombre)
            parametros(2) = miAcceso.constructor("@p3", unPermiso.seleccionado)
            Return miAcceso.Escribir("Familia_AsignarPermiso", parametros)
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function

#Region "Codigo viejo"
    'Public Function ListarIN(ByRef miFamilia As ent.Familia) As List(Of ent.Familia)
    '    Dim miLista As New List(Of ent.Familia)
    '    Dim parametros(0) As SqlParameter
    '    parametros(0) = miAcceso.constructor("@p1", miFamilia.nombre)
    '    Dim dt As DataTable = miAcceso.leer("Familia_SelectIN", parametros)

    '    For Each fila As DataRow In dt.Rows
    '        Dim unaFamilia As New ent.Familia
    '        unaFamilia.nombre = fila("permiso").ToString
    '        miLista.Add(unaFamilia)
    '    Next
    '    Return miLista
    'End Function

    'Public Function ListarFamiliasCon(ByRef unPermiso As ent.Permiso) As List(Of ent.Familia)
    '    Dim miLista As New List(Of ent.Familia)
    '    Dim parametros(0) As SqlParameter
    '    parametros(0) = miAcceso.constructor("@p1", unPermiso.nombre)
    '    Dim dt As DataTable = miAcceso.leer("Permiso_SelectINFamilia", parametros)

    '    For Each fila As DataRow In dt.Rows
    '        Dim unaFamilia As New ent.Familia
    '        unaFamilia.nombre = fila("permiso").ToString
    '        miLista.Add(unaFamilia)
    '    Next
    '    Return miLista
    'End Function
    'Public Function ListarNOTIN(ByRef miFamilia As ent.Familia) As List(Of ent.Familia)
    '    Dim miLista As New List(Of ent.Familia)
    '    Dim parametros(0) As SqlParameter
    '    parametros(0) = miAcceso.constructor("@p1", miFamilia.nombre)
    '    Dim dt As DataTable = miAcceso.leer("Familia_SelectNOTIN", parametros)

    '    For Each fila As DataRow In dt.Rows
    '        Dim unaFamilia As New ent.Familia
    '        unaFamilia.nombre = fila("permiso").ToString
    '        miLista.Add(unaFamilia)
    '    Next
    '    Return miLista
    'End Function
    'Public Sub Asignar(ByRef unaFamilia As ent.Familia, ByRef unPermiso As ent.Permiso)

    '    Dim parametros(1) As SqlParameter
    '    parametros(0) = miAcceso.constructor("@p1", unaFamilia.nombre)
    '    parametros(1) = miAcceso.constructor("@p2", unPermiso.nombre)

    '    miAcceso.Escribir("Familia_AsignarPermiso", parametros)
    '    'llamada recursiva
    '    'Dim familias As List(Of ent.Familia) = Me.ListarIN(unaFamilia)
    '    'If familias.Count > 0 Then
    '    '    For Each hijo As ent.Familia In familias
    '    '        Me.Asignar(hijo, unPermiso)
    '    '    Next
    '    'End If
    'End Sub

    'Public Sub Asignar(ByRef unaFamilia As ent.Familia, ByRef otraFamilia As ent.Familia)

    '    Dim parametros(1) As SqlParameter
    '    parametros(0) = miAcceso.constructor("@p1", unaFamilia.nombre)
    '    parametros(1) = miAcceso.constructor("@p2", otraFamilia.nombre)

    '    miAcceso.Escribir("Familia_AsignarFamilia", parametros)
    '    'llamada recursiva
    '    'Dim familias As List(Of ent.Familia) = Me.ListarIN(otraFamilia)
    '    'If familias.Count > 0 Then
    '    '    For Each hijo As ent.Familia In familias
    '    '        Me.Asignar(unaFamilia, DirectCast(hijo, ent.Familia))
    '    '    Next
    '    'End If
    '    'Dim permisoMap As New PermisoM
    '    'Dim permisos As List(Of ent.Permiso) = permisoMap.ListarIN(otraFamilia)
    '    'If permisos.Count > 0 Then
    '    '    For Each hijo As ent.Permiso In permisos
    '    '        Me.Asignar(unaFamilia, DirectCast(hijo, ent.Permiso))
    '    '    Next
    '    'End If
    'End Sub

    'Public Sub Quitar(ByRef unaFamilia As ent.Familia, ByRef unPermiso As ent.Permiso)

    '    Dim parametros(1) As SqlParameter
    '    parametros(0) = miAcceso.constructor("@p1", unaFamilia.nombre)
    '    parametros(1) = miAcceso.constructor("@p2", unPermiso.nombre)

    '    miAcceso.Escribir("Familia_QuitarPermiso", parametros)
    '    'llamada recursiva
    '    'Dim familias As List(Of ent.Familia) = Me.ListarIN(unaFamilia)
    '    'If familias.Count > 0 Then
    '    '    For Each hijo As ent.Familia In familias
    '    '        Me.Quitar(hijo, unPermiso)
    '    '    Next
    '    'End If
    'End Sub

    'Public Sub Quitar(ByRef unaFamilia As ent.Familia, ByRef otraFamilia As ent.Familia)

    '    Dim parametros(1) As SqlParameter
    '    parametros(0) = miAcceso.constructor("@p1", unaFamilia.nombre)
    '    parametros(1) = miAcceso.constructor("@p2", otraFamilia.nombre)

    '    miAcceso.Escribir("Familia_QuitarFamilia", parametros)
    '    'llamada recursiva
    '    'Dim familias As List(Of ent.Familia) = Me.ListarIN(otraFamilia)
    '    'If familias.Count > 0 Then
    '    '    For Each hijo As ent.Familia In familias
    '    '        Me.Quitar(unaFamilia, DirectCast(hijo, ent.Familia))
    '    '    Next
    '    'End If
    '    'Dim permisoMap As New PermisoM
    '    'Dim permisos As List(Of ent.Permiso) = permisoMap.ListarIN(otraFamilia)
    '    'If permisos.Count > 0 Then
    '    '    For Each hijo As ent.Permiso In permisos
    '    '        Me.Quitar(unaFamilia, DirectCast(hijo, ent.Permiso))
    '    '    Next
    '    'End If
    'End Sub

#End Region
End Class
