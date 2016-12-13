data <- read.table('PrePSSBeha.csv', header=T, sep=",")
> names(data)[2] <- "ChooseA"
> names(data)[3] <- "AvoidB"
> data
   Subject  ChooseA   AvoidB NumOfTrainingTrials Pre_Incongruent_SimonRT Pre_Congruent_SimonRT Pre_CongruencyEffect_SimonRT Pre_Incongruent_SimonACC
1    28020     1.00     0.88                 180                  580.29                484.81                        95.47                     0.93
2    28021     0.50     1.00                 360                  454.58                392.11                        62.47                     0.80
3    28022     0.50     0.75                 120                  429.77                408.32                        21.45                     0.87
4    28023     0.00     1.00                  60                  486.21                475.89                        10.33                     0.93
5    28024     0.50     0.50                 360                  667.79                484.55                       183.24                     0.93
6    28025     0.88     0.63                  60                  460.70                358.57                       102.13                     0.67
7    28026     0.88     0.88                  60                  453.27                404.72                        48.55                     1.00
8    28028     0.38     0.88                 120                  486.08                420.07                        66.01                     0.87
9    28029     0.63     0.75                 360                  486.93                428.91                        58.02                     0.93
10   28030     0.38     0.88                  60                  508.50                422.47                        86.03                     0.93
11   28031     0.88     1.00                 240                  490.57                476.93                        13.64                     0.93
12   28032     0.63     0.88                 240                  591.86                483.27                       108.59                     0.93
13   28033     0.88     0.75                 180                  426.82                363.02                        63.80                     0.73
14   28034 99999.00 99999.00                 320                  534.47                506.70                        27.77                     1.00
15   28035     1.00     0.50                 120                  473.47                425.77                        47.69                     1.00
16   28036     0.50     0.38                 300                  530.23                435.76                        94.48                     0.87
17   28037     1.00     0.75                 120                  492.53                437.23                        55.31                     1.00
18   28038     0.50     0.88                  60                  531.27                487.82                        43.44                     1.00
19   28039     0.88     0.38                  60                  470.36                401.76                        68.60                     0.93
20   28040 99999.00 99999.00                 254                  756.54                608.13                       148.41                     0.87
21   28041     0.63     1.00                 120                  451.43                433.53                        17.90                     0.93
22   28042     0.38     0.50                  60                  449.93                388.82                        61.11                     0.93
23   28043 99999.00 99999.00                 332                  459.54                380.19                        79.35                     0.87
24   28044     0.75     0.88                 180                  379.40                292.34                        87.06                     0.67
25   28045     0.50     0.50                 120                  501.69                371.39                       130.31                     0.87
26   28047 99999.00 99999.00                 205                  524.14                457.45                        66.69                     0.93
27   28048     1.00     1.00                  60                  407.14                351.22                        55.92                     0.93
28   28049     0.75     1.00                  60                  492.93                426.98                        65.95                     0.93
29   28050 99999.00 99999.00                 196                  773.00                654.77                       118.23                     0.93
30   28051     1.00     1.00                 180                  361.08                326.48                        34.61                     0.80
31   28052     0.63     0.63                  60                  338.88                283.80                        55.08                     0.53
32   28053     0.63     1.00                 120                  501.79                463.80                        37.99                     0.93
33   28054     0.88     1.00                 240                  479.27                441.52                        37.74                     1.00
34   28055     0.75     0.75                  60                  523.38                400.93                       122.45                     0.87
35   28056     0.50     0.50                  60                  446.18                386.36                        59.83                     0.73
36   28057     0.75     0.75                 120                  447.50                390.56                        56.94                     0.80
37   28058     1.00     0.50                 240                  808.33                566.64                       241.69                     0.80
38   28059 99999.00 99999.00                 247                  531.20                472.78                        58.42                     1.00
39   28060     0.88     1.00                 120                  466.08                424.07                        42.01                     0.87
40   28061     0.63     0.88                 360                  487.21                421.56                        65.66                     0.93
41   28062     0.38     0.38                 120                  475.07                372.89                       102.19                     0.93
42   28063     1.00     0.88                  60                  413.08                367.98                        45.11                     0.80
43   28064 99999.00 99999.00                 292                  574.87                726.41                      -151.55                     1.00
44   28065     0.75     0.88                  60                  374.86                337.85                        37.00                     0.93
45   28066 99999.00 99999.00                 296                  402.45                351.98                        50.48                     0.73
46   28067     0.75     0.50                 120                  504.79                401.22                       103.56                     0.93
47   28068     1.00     0.13                 120                  781.07                665.36                       115.71                     1.00
48   28069     1.00     0.88                  60                  503.43                420.41                        83.02                     0.93
49   28070     1.00     0.75                 360                  489.36                523.23                       -33.88                     0.93
50   28071     0.13     1.00                  60                  488.31                402.05                        86.26                     0.87
51   28072     0.38     1.00                  60                  494.93                476.48                        18.46                     1.00
52   28073     1.00     0.50                 120                  664.50                642.20                        22.30                     0.93
53   28074     0.88     0.50                 180                  394.30                308.80                        85.50                     0.67
54   28075     0.25     1.00                 120                  454.58                392.11                        62.47                     0.80
55   28076     1.00     0.63                  60                  476.23                405.98                        70.25                     0.87
56   28077     0.63     1.00                 360                  499.92                397.36                       102.57                     0.87
57   28078     0.75     0.63                 180                  427.08                375.59                        51.49                     0.87
58   28079     0.88     0.75                  60                  476.80                420.19                        56.61                     1.00
   Pre_Congruent_SimonACC Pre_CongruencyEffect_SimonACC Pre_OPScore Pre_RSScore Pre_RavensScore Pre_NDCompScore ND_Percentile Pre_Switch_RT Pre_Repeat_RT
