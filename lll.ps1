$abc = 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h','i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
"l"+$($abc.Item($(Get-Random -Maximum $abc.Count)))+"l" >C:\Users\daniel.eichberger\Desktop\lll.txt
foreach ($letter in $abc)
{
   "l"+$($abc.Item($(Get-Random -Maximum $abc.Count)))+"l" >>C:\Users\daniel.eichberger\Desktop\lll.txt
} 
