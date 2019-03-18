[reflection.assembly]::LoadWithPartialName("Microsoft.SqlServer.Smo")
$server = new-object ("Microsoft.SqlServer.Management.Smo.Server") .

$dbExists = $FALSE
foreach ($db in $server.databases) {
  if ($db.name -eq "acheidb") {
    Write-Host "acheidb já existe."
    $dbExists = $TRUE
  }
}

if ($dbExists -eq $FALSE) {
  $db = New-Object -TypeName Microsoft.SqlServer.Management.Smo.Database -argumentlist $server, "acheidb"
  $db.Create()

  $user = "NT AUTHORITY\NETWORK SERVICE"
  $usr = New-Object -TypeName Microsoft.SqlServer.Management.Smo.User -argumentlist $db, $user
  $usr.Login = $user
  $usr.Create()

  $role = $db.Roles["db_datareader"]
  $role.AddMember($user)
}