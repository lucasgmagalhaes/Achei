dotnet tool install --global dotnet-sonarscanner
dotnet sonarscanner begin /k:"lucasgmagalhaes_Achei" /o:"lucasgmagalhaes-github" /d:sonar.host.url="https://sonarcloud.io" /d:sonar.login="40131c9c86a0b49311822fbb44f64031990a3c53"
dotnet build ../Backend.sln
dotnet sonarscanner end /d:sonar.login="40131c9c86a0b49311822fbb44f64031990a3c53"
pause