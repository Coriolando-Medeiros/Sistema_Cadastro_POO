require 'terminal-table'
def listar_produtos(produtos)
    limpar_tela
    mensagem_amarelo("==========================Lista de produtos=========================", false, false, 1.5)

    table = Terminal::Table.new do |t|
        t.headings = ['ID', 'Nome', 'Descrição', 'Preço', 'Quantidade']
        ProdutosServico.todos.each do |produto|
            t.add_row [produto.id, produto.nome, produto.descricao, produto.preco, produto.quantidade]
        end
    end

    puts table
    mensagem_amarelo("Digite Enter para continuar...", false, false)
    gets
    limpar_tela
end