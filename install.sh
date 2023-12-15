echo  red "Replit Miao-Yunzai一键部署脚本"
echo  red "op魔改版"
echo  red "原仓库开源地址：https://github.com/yzsong06/Replit-Nodejs-MiaoYunzai"
echo  red "本项目严禁商用，部署脚本开源于Github"
echo  yellow "安装获取依赖文件需求环境"
nix-env -iA nixpkgs.nodePackages.pnpm
nix-env -iA nixpkgs.wget
eecho  blue "从Github拉取Miao-Yunzai文件"
git clone --depth=1 https://github.com/yoimiya-kokomi/Miao-Yunzai.git
cd Miao-Yunzai 
git clone --depth=1 https://github.com/yoimiya-kokomi/miao-plugin.git ./plugins/miao-plugin/
pnpm install
echo  green "从Github拉取锅巴插件"
git clone --depth=1 https://gitee.com/guoba-yunzai/guoba-plugin.git ./plugins/guoba-plugin/
pnpm install --filter=guoba-plugin
echo  yellow "从Github拉取chatgpt插件"
git clone --depth=1 https://github.com/ikechan8370/chatgpt-plugin.git ./plugins/chatgpt-plugin/
pnpm install --filter=chatgpt-plugin
cd ..
bash <(curl -s https://raw.githubusercontent.com/715494637/replit_Qbot/main/config.sh)
echo  blue "获取运行指令文件"
wget -O .replit https://raw.githubusercontent.com/715494637/replit_Qbot/main/replit/.replit
wget -O replit.nix https://raw.githubusercontent.com/715494637/replit_Qbot/main/replit/replit.nix
wget -O main.sh https://raw.githubusercontent.com/715494637/replit_Qbot/main/main.sh
echo 部署完成！单击Run或按下键盘上的Ctrl+Enter以启动本项目
echo 若出现使用问题请参考文档 https://www.wolai.com/oA43vuW71aBnv7UsEysn4T
echo 部署仓库开源地址：https://github.com/yzsong06/Replit-Nodejs-MiaoYunzai
echo 本项目严禁商用，部署脚本开源于Github
