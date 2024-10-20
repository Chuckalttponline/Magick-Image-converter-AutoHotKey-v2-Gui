#Requires AutoHotkey v2.0 ;Tells the AHK interpreter that we're using v2.
#SingleInstance Off
#NoTrayIcon

If(Not FileExist("magick.dll")) {
FileInstall("magick.dll", "magick.dll")
}


FilesCount := 0

MagickGui := Gui("-MaximizeBox", "Magick Image converter")
MagickGui.OnEvent("Close", (*) => ExitApp())
MagickGui.OnEvent("DropFiles", Gui_DropFiles)
MagickGui.SetFont("S13 Q5")

ImageFilesView := MagickGui.Add("ListView", "x5 y5 w440 h355 +ReadOnly -LV0x10 NoSortHdr", ["Name", "Path"])



ConvertButton := MagickGui.Add("Button", "x346 y365 w100 h50", "Convert`n" 0 " Images")
ConvertButton.OnEvent("Click", (*) => Convert())
ConvertButton.Enabled := False

ConvertionProgress := MagickGui.Add("Progress", "x5 y366 w338 h80 Range0-0")
;ConvertionProgress.Value += 1

ExtChoice := MagickGui.Add("DropDownList", "x346 y418 w100 h300 choose1", [".png", ".jpg", ".gif", ".bmp", ".webp", ".svg", ".pdf"])
;ExtChoice.Text


;////////////////// File handling
for GivenPath in A_Args
{
    Loop Files, GivenPath, "F"
    ImageFilesView.Add(, A_LoopFileName, A_LoopFileFullPath)
}
	ConvertionProgress.Opt("Range0-" ImageFilesView.GetCount())
	ConvertButton.Text := "Convert`n" ImageFilesView.GetCount() " Images"
	ImageFilesView.ModifyCol

			If(ImageFilesView.GetCount()) {
				ConvertButton.Enabled := true
			}
	
Gui_DropFiles(GuiObj, GuiCtrlObj, FileArray, X, Y) {
	for GivenPath in FileArray
	{
		Loop Files, GivenPath, "F"
		ImageFilesView.Add(, A_LoopFileName, A_LoopFileFullPath)
	}
		ConvertionProgress.Opt("Range0-" ImageFilesView.GetCount())
		ConvertButton.Text := "Convert`n" ImageFilesView.GetCount() " Images"
		ImageFilesView.ModifyCol
		
			If(ImageFilesView.GetCount()) {
				ConvertButton.Enabled := true
			}
}
;///////////////////////////////////


MagickGui.Show("Center w450 h452")

If(ImageFilesView.GetCount() = 0) {
	ImageFilesView.ModifyCol(1, 70)	
	ImageFilesView.ModifyCol(2, 60)	
}



Convert()
{
		OrgCnt := ImageFilesView.GetCount()
		ConvertButton.Enabled := False
		ExtChoice.Enabled := False
		
SelectedFolder := FileSelect("D 2", A_Desktop, "Choose your output folder")

If(!SelectedFolder) {
		ConvertButton.Enabled := true
		ExtChoice.Enabled := true
Exit
}

	Loop(OrgCnt) {
		CIpath := "`"" ImageFilesView.GetText(1, 2) "`""
		SplitPath(CIpath,, &OutDir,, &OutNameNoExt)
		COpath := "`"" SelectedFolder "\" OutNameNoExt ExtChoice.Text "`""

		ConvertButton.Text := "Converting`n" A_Index "-of-" OrgCnt
		
		RunWait(A_ComSpec " /c magick.dll " CIpath " " COpath " && exit",, "Hide")
		
		ImageFilesView.Delete(1)
		ConvertionProgress.Value += 1
	
	}
	ExitApp
}