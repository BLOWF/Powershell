# Ausgabe der Clustersturktur inklusive Nodes, VMs und LUNs in eine txt Datei
Out-File -FilePath "C:\Users\daniel.eichberger\Desktop\Cluster.txt"          

# Cluster in der Domäne auslesen
$ClusterList = Get-Cluster -Domain "ell.fnt.de"
foreach($Cluster in $ClusterList)
{
    $Cluster.Name | Format-Wide -Property Name -Column 1 | Out-File -FilePath "C:\Users\daniel.eichberger\Desktop\Cluster.txt" -Append
    # Nodes im Cluster auslesen
    $NodeList = Get-ClusterNode -cluster $Cluster 
    foreach($Node in $NodeList)
    { 
        "   " + $Node.Name | Format-Wide -Property Name -Column 1 | Out-File -FilePath "C:\Users\daniel.eichberger\Desktop\Cluster.txt" -Append 
        # VMs auf Node auslesen
        $VMList = (get-vm -ComputerName $node).Name 
        foreach($VM in $VMList)
        {
            "      " + $VM | Format-Wide -Property Name | Out-File -FilePath "C:\Users\daniel.eichberger\Desktop\Cluster.txt" -Append
        }        
    }

    #$output = $clusterlist.Name + $NodeList.Name + $VMList.Name

    # LUNs im Cluster auslesen
    Get-ClusterSharedVolume -Cluster $Cluster | Out-File -FilePath "C:\Users\daniel.eichberger\Desktop\Cluster.txt" -Append
}

