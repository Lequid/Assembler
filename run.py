


from os import system

root = "C:/Users/oleja/Desktop/Assembler"
system(root + "/nasm.exe -f win32 src/main.s")
system(root + "/golink.exe /console /entry main src\main.obj msvcrt.dll")
system(root + "/src/main.exe")

