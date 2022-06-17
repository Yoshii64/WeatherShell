add-type -AssemblyName System.Windows.Forms

$FormObject = [System.Windows.Forms.Form]
$LabelObject = [System.Windows.Forms.Label]
$ButtonObject = [System.Windows.Forms.Button]


$Window=New-Object $FormObject
$Window.ClientSize ='1000,1000'
$Window.BackColor = '#ffffff'
$Window.Text ='WeatherShell'
$Window.StartPosition ='CenterScreen'

$Window.Controls.AddRange(@($ENSO, $SSTATL, $MJO))

$ENSO = New-Object $ButtonObject
$ENSO.text = 'ENSO'
$ENSO.ClientSize = '100,100'
$ENSO.Location = '0,0'
$ENSO.Font = New-Object System.Drawing.Font('Microsoft Sans Serif', 12)

$SSTATL = New-Object $ButtonObject
$SSTATL.text = 'ATL SSTAs'
$SSTATL.ClientSize = '100,100'
$SSTATL.Location = '0,100'
$SSTATL.Font = New-Object System.Drawing.Font('Microsoft Sans Serif', 12)


$MJO = New-Object $ButtonObject
$MJO.text = 'MJO'
$MJO.ClientSize = '100,100'
$MJO.Location = '0,200'
$MJO.Font = New-Object System.Drawing.Font('Microsoft Sans Serif', 12)


$ENSO.Add_Click({
Invoke-WebRequest https://www.tropicaltidbits.com/analysis/ocean/nino34.png -OutFile C:\Users\$env:USERNAME\Desktop\ENSO.png
})

$SSTATL.Add_Click({
Invoke-WebRequest https://cyclonicwx.com/data/sst/crw_ssta_natl.png -OutFile C:\Users\$env:USERNAME\Desktop\ATLSSTAs.png
})

$MJO.Add_Click({

Invoke-WebRequest https://www.atmos.albany.edu/student/ventrice/real_time/twc_globe_mjo_vp200.png -OutFile C:\Users\$env:USERNAME\Desktop\MJO.png

})


$Window.ShowDialog()
$Window.Dispose()