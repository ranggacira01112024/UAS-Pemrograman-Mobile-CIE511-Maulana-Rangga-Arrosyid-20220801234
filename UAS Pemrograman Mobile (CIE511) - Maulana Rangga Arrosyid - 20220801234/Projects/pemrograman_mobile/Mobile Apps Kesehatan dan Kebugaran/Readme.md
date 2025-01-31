# Attach a USB device 

[detail here](https://learn.microsoft.com/en-us/windows/wsl/connect-usb)

```PowerShell
usbipd list
```
```PowerShell
usbipd bind --busid 2-2
```
```PowerShell
usbipd attach --wsl --busid 2-2
```
```WSL
lsusb
```
```PowerShell
usbipd detach --busid <busid>
```
