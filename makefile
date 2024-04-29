all: install mkdir download

install:
	@sudo apt-get --yes install curl libarchive-tools

mkdir:
	@mkdir --parents local/bin/

download:
	@curl --silent --location https://github.com/tsl0922/ttyd/releases/download/1.7.7/ttyd.x86_64 > local/bin/ttyd.x86_64
	@curl --silent --location https://github.com/cloudflare/cloudflared/releases/download/2024.4.1/cloudflared-linux-amd64 > local/bin/cloudflared-linux-amd64
	@curl --silent --location https://github.com/xjasonlyu/tun2socks/releases/download/v2.5.2/tun2socks-linux-amd64-v3.zip | bsdtar --extract --directory='local/bin/' --file='-'

sha256sum:
	@find local/bin/ -type f -exec sha256sum {} \;
