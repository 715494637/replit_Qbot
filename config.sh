export 
green(){ echo -e "\033[32m\033[01m$1\033[0m";}
yellow(){ echo -e "\033[33m\033[01m$1\033[0m";}
blue(){ echo -e "\033[36m\033[01m$1\033[0m";}
echo 
yellow "插件配置文件生成"
if [ ! -f ./Miao-Yunzai/plugins/chatgpt-plugin/config/config.json ]; then
    echo 
    green "生成chatgpt-plugin配置.."
    wget -O ./Miao-Yunzai/plugins/chatgpt-plugin/config/config.json https://raw.githubusercontent.com/715494637/replit_Qbot/main/chatgpt/config.json
fi
sed -i 's|"serverHost": "[^"]*"|"serverHost": "'${REPL_SLUG}'.'${REPL_OWNER}'.repl.co"|' ./Miao-Yunzai/plugins/chatgpt-plugin/config/config.json
sed -i 's|"serverPort": "[^"]*"|"serverPort": "9000"|' ./Miao-Yunzai/plugins/chatgpt-plugin/config/config.json
echo 
blue "已适配chatgpt-plugin配置.."

sed -i "s@host:.*@host: https://${REPL_SLUG}.${REPL_OWNER}.repl.co@" ./Miao-Yunzai/plugins/guoba-plugin/defSet/application.yaml
sed -i "s@port:.*@port: 8099@" ./Miao-Yunzai/plugins/guoba-plugin/defSet/application.yaml
echo 
blue "已适配guoba-plugin配置.."