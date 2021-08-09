require 'nokogiri'
require 'fast_excel'
require 'date'
require 'time'

# require 'ap' para imprimir melhor (awesome_print)

tipo = []		 # TRNTYPE 	(credito/debito)	
valor = []   # TRNAMT  	(valor/transacao)
notas = []   # MEMO     (notas da transacao)
dia = []	   # DTPOSTED	(data/dia)

# Selecionar seu arquivo Nubank
doc = File.open("jul.ofx")
doc_name = File.basename(doc, ".ofx")


doc.each do | x |
	x = Nokogiri::XML(x, nil, Encoding::UTF_8.to_s)

	if x.xpath("//TRNTYPE").children.to_s.empty? 
		else
			tipo << x.xpath("//TRNTYPE").children.to_s
	end
	if x.xpath("//TRNAMT").children.to_s.empty? 
		else
			valor << x.xpath("//TRNAMT").children.to_s
	end
	if x.xpath("//DTPOSTED").children.to_s.empty? 
		else
			#dia << Time.at(x.xpath("//DTPOSTED").children.to_s.delete_suffix('000000[0:GMT]').to_i)
			#dia << DateTime.strptime(x.xpath("//DTPOSTED").children.to_s.delete_suffix('000000[0:GMT]'))
			dia << x.xpath("//DTPOSTED").children.to_s.delete_suffix('000000[0:GMT]').insert(4, '/').insert(7, '/')
	end
	if x.xpath("//MEMO").children.to_s.empty? 
		else
			notas << x.xpath("//MEMO").children.to_s
	end
end

full = tipo+valor+notas+dia

workbook = FastExcel.open("#{doc_name}.xlsx", constant_memory: true)
bold = workbook.bold_format
worksheet = workbook.add_worksheet('nubanko')
worksheet.auto_width = true
worksheet.append_row(["Data", "Tipo", "Valor", "Notas", "Conciliação"], bold)

count = 0
tipo.each do | tipox |
	worksheet.append_row([dia[count], tipox, valor[count], notas[count]])
	count +=1
end

workbook.close



