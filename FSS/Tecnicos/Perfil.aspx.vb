Imports neg = _02_Negocio
Imports ent = _03_Entidades
Public Class Perfil
    Inherits PaginaBase
    Public Property miFamilia() As ent.Familia
        Get
            Return DirectCast(Session("Familia"), ent.Familia)
        End Get
        Set(ByVal value As ent.Familia)
            Session("Familia") = value
        End Set
    End Property

    Private _miFamiliaN As New neg.FamiliaN
    Public Property miFamiliaN() As neg.FamiliaN
        Get
            Return _miFamiliaN
        End Get
        Set(ByVal value As neg.FamiliaN)
            _miFamiliaN = value
        End Set
    End Property


    Dim misFamilias As List(Of ent.Familia)
    Dim miFamiliaPermisos As New List(Of ent.PermisoAbs)
    Dim listaPermisos As New List(Of ent.PermisoAbs)
    Dim listaPermisosNegados As New List(Of ent.PermisoAbs)

    Private Sub Perfil_Error(sender As Object, e As EventArgs) Handles Me.Error
        TratarErrorSinTry("Perfil")
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            If Not IsPostBack Then
                enlazarFamilias()
                lstFamilia.SelectedIndex = 0
                txtFamilia.Text = lstFamilia.SelectedItem.Text
                Dim primeravez As New ent.Familia
                primeravez.nombre = txtFamilia.Text
                miFamilia = primeravez
                miFamilia.codigo = 501
                'llenar los treeview
                prepararArboles()
            End If
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Perfil", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Perfil", ex2)
        End Try
    End Sub
    Private Sub Perfil_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        Try
            ControlarAutenticacion("Perfil")
            ControlarConsistencia("Perfil")
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Perfil", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Perfil", ex2)
        End Try

    End Sub
    Public Sub enlazarFamilias()
        Try
            misFamilias = miFamiliaN.Listar
            lstFamilia.DataSource = misFamilias
            lstFamilia.DataTextField = "nombre"
            lstFamilia.DataBind()
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Perfil", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Perfil", ex2)
        End Try
    End Sub

    Protected Sub lstFamilia_SelectedIndexChanged(sender As Object, e As EventArgs) Handles lstFamilia.SelectedIndexChanged
        Try
            txtFamilia.Text = lstFamilia.SelectedItem.Text
            miFamilia.nombre = txtFamilia.Text
            miFamiliaPermisos.Clear()
            enlazarFamilias()
            prepararArboles()
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Perfil", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Perfil", ex2)
        End Try
    End Sub
    Protected Sub btnNuevo_Click(sender As Object, e As EventArgs) Handles btnNuevo.Click
        Try
            miFamilia.nombre = txtFamilia.Text
            If txtFamilia.Text.Length > 0 Then
                If miFamilia.nombre.ToUpper = "DEFAULT" Or miFamilia.nombre.ToUpper = "ADMINISTRADOR" Then
                    EnviarMensaje(Panel1, "El perfil " & miFamilia.nombre & " ya existe.", True)
                Else
                    Dim resultado As Integer
                    If txtFamilia.Text.Length > 0 Then
                        miFamilia.nombre = txtFamilia.Text
                        resultado = miFamiliaN.Insert(miFamilia)
                    End If
                    'If resultado = -1 Then
                    '    EnviarMensaje(Panel1, "Error", True)
                    'Else
                    '    EnviarMensaje(Panel1, "OK", True)
                    'End If
                    miMensajero.EscribirBitacora("ABM Familia", miUsuario.login, "Alta de la familia " & miFamilia.nombre & ".")
                    txtFamilia.Text = ""
                    enlazarFamilias()
                    prepararArboles()
                    panelPermisos.Visible = False
                    panelArboles.Visible = False
                End If
            Else
                EnviarMensaje(Panel1, "Debe seleccionar un Perfil.", True)
            End If
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Perfil", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Perfil", ex2)
        End Try
    End Sub
    Protected Sub btnEliminar_Click(sender As Object, e As EventArgs) Handles btnEliminar.Click
        Try
            miFamilia.nombre = txtFamilia.Text
            If txtFamilia.Text.Length > 0 Then
                Dim resultado As Integer
                If txtFamilia.Text.Length > 0 Then
                    miFamilia.nombre = txtFamilia.Text

                End If
                If miFamilia.nombre.ToUpper = "DEFAULT" Or miFamilia.nombre.ToUpper = "ADMINISTRADOR" Then
                    EnviarMensaje(Panel1, "El perfil " & miFamilia.nombre & " no puede ser eliminado.", True)
                Else
                    resultado = miFamiliaN.Delete(miFamilia)
                    'If resultado = -1 Then
                    '    EnviarMensaje(Panel1, "Error", True)
                    'Else
                    '    EnviarMensaje(Panel1, "OK", True)
                    'End If
                End If
                miMensajero.EscribirBitacora("ABM Familia", miUsuario.login, "Baja de la familia " & miFamilia.nombre & ".")
                txtFamilia.Text = ""
                enlazarFamilias()
                prepararArboles()
                panelPermisos.Visible = False
                panelArboles.Visible = False
            Else
                EnviarMensaje(Panel1, "Debe seleccionar un Perfil.", True)
            End If
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Perfil", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Perfil", ex2)
        End Try
    End Sub

    Protected Sub btnModificar_Click(sender As Object, e As EventArgs) Handles btnModificar.Click
        Try
            miFamilia.nombre = txtFamilia.Text
            If txtFamilia.Text.Length > 0 Then
                panelPermisos.Visible = True
                panelArboles.Visible = True
            Else
                EnviarMensaje(Panel1, "Debe seleccionar un Perfil.", True)
            End If
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Perfil", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Perfil", ex2)
        End Try
    End Sub

    Protected Sub btnActualiza_Click(sender As Object, e As EventArgs) Handles btnActualizar.Click
        Try
            miFamilia.nombre = txtFamilia.Text
            If txtFamilia.Text.Length > 0 Then
                Dim resultado As Integer
                Dim resultado2 As Integer
                If miFamilia.nombre.ToUpper = "DEFAULT" Or miFamilia.nombre.ToUpper = "ADMINISTRADOR" Then
                    EnviarMensaje(Panel1, "El perfil " & miFamilia.nombre & " no puede ser modificado.", True)
                Else
                    resultado = miFamiliaN.Update(miFamilia, treePermisos.Nodes, True)
                    resultado2 = miFamiliaN.Update(miFamilia, treePatentes.Nodes, False)
                    'If resultado = -1 And resultado2 = -1 Then
                    '    EnviarMensaje(Panel1, "Error", True)
                    'Else
                    '    EnviarMensaje(Panel1, "OK", True)
                    'End If
                End If
                miMensajero.EscribirBitacora("ABM Familia", miUsuario.login, "Modificacion de la familia " & miFamilia.nombre & ".")
                panelPermisos.Visible = False
                panelArboles.Visible = False
                txtFamilia.Text = ""
                enlazarFamilias()
                prepararArboles()
            Else
                EnviarMensaje(Panel1, "Debe seleccionar un Perfil.", True)
            End If
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Perfil", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Perfil", ex2)
        End Try
    End Sub
    Protected Sub btnTodas_Click(sender As Object, e As EventArgs) Handles btnTodas.Click
        Try
            seleccionarTodos(treePermisos.Nodes)
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Perfil", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Perfil", ex2)
        End Try
    End Sub

    Protected Sub btnNinguna_Click(sender As Object, e As EventArgs) Handles btnNinguna.Click
        Try
            deseleccionarTodos(treePermisos.Nodes)
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Perfil", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Perfil", ex2)
        End Try
    End Sub

    Protected Sub btnTodos_Click(sender As Object, e As EventArgs) Handles btnTodos.Click
        Try
            seleccionarTodos(treePatentes.Nodes)
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Perfil", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Perfil", ex2)
        End Try
    End Sub

    Protected Sub btnNinguno_Click(sender As Object, e As EventArgs) Handles btnNinguno.Click
        Try
            deseleccionarTodos(treePatentes.Nodes)
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Perfil", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Perfil", ex2)
        End Try
    End Sub
