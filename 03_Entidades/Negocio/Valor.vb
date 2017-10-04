Public Class Valor

    Private _ParteEntera As Integer
    Public Property ParteEntera() As Integer
        Get
            Return _ParteEntera
        End Get
        Set(ByVal value As Integer)
            _ParteEntera = value
        End Set
    End Property

    Private _ParteDecimal As Integer
    Public Property ParteDecimal() As Integer
        Get
            Return _ParteDecimal
        End Get
        Set(ByVal value As Integer)
            _ParteDecimal = value
        End Set
    End Property

    Public Sub New()
    End Sub

    Public Sub New(parteEntera As Integer, parteDecimal As Integer)
        Me._ParteEntera = parteEntera
        Me._ParteDecimal = parteDecimal
    End Sub

    Public Function ComparateCon(ByRef unvalor As Valor) As Integer
        Dim resultado As Integer

        If unvalor.ParteEntera = Me.ParteEntera Then
            'Somos iguales, comparo los decimales
            If unvalor.ParteDecimal = Me.ParteDecimal Then
                'Somos totalmente iguales
                resultado = 0
            ElseIf unvalor.ParteDecimal < Me.ParteDecimal Then
                'Soy mayor
                resultado = 1
            ElseIf unvalor.ParteDecimal > Me.ParteDecimal Then
                'Soy Menor
                resultado = -1
            End If
        ElseIf unvalor.ParteEntera < Me.ParteEntera Then
            'Soy mayor
            resultado = 1

        ElseIf unvalor.ParteEntera > Me.ParteEntera Then
            'Soy Menor
            resultado = -1
        End If
        Return resultado
    End Function

    Public Overrides Function ToString() As String
        Return Me.ParteEntera.ToString & "," & Me.ParteDecimal.ToString
    End Function
End Class

