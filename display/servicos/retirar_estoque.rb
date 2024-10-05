require 'terminal-table'

def retirar_estoque(produtos)
    limpar_tela

    mensagem_amarelo("=======================Escolha um dos produtos baixo=====================", false, false, 1.5)
    table = Terminal::Table.new do |t|
        t.headings = ['ID', 'Nome', 'Quantidade']
        ProdutosServico.todos.each do |produto|
            t.add_row [produto.id, produto.nome, produto.quantidade]
        end
    end
    puts table

    mensagem_azul("Digite o 'ID' do produto", false, false)
    id = gets.chomp.to_i
    produto = ProdutosServico.todos.find{|p| p.id == id}
    unless produto
        limpar_tela
        mensagem_vermelho("Produto do 'ID #{id} não encontrado", false, false)
        mensagem_amarelo("Deseja digitar o número novamente? (s/n)", false, false)
        opcao = gets.chomp.downcase
        limpar_tela

        if opcao == 's' || opcao == 'sim'
            retirar_estoque
        end

        return
    end

    limpar_tela
    mensagem_azul("Digite a quantidade que deseja retirar do produto: #{amarelo(produto.nome)}", false, false)
    mensagem_verde("Estoque atual: #{amarelo(produto.quantidade)}", false, false)
    quantidade_retirada = gets.chomp.to_i
    if quantidade_retirada > 0 && quantidade_retirada <= produto.quantidade
        produto.quantidade -= quantidade_retirada

        ProdutosServico.atualizar(produto)
        mensagem_verde("Retirada realizada com sucesso!", true, true, 3)
        listar_produtos(produtos)
    elsif quantidade_retirada > produto.quantidade
        mensagem_vermelho("Você não pode retirar mais do que o estoque disponível!", true, true, 1)
        retirar_estoque(produtos)
    else
        mensagem_vermelho("Você não pode retirar (#{quantidade_retirada}) do estoque", true, true, 1)
        retirar_estoque(produtos)
    end
end