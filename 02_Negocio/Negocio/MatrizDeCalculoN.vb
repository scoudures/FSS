Imports Entidades = _03_Entidades
Imports Negocio = _02_Negocio
Public Class MatrizDeCalculoN
    'coleccion de jueces (pueden ser 3, 5 o 7)
    Public jueces As New List(Of Entidades.Juez)
    'coleccion de patinadores (participantes)
    Public patinadores As New List(Of Entidades.patinador)
    'coleccion de puntajes
    Public puntajes As New List(Of Entidades.puntaje)

    'Diccionario cuya clave es el juez y su valor es otro diccionario
    'El segundo diccionario tiene por clave el patinador y el puntaje que 
    'le asigno el juez que es clave del primer diccionario
    Public puntuacionJuez As New Dictionary(Of Entidades.Juez, Dictionary(Of Entidades.patinador, Double))

    'diccionario que representa la suma de todos los puntajes recibidos por cada patinador
    Public SumaTotalPatinador As New Dictionary(Of Entidades.patinador, Double)

    'Con este diccionario representamos la matriz del calculo CIPA (si recorriesemos las filas)
    Dim victorias As New Dictionary(Of Entidades.patinador, Dictionary(Of Entidades.patinador, Double))

    'Con este diccionario representamos la matriz del calculo CIPA (si recorriesemos las columnas)
    'no lo vamos a utilizar en el calculo, esta solo como comprobacion
    Dim derrotas As New Dictionary(Of Entidades.patinador, Dictionary(Of Entidades.patinador, Double))

    'Este diccionario tiene como clave el patinador y como valor la suma de las 
    'victorias mayoritarias (el patinador con mas victorias mayoritarias se clasificara en el primer puesto)
    Dim victoriasMayoritarias As New Dictionary(Of Entidades.patinador, Double)

    Private _nombre As String
    Public Property nombre() As String
        Get
            Return _nombre
        End Get
        Set(ByVal value As String)
            _nombre = value
        End Set
    End Property
    Sub New(ByVal nombre As String)
        Me.nombre = nombre
    End Sub

    Public Sub cargarPuntuaciones()
        'por cada juez que puntua esta competencia
        For Each juez In Me.jueces
            'creo un diccionario cuya clave es el patinador y su valor es el puntaje
            Dim dicPatinador As New Dictionary(Of Entidades.patinador, Double)
            'a cada patinador
            For Each patin In Me.patinadores
                'lo agrego al diccionario, con puntaje en cero
                dicPatinador.Add(patin, 0)
            Next
            'agrego al diccionario "puntuacionJuez" el juez como clave y el diccionario anterior 
            Me.puntuacionJuez.Add(juez, dicPatinador)
        Next
        'por cada puntaje en mi coleccion de puntajes
        For Each puntaje In Me.puntajes
            'Le pido que sume sus valores para actualizar el diccionario anterior
            Me.puntuacionJuez(puntaje.juez)(puntaje.patinador) = puntaje.SumaValores
        Next
    End Sub

    Public Sub mostrarPuntuaciones(ByRef unMensaje As Entidades.Mensaje)
        Dim cadena As String = ""

        For Each juez In Me.puntuacionJuez
            Dim DicPatinador As Dictionary(Of Entidades.patinador, Double)
            DicPatinador = DirectCast(juez.Value, Dictionary(Of Entidades.patinador, Double))
            For Each patinador In DicPatinador
                cadena = cadena & "juez: " & juez.Key.tostring & " Patinador: " & patinador.Key.tostring & " Suma: " & CStr(patinador.Value) & vbCrLf
            Next
        Next
        unMensaje.texto = cadena
        unMensaje.Titulo = "PUNTUACIONES"
    End Sub

    Public Sub ObtenerSumaTotalxPatinador()
        Dim Subtotal As Double = 0
        Dim valor As Double = 0
        'por cada patinador en mi lista de patinadores
        For Each pat In Me.patinadores
            'por cada juez en mi lista de jueces
            For Each juez0 In Me.jueces
                ' y por cada puntaje en mi lista de puntajes
                For Each puntaje In Me.puntajes
                    If String.Compare(puntaje.juez.nombre, juez0.nombre) = 0 And String.Compare(puntaje.patinador.nombre, pat.nombre) = 0 Then
                        'le pido al puntaje que sume sus valores (si juez y patinador coinciden)
                        Subtotal = Subtotal + puntaje.SumaValores
                    End If
                Next
            Next
            'actualizo el estado del diccionario SumaTotalPatinador (clave=patinador, valor=la suma calculada)
            Me.SumaTotalPatinador.Add(pat, Subtotal)
            Subtotal = 0
        Next
    End Sub
    Public Sub MostrarSumaTotalxPatinador(ByRef unMensaje As Entidades.Mensaje)
        Dim cadena As String = ""
        If Me.SumaTotalPatinador IsNot Nothing Then
            'por cada elemento en mi diccionario de sumas
            For Each suma In Me.SumaTotalPatinador
                'mostrame el nombre del patinador y la suma total de sus puntajes
                'cadena = cadena & "Patinador: " & suma.Key.nombre & "  Suma Total: " & CStr(suma.Value) & vbCrLf
                cadena = cadena & "Suma Total " & suma.Key.nombre & ": " & CStr(suma.Value) & vbCrLf
            Next
        End If
        unMensaje.texto = cadena
        unMensaje.Titulo = "Total Patinador"

    End Sub

    Public Sub inicializarVictoriasDerrotas()
        'el calculo CIPA se realiza comparando los patinadores de a dos
        'tomo un patinador de la lista de mis patinadores
        For Each patinador1 In patinadores
            'creo un diccionario de victorias, cuya clave es el patinador y su valor las victorias obtenidas
            Dim dicpatinaVictorias As New Dictionary(Of Entidades.patinador, Double)
            'creo un diccionario de derrotas, cuya clave es el patinador y su valor sus derrotas (para comprobar el calculo)
            Dim dicpatinaDerrotas As New Dictionary(Of Entidades.patinador, Double)
            'luego tomo un segundo patinador para realizar la comparacion
            For Each patinador2 In patinadores
                'en cada diccionario agrego los patinadores y sus victorias/derrotas en cero
                dicpatinaVictorias.Add(patinador2, 0)
                dicpatinaDerrotas.Add(patinador2, 0)
            Next
            'en mi diccionario de victorias agrego el primer patinador como clave y el diccionario con sus oponentes como valor
            Me.victorias.Add(patinador1, (dicpatinaVictorias))
            'en mi diccionario de derrotas agrego el primer patinador como clave y el diccionario con sus oponentes como valor
            Me.derrotas.Add(patinador1, (dicpatinaDerrotas))
        Next
        'para calcular la clasificacion de cada patinador voy a utilizar un diccionario mas
        'en este voy a tener al patinador como clave y a la suma de sus victorias como valor 
        For Each patinador In Me.patinadores
            Me.victoriasMayoritarias.Add(patinador, 0)

        Next
    End Sub

    Public Sub obtenervictorias()
        'por cada juez en mi lista de jueces
        For Each juez In Me.jueces
            'por cada patinador en mi lista de patinadores
            For Each patinador1 In Me.patinadores
                'voy a comparar este patinador1 con el resto de los patinadores
                'pero la comparacion es siempre de a pares, se comparana los puntajes
                'juez a juez entre ambos patinadores
                For Each patinador2 In Me.patinadores
                    'descartamos que estemos comparando al patinador1 con el mismo
                    If Not (patinador1.Equals(patinador2)) Then
                        'si la puntuacion del patinador1 es mayor a la del patinador 2
                        If puntuacionJuez(juez)(patinador1) > puntuacionJuez(juez)(patinador2) Then
                            'se suma una victoria para el patinador1
                            victorias(patinador1)(patinador2) = victorias(patinador1)(patinador2) + 1
                            'si la puntuacion del patinador1 es igual a la del patinador 2
                        ElseIf puntuacionJuez(juez)(patinador1) = puntuacionJuez(juez)(patinador2) Then
                            'se suma media victoria para cada patinador (y por ende media derrota)
                            victorias(patinador1)(patinador2) += 0.5
                            derrotas(patinador1)(patinador2) += 0.5
                            'si la puntuacion del patinador1 es menor a la del patinador 2
                        Else
                            'no se suma ninguna victoria, en nuestro caso registramos una derrota
                            derrotas(patinador1)(patinador2) = derrotas(patinador1)(patinador2) + 1
                        End If
                    End If
                Next
            Next
        Next
    End Sub


    Public Sub mostrarVictorias(ByRef unMensaje As Entidades.Mensaje)
        Dim cadena As String = "  A  B  C  D  E  F  G  H  I " & vbCrLf
        'recorro mi diccionario de victorias
        For Each victoria In Me.victorias
            'creo un diccionario cuya clave es un patinador y su valor la suma de sus victorias
            Dim Dic As Dictionary(Of Entidades.patinador, Double)
            'le asigno el contenido que obtengo al recorrer mi diccionario de victorias
            Dic = DirectCast(victoria.Value, Dictionary(Of Entidades.patinador, Double))
            cadena = cadena & victoria.Key.tostring
            For Each patinador In Dic
                cadena = cadena & " " & CStr(patinador.Value) & " "
            Next
            cadena = cadena & vbCrLf
        Next
        unMensaje.texto = cadena
        unMensaje.Titulo = "victorias"
    End Sub

    Public Sub mostrarDerrotas(ByRef unMensaje As Entidades.Mensaje)
        Dim cadena As String = "  A  B  C  D  E  F  G  H  I " & vbCrLf
        For Each derrota In Me.derrotas
            Dim Dic As Dictionary(Of Entidades.patinador, Double)
            Dic = DirectCast(derrota.Value, Dictionary(Of Entidades.patinador, Double))
            cadena = cadena & derrota.Key.tostring
            For Each patinador In Dic
                cadena = cadena & " " & CStr(patinador.Value) & " "
            Next
            cadena = cadena & vbCrLf
        Next
        unMensaje.texto = cadena
        unMensaje.Titulo = "derrotas"
    End Sub

    Public Sub obtenerVictoriasMayoritarias()
        Dim JuezAlmedio As Double
        'la suma de victorias de cada patinador se raducen en "victorias mayoritarias"
        'una suma se transforma en victoria mayoritaria si es mayor o igual a la mitad
        'de los jueces (tomamos este valor como referencia para hacer el calculo)
        JuezAlmedio = Me.jueces.Count / 2
        'por cada patinador de mi diccionario de victorias
        For Each Patinador In Me.victorias
            'creo un diccionario cuya clave es patinador y su valor es la suma de sus victorias
            Dim DicMisVictorias As Dictionary(Of Entidades.patinador, Double)
            'le asigno el valor que obtengo al recorrer el diccionario de victorias
            DicMisVictorias = DirectCast(Patinador.Value, Dictionary(Of Entidades.patinador, Double))
            'por cada patinador pregunto
            For Each pat In DicMisVictorias
                'si la suma de las victorias es mayor al valor de referencia
                If pat.Value > JuezAlmedio Then
                    'obtuve una victoria mayoritaria 
                    Me.victoriasMayoritarias(Patinador.Key) += 1
                    'si la suma de las victorias es igual al valor de referencia
                ElseIf pat.Value = JuezAlmedio Then
                    'obtuve media victoria mayoritaria 
                    Me.victoriasMayoritarias(Patinador.Key) += 0.5
                    'si la suma de las victorias es menor al valor de referencia
                Else
                    'no obtuve ninguna victoria mayoritaria 
                    Me.victoriasMayoritarias(Patinador.Key) += 0.0
                End If
            Next
        Next
    End Sub

    Public Sub mostrarVictoriasMayoritarias(ByRef unMensaje As Entidades.Mensaje)
        Dim cadena As String = ""
        For Each vict In Me.victoriasMayoritarias
            cadena = cadena & "patinador: " & vict.Key.nombre & " Victorias Mayoritarias: " & CStr(vict.Value) & vbCrLf
        Next
        unMensaje.texto = cadena
        unMensaje.Titulo = "Victorias Mayoritarias"
    End Sub

    Public Sub ObtenerClasificacion(ByRef unMensaje As Entidades.Mensaje)
        Dim cadena As String = ""
        Dim total As Double = Me.patinadores.Count
        For Each vict In Me.victoriasMayoritarias
            If (vict.Value - Int(vict.Value)) = 0 Then
                'cadena = cadena & "patinador: " & vict.Key.nombre & " Puesto: " & CStr(total - vict.Value) & vbCrLf
                cadena = cadena & CStr(total - vict.Value) & "° Puesto: " & vict.Key.nombre & vbCrLf
            Else
                cadena = cadena & "patinador: " & vict.Key.nombre & " Empate" & vbCrLf
            End If
        Next
        unMensaje.texto = cadena
        unMensaje.Titulo = "CLASIFICACION"
    End Sub



End Class
