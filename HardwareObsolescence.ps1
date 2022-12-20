if ($MachineModel -match "800G1" -or $MachineModel -match "800G2" -or $MachineModel -match "800G3" -or $MachineModel -match "800G4" -or $MachineModel -match "800G5") {
  if ($MemoryGB -lt 16) {
    $HardwareCompatibility = "Windows 10 supported"
  }
  else {
    $HardwareCompatibility = "Windows 11 Supported"
  }
}
