# this script kills current active window, use it with whkd

Add-Type @"
	using System;
	using System.Runtime.InteropServices;
	public class UserWindows {
		[DllImport("user32.dll")]
		public static extern IntPtr GetForegroundWindow();
		[DllImport("user32.dll")]
		[return: MarshalAs(UnmanagedType.Bool)]
		public static extern bool PostMessage(IntPtr hWnd, uint Msg, IntPtr wParam, IntPtr lParam);
	}
"@

$WM_CLOSE = 0x0010
$activeHandle = [UserWindows]::GetForegroundWindow()
[UserWindows]::PostMessage($activeHandle, $WM_CLOSE, [IntPtr]::Zero, [IntPtr]::Zero)
