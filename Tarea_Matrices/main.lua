-----------------------------------------------------------------------------------------
--
-- main.lua
-- 6/10/2019 Luis Fernando Choque Arana
-- Tarea 1 de Infografia
-- Trasformaciones de matrices 3X3
-- Al final del documento se tiene las funciones con sus respectivos parametros
-----------------------------------------------------------------------------------------

function rotacion2D (x,y,angulo)
  result= {
    x*math.cos(angulo)-y*math.sin(angulo),x*math.sin(angulo)+y*math.cos(angulo)
  }
  return result
end

function rotacion3DX(mat,angulo)
  result = {
    (1*mat[1]),
    (math.cos(angulo)*mat[2]+(-math.sin(angulo)*mat[3])),
    (math.sin(angulo)*mat[2]+math.sin(angulo)*mat[3])
  }
  print (result[1] .." ," .. result[2] .. " ,".. result[3]  )
end

function rotacion3DY(mat,angulo)
  result = {
    (math.cos(angulo)*mat[1]+math.sin(angulo)*mat[3]),
    (1*mat[2]),
    ((-math.sin(angulo)*mat[1])+math.cos(angulo)*mat[3])
  }
  print (result[1] .." ," .. result[2] .. " ,".. result[3]  )
end

function rotacion3DZ(mat,angulo)
  result = {
    (math.cos(angulo)*mat[1]+(-math.sin(angulo)*mat[2])),
    (math.sin(angulo)*mat[1]+math.cos(angulo)*mat[2]),
    (1*mat[3])
  }
  print (result[1] .. " ," .. result[2] .. " ,".. result[3]  )
end

function traslacion(mat,distancia)
    mat_con_distancia = {
      {1,0,0,distancia[1]},
      {0,1,0,distancia[2]},
      {0,0,1,distancia[3]},
      {0,0,0,1}
    }
    mat_a_multiplicar = {mat[1],mat[2],mat[3],1}
    result = {
      mat_con_distancia[1][1]*mat_a_multiplicar[1]+mat_con_distancia[1][4]*mat_a_multiplicar[4],
      mat_con_distancia[2][2]*mat_a_multiplicar[2]+mat_con_distancia[2][4]*mat_a_multiplicar[4],
      mat_con_distancia[3][3]*mat_a_multiplicar[3]+mat_con_distancia[3][4]*mat_a_multiplicar[4],
      mat_con_distancia[4][4]*mat_a_multiplicar[4]
    }
    print (result[1])
    print ( result[2])
    print (result[3])
    print ( result[4])

end

function escalamiento (Mat,fac)
    -- creacion matriz de escala
    ancho =table.getn(Mat[1])
    alto = table.getn(Mat)

    mt = {}
    for i=1,ancho do
      mt[i] = {}
      for j=1,alto do
        if i == j then
          mt[i][j] = fac
        elseif i == ancho and j== alto then
          mt[i][j] = 1
        else
          mt[i][j] = 0
        end
        --print(i,j)
        --print (mt[i][j])
      end
    end

    res = {}
    for i=1,ancho do
      res[i] = {}
      for j=1,alto do
        res[i][j]= (Mat[i][1]*mt[1][j] )+ (Mat[i][2]*mt[2][j])+(Mat[i][3]*mt[3][j])
         print(i,j)
         print (res[i][j])
      end
    end

    return res
end

matrix = {{1,2,3},{4,5,6},{7,8,9}}
factor_de_escala= 2
--escalamiento(matrix,factor_de_escala)
--rotacion(2,3)

matriz= {1,2,3}
--rotacion3DX(matriz,20)
--rotacion3DY(matriz,30)
--rotacion3DZ(matriz,40)

matrizTraslacion = {1,2,3}
distancia_traslacion= {2,5,3}
--traslacion(matrizTraslacion,distancia_traslacion)
