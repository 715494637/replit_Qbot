echo 插件配置文件生成/修改
if [ ! -f ./Miao-Yunzai/plugins/chatgpt-plugin/config/config.json ]; then
    wget -O ./Miao-Yunzai/plugins/chatgpt-plugin/config/config.json https://raw.githubusercontent.com/715494637/replit_Qbot/main/chatgpt/config.json
fi
if [ ! -f ./Miao-Yunzai/plugins/guoba-plugin/config/application.yaml ]; then
    wget -O ./Miao-Yunzai/plugins/guoba-plugin/config/application.yaml https://raw.githubusercontent.com/715494637/replit_Qbot/main/gupoba/application.yaml
fi

sed -i 's|"serverHost": "[^"]*"|"serverHost": "https://'${REPL_SLUG}'.'${REPL_OWNER}'.repl.co"|' config.json
sed -i "s@host:.*@host: https://${REPL_SLUG}.${REPL_OWNER}.repl.co@" config.yaml