1                    0.96                          0.02          25          28               6              35            90       1626.42        979.36
2                    1.00                          0.20          55          51              13              33            80       1229.40        891.45
3                    0.98                          0.11          48          50              12              34            83       1048.07        766.70
4                    0.98                          0.04          46           3              12              35            90       1147.93        723.77
5                    0.98                          0.04          50          10               9              30            62       1258.93        804.47
6                    0.98                          0.31           4          45              11              33            80        940.85        578.73
7                    0.96                         -0.04          36          35              15              37            99       1137.92        741.40
8                    0.96                          0.09          41          31              17              38            99       1213.36        854.19
9                    0.98                          0.04           8           0              13              30            62       1487.87       1196.96
10                   1.00                          0.07          57          40               9              34            83       1293.73        890.93
11                   1.00                          0.07          43          44              12              38            99       1415.08        800.14
12                   1.00                          0.07          65          34               9              30            62       1418.86        812.26
13                   0.98                          0.24          62          20              11              38            99       1039.29        610.31
14                   0.96                         -0.04          50          42              11              37            99       1234.91        626.91
15                   0.98                         -0.02          61          30              13              38            99        881.93        660.16
16                   1.00                          0.13          27          32               9              34            83       1064.92        653.36
17                   0.98                         -0.02           6           7               8              28            51       1106.92        779.09
18                   1.00                          0.00          50          55              15              35            90        936.85        643.51
19                   1.00                          0.07          43          39              14              34            83       1092.13        694.98
20                   1.00                          0.13          42          12              16              25            39       1153.42        584.02
21                   1.00                          0.07          56          39              17              34            83       1231.14        927.76
22                   0.98                          0.04          68          18               8              34            83       1163.50        662.21
23                   0.96                          0.09          14          28              13              30            62        999.53        703.07
24                   0.98                          0.31          23          35              11              29            57       1011.07        497.14
25                   0.98                          0.11          39          32              10              34            83        938.46        598.50
26                   0.98                          0.04          15          14               8              21            25       1770.42        886.31
27                   1.00                          0.07          75          41              11              38            99        851.57        536.36
28                   0.96                          0.02          46          47               8              30            62       1046.47        801.40
29                   0.98                          0.04          20          15              12              18            16       1405.08       1112.61
30                   0.98                          0.18          55          38              13              32            75        894.83        483.76
31                   0.98                          0.44          43          47              14              34            83       1030.69        536.28
32                   0.98                          0.04          35           4              14              28            51       1506.69        882.32
33                   0.98                         -0.02          49          55              12              37            99       1258.93        804.47
34                   0.96                          0.09          43          30               7              28            51       1773.50       1233.90
35                   1.00                          0.27          50          33              12              34            83            NA            NA
36                   1.00                          0.20           6          24              13              35            90        998.73        571.83
37                   0.87                          0.07          30          16              14              36            96       1005.43        847.07
38                   1.00                          0.00          62          43              12              24            35       1082.57        775.47
39                   1.00                          0.13          64          70              16              36            96       1138.29        752.09
40                   1.00                          0.07          29          23              10              29            57        882.79        650.24
41                   0.98                          0.04          63          57               9              30            62        942.07        742.98
42                   0.96                          0.16          68          39              15              28            51        839.47        630.11
43                   0.91                         -0.09          19          14              12              37            99       1277.62        759.09
44                   0.91                         -0.02          46          61              11              29            57        962.00        640.80
45                   0.98                          0.24          47          55              10              30            62       1199.69        737.67
46                   1.00                          0.07          39          37              12              38            99        950.67        718.95
47                   0.93                         -0.07          62          46              13              35            90       1214.92        859.22
48                   0.98                          0.04          32          26              17              36            96        995.62        658.69
49                   0.96                          0.02          69          75              14              36            96       1192.83        889.83
50                   0.98                          0.11          60          31              16              35            90        908.08        482.09
51                   0.98                         -0.02          42          51              12              38            99       1493.00        907.45
52                   1.00                          0.07          48          30              12              35            90       1296.00        997.98
53                   0.98                          0.31          42          32              10              38            99       1037.00        554.52
54                   1.00                          0.20          55          46               7              33            80       1191.80        725.19
55                   0.93                          0.07          23          50               7              33            80        940.17        804.43
56                   1.00                          0.13          24           3               7              30            62       1163.20        899.75
57                   0.98                          0.11          27          26              12              29            57       1070.69        580.83
58                   0.96                         -0.04          37          45              15              38            99       1001.55        649.13
   Pre_SwitchEffect_RT Pre_Switch_ACC Pre_Repeat_ACC Pre_SwitchEffect_ACC Pre_Lag2_T2T1 Pre_Lag3_T2T1 Pre_ABEffect1823_T2T1 Pre_Total_3BackACC
