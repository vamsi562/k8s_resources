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