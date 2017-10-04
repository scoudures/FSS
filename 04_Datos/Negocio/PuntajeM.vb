Imports System.Data.SqlClient
Imports Entidades = _03_Entidades
Public Class PuntajeM
    Dim miAcceso As New Acceso
    Dim miVerificador As New Verificador
    Public Function Nuevo(ByRef unaCompetencia As Entidades.Competencia) As Integer
        Try
            Dim resultado As Integer
            Dim parametros(11) As SqlParameter
            parametros(0) = miAcceso.constructor("@competencia", unaCompetencia.competencia.ToString)
            parametros(1) = miAcceso.constructor("@participante", unaCompetencia.participante.nombre.ToString)
            Dim i As Integer = 2
            For Each punta As Entidades.puntaje In unaCompetencia.misPuntajes
                parametros(i) = miAcceso.constructor("@puntaje" & i.ToString, punta.valorA.ToString)
                i = i + 1
                parametros(i) = miAcceso.constructor("@puntaje" & i.ToString, punta.valorB.ToString)
                i = i + 1
            Next
            resultado = miAcceso.Escribir("Puntaje_Insert", parametros)
            'miVerificador.DigitosPorTabla("Puntaje")
            Return resultado
        Catch ex As Entidades.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    Public Function Eliminar(ByRef miPuntaje As Entidades.puntaje) As Integer
        Try

            Dim resultado As Integer
            Dim parametros(2) As SqlParameter
            parametros(0) = miAcceso.constructor("@puntaje", miPuntaje.idPuntaje)
            parametros(1) = miAcceso.constructor("@patinador", miPuntaje.patinador.nombre)
            parametros(2) = miAcceso.constructor("@juez", miPuntaje.juez.nombre)
            resultado = miAcceso.Escribir("Puntaje_Delete", parametros)
            'miVerificador.DigitosPorTabla("Puntaje")
            Return resultado
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function

    Public Function Modificar(ByRef miPuntaje As Entidades.puntaje) As Integer
        Try
            Dim resultado As Integer
            Dim parametros(4) As SqlParameter
            parametros(0) = miAcceso.constructor("@puntaje", miPuntaje.idPuntaje)
            parametros(1) = miAcceso.constructor("@patinador", miPuntaje.patinador.nombre)
            parametros(2) = miAcceso.constructor("@juez", miPuntaje.juez.nombre)
            parametros(3) = miAcceso.constructor("@p4", miPuntaje.valorA)
            parametros(4) = miAcceso.constructor("@p5", miPuntaje.valorB)
            resultado = miAcceso.Escribir("Puntaje_Update", parametros)
            'miVerificador.DigitosPorTabla("Puntaje")
            Return resultado
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    'Public Function Listar(ByRef miCompetencia As Entidades.Competencia) As List(Of Entidades.puntaje)
    '    Dim miLista As New List(Of Entidades.puntaje)
    '    Dim parametros(1) As SqlParameter
    '    parametros(0) = miAcceso.constructor("@competencia", miCompetencia.competencia.ToString)
    '    parametros(1) = miAcceso.constructor("@patinador", miCompetencia.participante.tostring)
    '    Dim dt As New DataTable
    '    dt = miAcceso.leer("Puntaje_Select", parametros)
    '    For Each fila As DataRow In dt.Rows
    '        Dim unPuntaje As New Entidades.puntaje
    '        unPuntaje.idPuntaje = fila.Item("Puntaje")
    '        unPuntaje.patinador.nombre = fila.Item("Patinador")
    '        For i = 1 To 9
    '            Dim unValor As New Entidades.Valor
    '            unValor.ParteEntera = fila.Item("J" & i.ToString & "valorA").ToString.Substring(0, 2)
    '            unValor.ParteDecimal = fila.Item("J" & i.ToString & "valorA").ToString.Substring(3, 2)
    '            unPuntaje.misvalores.Add(unValor)
    '            Dim otroValor As New Entidades.Valor
    '            otroValor.ParteEntera = fila.Item("J" & i.ToString & "valorB").ToString.Substring(0, 2)
    '            otroValor.ParteDecimal = fila.Item("J" & i.ToString & "valorB").ToString.Substring(3, 2)
    '            unPuntaje.misvalores.Add(otroValor)
    '        Next
    '        miLista.Add(unPuntaje)
    '    Next
    '    Return miLista
    'End Function
    Public Function Listar(ByRef miCompetencia As Entidades.Competencia) As List(Of Entidades.PuntajeVista)
        Try
            Dim miLista As New List(Of Entidades.PuntajeVista)
            Dim parametros(1) As SqlParameter
            parametros(0) = miAcceso.constructor("@competencia", miCompetencia.competencia.ToString)
            parametros(1) = miAcceso.constructor("@patinador", miCompetencia.participante.tostring)
            Dim dt As New DataTable
            dt = miAcceso.leer("Puntaje_Select", parametros)
            For Each fila As DataRow In dt.Rows
                Dim unPuntaje As New Entidades.PuntajeVista
                unPuntaje.competencia = fila.Item("Competencia")
                unPuntaje.patinador = fila.Item("Patinador")
                unPuntaje.J1valorA = fila.Item("J1valorA")
                unPuntaje.J1valorB = fila.Item("J1valorB")
                unPuntaje.J2valorA = fila.Item("J2valorA")
                unPuntaje.J2valorB = fila.Item("J2valorB")
                unPuntaje.J3valorA = fila.Item("J3valorA")
                unPuntaje.J3valorB = fila.Item("J3valorB")
                unPuntaje.J4valorA = fila.Item("J4valorA")
                unPuntaje.J4valorB = fila.Item("J4valorB")
                unPuntaje.J5valorA = fila.Item("J5valorA")
                unPuntaje.J5valorB = fila.Item("J5valorB")
                miLista.Add(unPuntaje)
            Next
            Return miLista
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    'Public Function listar() As List(Of Entidades.puntaje)
    '    Dim miLista As New List(Of Entidades.puntaje)
    '    Dim dt As New DataTable
    '    dt = miAcceso.leer("Puntaje_SelectAll")
    '    For Each fila As DataRow In dt.Rows
    '        Dim unPuntaje As New Entidades.puntaje
    '        unPuntaje.idPuntaje = fila.Item("Puntaje")
    '        unPuntaje.patinador.nombre = fila.Item("Patinador")
    '        unPuntaje.juez.nombre = fila.Item("Juez")
    '        unPuntaje.valorA = fila.Item("ValorA")
    '        unPuntaje.valorB = fila.Item("ValorB")
    '        'unPuntaje.misValores(0).ParteEntera = fila.Item("ParteEnteraA")
    '        'unPuntaje.misValores(0).ParteDecimal = fila.Item("ParteDecimalA")
    '        'unPuntaje.misValores(1).ParteEntera = fila.Item("ParteEnteraB")
    '        'unPuntaje.misValores(1).ParteDecimal = fila.Item("ParteDecimalB")
    '        miLista.Add(unPuntaje)
    '    Next
    '    Return miLista
    'End Function

    Public Function listar() As List(Of Entidades.PuntajeVista)
        Try
            Dim miLista As New List(Of Entidades.PuntajeVista)
            Dim dt As New DataTable
            dt = miAcceso.leer("Puntaje_SelectAll")
            For Each fila As DataRow In dt.Rows
                Dim unPuntaje As New Entidades.PuntajeVista
                unPuntaje.competencia = fila.Item("Competencia")
                unPuntaje.patinador = fila.Item("Patinador")
                unPuntaje.J1valorA = fila.Item("J1valorA")
                unPuntaje.J1valorB = fila.Item("J1valorB")
                unPuntaje.J2valorA = fila.Item("J2valorA")
                unPuntaje.J2valorB = fila.Item("J2valorB")
                unPuntaje.J3valorA = fila.Item("J3valorA")
                unPuntaje.J3valorB = fila.Item("J3valorB")
                unPuntaje.J4valorA = fila.Item("J4valorA")
                unPuntaje.J4valorB = fila.Item("J4valorB")
                unPuntaje.J5valorA = fila.Item("J5valorA")
                unPuntaje.J5valorB = fila.Item("J5valorB")
                miLista.Add(unPuntaje)
            Next
            Return miLista
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function

End Class
