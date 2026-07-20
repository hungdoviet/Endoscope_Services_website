$cssFile = "e:\EndoscopeServices\Web\AI WEB ES\css\style.css"
$utf8 = New-Object System.Text.UTF8Encoding $False
$content = [IO.File]::ReadAllText($cssFile, $utf8)

# 1. Root Variables
$content = $content -replace '--clr-dark:\s*#0f172a;', '--clr-dark:       #f8fafc;'
$content = $content -replace '--clr-dark-2:\s*#1e293b;', '--clr-dark-2:     #ffffff;'
$content = $content -replace '--clr-dark-3:\s*#334155;', '--clr-dark-3:     #e2e8f0;'
$content = $content -replace '--clr-white:\s*#ffffff;', '--clr-white:      #0f172a;'
$content = $content -replace '--gradient-hero:.*?100%\);', '--gradient-hero: linear-gradient(135deg, #f8fafc 0%, #e2e8f0 50%, #eff6ff 100%);'

# footer and CTA specific dark colors
$content = $content -replace '#0c1929', '#e0e7ff'
$content = $content -replace '#0e2847', '#f1f5f9'
$content = $content -replace '#080e1a', '#f8fafc'

# 2. Body Custom Gradient
$content = $content -replace 'rgba\(15,23,42,1\)', 'rgba(248,250,252,1)'
$content = $content -replace 'rgba\(10,15,40,1\)', 'rgba(238,242,246,1)'

# 3. Text colors (Hardcoded)
$content = $content -replace '#cbd5e1', '#334155'
$content = $content -replace '#94a3b8', '#475569'

# 4. Glassmorphism and Overlays
# Replaces white overlays with dark overlays
$content = $content -replace 'rgba\(255,255,255,', 'rgba(15,23,42,'

# Replaces very dark backgrounds for glassmorphism panels with white glassmorphism panels
$content = $content -replace 'rgba\(15, 23, 42, 0.8\)', 'rgba(255, 255, 255, 0.85)'   # header
$content = $content -replace 'rgba\(15, 23, 42, 0.97\)', 'rgba(255, 255, 255, 0.97)'  # header scrolled
$content = $content -replace 'rgba\(30, 41, 59, 0.4\)', 'rgba(255, 255, 255, 0.6)'    # cards / forms
$content = $content -replace 'rgba\(30, 41, 59, 0.7\)', 'rgba(255, 255, 255, 0.95)'   # dropdown
$content = $content -replace 'rgba\(15, 23, 42, 0.6\)', 'rgba(255, 255, 255, 0.8)'    # specific dark overlay

# 5. Service Card Grid background fixes
# Background dark blue inside linear gradients
$content = $content -replace 'rgba\(14,165,233,0.06\), rgba\(6,182,212,0.03\)', 'rgba(14,165,233,0.15), rgba(6,182,212,0.08)'

# Re-white the buttons so their text stays white even though --clr-white is now dark
$content = $content -replace 'color: var\(--clr-white\);\s*box-shadow:', "color: #ffffff;`n    box-shadow:"

[IO.File]::WriteAllText($cssFile, $content, $utf8)
Write-Output "Theme converted to Bright Mode!"
