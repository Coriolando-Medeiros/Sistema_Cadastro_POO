class ProdutosServico # unit of work
    @arquivo = "db/produtos.json"
    def self.todos
        dados = JsonRepositorio.ler(@arquivo)
        produtos = []
        dados.each do |dado|
            produtos << Produto.new(dado)
        end
        produtos
    end

    def self.adicionar(produto)
        produto_hash = self.transformar_para_hash(produto)
        JsonRepositorio.adicionar(@arquivo, produto_hash)
    end

    def self.atualizar(produto)
        if produto.nil?
            puts "Produto não pode ser nil"
            return
        end

        dados = JsonRepositorio.ler(@arquivo)
        produto_hash = dados.find{|dado| dado["id"] == produto.id}

        if produto_hash.nil?
            puts "Produto com ID #{produto.id} não encontrado!"
            return
        end

        
        produto_hash["nome"] = produto.nome
        produto_hash["descricao"] = produto.descricao
        produto_hash["preco"] = produto.preco
        produto_hash["quantidade"] = produto.quantidade

        JsonRepositorio.gravar(@arquivo, dados)
    end

    private

    def self.transformar_para_hash(produto)
        produto.instance_variables.each_with_object({}) do |var, hash|
          hash[var.to_s.delete("@")] = produto.instance_variable_get(var)
        end
      end
end

