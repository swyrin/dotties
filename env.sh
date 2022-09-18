DOTTIES_DIR=$(find $HOME -type d -name "dotties")
VIS_ALIAS="alias vis='$DOTTIES_DIR/viswal.sh'"
POP_REPORT_ALIAS="alias pop_report='$DOTTIES_DIR/pop_report'"

echo $VIS_ALIAS | tee -a $HOME/.bashrc
echo $VIS_ALIAS | tee -a $HOME/.zshrc
echo $POP_REPORT_ALIAS | tee -a $HOME/.bashrc
echo $POP_REPORT_ALIAS | tee -a $HOME/.zshrc
