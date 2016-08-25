# ------------------------------------------------------------------
#  [victoria.galligani@cima.fcen.uba.ar] get_files_from_mirador.sh 
#
#  Description: Permite bajar datos de http://mirador.gsfc.nasa.gov/ 
#         asumiendo que ya se creo files.dat que contiene la lista 
#         de URLs creados por la pagina de nasa. Y que ya tiene un 
#         login en https://urs.earthdata.nasa.gov/, y ademas se 
#         agrego en "my applications" del login la opcion 
#         nasa_gesdisc_data_archive
#
#  Modificar el userid y userpassword 
#         
#  Date: 25-08-2016
# ------------------------------------------------------------------

cd ~
touch .netrc
echo "machine urs.earthdata.nasa.gov login <userid> password <userpassword>" >> .netrc
chmod 0600 .netrc

cd ~
touch .urs_cookies

wget --no-check-certificate --content-disposition --load-cookies ~/.urs_cookies --save-cookies ~/.urs_cookies --auth-no-challenge=on --keep-session-cookies -i files.dat
rm ~/.netrc

