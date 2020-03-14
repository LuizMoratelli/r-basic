# R - Basic

## Exercício 3

### Boxplot `Quantity`
![image](https://github.com/LuizMoratelli/r-basic/blob/master/boxplot-quantity.png)

### Boxplot `Quantity` Normalized
![image](https://github.com/LuizMoratelli/r-basic/blob/master/bloxplot-quantity-normalized.png)

## Exercício 4

### Pairs `A02Q`
![image](https://github.com/LuizMoratelli/r-basic/blob/master/pairs-media-qtd.png)

### Boxplot `media ~ Region`
![image](https://github.com/LuizMoratelli/r-basic/blob/master/bloxpot-media-region.png)

### Summary `reg`
```
Residuals:
    Min      1Q  Median      3Q     Max 
-2.7385 -0.3943 -0.0607  0.2726  7.7492 

Coefficients:
                     Estimate Std. Error t value Pr(>|t|)    
(Intercept)           2.10096    0.05558  37.799  < 2e-16 ***
RegionCanada         -0.08519    0.30189  -0.282   0.7779    
RegionCaribbean       1.58944    0.15236  10.432  < 2e-16 ***
RegionCentral         1.62648    0.09804  16.590  < 2e-16 ***
RegionCentral Asia    1.66651    0.14387  11.583  < 2e-16 ***
RegionEast            1.66620    0.23109   7.210 1.04e-12 ***
RegionEMEA            0.14980    0.07434   2.015   0.0442 *  
RegionNorth           1.56313    0.12429  12.577  < 2e-16 ***
RegionNorth Asia      1.63758    0.11532  14.201  < 2e-16 ***
RegionOceania         1.40908    0.18362   7.674 3.66e-14 ***
RegionSouth           1.52935    0.08342  18.332  < 2e-16 ***
RegionSoutheast Asia  1.55957    0.13328  11.701  < 2e-16 ***
RegionWest            1.69804    0.25908   6.554 8.60e-11 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.8393 on 1099 degrees of freedom
Multiple R-squared:  0.448,	Adjusted R-squared:  0.4419 
F-statistic: 74.31 on 12 and 1099 DF,  p-value: < 2.2e-16
```

### Anova `reg`
```
Analysis of Variance Table

Response: media
            Df Sum Sq Mean Sq F value    Pr(>F)    
Region      12 628.15  52.346  74.314 < 2.2e-16 ***
Residuals 1099 774.13   0.704                      
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
```

### Table `Region`
```
                faixa_media
Region           [1,1.82) [1.82,2.8) [2.8,3.68) [3.68,4.99) [4.99,10]
  Africa               77        123         21           5         2
  Canada                2          6          0           0         0
  Caribbean             0          0         21          13         1
  Central               0          3         54          49         2
  Central Asia          0          1         20          18         1
  East                  0          0          8           6         0
  EMEA                 92        151         28          10         8
  North                 1          3         29          20         4
  North Asia            2          4         25          35         3
  Oceania               0          0         17           6         0
  South                 2         20         73          72        15
  Southeast Asia        0          3         22          23         0
  West                  0          0          2           9         0
```

## Exercício 5

### Plot `total ~ periodo`
![image](https://github.com/LuizMoratelli/r-basic/blob/master/plot-total-periodo.png)

### Plot + Lines `previsao ~ periodo`
![image](https://github.com/LuizMoratelli/r-basic/blob/master/plot-lines-previsao-periodo.png)

## Exercício 6

### GGPlot `A02C`
![image](https://github.com/LuizMoratelli/r-basic/blob/master/ggplot-a02c.png)

### Plot `clusters`
![image](https://github.com/LuizMoratelli/r-basic/blob/master/plot-clusters.png)

### Table `A02C$Region`
```
                clustersCut
                 1 2 3
  Africa         1 0 0
  Canada         1 0 0
  Caribbean      0 1 0
  Central        0 1 0
  Central Asia   0 1 0
  East           0 1 0
  EMEA           1 0 0
  North          0 1 0
  North Asia     0 1 0
  Oceania        0 0 1
  South          0 1 0
  Southeast Asia 0 1 0
  West           0 1 0
```

## Exercício 7

### Table `paisano$Region`
```
                clusterCut
                 1 2 3
  Africa         1 0 0
  Canada         0 1 0
  Caribbean      0 1 0
  Central        0 0 1
  Central Asia   0 1 0
  East           0 1 0
  EMEA           1 0 0
  North          1 0 0
  North Asia     0 1 0
  Oceania        0 1 0
  South          1 0 0
  Southeast Asia 0 1 0
  West           0 1 0
```

### GGPlot `paisano`
![image](https://github.com/LuizMoratelli/r-basic/blob/master/ggplot-paisano.png)

### Plot `clusers`
![image](https://github.com/LuizMoratelli/r-basic/blob/master/plot-clusters-paisano.png)
