# Cysic 代理和证明器安装路径
CYSIC_AGENT_PATH="$HOME/cysic-prover-agent"
CYSIC_PROVER_PATH="$HOME/cysic-aleo-prover"

# 安装必要依赖
apt update && apt upgrade -y
apt install curl wget -y

# 检查并安装 Node.js 和 npm
if command -v node > /dev/null 2>&1; then
    echo "Node.js 已安装，版本: $(node -v)"
else
    echo "Node.js 未安装，正在安装..."
    curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
    sudo apt-get install -y nodejs
fi
if command -v npm > /dev/null 2>&1; then
    echo "npm 已安装，版本: $(npm -v)"
else
    echo "npm 未安装，正在安装..."
    sudo apt-get install -y npm
fi

# 检查并安装 PM2
if command -v pm2 > /dev/null 2>&1; then
    echo "PM2 已安装，版本: $(pm2 -v)"
else
    echo "PM2 未安装，正在安装..."
    npm install pm2@latest -g
fi

# 安装代理服务器
# 创建代理目录
rm -rf $CYSIC_AGENT_PATH
mkdir -p $CYSIC_AGENT_PATH
cd $CYSIC_AGENT_PATH

# 下载代理服务器
wget https://github.com/cysic-labs/aleo-miner/releases/download/v0.1.15/cysic-prover-agent-v0.1.15.tgz
tar -xf cysic-prover-agent-v0.1.15.tgz
cd cysic-prover-agent-v0.1.15

# 启动代理服务器
bash start.sh
echo "代理服务器已启动。"
