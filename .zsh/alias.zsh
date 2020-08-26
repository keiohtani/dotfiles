uname=$(uname)

cd $(dirname $0)

for alias_file in ./alias/**/*; do
    echo $alias_file
    if [ ! -d $alias_file ]; then
        source $alias_file
    fi
done
