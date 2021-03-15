repo="ts-node-eslint-jasmine"

copy_file () {
    file=$1
    echo "copy" ${file} "..."
    rm -f ${file}
    touch ${file}
    cat ${repo}/${file} >> ${file}
}

echo "clone" ${repo} "..."
git clone https://github.com/longmarch1/${repo}.git

# .editorconfig
copy_file ".editorconfig"

# .gitignore
copy_file ".gitignore"

# npm create package.json
echo "init package.json..."
npm init --yes

# setup typescript
echo "install typescript..."
npm install --save-dev typescript
npx tsc --init

# setup eslint
echo "install eslint..."
npm install --save-dev eslint eslint-config-airbnb-base
npm install --save-dev eslint-plugin-import eslint-plugin-jasmine

# setup .eslintrc
copy_file ".eslintrc..."

# setup jasmine
echo "install jasmine..."
npm install --save-dev jasmine @types/jasmine
npm install --save-dev ts-node jasmine-ts
npm install --save-dev jasmine-spec-reporter

# jasmine.json
copy_file "jasmine.json"

# add example.ts and example.t.ts
copy_file "example.ts"
mkdir "spec";
copy_file "spec/example.t.ts"

# Remove git repo
rm -rf ${repo}

echo ""
echo "[final step] add the following script to package.json manually."
echo ""
echo "\"test\": \"jasmine-ts --config=jasmine.json\""
echo ""
echo "run \"npm test\" to see unit test result"
