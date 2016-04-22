include:
  - rvm

ruby:
  cmd:
    - run
    - user: vagrant
    - name: rvm install 2.3.0
    - unless: test -d $HOME/.rvm/rubies/ruby-2.3.0
    - require:
      - cmd: rvm_bashrc