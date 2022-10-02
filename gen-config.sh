repo="ts-node-eslint-jasmine"

copy_file() {
    file=$1
    echo "copy" ${file} "..."
    rm -f ${file}
    touch ${file}
    cat ${repo}/${file} >>${file}
}

echo "clone" ${repo} "..."
git clone https://github.com/longmarch1/${repo}.git

# .editorconfig
copy_file ".editorconfig"

# .gitignore
copy_file ".gitignore"

# setup .eslintrc
copy_file ".eslintrc"

# jasmine.json
mkdir "spec"
mkdir "spec/helpers"
mkdir "spec/support"
copy_file "spec/helpers/console_reporter_helper.js"
copy_file "spec/support/jasmine.json"
copy_file "spec/example.t.ts"

# add example.ts
copy_file "example.ts"

# install
npm i --save-dev

# Remove git repo
rm -rf ${repo}

echo ""
echo "run \"npm test\" to see unit test result"
