$documents_path = 'C:\Users\daniel.eichberger\Documents\.Eigene Dokumente\Power Shell\docx2pdf'
$TimeStamp = (Get-Date).ToString("yyyymmDD_hhMMss")
$word_app = New-Object -ComObject Word.Application


Get-ChildItem -Path $documents_path -Filter *.doc? | ForEach-Object {
    $document = $word_app.Documents.Open($_.FullName)
    mkdir $($_.DirectoryName)\pdf
    $pdf_filename = "$($_.DirectoryName)\pdf\$($_.BaseName).pdf"
    $document.SaveAs([ref] $pdf_filename, [ref] 17)
    $document.Close()
}

$word_app.Quit()