1               647.06           1.00           0.80                 0.20          0.84          0.95                  0.08               0.59
2               337.95           0.98           1.00                -0.02          0.71          0.91                  0.16               0.90
3               281.37           0.98           0.93                 0.04          0.75          0.82                  0.10               0.83
4               424.16           0.87           1.00                -0.13          0.77          0.78                  0.14               0.75
5               454.47           0.96           1.00                -0.04          0.81          0.70                  0.18               0.78
6               362.12           0.89           0.87                 0.02          0.92          0.72                  0.15               0.73
7               396.52           0.93           0.87                 0.07          1.00          0.96                 -0.02               0.90
8               359.17           0.93           0.73                 0.20          0.75          0.87                  0.14               0.84
9               290.91           1.00           1.00                 0.00          0.00          0.15                  0.47               0.86
10              402.80           0.96           1.00                -0.04          0.62          0.50                  0.34               0.95
11              614.94           0.98           0.87                 0.11          0.06          0.18                  0.62               0.91
12              606.60           0.96           0.93                 0.02          1.00          1.00                 -0.05               0.94
13              428.98           0.93           0.93                 0.00          0.74          0.67                  0.23               0.88
14              608.00           0.98           0.73                 0.24          0.42          0.52                  0.28               0.91
15              221.77           0.98           1.00                -0.02          0.50          0.50                  0.42               0.86
16              411.56           0.98           0.87                 0.11          0.80          0.95                  0.12               0.73
17              327.83           1.00           0.87                 0.13          0.18          0.40                  0.45               0.78
18              293.34           1.00           0.87                 0.13          0.31          0.44                  0.35               0.94
19              397.16           0.98           1.00                -0.02          0.68          0.68                  0.22               0.80
20              569.39           0.96           0.80                 0.16          0.45          0.57                  0.42               0.93
21              303.39           1.00           0.93                 0.07          0.83          0.91                  0.13               0.89
22              501.29           0.93           0.80                 0.13          0.96          0.90                  0.02               0.75
23              296.47           1.00           1.00                 0.00          0.83          0.87                  0.03               0.99
24              513.94           0.98           0.93                 0.04          0.53          0.47                  0.38               0.89
25              339.96           0.98           0.87                 0.11          0.86          1.00                  0.04               0.56
26              884.11           0.93           0.80                 0.13          0.65          0.47                  0.26               0.66
27              315.22           1.00           0.93                 0.07          0.85          0.92                  0.09               0.95
28              245.06           0.93           1.00                -0.07          0.60          0.75                  0.15               0.63
29              292.47           0.91           0.87                 0.04          0.57          0.52                  0.35               0.66
30              411.08           1.00           0.80                 0.20          0.55          0.58                  0.38               0.98
31              494.41           0.96           0.87                 0.09          0.64          0.78                  0.14               0.94
32              624.37           0.98           0.87                 0.11          0.24          0.53                  0.31               0.81
33              454.47           0.96           1.00                -0.04          0.74          0.57                  0.29               0.80
34              539.60           0.67           0.67                 0.00          0.71          0.71                  0.25               0.88
35                  NA             NA             NA                   NA          0.94          0.91                 -0.02               0.81
36              426.90           0.93           1.00                -0.07          0.68          0.57                  0.28               0.85
37              158.36           0.93           0.93                 0.00          0.68          0.56                  0.06               0.73
38              307.11           0.96           0.93                 0.02          0.18          0.07                  0.62               0.79
39              386.20           1.00           0.93                 0.07          0.74          0.57                  0.09               0.76
40              232.55           0.93           0.93                 0.00          0.33          0.14                  0.63               0.84
41              199.09           0.98           1.00                -0.02          0.93          0.78                  0.11               0.63
42              209.35           0.98           1.00                -0.02          0.95          0.58                  0.19               0.86
43              518.52           0.96           0.87                 0.09          0.31          0.22                  0.40               0.73
44              321.20           0.98           0.93                 0.04          1.00          1.00                  0.00               0.79
45              462.03           0.93           0.87                 0.07          0.52          0.50                  0.32               0.83
46              231.71           0.93           1.00                -0.07          0.71          0.82                  0.19               0.80
47              355.70           1.00           0.87                 0.13          0.45          0.53                  0.24               0.91
48              336.93           1.00           0.87                 0.13          0.52          0.86                  0.26               0.20
49              303.00           0.93           0.80                 0.13          0.76          0.70                  0.00               0.89
50              425.99           0.98           0.87                 0.11          0.67          0.57                  0.29               0.89
51              585.55           0.93           0.93                 0.00          0.86          0.71                  0.12               0.95
52              298.02           0.98           0.93                 0.04          0.91          0.83                  0.09               0.83
53              482.48           0.93           0.93                 0.00          0.90          0.85                  0.02               0.79
54              466.61           0.93           1.00                -0.07          0.94          0.95                 -0.09               0.81
55              135.74           0.93           0.80                 0.13          0.89          0.77                  0.04               0.69
56              263.45           0.98           0.67                 0.31          0.69          0.55                  0.30               0.66
57              489.86           0.91           0.87                 0.04          0.96          0.75                  0.07               0.88
58              352.41           1.00           0.73                 0.27          0.77          0.77                  0.05               0.89
   Pre_Distractor_3BackACC Pre_Total_3BackRT Pre_Distractor_3BackRT Simon_ACC
