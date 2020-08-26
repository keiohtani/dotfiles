uname=$(uname)

cd $(dirname $0)

for alias_file in ./alias/**/*; do
    if [ ! -d $alias_file ]; then
        source $alias_file
    fi
done
