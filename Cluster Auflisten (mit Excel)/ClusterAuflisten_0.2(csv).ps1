# Cluster in der Domäne auslesen
$ClusterList = Get-Cluster -Domain "ell.fnt.de"
foreach($Cluster in $ClusterList)
{
    #$Cluster.Name + ";;"| Format-Wide -Property Name -Column 1  | Out-File "C:\Users\daniel.eichberger\Desktop\Cluster.csv" -encoding utf8
    # Nodes im Cluster auslesen
    $NodeList = Get-ClusterNode -cluster $Cluster 
    foreach($Node in $NodeList)
    { 
        "$cluster;" + $Node.Name + ";" | Format-Wide -Property Name -Column 1 | Out-File "C:\Users\daniel.eichberger\Desktop\Cluster.csv" -Append -encoding utf8
        # VMs auf Node auslesen
        $VMList = (get-vm -ComputerName $node).Name 
        foreach($VM in $VMList)
        {
            ";;" + $VM | Format-Wide -Property Name | Out-File "C:\Users\daniel.eichberger\Desktop\Cluster.csv" -Append -encoding utf8
        }        
    }
    # LUNs im Cluster auslesen
    #Get-ClusterSharedVolume -Cluster $Cluster | Out-File -FilePath "C:\Users\daniel.eichberger\Desktop\Cluster.txt" -Append
}