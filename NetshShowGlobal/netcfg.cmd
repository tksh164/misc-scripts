@echo off

netsh interface tcp show global
netsh interface tcp show global | findstr ECN
reg query HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters /v TcpMaxDataRetransmissions

pause
