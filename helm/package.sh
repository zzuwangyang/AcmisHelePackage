echo "打包所有 Helm 包..."
script_abs=$(readlink -f "$0")
script_dir=$(dirname $script_abs)
helm repo index $script_dir
echo "打包所有 Helm 包成功"
