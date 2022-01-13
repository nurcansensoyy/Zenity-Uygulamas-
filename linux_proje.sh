#!/bin/bash
#


rc=1
while [ $rc -eq 1 ]; do
  ans=$(zenity --info --title 'Linux Bilgilendirme Ekranı' \
      --text "Hangi bilgiyi görmek istersiniz?" --no-wrap \
      --extra-button "Makine Donanım Adı" \
      --extra-button "Makine Mimarisi" \
      --extra-button "İşlemci Özellikleri" \
      --extra-button "Donanım Bilgileri" \
      --extra-button "Blok Cihazları" \
      --ok-label "Çıkış Yap"
       )
  rc=$?
  echo "${rc}-${ans}"
  echo $ans
  if [[ $ans = "Makine Donanım Adı" ]]
  then
  (
  echo "50" ; sleep 1
  echo "# Makine donanım adı bulunuyor..." ; sleep 1
  ) |
        zenity --progress \
        --title="Makine Donanım Adı" \
        --text="Donanım adı bilgisi:" \
        --percentage=0
        if [ "$?" = -1 ] ; then
        zenity --error \
        --text="Donanım adı bulunamadı."	
  fi
	yazi=$(uname -a)
	zenity --info --title 'Makine Donanım Adı' \
	--text "$yazi"  \
	--ok-label "Geri Dön"  --width=300 --height=200
  elif [[ $ans = "Makine Mimarisi" ]]
  then
  (
  echo "50" ; sleep 1
  echo "# Makine mimarisi bulunuyor..."; sleep 1
  ) |
  zenity --progress \
  --title="Makine Mimarisi" \
  --text="Makine mimarisi bilgisi:" \
  --percentage=0
  if [ "$?" = -1 ] ; then
  zenity --error \
  --text="Makine mimarisi bulunamadı."
  fi
    yazi=$(uname -m)
	zenity --info --title 'Makine Mimarisi' \
	--text "$yazi"  \
	--ok-label "Geri Dön"  --width=300 --height=200
  elif [[ $ans = "İşlemci Özellikleri" ]]
  then
  (
  echo "50" ; sleep 1
  echo "# İşlemci özellikleri bulunuyor..." ; sleep 1
  ) |
        zenity --progress \
        --title="İşlemci Özellikleri" \
        --text="İşlemci özellikleri bilgisi:" \
        --percentage=0
        if [ "$?" = -1 ] ; then
        zenity --error \
        --text="İşlemci özellikleri bulunamadı."	
  fi
    yazi=$(lscpu)
	zenity --info --title 'İşlemci Özellikleri' \
	--text "$yazi"  \
	--ok-label "Geri Dön" --width=300 --height=200
  elif [[ $ans = "Donanım Bilgileri" ]]
  then
  (
  echo "50" ; sleep 1
  echo "# Donanım bilgileri bulunuyor..." ; sleep 1
  ) |
        zenity --progress \
        --title="Donanım Bilgileri" \
        --text="Donanım Bilgileri:" \
        --percentage=0
        if [ "$?" = -1 ] ; then
        zenity --error \
        --text="Donanım bilgileri bulunamadı."	
  fi
    yazi=$(hwinfo --short)
	zenity --info --title 'Donanım Bilgileri' \
	--text "$yazi"  \
	--ok-label "Geri Dön"  --width=300 --height=200
  elif [[ $ans = "Blok Cihazları" ]]
  then
  (
  echo "50" ; sleep 1
  echo "# Blok cihazları bulunuyor..." ; sleep 1
  ) |
        zenity --progress \
        --title="Blok Cihazları" \
        --text="Blok cihazları bilgisi:" \
        --percentage=0
        if [ "$?" = -1 ] ; then
        zenity --error \
        --text="Blok cihazları listelenemedi."	
  fi
    yazi=$(lsblk)
	zenity --info --title 'Blok Cihazları' \
	--text "$yazi"  \
	--ok-label "Geri Dön"  --width=300 --height=200
  fi
done
