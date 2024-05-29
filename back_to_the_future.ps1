# Start the Powershell from Terminal as administrator
# Start-Process powershell -Verb runAs

# Allows PowerShell to run scripts created locally
# Set-ExecutionPolicy RemoteSigned -Scope CurrentUser

# Navigate to the place where you store the script
# cd "path"

# Start the script lazy bastard
# ./back_to_the_future.ps1


function Send-SpaceKey {
    Add-Type -TypeDefinition @"
        using System;
        using System.Runtime.InteropServices;
        public class Keyboard {
            [DllImport("user32.dll", CharSet = CharSet.Auto, ExactSpelling = true)]
            public static extern void keybd_event(byte bVk, byte bScan, int dwFlags, int extraInfo);
            public const int KEYEVENTF_KEYUP = 0x0002;
            public const int VK_SPACE = 0x20;
            public static void SendSpace() {
                keybd_event(VK_SPACE, 0, 0, 0);
                keybd_event(VK_SPACE, 0, KEYEVENTF_KEYUP, 0);
            }
        }
"@
    [Keyboard]::SendSpace()
    Write-Output "Space key pressed at $(Get-Date)"
}
 
# Start a new PowerShell process
Start-Process powershell

# Press space key  every 30 seconds
while ($true) {
    Start-Sleep -Seconds 30
    Send-SpaceKey
} 