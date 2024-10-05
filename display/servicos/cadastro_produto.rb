def cadastro_produto(produto)
    mensagem("Iniciando cadastro de produtos...", true, true, 1.5)
    mensagem_azul("Digite o nome do produto", false, false)
    nome = gets.chomp
    limpar_tela

    mensagem_azul("Digite a descrição do produto (#{verde(nome)}): ", false, false)
    #mensagem_verde("Estoque atual (#{amarelo(produtos[:quantidade])}): ", false, false)
    descricao = gets.chomp
    limpar_tela

    mensagem_azul("Preço do (#{verde(nome)}): ", false, false)
    preco = gets.chomp.to_f
    limpar_tela

    mensagem_azul("Quantidade em estoque (#{verde(nome)})", false, false)
    quantidade = gets.chomp.to_i
    limpar_tela

    
    p = Produto.new ({
        "id" => Time.now.to_i,
        "nome" => nome,
        "descricao" => descricao,
        "preco" => preco,
        "quantidade" => quantidade
    })

    ProdutosServico.adicionar(p)

    mensagem("#{amarelo(nome)} cadastrado com sucesso!", true, true, 3)
end