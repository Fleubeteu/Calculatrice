function Calculatrice {
    param (
        [double]$nombre1,
        [double]$nombre2 = 0,
        [string]$operation
    )

    switch ($operation) {
        "+" { return $nombre1 + $nombre2 }
        "-" { return $nombre1 - $nombre2 }
        "*" { return $nombre1 * $nombre2 }
        "/" {
            if ($nombre2 -eq 0) {
                Write-Host "Erreur : Division par zéro !" -ForegroundColor Red
                return $null
            }
            return $nombre1 / $nombre2
        }
        "^2" { return $nombre1 * $nombre1 }
        default {
            Write-Host "Erreur : Opération non valide !" -ForegroundColor Red
            return $null
        }
    }
}

$nombre1 = [double](Read-Host "Entrez le premier nombre")
$operation = Read-Host "Entrez l'opération (+, -, *, /, ^2)"

if ($operation -ne "^2") {
    $nombre2 = [double](Read-Host "Entrez le deuxième nombre")
    $resultat = Calculatrice -nombre1 $nombre1 -nombre2 $nombre2 -operation $operation
} else {
    $resultat = Calculatrice -nombre1 $nombre1 -operation $operation
}

if ($resultat -ne $null) {
    Write-Host "Résultat : $resultat" -ForegroundColor Green
}