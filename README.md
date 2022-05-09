<h1>TIS Automation Challenge </h1>
Esse repositório tem como finalidade , ser o repositório utilizado para realizar o seguinte desafio feito pelo time de TIS Automation.

Crie um pipeline de integração contínua utilizando tecnologias como Azure DevOps, TravisCI, Github Actions ou algum outro de sua preferência. O seu pipeline deve:

Provisionar uma estrutura com IaC utilizando Terraform ou outra ferramenta, podendo utilizar um provedor de nuvem pública ou ser executado localmente.
2 hosts Windows
2 hosts Linux

Utilizar Ansible ou outra ferramenta para configurar:
Nos hosts Linux, provisionar um Apache ou um NGINX com um Hello World.
Nos hosts Windows: Instale o MSI do Apache, e provisione o mesmo Hello World utilizado no Linux. dica: Crie um arquivo ‘index.html’ no repositório, e copie ele para os diretórios necessários.
Desenvolver uma API, na linguagem deseja, que retorne uma mensagem de "Hello World!" tanto em uma requisição GET como POST.
IMPORTANTE: Inclua no README do projeto melhorias que seriam necessárias caso você tivesse mais tempo para entregar e desafios encontrados durante a execução.

<h1> Provisionamento dos Hosts </h1>

Para realizar os provisionamentos dos hosts solicitados , criei um arquivo terraform para provisionar as máquinas na nuvem publica da AWS.

<h2> Explanação da Estrutura Terraform </h2>

main.tf : Arquivo que contém o núcleo do provisionamento IaC , temos a descrição das 4 máquinas virtuais , dos grupos de seguranças e o par de chave utilizado
security-groups: Arquivo que contém os grupos de seguranças utilizando no provisionamento das regras de firewall tanto de entrada quanto de saída
variables.tf : Arquivo que contém as váriaveis utilizadas em toda a estrutura de provisionamento do Terraform

<h1> Configuração Automatizada </h1>

Para realizar o provisionamento da configuração do Apache nas máquinas criadas , utilizei o Ansible , através de um inventário dinâmico.

<h2>Explanação da Estrutura Ansible</h2>

inventory_aws_ec2.yml : Para automatizar a configuração dos hosts criei um arquivo de conexão via plugin de criação inventário com a aws , para facilitar a localização dos hosts que estão provisionados na nuvem
plabook-linux.yml : Arquivo que contém a playbook para a instalação do Apache nos hosts Linux.
playbook-windows.yml : Arquivo que contém a playbook para a instalação do Apache nos hosts Linux.
index.html: Arquivo que será copiado para dentro das pastas de configuração dos sites nos hosts.


<h1>Criação da Pipeline</h1>

Infelizmente não foi possivel realizar a entrega total da pipeline no Azure DevOps como era previsto , a mesma está em construção e andamento.

<h1>Criação da API</h1>

Infelizmente não foi possivel realizar a entrega da API , estou em processo de estudos , para a criação da mesmo e em breve estarei entregando nesse repositório.