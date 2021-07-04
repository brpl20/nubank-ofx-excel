require 'nokogiri'
require 'fast_excel'
require 'date'
require 'time'

tipo = []		 # TRNTYPE 	(credito/debito)	
valor = []   # TRNAMT  	(valor/transacao)
notas = []   # MEMO     (notas da transacao)
dia = []	   # DTPOSTED	(data/dia)

# Selecionar seu arquivo Nubank
doc = File.open("NU_402496560_01JAN2021_28MAI2021.ofx")

doc.each do | x |
	x = Nokogiri::XML(x)
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
			dia << x.xpath("//DTPOSTED").children.to_s
	end
	if x.xpath("//MEMO").children.to_s.empty? 
		else
			notas << x.xpath("//MEMO").children.to_s
	end
end

workbook = FastExcel.open("nubank.xlsx", constant_memory: true)
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