1                     0.70           1137.09                1148.43      0.96
2                     0.75            758.85                 989.53      1.00
3                     0.75           1244.15                1278.07      0.98
4                     0.70            840.55                1024.64      0.98
5                     0.80           1072.24                1235.63      0.98
6                     0.55           1151.34                1025.36      0.98
7                     0.95            666.32                 817.05      0.96
8                     0.85           1126.04                1121.76      0.96
9                     0.70            704.25                 889.07      0.98
10                    1.00           1021.64                1269.95      1.00
11                    0.90            812.85                 879.39      1.00
12                    1.00           1100.00                 980.15      1.00
13                    0.75           1198.60                1447.87      0.98
14                    0.90           1447.90                1825.61      0.96
15                    0.80            644.16                 881.50      0.98
16                    0.60            930.66                 987.92      1.00
17                    0.60           1116.45                1271.00      0.98
18                    0.90           1840.23                2048.11      1.00
19                    0.60           1199.69                1530.58      1.00
20                    0.85           1097.77                1157.47      1.00
21                    0.90           1549.38                1721.89      1.00
22                    0.45           1134.78                1440.44      0.98
23                    1.00            716.03                 789.10      0.96
24                    0.80            647.66                 828.44      0.98
25                    0.60            903.96                1031.50      0.98
26                    0.10            763.04                 877.00      0.98
27                    1.00           1312.89                1666.40      1.00
28                    0.45           1118.08                1127.33      0.96
29                    0.45           1642.87                1916.89      0.98
30                    0.90            540.60                 582.94      0.98
31                    0.95            928.52                1198.11      0.98
32                    0.80           1398.48                1621.56      0.98
33                    0.55            767.53                 953.82      0.98
34                    0.85            815.29                 938.53      0.96
35                    0.70            914.05                1082.00      1.00
36                    0.75           1316.75                1329.40      1.00
37                    0.70            854.17                1045.71      0.87
38                    0.65            705.75                 743.77      1.00
39                    0.80            864.51                 854.56      1.00
40                    0.90            969.36                1035.00      1.00
41                    0.40            764.92                1158.13      0.98
42                    0.65            710.45                 843.77      0.96
43                    0.75           1022.14                 979.67      0.91
44                    0.55            989.51                1151.55      0.91
45                    0.70           1061.80                1284.07      0.98
46                    0.70           1340.72                1635.79      1.00
47                    0.80            804.58                 985.88      0.93
48                    0.15            991.44                1168.00      0.98
49                    0.80            743.76                 766.06      0.96
50                    0.75            807.56                 945.33      0.98
51                    0.95            859.57                 932.68      0.98
52                    0.65           1140.08                1526.69      1.00
53                    0.65            592.83                 698.54      0.98
54                    0.85           1010.35                1100.24      1.00
55                    0.20           1025.04                1437.00      0.93
56                    0.40            842.40                 864.25      1.00
57                    0.95            660.96                 832.00      0.98
58                    0.80            621.42                 709.81      0.96
> raw <- data
> data <- subset(data, data$ChooseA <= 1)
> dim(data)
[1] 50 29
> plot(data$ChooseA)
> hist(data$ChooseA)
> plot(data$AvoidB)
> mean(data$AvoidB)
[1] 0.7594
> mean(data$ChooseA)
[1] 0.7072
> t.test(data$ChooseA, data$AvoidB, paired=T)

	Paired t-test

