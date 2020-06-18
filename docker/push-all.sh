file=$(find /var/ftp/acmis/docker |grep Makefile$)
echo $file
for variable in {$file}
do
tdir=${variable/Makefile/}
cd $tdir
make push
done