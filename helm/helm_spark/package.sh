script_abs=$(readlink -f "$0")
script_dir=$(dirname $script_abs)
echo "打包 $script_dir ..."
helm package $script_dir
helm repo index $script_dir


