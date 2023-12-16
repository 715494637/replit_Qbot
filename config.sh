export 
green(){ echo -e "\033[32m\033[01m$1\033[0m";}
yellow(){ echo -e "\033[33m\033[01m$1\033[0m";}
blue(){ echo -e "\033[36m\033[01m$1\033[0m";}

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
