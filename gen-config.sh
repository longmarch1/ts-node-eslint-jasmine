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

# setup tsconfig.json
copy_file "tsconfig.json"

# setup package.json
copy_file "package.json"

# jasmine.json
mkdir "spec"
mkdir "spec/helpers"
mkdir "spec/support"
copy_file "spec/helpers/console_reporter_helper.js"
copy_file "spec/support/jasmine.json"
copy_file "spec/example.t.ts"

# add example.ts
copy_file "example.ts"

# Remove git repo
rm -rf ${repo}

# install
npm i

echo ""
echo "run \"npm test\" to see unit test result"
