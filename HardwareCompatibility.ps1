# Set the Dashworks API endpoint and API key
$apiEndpoint = "https://your-dashworks-instance.com/api"
$apiKey = "your-api-key"

# Set the values for the "Hardware Compatibility" field
$compatibilityWindows11 = "Compatible with Windows 11"
$compatibilityWindows10 = "Compatible with Windows 10"

# Read the list of machine models and compatibility values from a CSV file
$csvFile = Import-Csv "machine-models.csv"

# Loop through the list of machine models
foreach ($row in $csvFile) {
  # Get the hardware asset ID for the current machine model
  $hardwareModel = $row.HardwareModel
  $hardwareAsset = (Invoke-WebRequest -Uri "$apiEndpoint/hardware?hardwareModel=$hardwareModel" -Headers @{"Authorization"="Bearer $apiKey"}).Content | ConvertFrom-Json
  $hardwareId = $hardwareAsset.id

  # Set the value for the "Hardware Compatibility" field
  $hardwareCompatibility = $row.HardwareCompatibility
  if ($hardwareCompatibility -eq $compatibilityWindows11) {
    $customFields = @{ "Hardware Compatibility" = $compatibilityWindows11 }
  } else {
    $customFields = @{ "Hardware Compatibility" = $compatibilityWindows10 }
  }

  # Update the hardware asset with the new value for the "Hardware Compatibility" field
  Invoke-WebRequest -Method Patch -Uri "$apiEndpoint/hardware/$hardwareId" -Headers @{"Authorization"="Bearer $apiKey"} -Body (ConvertTo-Json @{ customFields = $customFields })
}
