# Define the list of compatible machine models
$compatibleModels = "8138580G1", "805850G374", "80694830G4853", "375800G45849", "5859800G4845"

# Check if the machine model is in the list of compatible models
if ($compatibleModels -contains $MachineModel) {
  # Check if the amount of memory is less than 16 GB
  if ($MemoryGB -lt 16) {
    # Set the hardware compatibility to "Windows 10 supported"
    $HardwareCompatibility = "Windows 10 supported"
  }
  else {
    # Set the hardware compatibility to "Windows 11 supported"
    $HardwareCompatibility = "Windows 11 supported"
  }
}
