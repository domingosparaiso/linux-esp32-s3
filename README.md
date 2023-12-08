# linux-esp32-s3
Install Linux on a ESP32-S3 board

Scripts para montagem do ambiente, compilação e instalação do Linux em uma placa com ESP32-S3.

Os scripts foram criados para que sejam usados no Debian 12, fiz a instalação mais básica possível, desmarcando todas as opções no instalador.

Caso não exista um usuário com o nome "esp32", o script vai criar o usuário. Você pode instalar o Debian 12 em uma máquina virtual (eu usei o VirtualBox) e escolher esse nome de usuário durante a instalação.

Após instalar o Debian 12, faça login e execute os comandos a seguir:

obs: O comando "su" vai mudar para o usuário root (superusuário), informe a senha de root para prosseguir.

`$ su -`

`# apt install -y git`

`# git clone https://github.com/domingosparaiso/linux-esp32-s3 esp32s3`

`# cd esp32s3`

`# bash setup.sh`