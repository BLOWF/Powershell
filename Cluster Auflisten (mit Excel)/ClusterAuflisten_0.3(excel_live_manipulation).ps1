$ClusterCount = 0
$NodeCount = 0
$VmCount = 0
$date = Get-Date

$XL = New-Object -comobject Excel.Application
$XL.Visible = $True 
$WB = $XL.Workbooks.Add()
$WS = $WB.Worksheets.Item(1)

$WS.Cells.Item(1,1).Value2 = "Clusterstruktur"
$WS.Cells.Item(1,1).Orienation=45
$WS.Cells.Item(1,1).Font.size = 22
$WS.Cells.Item(1,1).Font.Bold = $true
$WS.Cells.Item(1,1).Font.Underline = $true
$WS.Range("A1:C1").Value2
$WS.Cells.Item(3,1) = "Cluster Anzahl:"
$WS.Cells.Item(3,1).Interior.ColorIndex = 6
$WS.Cells.Item(3,1).Borders.LineStyle = 2
$WS.Cells.Item(3,2).Borders.LineStyle = 2
$WS.Cells.Item(4,1) = "Node Anzahl:"
$WS.Cells.Item(4,1).Interior.ColorIndex = 6
$WS.Cells.Item(4,1).Borders.LineStyle = 2
$WS.Cells.Item(4,2).Borders.LineStyle = 2
$WS.Cells.Item(5,1) = "VM Anzahl:"
$WS.Cells.Item(5,1).Interior.ColorIndex = 6
$WS.Cells.Item(5,1).Borders.LineStyle = 2
$WS.Cells.Item(5,2).Borders.LineStyle = 2
$WS.Cells.Item(1,4) = "$date"
$WS.Cells.Item(9,1).Borders.LineStyle = 1
$WS.Cells.Item(9,2).Borders.LineStyle = 1
$WS.Cells.Item(9,3).Borders.LineStyle = 1
$WS.Cells.Item(9,3).Orienation=45

$WS.Cells.Item(9,1) = "Cluster"
$WS.Cells.Item(9,1).Font.Bold = $true
$WS.Cells.Item(9,1).Interior.ColorIndex = 6
$WS.Cells.Item(9,2) = "Node"
$WS.Cells.Item(9,2).Font.Bold = $true
$WS.Cells.Item(9,2).Interior.ColorIndex = 6
$WS.Cells.item(9,3) = "VM"
$WS.Cells.Item(9,3).Font.Bold = $true
$WS.Cells.Item(9,3).Interior.ColorIndex = 6
 
$row = 11
 
$ClusterList = Get-Cluster -Domain "ell.fnt.de"
$VMList = (get-vm -ComputerName $node).Name
 
foreach($cluster in $clusterlist) 
{
    $WS.cells.item($row,1) = $cluster.Name
    $WS.Cells.Item($row,1).Borders.LineStyle = 1
    $ClusterCount++
    $NodeList = Get-ClusterNode -cluster $Cluster 
    foreach($Node in $NodeList)
    {
        $WS.cells.item($row,2) = $node.Name
        $WS.Cells.Item($row,2).Borders.LineStyle = 1
        $NodeCount++
        foreach($vm in $VMList)
        {
            $WS.cells.item($row,3) = $vm
            $WS.Cells.Item($row,1).Interior.ColorIndex = 24
            $WS.Cells.Item($row,2).Interior.ColorIndex = 15
            $WS.Cells.Item($row,3).Interior.ColorIndex = 48
            $WS.Cells.Item($row,3).Borders.LineStyle = 2
            $VmCount++
            $row++  
        }
    }  
}
$LunList = Get-ClusterSharedVolume -Cluster $Cluster |select Name, OwnerNode 
$row= $row+2
$WS.Cells.Item($row, 2) = "LUN"
$WS.Cells.Item($row, 2).Borders.LineStyle = 1
$WS.Cells.Item($row, 2).Interior.ColorIndex = 6
$WS.Cells.Item($row, 3) = "Node"
$WS.Cells.Item($row, 3).Borders.LineStyle = 1
$WS.Cells.Item($row, 3).Interior.ColorIndex = 6
foreach($Lun in $LunList)
{
    $row++
    $WS.Cells.Item($row, 2) = $Lun.Name
    $WS.Cells.Item($row, 2).Borders.LineStyle = 2
    $WS.Cells.Item($row, 3) = $Lun.OwnerNode.Name
    $WS.Cells.Item($row, 3).Borders.LineStyle = 2

}

$WS.Cells.Item(5,2) = "$VmCount"
$WS.Cells.Item(3,2) = "$ClusterCount"
$WS.Cells.Item(4,2) = "$NodeCount"

$WS.columns.autofit()   