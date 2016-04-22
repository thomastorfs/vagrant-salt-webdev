curl:
  pkg:
    - installed

rvm:
  cmd.run:
    - name: curl -sSL https://get.rvm.io | bash
    - user: vagrant
    - unless: /home/vagrant/.rvm/bin/rvm --version
    - require:
      - pkg: curl

rvm_bashrc:
  cmd:
    - run
    - name: echo "[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm" >> $HOME/.bashrc
    - user: vagrant
    - unless: grep ".rvm/scripts/rvm" ~/.bashrc
    - require:
      - cmd: rvm