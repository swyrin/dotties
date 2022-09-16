DOTTIES_DIR=$(find $HOME -type d -name "dotties")

echo "alias vis='$DOTTIES_DIR/viswal.sh'" | tee -a $HOME/.bashrc
echo "alias pop_report='$DOTTIES_DIR/pop_report'" | tee -a $HOME/.bashrc