data:  data$ChooseA and data$AvoidB
t = -1.004, df = 49, p-value = 0.3203
alternative hypothesis: true difference in means is not equal to 0
95 percent confidence interval:
 -0.15667944  0.05227944
sample estimates:
mean of the differences 
                -0.0522 

> cor.test(data$ChooseA, data$AvoidB)

	Pearson's product-moment correlation

data:  data$ChooseA and data$AvoidB
t = -1.1439, df = 48, p-value = 0.2584
alternative hypothesis: true correlation is not equal to 0
95 percent confidence interval:
 -0.4221060  0.1209336
sample estimates:
       cor 
-0.1628975 

> plot(data$ChooseA, data$AvoidB)
> hist(data$Pre_Congruent_SimonRT)
> mean(data$Pre_Congruent_SimonRT)
[1] 421.4336
> mean(data$Pre_Incongruent_SimonRT)
[1] 489.6352
> mean(data$Pre_Incongruent_SimonACC)
[1] 0.882
> mean(data$Pre_Congruent_SimonRT)
[1] 421.4336
> sd(data$Pre_Congruent_SimonRT)
[1] 73.14343
> mean(data$Pre_Incongruent_SimonRT})
Error: unexpected '}' in "mean(data$Pre_Incongruent_SimonRT}"
> mean(data$Pre_Incongruent_SimonRT)
[1] 489.6352
> sd(data$Pre_Incongruent_SimonRT)
[1] 88.54993
> mean(data$Simon_ACC)
[1] 0.978
> sd(data$Simon_ACC)
[1] 0.02547508
> min(data$Pre_Congruent_SimonRT)
[1] 283.8
> max(data$Pre_Congruent_SimonRT)
[1] 665.36
> min(data$Pre_Incongruent_SimonRT)
[1] 338.88
> max(data$Pre_Incongruent_SimonRT)
[1] 808.33
> max(data$Simon_ACC)
[1] 1
> min(data$Simon_ACC)
[1] 0.87
> mean(data$Pre_Incongruent_SimonACC)
[1] 0.882
> mean(data$Pre_Congruent_SimonACC)
[1] 0.978
> t.test(data$ChooseA, data$AvoidB, paired=T)

	Paired t-test

