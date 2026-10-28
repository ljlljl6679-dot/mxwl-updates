# 麦向未莱游戏中心 · 官方内容更新站

官方更新地址（需创建并启用 GitHub Pages 后才会生效）：  
https://ljlljl6679-dot.github.io/mxwl-updates/manifest.json

本仓库是公开的**静态游戏更新分发站**，不是后台服务或实时联机服务器。

## 首次上线
1. GitHub 创建一个名为 `mxwl-updates` 的 **Public** 空仓库；不要勾选初始化 README/.gitignore/License。
2. 下载并解压部署包；在 Windows 安装 Git for Windows 后，双击 `一键上传到GitHub.bat`。
3. 在 GitHub 仓库 **Settings > Pages**，Source 选 `Deploy from a branch`，Branch `main`，Folder `/(root)`，Save。
4. 打开 https://ljlljl6679-dot.github.io/mxwl-updates/manifest.json，确认 JSON 能显示，然后在 V3.2 软件「在线更新」中填入该地址。

## 以后发布
管理员使用原先的「麦向未莱游戏中心 V3.2 管理员发布工具」修改题库或游戏文件并生成新版本。运行本目录的 `同步新版本并上传.bat`，选择管理员工具生成的 `线上更新目录`。脚本只导入其中 `files` 和 `manifest.json`，不会导入管理员密钥。发布完成后，在线用户会在下次检查时收到提醒。

## 安全与维护
- **严禁**把 `admin_private_key.txt` 或管理员工具 ZIP 放进这个仓库 / 网页文件目录。
- `manifest.json` 有 Ed25519 签名；客户端还会校验每个下载文件的 SHA-256。
- `files/` 是内容哈希命名文件，不要改名。上传新版时保留旧文件以备排查。只在所有文件上传完成后发布 `manifest.json`；Git 提交会一起发布变更。
- 游戏中心 V3.2 **只更新游戏资源和大厅游戏清单**，不能在线替换 EXE。
- GitHub Pages 是第三方静态托管，不保证永久免费或无限流量；定期保存此仓库的备份。
- V3.1 或更早版本用户须先手动升级到 V3.2。

**此部署包不包含管理员发布私钥。**
