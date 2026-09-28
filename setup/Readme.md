# Commands
```
 eksctl create cluster --config-file=eks_cluster.yaml 
```
```
 eksctl delete cluster --region=us-east-1 --name=roboshop-dev
```


## kubens
```
git clone https://github.com/ahmetb/kubectx.git ~/.kubectx
COMPDIR=$(pkg-config --variable=completionsdir bash-completion)
ln -sf ~/.kubectx/completion/kubens.bash $COMPDIR/kubens
ln -sf ~/.kubectx/completion/kubectx.bash $COMPDIR/kubctx
cat << EOF >> ~/.bashrc
#kubectx and kubens
export PATH=~/.kubectx:\$PATH
EOF
````

```
dnf update -y
dnf install -y git bash-completion

# 2. Clone the repository to a system folder
git clone --depth 1 https://github.com/ahmetb/kubectx.git /opt/kubectx

# 3. Create global symlinks so any user can run the commands
ln -s /opt/kubectx/kubectx /usr/local/bin/kubectx
ln -s /opt/kubectx/kubens /usr/local/bin/kubens

# 4. Link completion scripts for global tab-completion
COMPDIR=$(pkg-config --variable=completionsdir bash-completion 2>/dev/null || echo "/etc/bash_completion.d")
ln -s /opt/kubectx/completion/kubectx.bash "$COMPDIR/kubectx"
ln -s /opt/kubectx/completion/kubens.bash "$COMPDIR/kubens"
```