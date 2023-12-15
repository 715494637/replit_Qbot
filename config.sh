echo 插件配置文件生成/修改
if [ ! -f ./Miao-Yunzai/plugins/chatgpt-plugin/config/config.json ]; then
    echo 生成chatgpt-plugin配置..
    wget -O ./Miao-Yunzai/plugins/chatgpt-plugin/config/config.json https://raw.githubusercontent.com/715494637/replit_Qbot/main/chatgpt/config.json
fi
if [ ! -f ./Miao-Yunzai/plugins/guoba-plugin/config/application.yaml ]; then
    echo 生成guoba-plugin配置..
    mkdir ./Miao-Yunzai/plugins/guoba-plugin/config
    wget -O ./Miao-Yunzai/plugins/guoba-plugin/config/application.yaml https://raw.githubusercontent.com/715494637/replit_Qbot/main/gupoba/application.yaml
fi
echo 适配chatgpt-plugin配置..
sed -i 's|"serverHost": "[^"]*"|"serverHost": "https://'${REPL_SLUG}'.'${REPL_OWNER}'.repl.co"|' ./Miao-Yunzai/plugins/chatgpt-plugin/config/config.json
echo 适配guoba-plugin配置..
sed -i "s@host:.*@host: https://${REPL_SLUG}.${REPL_OWNER}.repl.co@" ./Miao-Yunzai/plugins/guoba-plugin/config/application.yaml
