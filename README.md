# Conversor de arquivo OFX do Nubank para Excel 

O Nubank, apesar de um banco digital e moderno não disponibiliza um extrato fácil para conciliação bancária, é preciso enviar um e-mail para eles e aguardar um arquivo PDF e um OFX, que nem todo mundo gosta ou possui gerenciador financeiro, então este app converte o OFX deles para um formato excel para posterior conferência.

Será criado uma coluna "conciliação" para adicionar suas notas pessoais.

Altere manualmente o código para selecionar seu arquivo 'ofx'. 

# Nota
Este aplicativo é somente para uso pessoal, por sua conta e risco.

# Gems 
* nokogiri
* fast_excel

# todo-issues-problemas
- ~criar métodos para adicionar aos arrays~
- ~ver se soma de valores está funcionando~
- ~arrumar acentos ao parsear do nokogiri~
- ~arrumar nome do arquivo mesmo do ofx~
- arrumar formato da data sem gambiarra
- criar opção para seperar os extratos por mês
- criar versão online
- criar resumo de transações