#!/bin/bash

# Oneliner to update commit hashes in all packages
find ~/.local/share/nvim/site/pack/packer -iname .git -exec bash -c 'cd "{}"; cd ..; git remote -v | grep fetch | sed -E "s#^origin\thttps://github.com/##;s#(\.git)?[ \t]+\(fetch\)#,$(git --no-pager log -1 --pretty=format:%H)#"' \; | xargs -I _ bash -c 'var="_"; sed "s|\"${var%%,*}\",\([ \\t\\n]\)commit = \"[^\"]\+\"|\"${var%%,*}\",\1commit = \"${var##*,}\"|" -i ~/.config/nvim/lua/user/plugins.lua'

# Oneliner to assign a commit to all packages (run once when packages are not pinned)
find ~/.local/share/nvim/site/pack/packer -iname .git -exec bash -c 'cd "{}"; cd ..; git remote -v | grep fetch | sed -E "s#^origin\thttps://github.com/##;s#(\.git)?[ \t]+\(fetch\)#,$(git --no-pager log -1 --pretty=format:%H)#"' \; | xargs -I _ bash -c 'var="_"; sed "s|\"${var%%,*}\"|\"${var%%,*}\", commit = \"${var##*,}\"|" -i ~/.config/nvim/lua/user/plugins.lua'

# Oneliner to unpine all dependencies
sed -Ei 's/commit = "[^"]+",?//' ~/.config/nvim/lua/user/plugins.lua
