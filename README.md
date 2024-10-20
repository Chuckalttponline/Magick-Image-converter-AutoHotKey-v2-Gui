This is a UI built from AutoHotKey v2 for "Magick Image converter"(a Very good Command line tool basically a photo editor)

Compact and Simple
-
![image](https://github.com/user-attachments/assets/1b521f30-f24d-4e14-ae66-a79b97c8f987)


Convert almost any image format you can think of including .heic and .ico Which will be converted to several images if the icon has multiple layers: Convert to [.png, .jpg, .gif, .bmp, .webp, .svg, .pdf]
-
- Insert an image into a new pdf file.
- Yes svg can hold real image data not just Gcode.




![unnamed](https://github.com/user-attachments/assets/bc08ab78-cc3d-47c0-95b6-d6bd24bf0868)


Click Convert # Images, and Select a output folder. 
-
![unnamed1](https://github.com/user-attachments/assets/bb516dfd-ce22-4ae8-b7c1-d00d32b7199f)

![image](https://github.com/user-attachments/assets/02ffd392-18b7-4dc4-98b0-dc66a8323cfb)


My Script uses Magick image converter as a DLL and passes the needed pramitors to it.
I recomend checking out the original command line tool at > https://imagemagick.org/script/convert.php  Its good😎...


"Magick Image converter Gui.exe" is ready to use just run it and it will extract a "magick.dll" which is what does the image converting. If you want to edit the Gui I left in an icon "IDR_MAGICKICON.ico" and the AutoHotKey v2 source code for the Gui "Magick Image converter Gui.ahk" to get a "magick.dll" either run "Magick Image converter Gui.exe" or download the latest version of Magick image converter, copy "magick.exe" and name it to "magick.dll". Then you can edit the AutoHotKey v2 code and compile using the icon.