data:  data$ChooseA and data$AvoidB
t = -1.004, df = 49, p-value = 0.3203
alternative hypothesis: true difference in means is not equal to 0
95 percent confidence interval:
 -0.15667944  0.05227944
sample estimates:
mean of the differences 
                -0.0522 

> cor.test(data$ChooseA, data$AvoidB)

	Pearson's product-moment correlation

data:  data$ChooseA and data$AvoidB
t = -1.1439, df = 48, p-value = 0.2584
alternative hypothesis: true correlation is not equal to 0
95 percent confidence interval:
 -0.4221060  0.1209336
sample estimates:
       cor 
-0.1628975 

> t.test(data$Pre_Congruent_SimonRT, data$Pre_Incongruent_SimonRT, paired=T)

	Paired t-test

data:  data$Pre_Congruent_SimonRT and data$Pre_Incongruent_SimonRT
t = -10.9128, df = 49, p-value = 1.024e-14
alternative hypothesis: true difference in means is not equal to 0
95 percent confidence interval:
 -80.76084 -55.64236
sample estimates:
mean of the differences 
               -68.2016 

> t.test(data$Pre_Congruent_SimonRT, data$Pre_Incongruent_SimonRT, paired=T)

	Paired t-test

data:  data$Pre_Congruent_SimonRT and data$Pre_Incongruent_SimonRT
t = -10.9128, df = 49, p-value = 1.024e-14
alternative hypothesis: true difference in means is not equal to 0
95 percent confidence interval:
 -80.76084 -55.64236
sample estimates:
mean of the differences 
               -68.2016 

> cor.test(data$ChooseA, data$Pre_Congruent_SimonRT)

	Pearson's product-moment correlation

data:  data$ChooseA and data$Pre_Congruent_SimonRT
t = 0.8417, df = 48, p-value = 0.4041
alternative hypothesis: true correlation is not equal to 0
95 percent confidence interval:
 -0.1632224  0.3859946
sample estimates:
      cor 
0.1206047 

> cor.test(data$AvoidB, data$Pre_CongruencyEffect_SimonRT)

	Pearson's product-moment correlation

data:  data$AvoidB and data$Pre_CongruencyEffect_SimonRT
t = -3.2698, df = 48, p-value = 0.001995
alternative hypothesis: true correlation is not equal to 0
95 percent confidence interval:
 -0.6302765 -0.1684729
sample estimates:
       cor 
-0.4268059 

> cor.test(data$AvoidB, data$Pre_CongruencyEffect_SimonRT, type="Spearman")

	Pearson's product-moment correlation

data:  data$AvoidB and data$Pre_CongruencyEffect_SimonRT
t = -3.2698, df = 48, p-value = 0.001995
alternative hypothesis: true correlation is not equal to 0
95 percent confidence interval:
 -0.6302765 -0.1684729
sample estimates:
       cor 
-0.4268059 

> cor.test(data$AvoidB, data$Pre_CongruencyEffect_SimonRT)

	Pearson's product-moment correlation

data:  data$AvoidB and data$Pre_CongruencyEffect_SimonRT
t = -3.2698, df = 48, p-value = 0.001995
alternative hypothesis: true correlation is not equal to 0
95 percent confidence interval:
 -0.6302765 -0.1684729
sample estimates:
       cor 
-0.4268059 

> plot(data$AvoidB, data$Pre_CongruencyEffect_SimonRT)
> plot(data$ChooseA, data$Pre_CongruencyEffect_SimonRT)
> plot(data$ChooseA, data$Pre_CongruencyEffect_SimonRT)
> cor.test(data$ChooseA, data$Pre_CongruencyEffect_SimonRT)

	Pearson's product-moment correlation

data:  data$ChooseA and data$Pre_CongruencyEffect_SimonRT
t = 0.0423, df = 48, p-value = 0.9664
alternative hypothesis: true correlation is not equal to 0
95 percent confidence interval:
 -0.2727022  0.2839741