#Region "arboles"
    Private Sub prepararArboles()
        'Permisos de la familia seleccionada
        Try
            'Permisos Compuestos
            treePermisos.Nodes.Clear()
            'listaPermisos = miFamiliaN.ListarTodos()
            listaPermisos = miFamiliaN.Listar(miFamilia, True)
            llenarTreeview(treePermisos.Nodes, listaPermisos)
            treePermisos.CollapseAll()
            treePermisos.DataBind()
            'Permisos Simples
            treePatentes.Nodes.Clear()
            'listaPermisosNegados = miFamiliaN.ListarTodos()
            listaPermisosNegados = miFamiliaN.Listar(miFamilia, False)
            llenarTreeview(treePatentes.Nodes, listaPermisosNegados)
            treePatentes.CollapseAll()
            treePatentes.DataBind()
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Perfil", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Perfil", ex2)
        End Try
    End Sub

    Private Sub llenarTreeview(ByRef NodosArbol As TreeNodeCollection, lista As List(Of ent.PermisoAbs))
        Try
            'llenar los nodos del treeview de manera recursiva
            If lista.Count > 0 Then
                For Each p As ent.PermisoAbs In lista
                    Dim nodo As New TreeNode(p.nombre, p.codigo)
                    nodo.Checked = p.seleccionado
                    NodosArbol.Add(nodo)
                    'ent.Familia es un permiso compuesto
                    If TypeOf p Is ent.Familia Then
                        Dim compuesto As ent.Familia = CType(p, ent.Familia)
                        If compuesto.misPermisos.Count <> 0 Then
                            'llamada recursiva
                            llenarTreeview(nodo.ChildNodes, compuesto.misPermisos)
                        End If
                    End If
                Next
            End If
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Perfil", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Perfil", ex2)
        End Try

    End Sub
    Private Sub seleccionarTodos(ByRef NodosArbol As TreeNodeCollection)
        Try
            For Each nodo As TreeNode In NodosArbol
                nodo.Checked = True
                For Each nodito As TreeNode In nodo.ChildNodes
                    nodito.Checked = True
                Next
            Next
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Perfil", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Perfil", ex2)
        End Try
    End Sub
    Private Sub deseleccionarTodos(ByRef NodosArbol As TreeNodeCollection)
        Try
            For Each nodo As TreeNode In NodosArbol
                nodo.Checked = False
                For Each nodito As TreeNode In nodo.ChildNodes
                    nodito.Checked = False
                Next
            Next
        Catch ex As ent.miClaseExcepcion
            TratarErrorEnCatch("Perfil", ex)
        Catch ex2 As Exception
            TratarErrorEnCatch("Perfil", ex2)
        End Try
    End Sub

#End Region


End Class