# frozen_string_literal: true

class HomePage < SitePrism::Page
  set_url '/'
  # Declare all the elements of this page
  element :txt_busca_produto, '#inpHeaderSearch'
  element :btn_buscar_produto, '#btnHeaderSearch'

  def buscar_produto(produto)
    txt_busca_produto.set produto
    btn_buscar_produto.click
  end  

end
