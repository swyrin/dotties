DOTTIES_DIR=$(find $HOME -type d -name "dotties")

VIS_ALIAS="alias vis='$DOTTIES_DIR/viswal.sh'"
echo $VIS_ALIAS | tee -a $HOME/.bashrc $HOME/.zshrc
