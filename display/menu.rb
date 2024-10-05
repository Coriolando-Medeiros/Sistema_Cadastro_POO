def iniciar_menu(produtos = [])
    
    loop do
        puts "*" * 40
        mensagem("     Bem-vindo ao Sistema de Estoque     ", false, false)
        puts "*" * 40
        mensagem("Escolha uma das opções abaixo:", false, false)
        puts "-" * 40
        mensagem_azul("#{vermelho("1")} - Cadastro de produtos", false, false)
        mensagem_azul("#{vermelho("2")} - Lista de produtos", false, false)
        mensagem_azul("#{vermelho("3")} - Retirada do estoque", false, false)
        mensagem_azul("#{vermelho("0")} - Sair", false, false)
        puts "-" * 40
        print "Opção: "

        opcao = gets.to_i

        case opcao
        when 1
            cadastro_produto(produtos)
        when 2
            listar_produtos(produtos)
        when 3
            retirar_estoque(produtos)
        when 0
            mensagem_vermelho("Saindo...", false, false, 1)
            exit
        else
            mensagem "Opção inválida! Tente novamente"
        end
    end
end