sample estimates:
       cor 
0.00610923 

2015-08-19 17:00:01.733 R[6531:389095] Communications error: <OS_xpc_error: <error: 0x7fff7a8b7b60> { count = 1, contents =
	"XPCErrorDescription" => <string: 0x7fff7a8b7fa8> { length = 22, contents = "Connection interrupted" }
}>
> ?paired.r
No documentation for 'paired.r' in specified packages and libraries:
you could try '??paired.r'
''
> library(ppcor)
> paired.r
Error: object 'paired.r' not found
> library(psych)
Warning message:
package 'psych' was built under R version 3.1.3 
> paired.r
function (xy, xz, yz = NULL, n, n2 = NULL, twotailed = TRUE) 
{
    cl <- match.call()
    if (!is.null(yz)) {
        diff <- xy - xz
        determin = 1 - xy * xy - xz * xz - yz * yz + 2 * xy * 
            xz * yz
        av = (xy + xz)/2
        cube = (1 - yz) * (1 - yz) * (1 - yz)
        t2 = diff * sqrt((n - 1) * (1 + yz)/(((2 * (n - 1)/(n - 
            3)) * determin + av * av * cube)))
        p <- pt(abs(t2), n - 2, lower.tail = FALSE)
        if (twotailed) 
            p <- 2 * p
        value <- list(test = "test of difference between two correlated  correlations", 
            t = t2, p = p, Call = cl)
    }
    else {
        xy.z <- 0.5 * log((1 + xy)/(1 - xy))
        xz.z <- 0.5 * log((1 + xz)/(1 - xz))
        if (is.null(n2)) 
            n2 <- n
        se.diff.r <- sqrt(1/(n - 3) + 1/(n2 - 3))
        diff <- xy.z - xz.z
        z <- abs(diff/se.diff.r)
        p <- (1 - pnorm(z))
        if (twotailed) 
            p <- 2 * p
        value <- list(test = "test of difference between two independent correlations", 
            z = z, p = p, Call = cl)
    }
    class(value) <- c("psych", "paired.r")
    return(value)
}
<environment: namespace:psych>
> paired.r(cor(data$AvoidB, data$Pre_Congruent_SimonRT), cor(data$ChooseA, data$Pre_CongruencyEffect_SimonRT), n=50)
Call: paired.r(xy = cor(data$AvoidB, data$Pre_Congruent_SimonRT), xz = cor(data$ChooseA, 
    data$Pre_CongruencyEffect_SimonRT), n = 50)
[1] "test of difference between two independent correlations"
z = 1.02  With probability =  0.31
> paired.r(cor(data$AvoidB, data$Pre_Congruent_SimonRT), cor(data$ChooseA, data$Pre_CongruencyEffect_SimonRT), cor(data$AvoidB, data$Choose), n=50)
Call: paired.r(xy = cor(data$AvoidB, data$Pre_Congruent_SimonRT), xz = cor(data$ChooseA, 
    data$Pre_CongruencyEffect_SimonRT), yz = cor(data$AvoidB, 
    data$Choose), n = 50)
[1] "test of difference between two correlated  correlations"
t = -0.95  With probability =  0.35
> ?paired.r
starting httpd help server ... done
> paired.r(0.427, 0.006, NULL, n=50)
Call: paired.r(xy = 0.427, xz = 0.006, yz = NULL, n = 50)
[1] "test of difference between two independent correlations"
z = 2.18  With probability =  0.03
> paired.r(cor(data$AvoidB, data$Pre_CongruencyEffect_SimonRT), cor(data$ChooseA, data$Pre_CongruencyEffect_SimonRT), cor(data$AvoidB, data$Choose), n=50)
Call: paired.r(xy = cor(data$AvoidB, data$Pre_CongruencyEffect_SimonRT), 
    xz = cor(data$ChooseA, data$Pre_CongruencyEffect_SimonRT), 
    yz = cor(data$AvoidB, data$Choose), n = 50)
[1] "test of difference between two correlated  correlations"
t = -2.11  With probability =  0.04
> paired.r(cor(data$AvoidB, data$Pre_CongruencyEffect_SimonRT), cor(data$ChooseA, data$Pre_CongruencyEffect_SimonRT), NULL, n=50)
