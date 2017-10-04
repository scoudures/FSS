Imports Entidades = _03_Entidades
Imports Mapper = _04_Datos
Public Class PuntajeN

    Private _miMapper As New Mapper.PuntajeM
    Public Property miMapper() As Mapper.PuntajeM
        Get
            Return _miMapper
        End Get
        Set(ByVal value As Mapper.PuntajeM)
            _miMapper = value
        End Set
    End Property

    Private _miPuntajeE As New Entidades.puntaje
    Public Property miPuntajeE() As Entidades.puntaje
        Get
            Return _miPuntajeE
        End Get
        Set(ByVal value As Entidades.puntaje)
            _miPuntajeE = value
        End Set
    End Property


    Public Function Eliminar(ByRef unPuntaje As Entidades.puntaje) As Integer
        Return miMapper.Eliminar(unPuntaje)
    End Function

    Public Function Nuevo(ByRef unaCompetencia As Entidades.Competencia) As Integer
        Try
            Return miMapper.Nuevo(unaCompetencia)
        Catch ex As Entidades.miClaseExcepcion
            Throw ex
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function

    Public Function listar() As List(Of Entidades.PuntajeVista)
        Return miMapper.listar
    End Function

    Public Function Modificar(ByRef unPuntaje As Entidades.puntaje) As Integer
        Return miMapper.Modificar(unPuntaje)
    End Function


    Public Function listar(ByRef unaCompetencia As Entidades.Competencia) As List(Of Entidades.PuntajeVista)
        Return miMapper.listar(unaCompetencia)
    End Function

    Public Function SumaLosValoresDe(ByRef unPuntaje As Entidades.puntaje) As Integer
        Dim suma As Integer
        Dim sumadecimal As Integer = 0
        Dim sumaentero As Integer = 0
        For Each valor As Entidades.Valor In unPuntaje.misvalores
            sumadecimal += valor.ParteDecimal
            sumaentero += valor.ParteEntera
        Next
        suma = sumadecimal + (sumaentero * 10)
        Return suma
    End Function

    Public Function Comparar(ByRef Puntaje1 As Entidades.puntaje, ByRef Puntaje2 As Entidades.puntaje) As Integer
        Return puntaje1.misvalores(0).ComparateCon(puntaje2.misvalores(0))
    End Function

    Public Function Desempate(ByRef Puntaje1 As Entidades.puntaje, ByRef Puntaje2 As Entidades.puntaje) As Integer
        Return Puntaje1.misvalores(1).ComparateCon(Puntaje2.misvalores(1))
    End Function

    Sub New()
    End Sub

    Sub New(miPuntajeE As Entidades.puntaje)
        Me.miPuntajeE = miPuntajeE
    End Sub
    Public Sub ArmarValores(ByRef unPuntaje As Entidades.puntaje)
        Dim valor As New Entidades.Valor
        valor.ParteEntera = unPuntaje.misvalores(0).ParteEntera
        valor.ParteDecimal = unPuntaje.misvalores(0).ParteDecimal
        'unPuntaje.valorA = CDbl(valor.ToString)
        unPuntaje.valorA = valor.ParteEntera + (0.10000000000000001 * valor.ParteDecimal)

        Dim valor2 As New Entidades.Valor
        valor2.ParteEntera = unPuntaje.misvalores(1).ParteEntera
        valor2.ParteDecimal = unPuntaje.misvalores(1).ParteDecimal
        'unPuntaje.valorB = CDbl(valor2.ToString)
        unPuntaje.valorB = valor2.ParteEntera + (0.10000000000000001 * valor2.ParteDecimal)
    End Sub
End Class
