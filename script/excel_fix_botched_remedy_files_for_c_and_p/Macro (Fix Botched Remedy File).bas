Attribute VB_Name = "Module1"
Sub FixBrokenRemedyFiles()

Dim numLoops As Integer

For numLoops = 1 To 3
  Dim wSheet As Worksheet
     
  For Each wSheet In Worksheets
    wSheet.Cells.Unmerge
  Next wSheet
  
    

  
  Dim lngI As Long
  For lngI = ActiveCell.SpecialCells(xlCellTypeLastCell).Row To 1 Step -1
    If Application.WorksheetFunction.CountA(ActiveSheet.Rows(lngI)) = 0 Then
      ActiveSheet.Rows(lngI).Delete
    End If
  Next
  For lngI = ActiveCell.SpecialCells(xlCellTypeLastCell).Column To 1 Step -1
    If Application.WorksheetFunction.CountA(ActiveSheet.Columns(lngI)) = 0 Then
      ActiveSheet.Columns(lngI).Delete
    End If
  Next
  
  Dim Firstrow As Long
    Dim Lastrow As Long
    Dim Lrow As Long
    Dim CalcMode As Long
    Dim ViewMode As Long

    With Application
        CalcMode = .Calculation
        .Calculation = xlCalculationManual
        .ScreenUpdating = False
    End With

    'We use the ActiveSheet but you can replace this with
    'Sheets("MySheet")if you want
    With ActiveSheet

        'We select the sheet so we can change the window view
        .Select

        'If you are in Page Break Preview Or Page Layout view go
        'back to normal view, we do this for speed
        ViewMode = ActiveWindow.View
        ActiveWindow.View = xlNormalView

        'Turn off Page Breaks, we do this for speed
        .DisplayPageBreaks = False

        'Set the first and last row to loop through
        Firstrow = .UsedRange.Cells(1).Column
        Lastrow = .UsedRange.Rows(.UsedRange.Rows.Count).Column

        'We loop from Lastrow to Firstrow (bottom to top)
        For Lrow = Lastrow To Firstrow Step -1

            'We check the values in the A column in this example
            With .Cells(Lrow, "A")

                If Not IsError(.Value) Then

                    If .Value = "Assigned To_IP DR BDC BO" Or .Value = "Managed By_IP DR BDC BO" Then .EntireColumn.Delete
                    'This will delete each row with the right values
                    'in Column A, case sensitive.

                End If

            End With

        Next Lrow
        
        Firstrow = .UsedRange.Cells(1).Row
        Lastrow = .UsedRange.Cells(20).Row
        
        'We loop from Lastrow to Firstrow (bottom to top)
        For Lrow = Lastrow To Firstrow Step -1

            'We check the values in the A column in this example
            With .Cells(Lrow, "A")

                If Not IsError(.Value) Then

                    If .Value = "Assigned To_IP DR BDC BO" Or .Value = "Managed By_IP DR BDC BO" Or .Value = "" Then .EntireRow.Delete
                    'This will delete each row with the right values
                    'in Column A, case sensitive.

                End If

            End With

        Next Lrow
        
        Firstrow = .UsedRange.Cells(20).Row
        Lastrow = .UsedRange.Rows(.UsedRange.Rows.Count).Row

        'We loop from Lastrow to Firstrow (bottom to top)
        For Lrow = Lastrow To Firstrow Step -1

            'We check the values in the A column in this example
            With .Cells(Lrow, "A")

                If Not IsError(.Value) Then

                    If .Value = "Assigned To_IP DR BDC BO" Or .Value = "Managed By_IP DR BDC BO" Or .Value = "Assignee Support Group Name+" Or .Value = "Manager Support Group Name" Or .Value = "" Then .EntireRow.Delete
                    'This will delete each row with the right values
                    'in Column A, case sensitive.

                End If

            End With

        Next Lrow

    End With

    ActiveWindow.View = ViewMode
    With Application
        .ScreenUpdating = True
        .Calculation = CalcMode
    End With
    

    With Application
        CalcMode = .Calculation
        .Calculation = xlCalculationManual
        .ScreenUpdating = False
    End With

    'We use the ActiveSheet but you can replace this with
    'Sheets("MySheet")if you want
    With ActiveSheet

        'We select the sheet so we can change the window view
        .Select

        'If you are in Page Break Preview Or Page Layout view go
        'back to normal view, we do this for speed
        ViewMode = ActiveWindow.View
        ActiveWindow.View = xlNormalView

        'Turn off Page Breaks, we do this for speed
        .DisplayPageBreaks = False

        'Set the first and last row to loop through
        Firstrow = 2 '.UsedRange.Cells(1).Row @_@
        Lastrow = .UsedRange.Rows(.UsedRange.Rows.Count).Row

        'We loop from Lastrow to Firstrow (bottom to top)
        For Lrow = Lastrow To Firstrow Step -1

            'We check the values in the A column in this example
            With .Cells(Lrow, "D")

                If Not IsError(.Value) Then

                    If (.Value = "Closed") Or (.Value = "Cancelled") Or .Value = "Rejected" Or .Value = "Completed" Then .EntireRow.Delete
                    
                End If

            End With

        Next Lrow

    End With

    ActiveWindow.View = ViewMode
    With Application
        .ScreenUpdating = True
        .Calculation = CalcMode
    End With
Next numLoops
End Sub
