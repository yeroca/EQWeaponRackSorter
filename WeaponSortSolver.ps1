#! /usr/bin/pwsh

# WeaponSortSolver.ps1
# PowerShell 5.0
#
# Four racks, four weapons per rack.
# The first character in each string is the BOTTOM weapon.
# Legal move: move one bottom weapon to an empty rack
# or onto a rack whose bottom weapon is of the same type.

# ------------------------------------------------------------
# State utilities
# ------------------------------------------------------------

function Get-StateKey {
    param([string[]]$State)

    return [string]::Join('|', $State)
}

function Test-Solved {
    param([string[]]$State)

    $found = @{}

    foreach ($rack in $State) {
        if ($rack.Length -eq 4 -and
            $rack -match '^(.)\1{3}$') {

            $found[$rack.Substring(0, 1)] = $true
        }
    }

    return ($found.Count -eq 3)
}

# ------------------------------------------------------------
# Breadth-first search
# ------------------------------------------------------------

function Find-Solution {
    param([string[]]$InitialState)

    $queue = New-Object 'System.Collections.Generic.Queue[string]'
    $visited = @{}
    $parents = @{}

    $startKey = Get-StateKey $InitialState

    $queue.Enqueue($startKey)
    $visited[$startKey] = $true

    $goalKey = $null

    while ($queue.Count -gt 0) {

        $key = $queue.Dequeue()

        # Recover the four racks from the state key.
        $state = $key.Split([char]'|')

        if (Test-Solved $state) {
            $goalKey = $key
            break
        }

        # Try every possible source and destination.
        for ($from = 0; $from -lt 4; $from++) {

            if ($state[$from].Length -eq 0) {
                continue
            }

            # Only the bottom weapon can be moved.
            $letter = $state[$from].Substring(0, 1)

            for ($to = 0; $to -lt 4; $to++) {

                if ($from -eq $to) {
                    continue
                }

                # Destination must have available capacity.
                if ($state[$to].Length -ge 4) {
                    continue
                }

                # Destination must be empty or have the
                # same type at its bottom.
                if ($state[$to].Length -gt 0 -and
                    $state[$to].Substring(0, 1) -ne $letter) {
                    continue
                }

                # Create the resulting state.
                $nextState = [string[]]$state.Clone()

                # Remove the bottom weapon from the source.
                $nextState[$from] = $state[$from].Substring(1)

                # Place the weapon on the bottom of the destination.
                $nextState[$to] = $letter + $state[$to]

                $nextKey = Get-StateKey $nextState

                # Avoid revisiting previously explored states.
                if ($visited.ContainsKey($nextKey)) {
                    continue
                }

                $visited[$nextKey] = $true

                # Remember how we reached this state.
                $parents[$nextKey] = [PSCustomObject]@{
                    Previous = $key
                    Letter   = $letter
                    From     = $from + 1
                    To       = $to + 1
                }

                $queue.Enqueue($nextKey)
            }
        }
    }

    if ($null -eq $goalKey) {
        return $null
    }

    # --------------------------------------------------------
    # Reconstruct the solution by walking backwards through
    # the predecessor records.
    # --------------------------------------------------------

    $moves = New-Object System.Collections.ArrayList
    $cursor = $goalKey

    while ($cursor -ne $startKey) {

        $record = $parents[$cursor]

        [void]$moves.Add($record)

        $cursor = $record.Previous
    }

    # Return moves in forward order.
    $solution = @()

    for ($i = $moves.Count - 1; $i -ge 0; $i--) {
        $solution += $moves[$i]
    }

    return ,$solution
}

# ------------------------------------------------------------
# Input
# ------------------------------------------------------------

Write-Host ""
Write-Host "Weapon Rack Puzzle Solver"
Write-Host "-----------------------"
Write-Host "Enter the contents of each weapon rack."
Write-Host "Letters: s, p, a for sword, spear, and axe respectively"
Write-Host "First letter is the BOTTOM weapon."
Write-Host "If the rack is empty, just hit enter."
Write-Host ""

$remaining = @{
    s = 4
    p = 4
    a = 4
}

$initialState = @('', '', '', '')

for ($i = 0; $i -lt 4; $i++) {

    $rackNumber = $i + 1

    while ($true) {

        $entry = Read-Host "rack $rackNumber"

        # Normalize input.
        $entry = $entry.Trim().ToLowerInvariant()

        if ($entry.Length -gt 4) {
            Write-Host "ERROR: A rack cannot contain more than four weapons." -ForegroundColor Red
            continue
        }

        if ($entry -notmatch '^[spa]*$') {
            Write-Host "ERROR: Only the letters s, p, and a are allowed." -ForegroundColor Red
            continue
        }

        # Count the letters in this entry.
        $counts = @{
            s = 0
            p = 0
            a = 0
        }

        foreach ($letter in $entry.ToCharArray()) {
            $counts[[string]$letter]++
        }

        # Check that sufficient weapons remain.
        $valid = $true

        foreach ($letter in @('s', 'p', 'a')) {
            if ($counts[$letter] -gt $remaining[$letter]) {
                Write-Host "ERROR: Too many '$letter' weapons. Only $($remaining[$letter]) remain." -ForegroundColor Red
                $valid = $false
            }
        }

        if (-not $valid) {
            continue
        }

        # Accept the entry and update inventory.
        $initialState[$i] = $entry

        foreach ($letter in @('s', 'p', 'a')) {
            $remaining[$letter] -= $counts[$letter]
        }

        break
    }

    # Show remaining inventory after each rack.
    Write-Host ""
    Write-Host "Remaining weapons:"
    Write-Host "  s: $($remaining['s'])  p: $($remaining['p'])  a: $($remaining['a'])"
    Write-Host ""
}

# Ensure the puzzle contains exactly four of each type.
if ($remaining['s'] -ne 0 -or
    $remaining['p'] -ne 0 -or
    $remaining['a'] -ne 0) {

    Write-Host "ERROR: The racks must contain exactly four weapons of each type." -ForegroundColor Red
    exit
}

# ------------------------------------------------------------
# Solve
# ------------------------------------------------------------

Write-Host "Searching for a solution..."
Write-Host ""

$solution = Find-Solution $initialState

if ($null -eq $solution) {
    Write-Host "No solution exists for this configuration." -ForegroundColor Red
    exit
}

# ------------------------------------------------------------
# Display solution
# ------------------------------------------------------------

Write-Host "Puzzle solved!"
Write-Host ""
Write-Host "Number of moves: $($solution.Count)"
Write-Host ""

$letterToWeapon = @{
    's' = 'sword'
    'p' = 'spear'
    'a' = 'axe'
}

for ($i = 0; $i -lt $solution.Count; $i++) {

    $move = $solution[$i]

    Write-Host ("{0,2}: {1,-5} from {2} to {3}" -f `
        ($i + 1), $letterToWeapon.($move.Letter), $move.From, $move.To)
}

Write-Host ""
Write-Host "End of solution."
