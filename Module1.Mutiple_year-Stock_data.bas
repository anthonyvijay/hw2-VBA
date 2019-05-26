Attribute VB_Name = "Module1"
Sub multiple()

Dim ws As Worksheet
Dim ticker As String
Dim vol As Double
Dim year_open As Double
Dim year_close As Double
Dim yearly_change As Double
Dim percent_change As Double
Dim Summary_Table_Row As Integer
Dim Color_range As Range


'run through each worksheet
For Each ws In Worksheets

   'set headers
   ws.Cells(1, 9).Value = "Ticker"
   ws.Cells(1, 10).Value = "Yearly Change"
   ws.Cells(1, 11).Value = "Percent Change"
   ws.Cells(1, 12).Value = "Total Stock Volume"


   'setup integers for loop
   Summary_Table_Row = 2
'loop
 lastRow = ws.Cells(Rows.Count, "A").End(xlUp).Row + 1
       For I = 2 To lastRow
            If ws.Cells(I + 1, 1).Value <> ws.Cells(I, 1).Value Then
 
           'find all the values
           ticker = ws.Cells(I, 1).Value
           vol = ws.Cells(I, 7).Value

           year_open = ws.Cells(I, 3).Value
           year_close = ws.Cells(I, 6).Value
        
        If year_close > 0 Then
           yearly_change = year_close - year_open
           percent_change = (year_close - year_open) * 100 / year_close
           End If
           

           ' insert values into summary
           ws.Cells(Summary_Table_Row, 9).Value = ticker
           ws.Cells(Summary_Table_Row, 10).Value = yearly_change
           ws.Cells(Summary_Table_Row, 11).Value = percent_change
           ws.Cells(Summary_Table_Row, 12).Value = vol
           Summary_Table_Row = Summary_Table_Row + 1

            vol = 0

       End If

'finish loop
   Next I

Next ws

    'Conditional foramting to indicate positive and negative numbers

For Each ws In Worksheets

Set Color_range = Worksheets("2014").Range("J2:J2836")

Set Color_range = Worksheets("2015").Range("J2:J3005")

Set Color_range = Worksheets("2016").Range("J2:J3169")

For Each Cell In Color_range
    If Cell.Value < 0 Then
        Cell.Interior.ColorIndex = 3
    Else
        Cell.Interior.ColorIndex = 4
End If
Next
Next
   End Sub


