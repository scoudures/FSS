Imports System.Security.Cryptography
Imports System.Text
Public Class Encriptador

    '******************
    '**** CODIFICA ****
    '******************
    Public Function Encriptar(ByVal micadena As String) As String
        Try
            Dim lngIi1 As Long
            Dim lngIi2 As Long
            Dim i As Long
            Dim strSemilla = Semilla("aedfhjoitr562ewruwiorueworuweiruwe")
            lngIi1 = Val(Left$(strSemilla, InStr(strSemilla, ",") - 1))
            lngIi2 = Val(Mid$(strSemilla, InStr(strSemilla, ",") + 1))
            For i = 1 To Len(micadena)
                lngIi1 = lngIi1 - i
                lngIi2 = lngIi2 + i
                If (i Mod 2) = 0 Then
                    Mid(micadena, i, 1) = Chr((Asc(Mid$(micadena, i, 1)) - lngIi1) And &HFF)
                Else
                    Mid(micadena, i, 1) = Chr((Asc(Mid$(micadena, i, 1)) + lngIi2) And &HFF)
                End If
            Next
            Return micadena
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function
    '********************
    '**** DECODIFICA ****
    '********************
    Public Function DesEncriptar(ByVal micadena As String) As String
        Try
            Dim strSemilla = Semilla("aedfhjoitr562ewruwiorueworuweiruwe")
            Dim lngIi1 As Long
            Dim lngIi2 As Long
            Dim i As Long
            lngIi1 = Val(Left$(strSemilla, InStr(strSemilla, ",") - 1))
            lngIi2 = Val(Mid$(strSemilla, InStr(strSemilla, ",") + 1))
            For i = 1 To Len(micadena)
                lngIi1 = lngIi1 - i
                lngIi2 = lngIi2 + i
                If (i Mod 2) = 0 Then
                    Mid(micadena, i, 1) = Chr((Asc(Mid$(micadena, i, 1)) + lngIi1) And &HFF)
                Else
                    Mid(micadena, i, 1) = Chr((Asc(Mid$(micadena, i, 1)) - lngIi2) And &HFF)
                End If
            Next
            Return micadena
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function

    '****************************
    '**** CALCULA LA SEMILLA ****
    '****************************
    Private Function Semilla(strClave As String) As String
        Try
            Dim lngSemilla1 As Long
            Dim lngSemilla2 As Long
            Dim j As Long
            Dim i As Long
            lngSemilla1 = 0
            lngSemilla2 = 0
            j = Len(strClave)

            For i = 1 To Len(strClave)

                lngSemilla1 = lngSemilla1 + Asc(Mid$(strClave, i, 1)) * i
                lngSemilla2 = lngSemilla2 + Asc(Mid$(strClave, i, 1)) * j
                j = j - 1

            Next

            Semilla = LTrim$(Str$(lngSemilla1)) + "," + LTrim$(Str$(lngSemilla2))
        Catch ex2 As Exception
            Throw ex2
        End Try
    End Function

    '********************
    '**** APLICA MD5 ****
    '********************
    'Public Function AplicaMD5(ByVal cadena As String) As String
    '    Try
    '        Dim CadenaConMd5 As String
    '        CadenaConMd5 = ""
    '        Dim md5 As New MD5CryptoServiceProvider
    '        Dim bytValue() As Byte
    '        Dim bytHash() As Byte
    '        Dim i As Integer
    '        bytValue = System.Text.Encoding.UTF8.GetBytes(cadena)
    '        bytHash = md5.ComputeHash(bytValue)
    '        md5.Clear()
    '        For i = 0 To bytHash.Length - 1
    '            CadenaConMd5 &= bytHash(i).ToString("x").PadLeft(2, "0")
    '        Next
    '        Return CadenaConMd5
    '    Catch ex2 As Exception
    '        Throw ex2
    '    End Try
    'End Function
    Public Function EncriptarMD5(ByVal cleanString As String) As String
        Dim clearBytes As [Byte]()
        clearBytes = New UnicodeEncoding().GetBytes(cleanString)
        Dim hashedBytes As [Byte]() = CType(CryptoConfig.CreateFromName("MD5"), HashAlgorithm).ComputeHash(clearBytes)
        Dim hashedText As String = BitConverter.ToString(hashedBytes)
        Return hashedText
    End Function
End Class