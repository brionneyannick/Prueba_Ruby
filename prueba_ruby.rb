def read_alum(file_name)
  file = File.open(file_name, 'r')
  alum = file.readlines.map(&:chomp).map { |lines| lines.split(', ') }
  file.close
  alum
end

alumnos = read_alum('salon.csv')

hash = {}
alumnos.each {|i| hash[i[0].to_sym] = i[1..-1].map {|nro| nro.to_i}}

opcion = 0
until opcion == 4 do
  puts '***Presiona el número que corresponde a la opción deseada***'
  puts '1)Ver Promedios'
  puts '2)Inasistencias'
  puts '3)Aprobados'
  puts '4)Salir'

  opcion = gets.chomp.to_i

  case opcion
    when 1
      sumas = hash.values.map {|array| array.inject {|acum, nota| acum + nota}}
      promedios = sumas.map {|x| x / 5.0}
      promedio_alumnos = hash.keys.zip(promedios).to_h
      promedio_alumnos.each {|x, y| puts "El promedio de #{x} es de #{y} puntos"}

    when 2
      ausencias = hash.values.map {|array| array.count(0)}
      ausencias_por_alumno = hash.keys.zip(ausencias).to_h
      ausencias_por_alumno.each{|alumno, ausen| puts "#{alumno} tiene #{ausen} ausencias"}
      print ausencias_por_alumno


    when 3
      sumas = hash.values.map {|array| promedios = array.inject {|acum, nota| acum + nota}}
      promedios = sumas.map {|x| x / 5.0}
      promedio_alumnos = hash.keys.zip(promedios).to_h
      promedio_alumnos.each do |nombre, nota|
        puts "#{nombre} aprobado" if nota > 5
      end

    when 4
      puts "Hasta Pronto!!!"

    else
      puts 'Opción no Válida'

  end



end
