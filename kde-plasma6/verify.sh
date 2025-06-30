

while read -r line;do
	if $(echo $line | grep -E -q '^ *$|^#' ); then continue; fi
	file=$(echo $line | cut -d" " -f2)
	pkg=$(echo $file|sed 's|^.*/||') 
	packagedir=$(echo $pkg|sed 's|\.tar.*||')
	name=$(echo $pkg|sed 's|-6.*$||')
	#echo $name
	if [ ! -d $name ];then
		echo "missing >> $name"
	fi
done <  md5
