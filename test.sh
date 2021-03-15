repo="ts-node-eslint-jasmine"

copy_file () {
    file=$1
    rm -f ${file}
    touch ${file}
    cat ${repo}/${file} >> ${file}
}

copy_file "test.json"