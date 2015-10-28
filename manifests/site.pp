################################
##### Definicoes de padroes #####
#################################


# Estas definicoes sao as padroes para qualquer classe incluida aqui,
# porem elas podem ser sobreescritas dentro da classe. Fazer isto apenas
# se for necessario. Os padroes definidos aqui devem satisfazer a grande
# maioria dos casos

# Por padrao todos os execs tem o seguinte path
Exec {
path => "/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin",
}

# Por padrao todos os files sao arquivos de fato do root:root no modo 644
# (rw para owner, r para grupo e r para outros)
File {
ensure => file,
owner  => root,
group  => root,
mode   => 644,
}

# Por padrao todos os pacotes devem estar no minimo instalados, porem nao
# necessariamente atualizados
Package {
ensure => present,
}

# Por padrao todos os servicos configurados devem estar sempre rodando
Service {
ensure => running,
}


# Todos as maquinas devem instalar o que esta na classe base
include base


###################################
##### Definicoes das maquinas #####
###################################

# Se nao fizer match em nenhuma outra definicao (sem pool)
# só executa o código comum a todos, mas tem que ter o default mesmo que vazio
node default {}

# definicao do pool de apps que rodam o newww
node /^app-\d+$/ {
	include pkg-nginx
	include newww
}

