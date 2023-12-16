export 
green(){ echo -e "\033[32m\033[01m$1\033[0m";}
yellow(){ echo -e "\033[33m\033[01m$1\033[0m";}
blue(){ echo -e "\033[36m\033[01m$1\033[0m";}

echo  
yellow "Replit Miao-Yunzai一键部署脚本"
echo  
yellow "op魔改版"
echo  
yellow "原仓库开源地址：https://github.com/yzsong06/Replit-Nodejs-MiaoYunzai"
echo  
yellow "本项目严禁商用，部署脚本开源于Github"
echo  
yellow "安装获取依赖文件需求环境"
nix-env -iA nixpkgs.nodePackages.pnpm
nix-env -iA nixpkgs.wget
echo  
blue "从Github拉取Miao-Yunzai文件"
git clone --depth=1 https://github.com/yoimiya-kokomi/Miao-Yunzai.git
cd Miao-Yunzai 
git clone --depth=1 https://github.com/yoimiya-kokomi/miao-plugin.git ./plugins/miao-plugin/
pnpm install
echo  
green "从Github拉取锅巴插件"
git clone --depth=1 https://gitee.com/guoba-yunzai/guoba-plugin.git ./plugins/guoba-plugin/
pnpm install --filter=guoba-plugin
echo  
yellow "从Github拉取chatgpt插件"
git clone --depth=1 https://github.com/ikechan8370/chatgpt-plugin.git ./plugins/chatgpt-plugin/
pnpm install --filter=chatgpt-plugin
cd ..
echo  
blue "获取运行指令文件"
wget -O .replit https://raw.githubusercontent.com/715494637/replit_Qbot/main/replit/.replit
wget -O replit.nix https://raw.githubusercontent.com/715494637/replit_Qbot/main/replit/replit.nix
wget -O main.sh https://raw.githubusercontent.com/715494637/replit_Qbot/main/main.sh
echo 
yellow "插件配置文件生成/修改"

if [ e ./Miao-Yunzai/plugins/chatgpt-plugin/config/config.json ]; then
    sed -i 's|"serverHost": "[^"]*"|"serverHost": "'${REPL_SLUG}'.'${REPL_OWNER}'.repl.co"|' ./Miao-Yunzai/plugins/chatgpt-plugin/config/config.json
    sed -i 's|"serverPort": "[^"]*"|"serverPort": "9000"|' ./Miao-Yunzai/plugins/chatgpt-plugin/config/config.json
else
    echo "{{
  "serverPort": 9000,
  "serverHost": "${REPL_SLUG}.${REPL_OWNER}.repl.co",
}}" > ./Miao-Yunzai/plugins/chatgpt-plugin/config/config.json
fi
echo 
blue "已适配chatgpt-plugin配置.."

if [ e ./Miao-Yunzai/plugins/guoba-plugin/config/application.yaml ]; then
    sed -i "s@host:.*@host: https://${REPL_SLUG}.${REPL_OWNER}.repl.co@" ./Miao-Yunzai/plugins/guoba-plugin/config/application.yaml
    sed -i "s@port:.*@port: 8099@" ./Miao-Yunzai/plugins/guoba-plugin/config/application.yaml
fi
sed -i "s@host:.*@host: https://${REPL_SLUG}.${REPL_OWNER}.repl.co@" ./Miao-Yunzai/plugins/guoba-plugin/defSet/application.yaml
sed -i "s@port:.*@port: 8099@" ./Miao-Yunzai/plugins/guoba-plugin/defSet/application.yaml
echo 
blue "已适配guoba-plugin配置.."
echo  
yellow "部署完成！单击Run或按下键盘上的Ctrl+Enter以启动本项目"
echo  
yellow "若出现使用问题请参考文档 https://www.wolai.com/oA43vuW71aBnv7UsEysn4T"
echo  
yellow "部署仓库开源地址：https://github.com/yzsong06/Replit-Nodejs-MiaoYunzai"
echo  
yellow "本项目严禁商用，部署脚本开源于Github"
