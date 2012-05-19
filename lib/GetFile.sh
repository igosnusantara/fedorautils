function GetFile()
{
if [ ! -f "$WORKINGDIR/$file" ] || [ "$FORCE" = "YES" ]; then
	ShowMsg "Downloading from: $get"
	ShowMsg "Saving to: $file"
	Notify "Downloading:" "Downloading $file"
	curl -L -O -# "$get"
	if [ -f "$WORKINGDIR/$file" ]; then
		ShowMsg "Download successful!"
		if [ "$KEEPDOWNLOADS" = "YES" ]; then
			cp -f "$file" "$DOWNLOADSDIR"
		fi
	else
		ErrorMsg "Error downloading $file!"
	fi
else
	ShowMsg "$file already present, skipping download"
fi
}
