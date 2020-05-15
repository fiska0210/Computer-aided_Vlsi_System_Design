/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : N-2017.09-SP2
// Date      : Tue Nov 13 06:19:57 2018
/////////////////////////////////////////////////////////////


module CLE ( clk, reset, rom_q, rom_a, sram_q, sram_a, sram_d, sram_wen, 
        finish );
  input [7:0] rom_q;
  output [6:0] rom_a;
  input [7:0] sram_q;
  output [9:0] sram_a;
  output [7:0] sram_d;
  input clk, reset;
  output sram_wen, finish;
  wire   n3401, n3402, n3403, n3404, n3405, n3406, n3407, n3408, n3409, n3410,
         n3412, n3413, n3414, n3415, n3416, read_complete, read, read_from_rom,
         en_read2, N472, round1, set, N919, N920, N921, N922, N1499, N1516,
         N1603, n1120, n1121, n1122, n1123, n1124, n1125, n1126, n1127, n1128,
         n1129, n1130, n1131, n1132, n1133, n1134, n1135, n1136, n1137, n1138,
         n1139, n1140, n1141, n1142, n1143, n1144, n1145, n1146, n1147, n1148,
         n1149, n1150, n1151, n1152, n1153, n1154, n1155, n1156, n1157, n1158,
         n1159, n1160, n1161, n1162, n1163, n1164, n1165, n1166, n1167, n1168,
         n1169, n1170, n1171, n1172, n1173, n1174, n1175, n1176, n1177, n1178,
         n1179, n1180, n1181, n1182, n1183, n1184, n1185, n1186, n1187, n1188,
         n1189, n1190, n1191, n1192, n1193, n1194, n1195, n1196, n1197, n1198,
         n1199, n1200, n1201, n1202, n1203, n1204, n1205, n1206, n1207, n1208,
         n1209, n1210, n1211, n1212, n1213, n1214, n1215, n1216, n1217, n1218,
         n1219, n1220, n1221, n1222, n1223, n1224, n1225, n1226, n1227, n1228,
         n1229, n1230, n1231, n1232, n1233, n1234, n1235, n1236, n1237, n1238,
         n1239, n1240, n1241, n1242, n1243, n1244, n1245, n1246, n1247, n1248,
         n1249, n1250, n1251, n1252, n1253, n1254, n1255, n1256, n1257, n1258,
         n1259, n1260, n1261, n1262, n1263, n1264, n1266, n1267, n1268, n1269,
         n1270, n1271, n1272, n1273, n1274, n1275, n1276, n1277, n1278, n1279,
         n1280, n1281, n1283, n1284, n1285, n1286, n1287, n1288, n1289, n1290,
         n1291, n1292, n1293, n1294, n1295, n1296, n1297, n1298, n1299, n1300,
         n1301, n1302, n1303, n1304, n1305, n1306, n1307, n1308, n1309, n1310,
         n1311, n1312, n1313, n1314, n1315, n1316, n1317, n1318, n1319, n1320,
         n1321, n1322, n1323, n1324, n1325, n1326, n1327, n1328, n1329, n1330,
         n1331, n1332, n1333, n1334, n1335, n1336, n1337, n1338, n1339, n1340,
         n1341, n1342, n1343, n1344, n1345, n1346, n1347, n1348, n1349, n1350,
         n1351, n1352, n1353, n1354, n1355, n1356, n1357, n1358, n1359, n1360,
         n1361, n1362, n1363, n1364, n1365, n1366, n1367, n1368, n1369, n1370,
         n1371, n1372, n1373, n1374, n1375, n1376, n1377, n1378, n1379, n1380,
         n1381, n1382, n1383, n1384, n1385, n1386, n1387, n1388, n1389, n1390,
         n1391, n1392, n1393, n1394, n1395, n1396, n1397, n1398, n1399, n1400,
         n1401, n1402, n1403, n1404, n1405, n1406, n1407, n1408, n1409, n1410,
         n1411, n1412, n1413, n1414, n1415, n1416, n1417, n1418, n1419, n1420,
         n1421, n1422, n1423, n1424, n1425, n1426, n1427, n1428, n1429, n1430,
         n1431, n1432, n1433, n1434, n1435, n1436, n1437, n1438, n1439, n1440,
         n1441, n1442, n1443, n1444, n1445, n1446, n1447, n1448, n1449, n1450,
         n1451, n1452, n1453, n1454, n1455, n1456, n1457, n1458, n1459, n1460,
         n1461, n1462, n1463, n1464, n1465, n1466, n1467, n1468, n1469, n1470,
         n1471, n1472, n1473, n1474, n1475, n1476, n1477, n1478, n1479, n1480,
         n1481, n1482, n1483, n1484, n1485, n1486, n1487, n1488, n1489, n1490,
         n1491, n1492, n1493, n1494, n1495, n1496, n1497, n1498, n14990, n1500,
         n1501, n1502, n1503, n1504, n1505, n1506, n1507, n1508, n1509, n1510,
         n1511, n1512, n1513, n1514, n1515, n15160, n1517, n1518, n1519, n1520,
         n1521, n1522, n1524, n1525, n1526, n1535, n1536, n1537, n1538, n1539,
         n1540, n1541, n1542, n1543, n1544, n1545, n1547, n1548, n1549, n1550,
         n1551, n1552, n1553, n1560, n1566, n1568, n1570, n1572, n1574, n1576,
         n1578, n1580, n1582, n1584, n1586, n1587, n1588, n1589, n1590, n1591,
         n1592, n1593, n1594, n1595, n1596, n1597, n1598, n1599, n1600, n1601,
         n1602, n16030, n1604, n1605, n1606, n1607, n1608, n1609, n1610, n1611,
         n1612, n1613, n1614, n1615, n1616, n1617, n1618, n1619, n1620, n1621,
         n1622, n1623, n1624, n1625, n1626, n1627, n1628, n1629, n1630, n1631,
         n1632, n1633, n1634, n1635, n1636, n1637, n1638, n1639, n1640, n1641,
         n1642, n1643, n1644, n1645, n1646, n1647, n1648, n1649, n1650, n1651,
         n1652, n1653, n1654, n1655, n1656, n1657, n1658, n1659, n1660, n1661,
         n1662, n1663, n1664, n1665, n1666, n1667, n1668, n1669, n1670, n1671,
         n1672, n1673, n1674, n1675, n1676, n1677, n1678, n1679, n1680, n1681,
         n1682, n1683, n1684, n1685, n1686, n1687, n1688, n1689, n1690, n1691,
         n1692, n1693, n1694, n1695, n1696, n1697, n1698, n1699, n1700, n1701,
         n1702, n1703, n1704, n1705, n1706, n1707, n1708, n1709, n1710, n1711,
         n1712, n1713, n1714, n1715, n1716, n1717, n1718, n1719, n1720, n1721,
         n1722, n1723, n1724, n1725, n1726, n1727, n1728, n1729, n1730, n1731,
         n1732, n1733, n1734, n1735, n1736, n1737, n1738, n1739, n1740, n1741,
         n1742, n1743, n1744, n1745, n1746, n1747, n1748, n1749, n1750, n1751,
         n1752, n1753, n1754, n1755, n1756, n1757, n1758, n1759, n1760, n1761,
         n1762, n1763, n1764, n1765, n1766, n1767, n1768, n1769, n1770, n1771,
         n1772, n1773, n1774, n1775, n1776, n1777, n1778, n1779, n1780, n1781,
         n1782, n1783, n1784, n1785, n1786, n1787, n1788, n1789, n1790, n1791,
         n1792, n1793, n1794, n1795, n1796, n1797, n1798, n1799, n1800, n1801,
         n1802, n1803, n1804, n1805, n1806, n1807, n1808, n1809, n1810, n1811,
         n1812, n1813, n1814, n1815, n1816, n1817, n1818, n1819, n1820, n1821,
         n1822, n1823, n1824, n1825, n1826, n1827, n1828, n1829, n1830, n1831,
         n1832, n1833, n1834, n1835, n1836, n1837, n1838, n1839, n1840, n1841,
         n1842, n1843, n1844, n1845, n1846, n1847, n1848, n1849, n1850, n1851,
         n1852, n1853, n1854, n1855, n1856, n1857, n1858, n1859, n1860, n1861,
         n1862, n1863, n1864, n1865, n1866, n1867, n1868, n1869, n1870, n1871,
         n1872, n1873, n1874, n1875, n1876, n1877, n1878, n1879, n1880, n1881,
         n1882, n1883, n1884, n1885, n1886, n1887, n1888, n1889, n1890, n1891,
         n1892, n1893, n1894, n1895, n1896, n1897, n1898, n1899, n1900, n1901,
         n1902, n1903, n1904, n1905, n1906, n1907, n1908, n1909, n1910, n1911,
         n1912, n1913, n1914, n1915, n1916, n1917, n1918, n1919, n1920, n1921,
         n1922, n1923, n1924, n1925, n1926, n1927, n1928, n1929, n1930, n1931,
         n1932, n1933, n1934, n1935, n1936, n1937, n1938, n1939, n1940, n1941,
         n1942, n1943, n1944, n1945, n1946, n1947, n1948, n1949, n1950, n1951,
         n1952, n1953, n1954, n1955, n1956, n1957, n1958, n1959, n1960, n1961,
         n1962, n1963, n1964, n1965, n1966, n1967, n1968, n1969, n1970, n1971,
         n1972, n1973, n1974, n1975, n1976, n1977, n1978, n1979, n1980, n1981,
         n1982, n1983, n1984, n1985, n1986, n1987, n1988, n1989, n1990, n1991,
         n1992, n1993, n1994, n1995, n1996, n1997, n1998, n1999, n2000, n2001,
         n2002, n2003, n2004, n2005, n2006, n2007, n2008, n2009, n2010, n2011,
         n2012, n2013, n2014, n2015, n2016, n2017, n2018, n2019, n2020, n2021,
         n2022, n2023, n2024, n2025, n2026, n2027, n2028, n2029, n2030, n2031,
         n2032, n2033, n2034, n2035, n2036, n2037, n2038, n2039, n2040, n2041,
         n2042, n2043, n2044, n2045, n2046, n2047, n2048, n2049, n2050, n2051,
         n2052, n2053, n2054, n2055, n2056, n2057, n2058, n2059, n2060, n2061,
         n2062, n2063, n2064, n2065, n2066, n2067, n2068, n2069, n2070, n2071,
         n2072, n2073, n2074, n2075, n2076, n2077, n2078, n2079, n2080, n2081,
         n2082, n2083, n2084, n2085, n2086, n2087, n2088, n2089, n2090, n2091,
         n2092, n2093, n2094, n2095, n2096, n2097, n2098, n2099, n2100, n2101,
         n2102, n2103, n2104, n2105, n2106, n2107, n2108, n2109, n2110, n2111,
         n2112, n2113, n2114, n2115, n2116, n2117, n2118, n2119, n2120, n2121,
         n2122, n2123, n2124, n2125, n2126, n2127, n2128, n2129, n2130, n2131,
         n2132, n2133, n2134, n2135, n2136, n2137, n2138, n2139, n2140, n2141,
         n2142, n2143, n2144, n2145, n2146, n2147, n2148, n2149, n2150, n2151,
         n2152, n2153, n2154, n2155, n2156, n2157, n2158, n2159, n2160, n2161,
         n2162, n2163, n2164, n2165, n2166, n2167, n2168, n2169, n2170, n2171,
         n2172, n2173, n2174, n2175, n2176, n2177, n2178, n2179, n2180, n2181,
         n2182, n2183, n2184, n2185, n2186, n2187, n2188, n2189, n2190, n2191,
         n2192, n2193, n2194, n2195, n2196, n2197, n2198, n2199, n2200, n2201,
         n2202, n2203, n2204, n2205, n2206, n2207, n2208, n2209, n2210, n2211,
         n2212, n2213, n2214, n2215, n2216, n2217, n2218, n2219, n2220, n2221,
         n2222, n2223, n2224, n2225, n2226, n2227, n2228, n2229, n2230, n2231,
         n2232, n2233, n2234, n2235, n2236, n2237, n2238, n2239, n2240, n2241,
         n2242, n2243, n2244, n2245, n2246, n2247, n2248, n2249, n2250, n2251,
         n2252, n2253, n2254, n2255, n2256, n2257, n2258, n2259, n2260, n2261,
         n2262, n2263, n2264, n2265, n2266, n2267, n2268, n2269, n2270, n2271,
         n2272, n2273, n2274, n2275, n2276, n2277, n2278, n2279, n2280, n2281,
         n2282, n2283, n2284, n2285, n2286, n2287, n2288, n2289, n2290, n2291,
         n2292, n2293, n2294, n2295, n2296, n2297, n2298, n2299, n2300, n2301,
         n2302, n2303, n2304, n2305, n2306, n2307, n2308, n2309, n2310, n2311,
         n2312, n2313, n2314, n2315, n2316, n2317, n2318, n2319, n2320, n2321,
         n2322, n2323, n2324, n2325, n2326, n2327, n2328, n2329, n2330, n2331,
         n2332, n2333, n2334, n2335, n2336, n2337, n2338, n2339, n2340, n2341,
         n2342, n2343, n2344, n2345, n2346, n2347, n2348, n2349, n2350, n2351,
         n2352, n2353, n2354, n2355, n2356, n2357, n2358, n2359, n2360, n2361,
         n2362, n2363, n2364, n2365, n2366, n2367, n2368, n2369, n2370, n2371,
         n2372, n2373, n2374, n2375, n2376, n2377, n2378, n2379, n2380, n2381,
         n2382, n2383, n2384, n2386, n2387, n2388, n2389, n2390, n2391, n2392,
         n2393, n2394, n2395, n2396, n2397, n2398, n2399, n2400, n2401, n2402,
         n2403, n2404, n2405, n2406, n2407, n2408, n2409, n2410, n2411, n2412,
         n2413, n2414, n2415, n2416, n2417, n2418, n2419, n2420, n2421, n2422,
         n2423, n2424, n2425, n2426, n2427, n2428, n2429, n2430, n2431, n2432,
         n2433, n2434, n2435, n2436, n2437, n2438, n2439, n2440, n2441, n2442,
         n2443, n2444, n2445, n2446, n2447, n2448, n2449, n2450, n2451, n2452,
         n2453, n2454, n2455, n2456, n2457, n2458, n2459, n2460, n2461, n2462,
         n2463, n2464, n2465, n2466, n2467, n2468, n2469, n2470, n2471, n2472,
         n2473, n2474, n2475, n2476, n2477, n2478, n2479, n2480, n2481, n2482,
         n2483, n2484, n2485, n2486, n2487, n2488, n2489, n2490, n2491, n2492,
         n2493, n2494, n2495, n2496, n2497, n2498, n2499, n2500, n2501, n2502,
         n2503, n2504, n2505, n2506, n2507, n2508, n2509, n2510, n2511, n2512,
         n2513, n2514, n2515, n2516, n2517, n2518, n2519, n2520, n2521, n2522,
         n2523, n2524, n2525, n2526, n2527, n2528, n2529, n2530, n2531, n2532,
         n2533, n2534, n2535, n2536, n2537, n2538, n2539, n2540, n2541, n2542,
         n2543, n2544, n2545, n2546, n2547, n2548, n2549, n2550, n2551, n2552,
         n2553, n2554, n2555, n2556, n2557, n2558, n2559, n2560, n2561, n2562,
         n2563, n2564, n2565, n2566, n2567, n2568, n2569, n2570, n2571, n2572,
         n2573, n2574, n2575, n2576, n2577, n2578, n2579, n2580, n2581, n2582,
         n2583, n2584, n2585, n2586, n2587, n2588, n2589, n2590, n2591, n2592,
         n2593, n2594, n2595, n2596, n2597, n2598, n2599, n2600, n2601, n2602,
         n2603, n2604, n2605, n2606, n2607, n2608, n2609, n2610, n2611, n2612,
         n2613, n2614, n2615, n2616, n2617, n2618, n2619, n2620, n2621, n2622,
         n2623, n2624, n2625, n2626, n2627, n2628, n2629, n2630, n2631, n2632,
         n2633, n2634, n2635, n2636, n2637, n2638, n2639, n2640, n2641, n2642,
         n2643, n2644, n2645, n2646, n2647, n2648, n2649, n2650, n2651, n2652,
         n2653, n2654, n2655, n2656, n2657, n2658, n2659, n2660, n2661, n2662,
         n2663, n2664, n2665, n2666, n2667, n2668, n2669, n2670, n2671, n2672,
         n2673, n2674, n2675, n2676, n2677, n2678, n2679, n2680, n2681, n2682,
         n2683, n2684, n2685, n2686, n2687, n2688, n2689, n2690, n2691, n2692,
         n2693, n2694, n2695, n2696, n2697, n2698, n2699, n2700, n2701, n2702,
         n2703, n2704, n2705, n2706, n2707, n2708, n2709, n2710, n2711, n2712,
         n2713, n2714, n2715, n2716, n2717, n2718, n2719, n2720, n2721, n2722,
         n2723, n2724, n2725, n2726, n2727, n2728, n2729, n2730, n2731, n2732,
         n2733, n2734, n2735, n2736, n2737, n2738, n2739, n2740, n2741, n2742,
         n2743, n2744, n2745, n2746, n2747, n2748, n2749, n2750, n2751, n2752,
         n2753, n2754, n2755, n2756, n2757, n2758, n2759, n2760, n2761, n2762,
         n2763, n2764, n2765, n2766, n2767, n2768, n2769, n2770, n2771, n2772,
         n2773, n2774, n2775, n2776, n2777, n2778, n2779, n2780, n2781, n2782,
         n2783, n2784, n2785, n2786, n2787, n2788, n2789, n2790, n2791, n2792,
         n2793, n2794, n2795, n2796, n2797, n2798, n2799, n2800, n2801, n2802,
         n2803, n2804, n2805, n2806, n2807, n2808, n2809, n2810, n2811, n2812,
         n2813, n2814, n2815, n2816, n2817, n2818, n2819, n2820, n2821, n2822,
         n2823, n2824, n2825, n2826, n2827, n2828, n2829, n2830, n2831, n2832,
         n2833, n2834, n2835, n2836, n2837, n2838, n2839, n2840, n2841, n2842,
         n2843, n2844, n2845, n2846, n2847, n2848, n2849, n2850, n2851, n2852,
         n2853, n2854, n2855, n2856, n2857, n2858, n2859, n2860, n2861, n2862,
         n2863, n2864, n2865, n2866, n2867, n2868, n2869, n2870, n2871, n2872,
         n2873, n2874, n2875, n2876, n2877, n2878, n2879, n2880, n2881, n2882,
         n2883, n2884, n2885, n2886, n2887, n2888, n2889, n2890, n2891, n2892,
         n2893, n2894, n2895, n2896, n2897, n2898, n2899, n2900, n2901, n2902,
         n2903, n2904, n2905, n2906, n2907, n2908, n2909, n2910, n2911, n2912,
         n2913, n2914, n2915, n2916, n2917, n2918, n2919, n2920, n2921, n2922,
         n2923, n2924, n2925, n2926, n2927, n2928, n2929, n2930, n2931, n2932,
         n2933, n2934, n2935, n2936, n2937, n2938, n2939, n2940, n2941, n2942,
         n2943, n2944, n2945, n2946, n2947, n2948, n2949, n2950, n2951, n2952,
         n2953, n2954, n2955, n2956, n2957, n2958, n2959, n2960, n2961, n2962,
         n2963, n2964, n2965, n2966, n2967, n2968, n2969, n2970, n2971, n2972,
         n2973, n2974, n2975, n2976, n2977, n2978, n2979, n2980, n2981, n2982,
         n2983, n2984, n2985, n2986, n2987, n2988, n2989, n2990, n2991, n2992,
         n2993, n2994, n2995, n2996, n2997, n2998, n2999, n3000, n3001, n3002,
         n3003, n3004, n3005, n3006, n3007, n3008, n3009, n3010, n3011, n3012,
         n3013, n3014, n3015, n3016, n3017, n3018, n3019, n3020, n3021, n3022,
         n3023, n3024, n3025, n3026, n3027, n3028, n3029, n3030, n3031, n3032,
         n3033, n3034, n3035, n3036, n3037, n3038, n3039, n3040, n3041, n3042,
         n3043, n3044, n3045, n3046, n3047, n3048, n3049, n3050, n3051, n3052,
         n3053, n3054, n3055, n3056, n3057, n3058, n3059, n3060, n3061, n3062,
         n3063, n3064, n3065, n3066, n3067, n3068, n3069, n3070, n3071, n3072,
         n3073, n3074, n3075, n3076, n3077, n3078, n3079, n3080, n3081, n3082,
         n3083, n3084, n3085, n3086, n3087, n3088, n3089, n3090, n3091, n3092,
         n3093, n3094, n3095, n3096, n3097, n3098, n3099, n3100, n3101, n3102,
         n3103, n3104, n3105, n3106, n3107, n3108, n3109, n3110, n3111, n3112,
         n3113, n3114, n3115, n3116, n3117, n3118, n3119, n3120, n3121, n3122,
         n3123, n3124, n3125, n3126, n3127, n3128, n3129, n3130, n3131, n3132,
         n3133, n3134, n3135, n3136, n3137, n3138, n3139, n3140, n3141, n3142,
         n3143, n3144, n3145, n3146, n3147, n3148, n3149, n3150, n3151, n3152,
         n3153, n3154, n3155, n3156, n3157, n3158, n3159, n3160, n3161, n3162,
         n3163, n3164, n3165, n3166, n3167, n3168, n3169, n3170, n3171, n3172,
         n3173, n3174, n3175, n3176, n3177, n3178, n3179, n3180, n3181, n3182,
         n3183, n3184, n3185, n3186, n3187, n3188, n3189, n3190, n3191, n3192,
         n3193, n3194, n3195, n3196, n3197, n3198, n3199, n3200, n3201, n3202,
         n3203, n3204, n3205, n3206, n3207, n3208, n3209, n3210, n3211, n3212,
         n3213, n3214, n3215, n3216, n3217, n3218, n3219, n3220, n3221, n3222,
         n3223, n3224, n3225, n3226, n3227, n3228, n3229, n3230, n3231, n3232,
         n3233, n3234, n3235, n3236, n3237, n3238, n3239, n3240, n3241, n3242,
         n3243, n3244, n3245, n3246, n3247, n3248, n3249, n3250, n3251, n3252,
         n3253, n3254, n3255, n3256, n3257, n3258, n3259, n3260, n3261, n3262,
         n3263, n3264, n3265, n3266, n3267, n3268, n3269, n3270, n3271, n3272,
         n3273, n3274, n3275, n3276, n3277, n3278, n3279, n3280, n3281, n3282,
         n3283, n3284, n3285, n3286, n3287, n3288, n3289, n3290, n3291, n3292,
         n3293, n3294, n3295, n3296, n3297, n3298, n3299, n3300, n3301, n3302,
         n3303, n3304, n3305, n3306, n3307, n3308, n3309, n3310, n3311, n3312,
         n3313, n3314, n3315, n3316, n3317, n3318, n3319, n3320, n3321, n3322,
         n3323, n3324, n3325, n3326, n3327, n3328, n3329, n3330, n3331, n3332,
         n3333, n3334, n3335, n3336, n3337, n3338, n3339, n3340, n3341, n3342,
         n3343, n3344, n3345, n3346, n3347, n3348, n3349, n3350, n3351, n3352,
         n3353, n3354, n3355, n3356, n3357, n3358, n3359, n3360, n3361, n3362,
         n3363, n3364, n3365, n3366, n3367, n3368, n3369, n3370, n3371, n3372,
         n3373, n3374, n3375, n3377, n3378, n3379, n3380, n3381, n3382, n3383,
         n3384, n3385, n3386, n3387, n3388, n3389, n3390, n3391, n3392, n3393,
         n3394, n3395, n3396, n3397, n3398, n3399, n3400,
         SYNOPSYS_UNCONNECTED_1, SYNOPSYS_UNCONNECTED_2,
         SYNOPSYS_UNCONNECTED_3, SYNOPSYS_UNCONNECTED_4;
  wire   [6:0] counter_read;
  wire   [2:0] counter_pixel;
  wire   [1:0] pixel_cal;
  wire   [31:1] row2;
  wire   [4:0] counter_row;
  wire   [9:0] counter_cal;
  wire   [127:0] color1;
  wire   [3:1] color;
  wire   [55:0] table1;
  wire   [127:0] color2;
  wire   [3:0] colornow;
  wire   [3:0] data;
  wire   [9:1] round2;

  sram_1024x8_t13 u_sram ( .Q({SYNOPSYS_UNCONNECTED_1, SYNOPSYS_UNCONNECTED_2, 
        SYNOPSYS_UNCONNECTED_3, SYNOPSYS_UNCONNECTED_4, data}), .A({n3401, 
        sram_a[8], n3403, n3404, sram_a[5], n3406, sram_a[3:2], n3409, n3410}), 
        .D({1'b0, 1'b0, 1'b0, 1'b0, sram_d[3:0]}), .CLK(clk), .CEN(1'b0), 
        .WEN(sram_wen) );
  DFFRX1 counter_cal_reg_0_ ( .D(n1526), .CK(clk), .RN(n3386), .Q(
        counter_cal[0]) );
  DFFRX1 round1_reg ( .D(n1517), .CK(clk), .RN(n3385), .Q(round1) );
  DFFRX1 counter_cal_reg_7_ ( .D(n1506), .CK(clk), .RN(n3388), .Q(
        counter_cal[7]), .QN(n3269) );
  DFFRX1 set_reg ( .D(n1525), .CK(clk), .RN(n3379), .Q(set), .QN(n3196) );
  DFFRX1 counter_pixel_reg_1_ ( .D(n1502), .CK(clk), .RN(n3377), .Q(
        counter_pixel[1]), .QN(n3037) );
  DFFRX1 read_complete_reg ( .D(n1501), .CK(clk), .RN(n3385), .Q(read_complete), .QN(n3151) );
  DFFRX1 read_from_rom_reg ( .D(read), .CK(clk), .RN(n3394), .Q(read_from_rom), 
        .QN(n3154) );
  DFFRX1 pixel_cal_reg_0_ ( .D(n1468), .CK(clk), .RN(n3383), .Q(pixel_cal[0])
         );
  DFFRX1 pixel_cal_reg_1_ ( .D(n1467), .CK(clk), .RN(n3385), .Q(pixel_cal[1]), 
        .QN(n3246) );
  DFFRX1 row2_reg_17_ ( .D(n1483), .CK(clk), .RN(n3381), .QN(n3099) );
  DFFRX1 row2_reg_18_ ( .D(n1482), .CK(clk), .RN(n3381), .Q(row2[18]), .QN(
        n3108) );
  DFFRX1 row2_reg_19_ ( .D(n1481), .CK(clk), .RN(n3391), .Q(row2[19]) );
  DFFRX1 row2_reg_20_ ( .D(n1480), .CK(clk), .RN(n3380), .QN(n3097) );
  DFFRX1 row2_reg_21_ ( .D(n1479), .CK(clk), .RN(n3381), .QN(n3098) );
  DFFRX1 row2_reg_23_ ( .D(n1477), .CK(clk), .RN(n3391), .Q(row2[23]) );
  DFFRX1 row2_reg_24_ ( .D(n1476), .CK(clk), .RN(n3380), .QN(n3204) );
  DFFRX1 row2_reg_25_ ( .D(n1475), .CK(clk), .RN(n3381), .QN(n3206) );
  DFFRX1 row2_reg_26_ ( .D(n1474), .CK(clk), .RN(n3391), .Q(row2[26]), .QN(
        n3230) );
  DFFRX1 row2_reg_27_ ( .D(n1473), .CK(clk), .RN(n3391), .Q(row2[27]) );
  DFFRX1 row2_reg_28_ ( .D(n1472), .CK(clk), .RN(n3380), .Q(row2[28]) );
  DFFRX1 row2_reg_29_ ( .D(n1471), .CK(clk), .RN(n3381), .QN(n3205) );
  DFFRX1 row2_reg_30_ ( .D(n1470), .CK(clk), .RN(n3391), .Q(row2[30]), .QN(
        n3109) );
  DFFRX1 row2_reg_31_ ( .D(n1469), .CK(clk), .RN(n3391), .Q(row2[31]) );
  DFFRX1 row2_reg_1_ ( .D(n14990), .CK(clk), .RN(n3381), .Q(row2[1]) );
  DFFRX1 row2_reg_2_ ( .D(n1498), .CK(clk), .RN(n3391), .Q(row2[2]) );
  DFFRX1 row2_reg_3_ ( .D(n1497), .CK(clk), .RN(n3391), .Q(row2[3]), .QN(n3129) );
  DFFRX1 row2_reg_4_ ( .D(n1496), .CK(clk), .RN(n3380), .Q(row2[4]) );
  DFFRX1 row2_reg_5_ ( .D(n1495), .CK(clk), .RN(n3381), .QN(n3048) );
  DFFRX1 row2_reg_6_ ( .D(n1494), .CK(clk), .RN(n3391), .Q(row2[6]), .QN(n3120) );
  DFFRX1 row2_reg_7_ ( .D(n1493), .CK(clk), .RN(n3391), .Q(row2[7]), .QN(n3050) );
  DFFRX1 row2_reg_8_ ( .D(n1492), .CK(clk), .RN(n3380), .QN(n3046) );
  DFFRX1 row2_reg_9_ ( .D(n1491), .CK(clk), .RN(n3381), .QN(n3207) );
  DFFRX1 row2_reg_10_ ( .D(n1490), .CK(clk), .RN(n3391), .Q(row2[10]), .QN(
        n3239) );
  DFFRX1 row2_reg_11_ ( .D(n1489), .CK(clk), .RN(n3390), .Q(row2[11]), .QN(
        n3125) );
  DFFRX1 row2_reg_12_ ( .D(n1488), .CK(clk), .RN(n3380), .Q(row2[12]) );
  DFFRX1 row2_reg_13_ ( .D(n1487), .CK(clk), .RN(n3381), .Q(row2[13]) );
  DFFRX1 row2_reg_14_ ( .D(n1486), .CK(clk), .RN(n3390), .Q(row2[14]) );
  DFFRX1 row2_reg_15_ ( .D(n1485), .CK(clk), .RN(n3388), .Q(row2[15]), .QN(
        n3051) );
  DFFRX1 counter_cal_reg_9_ ( .D(n1519), .CK(clk), .RN(n3385), .Q(
        counter_cal[9]) );
  DFFRX1 counter_cal_reg_1_ ( .D(n1512), .CK(clk), .RN(n3386), .Q(
        counter_cal[1]) );
  DFFRX1 counter_cal_reg_2_ ( .D(n1511), .CK(clk), .RN(n3386), .Q(
        counter_cal[2]), .QN(n3263) );
  DFFRX1 counter_cal_reg_3_ ( .D(n1510), .CK(clk), .RN(n3386), .Q(
        counter_cal[3]) );
  DFFRX1 counter_cal_reg_4_ ( .D(n1509), .CK(clk), .RN(n3386), .Q(
        counter_cal[4]) );
  DFFRX1 counter_cal_reg_5_ ( .D(n1508), .CK(clk), .RN(n3385), .Q(
        counter_cal[5]), .QN(n3259) );
  DFFRX1 counter_cal_reg_6_ ( .D(n1507), .CK(clk), .RN(n3385), .Q(
        counter_cal[6]), .QN(n3195) );
  DFFRX1 color2_reg_31__3_ ( .D(n1339), .CK(clk), .RN(n3377), .Q(color2[127]), 
        .QN(n3043) );
  DFFRX1 color2_reg_6__3_ ( .D(n1364), .CK(clk), .RN(n3388), .Q(color2[27]), 
        .QN(n3177) );
  DFFRX1 color2_reg_7__3_ ( .D(n1363), .CK(clk), .RN(n3390), .Q(color2[31]), 
        .QN(n3075) );
  DFFRX1 color2_reg_9__3_ ( .D(n1361), .CK(clk), .RN(n3379), .Q(color2[39]), 
        .QN(n3296) );
  DFFRX1 color2_reg_10__3_ ( .D(n1360), .CK(clk), .RN(n3379), .Q(color2[43]), 
        .QN(n3089) );
  DFFRX1 color2_reg_11__3_ ( .D(n1359), .CK(clk), .RN(n3379), .Q(color2[47]), 
        .QN(n3273) );
  DFFRX1 color2_reg_14__3_ ( .D(n1356), .CK(clk), .RN(n3379), .Q(color2[59]), 
        .QN(n3178) );
  DFFRX1 color2_reg_19__3_ ( .D(n1351), .CK(clk), .RN(n3386), .Q(color2[79]), 
        .QN(n3275) );
  DFFRX1 color2_reg_21__3_ ( .D(n1349), .CK(clk), .RN(n3390), .Q(color2[87]), 
        .QN(n3167) );
  DFFRX1 color2_reg_22__3_ ( .D(n1348), .CK(clk), .RN(n3389), .Q(color2[91]), 
        .QN(n3179) );
  DFFRX1 color2_reg_30__3_ ( .D(n1340), .CK(clk), .RN(n3378), .Q(color2[123]), 
        .QN(n3079) );
  DFFRX1 color2_reg_0__2_ ( .D(n1402), .CK(clk), .RN(n3387), .Q(color2[2]), 
        .QN(n3284) );
  DFFRX1 color2_reg_1__2_ ( .D(n1401), .CK(clk), .RN(n3387), .Q(color2[6]), 
        .QN(n3277) );
  DFFRX1 color2_reg_2__2_ ( .D(n1400), .CK(clk), .RN(n3387), .Q(color2[10]), 
        .QN(n3291) );
  DFFRX1 color2_reg_3__2_ ( .D(n1399), .CK(clk), .RN(n3387), .Q(color2[14]), 
        .QN(n3276) );
  DFFRX1 color2_reg_4__2_ ( .D(n1398), .CK(clk), .RN(n3387), .Q(color2[18]), 
        .QN(n3322) );
  DFFRX1 color2_reg_8__2_ ( .D(n1394), .CK(clk), .RN(n3389), .Q(color2[34]), 
        .QN(n3308) );
  DFFRX1 color2_reg_9__2_ ( .D(n1393), .CK(clk), .RN(n3389), .Q(color2[38]), 
        .QN(n3295) );
  DFFRX1 color2_reg_11__2_ ( .D(n1391), .CK(clk), .RN(n3389), .Q(color2[46]), 
        .QN(n3272) );
  DFFRX1 color2_reg_13__2_ ( .D(n1389), .CK(clk), .RN(n3390), .Q(color2[54]), 
        .QN(n3184) );
  DFFRX1 color2_reg_14__2_ ( .D(n1388), .CK(clk), .RN(n3390), .Q(color2[58]), 
        .QN(n3176) );
  DFFRX1 color2_reg_15__2_ ( .D(n1387), .CK(clk), .RN(n3390), .Q(color2[62]), 
        .QN(n3074) );
  DFFRX1 color2_reg_18__2_ ( .D(n1384), .CK(clk), .RN(n3393), .Q(color2[74]), 
        .QN(n3090) );
  DFFRX1 color2_reg_21__2_ ( .D(n1381), .CK(clk), .RN(n3386), .Q(color2[86]), 
        .QN(n3187) );
  DFFRX1 color2_reg_22__2_ ( .D(n1380), .CK(clk), .RN(n3396), .Q(color2[90]), 
        .QN(n3180) );
  DFFRX1 color2_reg_23__2_ ( .D(n1379), .CK(clk), .RN(n3386), .Q(color2[94]), 
        .QN(n3077) );
  DFFRX1 color2_reg_24__2_ ( .D(n1378), .CK(clk), .RN(n3389), .Q(color2[98]), 
        .QN(n3307) );
  DFFRX1 color2_reg_26__2_ ( .D(n1376), .CK(clk), .RN(n3389), .Q(color2[106]), 
        .QN(n3086) );
  DFFRX1 color2_reg_29__2_ ( .D(n1373), .CK(clk), .RN(n3388), .Q(color2[118]), 
        .QN(n1592) );
  DFFRX1 color2_reg_30__2_ ( .D(n1372), .CK(clk), .RN(n3388), .Q(color2[122]), 
        .QN(n1594) );
  DFFRX1 color2_reg_31__2_ ( .D(n1371), .CK(clk), .RN(n3388), .Q(color2[126]), 
        .QN(n3173) );
  DFFRX1 color2_reg_1__1_ ( .D(n1433), .CK(clk), .RN(n3383), .Q(color2[5]), 
        .QN(n3297) );
  DFFRX1 color2_reg_3__1_ ( .D(n1431), .CK(clk), .RN(n3382), .Q(color2[13]), 
        .QN(n3292) );
  DFFRX1 color2_reg_5__1_ ( .D(n1429), .CK(clk), .RN(n3382), .Q(color2[21]), 
        .QN(n3199) );
  DFFRX1 color2_reg_6__1_ ( .D(n1428), .CK(clk), .RN(n3382), .Q(color2[25]), 
        .QN(n3198) );
  DFFRX1 color2_reg_7__1_ ( .D(n1427), .CK(clk), .RN(n3382), .Q(color2[29]), 
        .QN(n3093) );
  DFFRX1 color2_reg_10__1_ ( .D(n1424), .CK(clk), .RN(n3383), .Q(color2[41]), 
        .QN(n1600) );
  DFFRX1 color2_reg_11__1_ ( .D(n1423), .CK(clk), .RN(n3383), .Q(color2[45]), 
        .QN(n16030) );
  DFFRX1 color2_reg_12__1_ ( .D(n1422), .CK(clk), .RN(n3383), .Q(color2[49]), 
        .QN(n3285) );
  DFFRX1 color2_reg_13__1_ ( .D(n1421), .CK(clk), .RN(n3383), .Q(color2[53]), 
        .QN(n1588) );
  DFFRX1 color2_reg_14__1_ ( .D(n1420), .CK(clk), .RN(n3383), .Q(color2[57]), 
        .QN(n3278) );
  DFFRX1 color2_reg_15__1_ ( .D(n1419), .CK(clk), .RN(n3394), .Q(color2[61]), 
        .QN(n3174) );
  DFFRX1 color2_reg_18__1_ ( .D(n1416), .CK(clk), .RN(n3382), .Q(color2[73]), 
        .QN(n3202) );
  DFFRX1 color2_reg_19__1_ ( .D(n1415), .CK(clk), .RN(n3382), .Q(color2[77]), 
        .QN(n3095) );
  DFFRX1 color2_reg_20__1_ ( .D(n1414), .CK(clk), .RN(n3382), .Q(color2[81]), 
        .QN(n3289) );
  DFFRX1 color2_reg_22__1_ ( .D(n1412), .CK(clk), .RN(n3382), .Q(color2[89]), 
        .QN(n3282) );
  DFFRX1 color2_reg_23__1_ ( .D(n1411), .CK(clk), .RN(n3382), .Q(color2[93]), 
        .QN(n3071) );
  DFFRX1 color2_reg_26__1_ ( .D(n1408), .CK(clk), .RN(n3384), .Q(color2[105]), 
        .QN(n3200) );
  DFFRX1 color2_reg_27__1_ ( .D(n1407), .CK(clk), .RN(n3384), .Q(color2[109]), 
        .QN(n3047) );
  DFFRX1 color2_reg_28__1_ ( .D(n1406), .CK(clk), .RN(n3384), .Q(color2[113]), 
        .QN(n3286) );
  DFFRX1 color2_reg_29__1_ ( .D(n1405), .CK(clk), .RN(n3383), .Q(color2[117]), 
        .QN(n1591) );
  DFFRX1 color2_reg_30__1_ ( .D(n1404), .CK(clk), .RN(n3384), .Q(color2[121]), 
        .QN(n3279) );
  DFFRX1 color2_reg_31__1_ ( .D(n1403), .CK(clk), .RN(n3383), .Q(color2[125]), 
        .QN(n1607) );
  DFFRX1 color_reg_0_ ( .D(n15160), .CK(clk), .RN(n3393), .QN(n3248) );
  DFFRX1 color2_reg_3__0_ ( .D(n1463), .CK(clk), .RN(n3384), .Q(color2[12]), 
        .QN(n3293) );
  DFFRX1 color2_reg_5__0_ ( .D(n1461), .CK(clk), .RN(n3384), .Q(color2[20]), 
        .QN(n1593) );
  DFFRX1 color2_reg_6__0_ ( .D(n1460), .CK(clk), .RN(n3384), .Q(color2[24]), 
        .QN(n1595) );
  DFFRX1 color2_reg_7__0_ ( .D(n1459), .CK(clk), .RN(n3384), .Q(color2[28]), 
        .QN(n1596) );
  DFFRX1 color2_reg_9__0_ ( .D(n1457), .CK(clk), .RN(n3394), .Q(color2[36]), 
        .QN(n3301) );
  DFFRX1 color2_reg_10__0_ ( .D(n1456), .CK(clk), .RN(n3394), .Q(color2[40]), 
        .QN(n1598) );
  DFFRX1 color2_reg_11__0_ ( .D(n1455), .CK(clk), .RN(n3398), .Q(color2[44]), 
        .QN(n1599) );
  DFFRX1 color2_reg_15__0_ ( .D(n1451), .CK(clk), .RN(n3395), .Q(color2[60]), 
        .QN(n3076) );
  DFFRX1 color2_reg_17__0_ ( .D(n1449), .CK(clk), .RN(n3396), .Q(color2[68]), 
        .QN(n3306) );
  DFFRX1 color2_reg_19__0_ ( .D(n1447), .CK(clk), .RN(n3396), .Q(color2[76]), 
        .QN(n3096) );
  DFFRX1 color2_reg_21__0_ ( .D(n1445), .CK(clk), .RN(n3395), .Q(color2[84]), 
        .QN(n3188) );
  DFFRX1 color2_reg_23__0_ ( .D(n1443), .CK(clk), .RN(n3395), .Q(color2[92]), 
        .QN(n3078) );
  DFFRX1 color2_reg_26__0_ ( .D(n1440), .CK(clk), .RN(n3395), .Q(color2[104]), 
        .QN(n3201) );
  DFFRX1 color2_reg_27__0_ ( .D(n1439), .CK(clk), .RN(n3395), .Q(color2[108]), 
        .QN(n3094) );
  DFFRX1 color2_reg_29__0_ ( .D(n1437), .CK(clk), .RN(n3395), .Q(color2[116]), 
        .QN(n1604) );
  DFFRX1 color2_reg_30__0_ ( .D(n1436), .CK(clk), .RN(n3395), .Q(color2[120]), 
        .QN(n3281) );
  DFFRX1 color2_reg_31__0_ ( .D(n1435), .CK(clk), .RN(n3395), .Q(color2[124]), 
        .QN(n1605) );
  DFFRX1 color_reg_2_ ( .D(n1514), .CK(clk), .RN(n3386), .Q(color[2]) );
  DFFRX1 color_reg_3_ ( .D(n1513), .CK(clk), .RN(n3390), .Q(color[3]) );
  DFFRX1 round2_reg_7_ ( .D(n1262), .CK(clk), .RN(n3390), .Q(round2[7]), .QN(
        n3264) );
  DFFRX1 round2_reg_6_ ( .D(n1261), .CK(clk), .RN(n3378), .Q(round2[6]), .QN(
        n3260) );
  DFFSX1 counter_pixel_reg_2_ ( .D(n1504), .CK(clk), .SN(n3399), .Q(
        counter_pixel[2]) );
  DFFSX1 read_reg ( .D(N472), .CK(clk), .SN(n3399), .Q(read) );
  DFFSX1 counter_pixel_reg_0_ ( .D(n1503), .CK(clk), .SN(n3399), .Q(
        counter_pixel[0]), .QN(n3133) );
  DFFSX1 color_reg_1_ ( .D(n1515), .CK(clk), .SN(n3399), .Q(color[1]), .QN(
        n3249) );
  DFFRX1 counter_read_reg_0_ ( .D(n1254), .CK(clk), .RN(n3381), .Q(
        counter_read[0]) );
  DFFRX1 counter_read_reg_1_ ( .D(n1253), .CK(clk), .RN(n3379), .Q(
        counter_read[1]), .QN(n3197) );
  DFFRX1 counter_read_reg_3_ ( .D(n1252), .CK(clk), .RN(n3385), .Q(
        counter_read[3]), .QN(n3256) );
  DFFRX1 counter_read_reg_4_ ( .D(n1251), .CK(clk), .RN(n3381), .Q(
        counter_read[4]) );
  DFFRX1 counter_read_reg_5_ ( .D(n1250), .CK(clk), .RN(n3383), .Q(
        counter_read[5]), .QN(n3261) );
  DFFRX1 counter_read_reg_6_ ( .D(n1249), .CK(clk), .RN(n3379), .Q(
        counter_read[6]), .QN(n1608) );
  DFFRX1 color1_reg_18__3_ ( .D(n1229), .CK(clk), .RN(n3384), .Q(color1[75]), 
        .QN(n3030) );
  DFFRX1 color1_reg_28__3_ ( .D(n1219), .CK(clk), .RN(n3378), .Q(color1[115])
         );
  DFFRX1 color1_reg_0__2_ ( .D(n1216), .CK(clk), .RN(n3387), .Q(color1[2]), 
        .QN(n3123) );
  DFFRX1 color1_reg_28__2_ ( .D(n1188), .CK(clk), .RN(n3388), .Q(color1[114])
         );
  DFFRX1 color1_reg_0__1_ ( .D(n1184), .CK(clk), .RN(n3396), .Q(color1[1]), 
        .QN(n3122) );
  DFFRX1 color1_reg_28__1_ ( .D(n1156), .CK(clk), .RN(n3399), .Q(color1[113])
         );
  DFFRX1 color1_reg_28__0_ ( .D(n1124), .CK(clk), .RN(n3398), .Q(color1[112])
         );
  DFFSX1 counter_read_reg_2_ ( .D(n1120), .CK(clk), .SN(n3399), .Q(
        counter_read[2]) );
  EDFFX1 colornow_reg_2_ ( .D(N921), .E(N1499), .CK(clk), .Q(colornow[2]) );
  DFFSX4 counter_row_reg_0_ ( .D(n1524), .CK(clk), .SN(n3399), .Q(
        counter_row[0]), .QN(n3372) );
  DFFSX4 counter_row_reg_2_ ( .D(n1522), .CK(clk), .SN(n3399), .Q(
        counter_row[2]), .QN(n3373) );
  DFFSX4 counter_row_reg_3_ ( .D(n1521), .CK(clk), .SN(n3395), .Q(
        counter_row[3]), .QN(n3370) );
  DFFSX4 counter_row_reg_4_ ( .D(n1520), .CK(clk), .SN(n3399), .Q(
        counter_row[4]), .QN(n3331) );
  DFFSX2 round2_reg_1_ ( .D(n1256), .CK(clk), .SN(n3398), .Q(round2[1]), .QN(
        n3247) );
  DFFSX2 round2_reg_2_ ( .D(n1257), .CK(clk), .SN(n3399), .Q(round2[2]), .QN(
        n3262) );
  DFFRX1 color1_reg_4__1_ ( .D(n1180), .CK(clk), .RN(n3399), .Q(color1[17]), 
        .QN(n3240) );
  DFFRX1 color1_reg_20__1_ ( .D(n1164), .CK(clk), .RN(n3393), .Q(color1[81]), 
        .QN(n3237) );
  DFFRX1 color1_reg_3__1_ ( .D(n1181), .CK(clk), .RN(n3397), .Q(color1[13]), 
        .QN(n3235) );
  DFFRX1 color1_reg_2__1_ ( .D(n1182), .CK(clk), .RN(n3374), .Q(color1[9]), 
        .QN(n3229) );
  DFFRX1 color1_reg_2__0_ ( .D(n1150), .CK(clk), .RN(n3397), .Q(color1[8]), 
        .QN(n3228) );
  DFFRX1 color1_reg_22__3_ ( .D(n1225), .CK(clk), .RN(n3387), .Q(color1[91]), 
        .QN(n3220) );
  DFFRX1 color1_reg_22__0_ ( .D(n1130), .CK(clk), .RN(n3396), .Q(color1[88]), 
        .QN(n3216) );
  DFFRX1 color1_reg_22__1_ ( .D(n1162), .CK(clk), .RN(n3374), .Q(color1[89]), 
        .QN(n3215) );
  DFFRX1 color1_reg_5__3_ ( .D(n1242), .CK(clk), .RN(n3379), .Q(color1[23]), 
        .QN(n3170) );
  DFFRX1 color1_reg_26__2_ ( .D(n1190), .CK(clk), .RN(n3389), .Q(color1[106]), 
        .QN(n3163) );
  DFFRX1 color1_reg_13__3_ ( .D(n1234), .CK(clk), .RN(n3380), .Q(color1[55]), 
        .QN(n3157) );
  DFFRX1 color1_reg_31__2_ ( .D(n1185), .CK(clk), .RN(n3388), .Q(color1[126]), 
        .QN(n3153) );
  DFFRX1 color1_reg_3__3_ ( .D(n1244), .CK(clk), .RN(n3377), .Q(color1[15]), 
        .QN(n3110) );
  DFFRX1 color1_reg_30__0_ ( .D(n1122), .CK(clk), .RN(n3396), .Q(color1[120]), 
        .QN(n3102) );
  DFFRX1 color1_reg_7__2_ ( .D(n1209), .CK(clk), .RN(n3392), .Q(color1[30]), 
        .QN(n3082) );
  DFFRX1 color1_reg_31__3_ ( .D(n1248), .CK(clk), .RN(n3378), .Q(color1[127]), 
        .QN(n3073) );
  DFFRX1 color1_reg_6__3_ ( .D(n1241), .CK(clk), .RN(n3385), .Q(color1[27]), 
        .QN(n3065) );
  DFFRX1 color1_reg_21__3_ ( .D(n1226), .CK(clk), .RN(n3390), .Q(color1[87]), 
        .QN(n3057) );
  DFFRX1 color1_reg_29__2_ ( .D(n1187), .CK(clk), .RN(n3388), .Q(color1[118]), 
        .QN(n3054) );
  DFFRX1 color1_reg_13__2_ ( .D(n1203), .CK(clk), .RN(n3390), .Q(color1[54]), 
        .QN(n3045) );
  DFFRX1 color1_reg_11__3_ ( .D(n1236), .CK(clk), .RN(n3379), .Q(color1[47]), 
        .QN(n3040) );
  DFFRX1 color1_reg_27__3_ ( .D(n1220), .CK(clk), .RN(n3378), .Q(color1[111]), 
        .QN(n3039) );
  DFFRX1 color1_reg_27__2_ ( .D(n1189), .CK(clk), .RN(n3388), .Q(color1[110]), 
        .QN(n3038) );
  DFFRX1 color1_reg_5__2_ ( .D(n1211), .CK(clk), .RN(n3393), .Q(color1[22]), 
        .QN(n3036) );
  DFFRX1 color1_reg_5__1_ ( .D(n1179), .CK(clk), .RN(n3392), .Q(color1[21]), 
        .QN(n3035) );
  DFFRX1 color1_reg_6__2_ ( .D(n1210), .CK(clk), .RN(n3387), .Q(color1[26]), 
        .QN(n3034) );
  DFFRX1 color1_reg_16__3_ ( .D(n1231), .CK(clk), .RN(n3388), .Q(color1[67]), 
        .QN(n3032) );
  DFFRX1 color1_reg_15__3_ ( .D(n1232), .CK(clk), .RN(n3380), .Q(color1[63]), 
        .QN(n3029) );
  DFFRX1 color1_reg_29__3_ ( .D(n1218), .CK(clk), .RN(n3377), .Q(color1[119]), 
        .QN(n3028) );
  DFFRX1 color1_reg_7__3_ ( .D(n1240), .CK(clk), .RN(n3375), .Q(color1[31]), 
        .QN(n3027) );
  DFFRX1 color1_reg_10__2_ ( .D(n1206), .CK(clk), .RN(n3389), .Q(color1[42]), 
        .QN(n3026) );
  DFFRX1 sram_wen_reg ( .D(n1281), .CK(clk), .RN(n3385), .Q(n3132), .QN(n3257)
         );
  DFFRX1 round2_reg_9_ ( .D(n1280), .CK(clk), .RN(n3385), .Q(round2[9]), .QN(
        n3268) );
  DFFRX1 row2_reg_0_ ( .D(n1500), .CK(clk), .RN(n3381), .QN(n3209) );
  DFFRX1 table1_reg_11__0_ ( .D(n1335), .CK(clk), .RN(n3399), .Q(table1[40]), 
        .QN(n3255) );
  DFFRX1 table1_reg_11__3_ ( .D(n1293), .CK(clk), .RN(n3392), .Q(table1[43]), 
        .QN(n3092) );
  DFFRX1 table1_reg_11__2_ ( .D(n1307), .CK(clk), .RN(n3393), .Q(table1[42]), 
        .QN(n3194) );
  DFFRX1 table1_reg_11__1_ ( .D(n1321), .CK(clk), .RN(n3389), .Q(table1[41]), 
        .QN(n3254) );
  DFFRX1 table1_reg_14__1_ ( .D(n1323), .CK(clk), .RN(n3386), .Q(table1[49]), 
        .QN(n3253) );
  DFFRX1 table1_reg_15__3_ ( .D(n1296), .CK(clk), .RN(n3392), .Q(table1[55]), 
        .QN(n3131) );
  DFFRX1 table1_reg_15__1_ ( .D(n1324), .CK(clk), .RN(n3388), .Q(table1[53]), 
        .QN(n3251) );
  DFFRX1 table1_reg_15__2_ ( .D(n1310), .CK(clk), .RN(n3394), .Q(table1[54]), 
        .QN(n3250) );
  DFFRX1 table1_reg_14__3_ ( .D(n1295), .CK(clk), .RN(n3392), .Q(table1[51]), 
        .QN(n3130) );
  DFFRX1 table1_reg_4__2_ ( .D(n1300), .CK(clk), .RN(n3393), .Q(table1[14]), 
        .QN(n3348) );
  DFFRX1 table1_reg_9__2_ ( .D(n1305), .CK(clk), .RN(n3393), .Q(table1[34]), 
        .QN(n3347) );
  DFFRX1 table1_reg_10__2_ ( .D(n1306), .CK(clk), .RN(n3393), .Q(table1[38]), 
        .QN(n3369) );
  DFFRX1 table1_reg_10__0_ ( .D(n1334), .CK(clk), .RN(n3396), .Q(table1[36]), 
        .QN(n3366) );
  DFFRX1 table1_reg_2__0_ ( .D(n1326), .CK(clk), .RN(n3394), .Q(table1[4]), 
        .QN(n3368) );
  DFFRX1 table1_reg_3__0_ ( .D(n1327), .CK(clk), .RN(n3394), .Q(table1[8]), 
        .QN(n3367) );
  DFFRX1 table1_reg_12__1_ ( .D(n1322), .CK(clk), .RN(n3383), .Q(table1[45]), 
        .QN(n3346) );
  DFFRX1 table1_reg_1__1_ ( .D(n1311), .CK(clk), .RN(n3391), .Q(table1[1]), 
        .QN(n3345) );
  DFFRX1 table1_reg_12__0_ ( .D(n1336), .CK(clk), .RN(n3394), .Q(table1[44]), 
        .QN(n3343) );
  DFFRX1 table1_reg_1__0_ ( .D(n1325), .CK(clk), .RN(n3394), .Q(table1[0]), 
        .QN(n3344) );
  DFFRX1 table1_reg_2__2_ ( .D(n1298), .CK(clk), .RN(n3381), .Q(table1[6]), 
        .QN(n3365) );
  DFFRX1 table1_reg_8__0_ ( .D(n1332), .CK(clk), .RN(n3394), .Q(table1[28]), 
        .QN(n3341) );
  DFFRX1 table1_reg_8__1_ ( .D(n1318), .CK(clk), .RN(n3381), .Q(table1[29]), 
        .QN(n3342) );
  DFFRX1 table1_reg_4__0_ ( .D(n1328), .CK(clk), .RN(n3394), .Q(table1[12]), 
        .QN(n3339) );
  DFFRX1 table1_reg_4__1_ ( .D(n1314), .CK(clk), .RN(n3380), .Q(table1[13]), 
        .QN(n3340) );
  DFFRX1 table1_reg_9__0_ ( .D(n1333), .CK(clk), .RN(n3394), .Q(table1[32]), 
        .QN(n3337) );
  DFFRX1 table1_reg_9__1_ ( .D(n1319), .CK(clk), .RN(n3382), .Q(table1[33]), 
        .QN(n3338) );
  DFFRX1 table1_reg_5__0_ ( .D(n1329), .CK(clk), .RN(n3394), .Q(table1[16]), 
        .QN(n3336) );
  DFFRX1 table1_reg_5__1_ ( .D(n1315), .CK(clk), .RN(n3384), .Q(table1[17]), 
        .QN(n3335) );
  DFFRX1 table1_reg_2__1_ ( .D(n1312), .CK(clk), .RN(n3382), .Q(table1[5]), 
        .QN(n3363) );
  DFFRX1 table1_reg_2__3_ ( .D(n1284), .CK(clk), .RN(n3379), .Q(table1[7]), 
        .QN(n3361) );
  DFFRX1 table1_reg_5__2_ ( .D(n1301), .CK(clk), .RN(n3393), .Q(table1[18]), 
        .QN(n3333) );
  DFFRX1 table1_reg_10__3_ ( .D(n1292), .CK(clk), .RN(n3392), .Q(table1[39]), 
        .QN(n3149) );
  DFFRX1 table1_reg_10__1_ ( .D(n1320), .CK(clk), .RN(n3380), .Q(table1[37]), 
        .QN(n3360) );
  DFFRX1 table1_reg_6__2_ ( .D(n1302), .CK(clk), .RN(n3393), .Q(table1[22]), 
        .QN(n3359) );
  DFFRX1 table1_reg_1__2_ ( .D(n1297), .CK(clk), .RN(n3393), .Q(table1[2]), 
        .QN(n3332) );
  DFFRX1 table1_reg_14__0_ ( .D(n1337), .CK(clk), .RN(n3375), .Q(table1[48]), 
        .QN(n3358) );
  DFFRX1 table1_reg_15__0_ ( .D(n1338), .CK(clk), .RN(n3394), .Q(table1[52]), 
        .QN(n3357) );
  DFFRX1 table1_reg_14__2_ ( .D(n1309), .CK(clk), .RN(n3393), .Q(table1[50]), 
        .QN(n3356) );
  DFFRX1 table1_reg_7__0_ ( .D(n1331), .CK(clk), .RN(n3398), .Q(table1[24]), 
        .QN(n3355) );
  DFFRX1 table1_reg_6__3_ ( .D(n1288), .CK(clk), .RN(n3392), .Q(table1[23]), 
        .QN(n3147) );
  DFFRX1 table1_reg_6__1_ ( .D(n1316), .CK(clk), .RN(n3384), .Q(table1[21]), 
        .QN(n3354) );
  DFFRX1 table1_reg_6__0_ ( .D(n1330), .CK(clk), .RN(n3398), .Q(table1[20]), 
        .QN(n3352) );
  DFFRX1 table1_reg_7__1_ ( .D(n1317), .CK(clk), .RN(n3387), .Q(table1[25]), 
        .QN(n3351) );
  DFFRX1 color2_reg_20__2_ ( .D(n1382), .CK(clk), .RN(n3386), .Q(color2[82]), 
        .QN(n3327) );
  DFFRX1 color2_reg_12__3_ ( .D(n1358), .CK(clk), .RN(n3379), .Q(color2[51]), 
        .QN(n3326) );
  DFFRX1 color2_reg_12__2_ ( .D(n1390), .CK(clk), .RN(n3390), .Q(color2[50]), 
        .QN(n3324) );
  DFFRX1 color2_reg_28__2_ ( .D(n1374), .CK(clk), .RN(n3388), .Q(color2[114]), 
        .QN(n3323) );
  DFFRX1 color2_reg_16__0_ ( .D(n1450), .CK(clk), .RN(n3396), .Q(color2[64]), 
        .QN(n3319) );
  DFFRX1 color2_reg_16__1_ ( .D(n1418), .CK(clk), .RN(n3382), .Q(color2[65]), 
        .QN(n3318) );
  DFFRX1 color2_reg_24__0_ ( .D(n1442), .CK(clk), .RN(n3395), .Q(color2[96]), 
        .QN(n3315) );
  DFFRX1 color2_reg_0__0_ ( .D(n1466), .CK(clk), .RN(n3385), .Q(color2[0]), 
        .QN(n3313) );
  DFFRX1 color2_reg_24__1_ ( .D(n1410), .CK(clk), .RN(n3384), .Q(color2[97]), 
        .QN(n3312) );
  DFFRX1 color2_reg_8__1_ ( .D(n1426), .CK(clk), .RN(n3383), .Q(color2[33]), 
        .QN(n3311) );
  DFFRX1 color2_reg_0__1_ ( .D(n1434), .CK(clk), .RN(n3383), .Q(color2[1]), 
        .QN(n3310) );
  DFFRX1 color2_reg_8__3_ ( .D(n1362), .CK(clk), .RN(n3379), .Q(color2[35]), 
        .QN(n3309) );
  DFFRX1 color2_reg_25__0_ ( .D(n1441), .CK(clk), .RN(n3395), .Q(color2[100]), 
        .QN(n3302) );
  DFFRX1 color2_reg_1__0_ ( .D(n1465), .CK(clk), .RN(n3384), .Q(color2[4]), 
        .QN(n3300) );
  DFFRX1 color2_reg_9__1_ ( .D(n1425), .CK(clk), .RN(n3383), .Q(color2[37]), 
        .QN(n3298) );
  DFFRX1 color2_reg_0__3_ ( .D(n1370), .CK(clk), .RN(n3377), .Q(color2[3]), 
        .QN(n3137) );
  DFFRX1 color2_reg_1__3_ ( .D(n1369), .CK(clk), .RN(n3377), .Q(color2[7]), 
        .QN(n3136) );
  DFFRX1 color1_reg_0__3_ ( .D(n1247), .CK(clk), .RN(n3377), .Q(color1[3]), 
        .QN(n3124) );
  DFFRX1 color1_reg_0__0_ ( .D(n1152), .CK(clk), .RN(n3397), .Q(color1[0]), 
        .QN(n3121) );
  DFFRX1 color1_reg_9__2_ ( .D(n1207), .CK(clk), .RN(n3390), .Q(color1[38]), 
        .QN(n3226) );
  DFFRX1 color1_reg_1__3_ ( .D(n1246), .CK(clk), .RN(n3377), .Q(color1[7]), 
        .QN(n3128) );
  DFFRX1 color1_reg_25__3_ ( .D(n1222), .CK(clk), .RN(n3378), .Q(color1[103]), 
        .QN(n3113) );
  DFFRX1 color1_reg_4__0_ ( .D(n1148), .CK(clk), .RN(n3398), .Q(color1[16]), 
        .QN(n3126) );
  DFFRX1 color1_reg_20__0_ ( .D(n1132), .CK(clk), .RN(n3398), .Q(color1[80]), 
        .QN(n3238) );
  DFFRX1 color1_reg_3__0_ ( .D(n1149), .CK(clk), .RN(n3398), .Q(color1[12]), 
        .QN(n3234) );
  DFFRX1 color1_reg_12__0_ ( .D(n1140), .CK(clk), .RN(n3392), .Q(color1[48]), 
        .QN(n3116) );
  DFFRX1 color1_reg_25__0_ ( .D(n1127), .CK(clk), .RN(n3397), .Q(color1[100]), 
        .QN(n3223) );
  DFFRX1 row2_reg_22_ ( .D(n1478), .CK(clk), .RN(n3391), .Q(row2[22]), .QN(
        n3231) );
  DFFRX1 color1_reg_14__0_ ( .D(n1138), .CK(clk), .RN(n3397), .Q(color1[56]), 
        .QN(n3101) );
  DFFRX1 color2_reg_4__0_ ( .D(n1462), .CK(clk), .RN(n3384), .Q(color2[16]), 
        .QN(n3330) );
  DFFRX1 color2_reg_4__1_ ( .D(n1430), .CK(clk), .RN(n3382), .Q(color2[17]), 
        .QN(n3329) );
  DFFRX1 color1_reg_10__3_ ( .D(n1237), .CK(clk), .RN(n3379), .Q(color1[43]), 
        .QN(n3164) );
  DFFRX1 color1_reg_26__3_ ( .D(n1221), .CK(clk), .RN(n3378), .Q(color1[107]), 
        .QN(n3069) );
  DFFRX1 color1_reg_11__2_ ( .D(n1205), .CK(clk), .RN(n3389), .Q(color1[46]), 
        .QN(n3193) );
  DFFRX1 color2_reg_20__3_ ( .D(n1350), .CK(clk), .RN(n3387), .Q(color2[83]), 
        .QN(n3328) );
  DFFRX1 color2_reg_4__3_ ( .D(n1366), .CK(clk), .RN(n3392), .Q(color2[19]), 
        .QN(n3325) );
  DFFRX1 color2_reg_28__3_ ( .D(n1342), .CK(clk), .RN(n3378), .Q(color2[115]), 
        .QN(n3141) );
  DFFRX1 color2_reg_2__0_ ( .D(n1464), .CK(clk), .RN(n3385), .Q(color2[8]), 
        .QN(n3321) );
  DFFRX1 color2_reg_2__1_ ( .D(n1432), .CK(clk), .RN(n3383), .Q(color2[9]), 
        .QN(n3320) );
  DFFRX1 color2_reg_18__0_ ( .D(n1448), .CK(clk), .RN(n3396), .Q(color2[72]), 
        .QN(n3203) );
  DFFRX1 color1_reg_16__2_ ( .D(n1200), .CK(clk), .RN(n3375), .Q(color1[66]), 
        .QN(n3064) );
  DFFRX1 color1_reg_17__3_ ( .D(n1230), .CK(clk), .RN(n3380), .Q(color1[71]), 
        .QN(n3155) );
  DFFRX1 color1_reg_17__2_ ( .D(n1199), .CK(clk), .RN(n3378), .Q(color1[70]), 
        .QN(n3060) );
  DFFRX1 color2_reg_16__3_ ( .D(n1354), .CK(clk), .RN(n3377), .Q(color2[67]), 
        .QN(n3317) );
  DFFRX1 color2_reg_16__2_ ( .D(n1386), .CK(clk), .RN(n3378), .Q(color2[66]), 
        .QN(n3316) );
  DFFRX1 color2_reg_24__3_ ( .D(n1346), .CK(clk), .RN(n3378), .Q(color2[99]), 
        .QN(n3140) );
  DFFRX1 color2_reg_17__1_ ( .D(n1417), .CK(clk), .RN(n3382), .Q(color2[69]), 
        .QN(n3305) );
  DFFRX1 color2_reg_17__3_ ( .D(n1353), .CK(clk), .RN(n3382), .Q(color2[71]), 
        .QN(n3304) );
  DFFRX1 color2_reg_17__2_ ( .D(n1385), .CK(clk), .RN(n3378), .Q(color2[70]), 
        .QN(n3303) );
  DFFRX1 color2_reg_25__1_ ( .D(n1409), .CK(clk), .RN(n3384), .Q(color2[101]), 
        .QN(n3299) );
  DFFRX1 color2_reg_25__2_ ( .D(n1377), .CK(clk), .RN(n3388), .Q(color2[102]), 
        .QN(n3294) );
  DFFRX1 color2_reg_25__3_ ( .D(n1345), .CK(clk), .RN(n3378), .Q(color2[103]), 
        .QN(n3139) );
  DFFRX1 color2_reg_18__3_ ( .D(n1352), .CK(clk), .RN(n3391), .Q(color2[75]), 
        .QN(n3091) );
  DFFRX1 color2_reg_26__3_ ( .D(n1344), .CK(clk), .RN(n3378), .Q(color2[107]), 
        .QN(n3088) );
  DFFRX1 color2_reg_10__2_ ( .D(n1392), .CK(clk), .RN(n3389), .Q(color2[42]), 
        .QN(n3087) );
  DFFRX1 row2_reg_16_ ( .D(n1484), .CK(clk), .RN(n3380), .QN(n3192) );
  DFFRX1 color2_reg_2__3_ ( .D(n1368), .CK(clk), .RN(n3377), .Q(color2[11]), 
        .QN(n3138) );
  DFFRX1 color1_reg_7__0_ ( .D(n1145), .CK(clk), .RN(n3398), .Q(color1[28]), 
        .QN(n3189) );
  DFFRX1 color2_reg_13__0_ ( .D(n1453), .CK(clk), .RN(n3385), .Q(color2[52]), 
        .QN(n3186) );
  DFFRX1 color2_reg_5__3_ ( .D(n1365), .CK(clk), .RN(n3381), .Q(color2[23]), 
        .QN(n3185) );
  DFFRX1 color2_reg_5__2_ ( .D(n1397), .CK(clk), .RN(n3396), .Q(color2[22]), 
        .QN(n3183) );
  DFFRX1 color2_reg_29__3_ ( .D(n1341), .CK(clk), .RN(n3377), .Q(color2[119]), 
        .QN(n3081) );
  DFFRX1 color2_reg_20__0_ ( .D(n1446), .CK(clk), .RN(n3395), .Q(color2[80]), 
        .QN(n3290) );
  DFFRX1 color2_reg_28__0_ ( .D(n1438), .CK(clk), .RN(n3395), .Q(color2[112]), 
        .QN(n3288) );
  DFFRX1 color2_reg_12__0_ ( .D(n1454), .CK(clk), .RN(n3385), .Q(color2[48]), 
        .QN(n3287) );
  DFFRX1 color2_reg_6__2_ ( .D(n1396), .CK(clk), .RN(n3387), .Q(color2[26]), 
        .QN(n3175) );
  DFFRX1 color2_reg_7__2_ ( .D(n1395), .CK(clk), .RN(n3385), .Q(color2[30]), 
        .QN(n3042) );
  DFFRX1 color2_reg_22__0_ ( .D(n1444), .CK(clk), .RN(n3395), .Q(color2[88]), 
        .QN(n3283) );
  DFFRX1 color2_reg_14__0_ ( .D(n1452), .CK(clk), .RN(n3385), .Q(color2[56]), 
        .QN(n3280) );
  DFFRX1 color2_reg_3__3_ ( .D(n1367), .CK(clk), .RN(n3377), .Q(color2[15]), 
        .QN(n3135) );
  DFFRX1 color1_reg_23__3_ ( .D(n1224), .CK(clk), .RN(n3389), .Q(color1[95]), 
        .QN(n3171) );
  DFFRX1 color2_reg_19__2_ ( .D(n1383), .CK(clk), .RN(n3379), .Q(color2[78]), 
        .QN(n3274) );
  DFFRX1 color2_reg_27__2_ ( .D(n1375), .CK(clk), .RN(n3388), .Q(color2[110]), 
        .QN(n3271) );
  DFFRX1 color2_reg_27__3_ ( .D(n1343), .CK(clk), .RN(n3378), .Q(color2[111]), 
        .QN(n3134) );
  DFFRX1 color1_reg_7__1_ ( .D(n1177), .CK(clk), .RN(n3394), .Q(color1[29]), 
        .QN(n3169) );
  DFFRX1 color2_reg_21__1_ ( .D(n1413), .CK(clk), .RN(n3381), .Q(color2[85]), 
        .QN(n3168) );
  DFFRX1 color2_reg_13__3_ ( .D(n1357), .CK(clk), .RN(n3380), .Q(color2[55]), 
        .QN(n3166) );
  DFFRX1 color2_reg_23__3_ ( .D(n1347), .CK(clk), .RN(n3378), .Q(color2[95]), 
        .QN(n3070) );
  DFFRX1 color2_reg_15__3_ ( .D(n1355), .CK(clk), .RN(n3380), .Q(color2[63]), 
        .QN(n3041) );
  DFFRX1 color1_reg_26__1_ ( .D(n1158), .CK(clk), .RN(n3374), .Q(color1[105]), 
        .QN(n3162) );
  DFFRX1 color1_reg_10__0_ ( .D(n1142), .CK(clk), .RN(n3396), .Q(color1[40]), 
        .QN(n3161) );
  DFFRX1 color1_reg_26__0_ ( .D(n1126), .CK(clk), .RN(n3396), .Q(color1[104]), 
        .QN(n3160) );
  DFFRX1 color1_reg_5__0_ ( .D(n1147), .CK(clk), .RN(n3397), .Q(color1[20]), 
        .QN(n3066) );
  DFFRX1 color1_reg_6__1_ ( .D(n1178), .CK(clk), .RN(n3375), .Q(color1[25]), 
        .QN(n3159) );
  DFFRX1 color1_reg_6__0_ ( .D(n1146), .CK(clk), .RN(n3396), .Q(color1[24]), 
        .QN(n3033) );
  DFFRX1 color1_reg_16__1_ ( .D(n1168), .CK(clk), .RN(n3398), .Q(color1[65]), 
        .QN(n3063) );
  DFFRX1 color1_reg_17__1_ ( .D(n1167), .CK(clk), .RN(n3393), .Q(color1[69]), 
        .QN(n3059) );
  DFFRX1 color1_reg_2__3_ ( .D(n1245), .CK(clk), .RN(n3377), .Q(color1[11]), 
        .QN(n3115) );
  DFFRX1 color1_reg_2__2_ ( .D(n1214), .CK(clk), .RN(n3387), .Q(color1[10]), 
        .QN(n3114) );
  DFFRX1 color1_reg_10__1_ ( .D(n1174), .CK(clk), .RN(n3375), .Q(color1[41]), 
        .QN(n3056) );
  DFFRX1 color1_reg_13__0_ ( .D(n1139), .CK(clk), .RN(n3397), .Q(color1[52]), 
        .QN(n3052) );
  DFFRX1 color1_reg_8__3_ ( .D(n1239), .CK(clk), .RN(n3379), .Q(color1[35]), 
        .QN(n3214) );
  DFFRX1 color1_reg_24__3_ ( .D(n1223), .CK(clk), .RN(n3379), .Q(color1[99]), 
        .QN(n3107) );
  DFFRX1 color1_reg_24__2_ ( .D(n1192), .CK(clk), .RN(n3389), .Q(color1[98]), 
        .QN(n3106) );
  DFFRX1 color1_reg_8__1_ ( .D(n1176), .CK(clk), .RN(n3394), .Q(color1[33]), 
        .QN(n3212) );
  DFFRX1 color1_reg_24__1_ ( .D(n1160), .CK(clk), .RN(n3396), .Q(color1[97]), 
        .QN(n3119) );
  DFFRX1 color1_reg_8__0_ ( .D(n1144), .CK(clk), .RN(n3392), .Q(color1[32]), 
        .QN(n3211) );
  DFFRX1 color1_reg_24__0_ ( .D(n1128), .CK(clk), .RN(n3398), .Q(color1[96]), 
        .QN(n3118) );
  DFFRX1 color1_reg_9__3_ ( .D(n1238), .CK(clk), .RN(n3379), .Q(color1[39]), 
        .QN(n3208) );
  DFFRX1 color1_reg_1__2_ ( .D(n1215), .CK(clk), .RN(n3387), .Q(color1[6]), 
        .QN(n3225) );
  DFFRX1 color1_reg_25__2_ ( .D(n1191), .CK(clk), .RN(n3389), .Q(color1[102]), 
        .QN(n3227) );
  DFFRX1 color1_reg_1__1_ ( .D(n1183), .CK(clk), .RN(n3396), .Q(color1[5]), 
        .QN(n3111) );
  DFFRX1 color1_reg_9__1_ ( .D(n1175), .CK(clk), .RN(n3395), .Q(color1[37]), 
        .QN(n3112) );
  DFFRX1 color1_reg_25__1_ ( .D(n1159), .CK(clk), .RN(n3394), .Q(color1[101]), 
        .QN(n3224) );
  DFFRX1 color1_reg_1__0_ ( .D(n1151), .CK(clk), .RN(n3397), .Q(color1[4]), 
        .QN(n3221) );
  DFFRX1 color1_reg_9__0_ ( .D(n1143), .CK(clk), .RN(n3397), .Q(color1[36]), 
        .QN(n3222) );
  DFFRX1 counter_cal_reg_8_ ( .D(n1518), .CK(clk), .RN(n3385), .Q(
        counter_cal[8]), .QN(n3083) );
  DFFRX1 color1_reg_3__2_ ( .D(n1213), .CK(clk), .RN(n3387), .Q(color1[14]), 
        .QN(n3236) );
  DFFRX1 color1_reg_30__3_ ( .D(n1217), .CK(clk), .RN(n3378), .Q(color1[123]), 
        .QN(n3105) );
  DFFRX1 color1_reg_15__2_ ( .D(n1201), .CK(clk), .RN(n3390), .Q(color1[62]), 
        .QN(n3084) );
  DFFRX1 color1_reg_21__2_ ( .D(n1195), .CK(clk), .RN(n3386), .Q(color1[86]), 
        .QN(n3190) );
  DFFRX1 color1_reg_13__1_ ( .D(n1171), .CK(clk), .RN(n3399), .Q(color1[53]), 
        .QN(n3044) );
  DFFRX1 table1_reg_3__3_ ( .D(n1285), .CK(clk), .RN(n3392), .Q(table1[11]), 
        .QN(n3150) );
  DFFRX1 color1_reg_23__2_ ( .D(n1193), .CK(clk), .RN(n3386), .Q(color1[94]), 
        .QN(n3080) );
  DFFRX1 table1_reg_8__2_ ( .D(n1304), .CK(clk), .RN(n3393), .Q(table1[30]), 
        .QN(n3350) );
  DFFRX1 color1_reg_20__3_ ( .D(n1227), .CK(clk), .RN(n3386), .Q(color1[83]), 
        .QN(n3219) );
  DFFRX1 color1_reg_20__2_ ( .D(n1196), .CK(clk), .RN(n3386), .Q(color1[82]), 
        .QN(n3218) );
  DFFRX1 color1_reg_22__2_ ( .D(n1194), .CK(clk), .RN(n3396), .Q(color1[90]), 
        .QN(n3217) );
  DFFRX1 color1_reg_30__2_ ( .D(n1186), .CK(clk), .RN(n3388), .Q(color1[122]), 
        .QN(n3104) );
  DFFRX1 color1_reg_30__1_ ( .D(n1154), .CK(clk), .RN(n3374), .Q(color1[121]), 
        .QN(n3103) );
  DFFRX1 color1_reg_4__3_ ( .D(n1243), .CK(clk), .RN(n3381), .Q(color1[19]), 
        .QN(n3127) );
  DFFRX1 color1_reg_4__2_ ( .D(n1212), .CK(clk), .RN(n3387), .Q(color1[18]), 
        .QN(n3241) );
  DFFRX1 table1_reg_12__2_ ( .D(n1308), .CK(clk), .RN(n3393), .Q(table1[46]), 
        .QN(n3334) );
  DFFRX1 table1_reg_3__2_ ( .D(n1299), .CK(clk), .RN(n3393), .Q(table1[10]), 
        .QN(n3362) );
  DFFRX1 color1_reg_19__2_ ( .D(n1197), .CK(clk), .RN(n3375), .Q(color1[78]), 
        .QN(n3072) );
  DFFRX1 color1_reg_19__3_ ( .D(n1228), .CK(clk), .RN(n3380), .Q(color1[79]), 
        .QN(n3165) );
  DFFRX1 color1_reg_12__3_ ( .D(n1235), .CK(clk), .RN(n3380), .Q(color1[51]), 
        .QN(n3117) );
  DFFRX1 table1_reg_7__3_ ( .D(n1289), .CK(clk), .RN(n3392), .Q(table1[27]), 
        .QN(n3148) );
  DFFRX1 color1_reg_14__3_ ( .D(n1233), .CK(clk), .RN(n3379), .Q(color1[59]), 
        .QN(n3210) );
  DFFRX1 table1_reg_7__2_ ( .D(n1303), .CK(clk), .RN(n3393), .Q(table1[26]), 
        .QN(n3353) );
  DFFRX1 color1_reg_12__2_ ( .D(n1204), .CK(clk), .RN(n3390), .Q(color1[50]), 
        .QN(n3233) );
  DFFRX1 color1_reg_12__1_ ( .D(n1172), .CK(clk), .RN(n3395), .Q(color1[49]), 
        .QN(n3232) );
  DFFRX1 color1_reg_14__2_ ( .D(n1202), .CK(clk), .RN(n3390), .Q(color1[58]), 
        .QN(n3049) );
  DFFRX1 color1_reg_14__1_ ( .D(n1170), .CK(clk), .RN(n3375), .Q(color1[57]), 
        .QN(n3100) );
  DFFRX1 table1_reg_12__3_ ( .D(n1294), .CK(clk), .RN(n3392), .Q(table1[47]), 
        .QN(n3142) );
  DFFRX1 color1_reg_19__1_ ( .D(n1165), .CK(clk), .RN(n3397), .Q(color1[77]), 
        .QN(n1590) );
  DFFRX1 color1_reg_27__0_ ( .D(n1125), .CK(clk), .RN(n3398), .Q(color1[108]), 
        .QN(n3067) );
  DFFRX1 color2_reg_8__0_ ( .D(n1458), .CK(clk), .RN(n3394), .Q(color2[32]), 
        .QN(n3314) );
  DFFRX1 color1_reg_18__0_ ( .D(n1134), .CK(clk), .RN(n3396), .Q(color1[72]), 
        .QN(n3061) );
  DFFRX1 color1_reg_31__1_ ( .D(n1153), .CK(clk), .RN(n3393), .Q(color1[125]), 
        .QN(n1606) );
  DFFRX1 color1_reg_23__0_ ( .D(n1129), .CK(clk), .RN(n3397), .Q(color1[92]), 
        .QN(n1602) );
  DFFRX1 color1_reg_21__0_ ( .D(n1131), .CK(clk), .RN(n3397), .Q(color1[84]), 
        .QN(n1601) );
  DFFRX1 color1_reg_21__1_ ( .D(n1163), .CK(clk), .RN(n3400), .Q(color1[85]), 
        .QN(n1589) );
  DFFRX2 sram_a_reg_3_ ( .D(n1276), .CK(clk), .RN(n3380), .Q(n3407), .QN(n1584) );
  DFFRX1 sram_a_reg_7_ ( .D(n1272), .CK(clk), .RN(n3389), .Q(n3403), .QN(n1582) );
  DFFRX1 sram_a_reg_5_ ( .D(n1274), .CK(clk), .RN(n3382), .Q(n3405), .QN(n1580) );
  DFFRX1 sram_a_reg_6_ ( .D(n1273), .CK(clk), .RN(n3387), .Q(n3404), .QN(n1578) );
  DFFRX2 sram_a_reg_2_ ( .D(n1277), .CK(clk), .RN(n3384), .Q(n3408), .QN(n1574) );
  DFFRX2 sram_d_reg_2_ ( .D(n1267), .CK(clk), .RN(n3387), .Q(n3413), .QN(n1570) );
  DFFRX2 sram_d_reg_1_ ( .D(n1268), .CK(clk), .RN(n3391), .Q(n3414), .QN(n1568) );
  DFFRX1 sram_a_reg_9_ ( .D(n1270), .CK(clk), .RN(n3383), .Q(n3401), .QN(n3243) );
  DFFRX2 sram_a_reg_4_ ( .D(n1275), .CK(clk), .RN(n3386), .Q(n3406), .QN(n3244) );
  DFFRX2 sram_a_reg_0_ ( .D(n1279), .CK(clk), .RN(n3391), .Q(n3410), .QN(n3242) );
  DFFRX1 sram_a_reg_1_ ( .D(n1278), .CK(clk), .RN(n3382), .Q(n3409), .QN(n3245) );
  EDFFHQX1 rom_a_reg_6_ ( .D(n1608), .E(N1603), .CK(clk), .Q(n3024) );
  DFFRX1 finish_reg ( .D(n1255), .CK(clk), .RN(n3390), .Q(n3416), .QN(n1560)
         );
  DFFRX2 round2_reg_5_ ( .D(n1260), .CK(clk), .RN(n3383), .Q(round2[5]), .QN(
        n3252) );
  EDFFXL rom_a_reg_1_ ( .D(counter_read[1]), .E(N1603), .CK(clk), .QN(n1549)
         );
  EDFFXL rom_a_reg_2_ ( .D(counter_read[2]), .E(N1603), .CK(clk), .QN(n1550)
         );
  EDFFXL rom_a_reg_3_ ( .D(counter_read[3]), .E(N1603), .CK(clk), .QN(n1551)
         );
  EDFFXL rom_a_reg_4_ ( .D(counter_read[4]), .E(N1603), .CK(clk), .QN(n1552)
         );
  EDFFXL rom_a_reg_5_ ( .D(counter_read[5]), .E(N1603), .CK(clk), .QN(n1553)
         );
  EDFFXL rom_a_reg_0_ ( .D(counter_read[0]), .E(N1603), .CK(clk), .QN(n1548)
         );
  DFFSX2 round2_reg_3_ ( .D(n1258), .CK(clk), .SN(n3399), .Q(round2[3]), .QN(
        n3265) );
  DFFRX2 sram_a_reg_8_ ( .D(n1271), .CK(clk), .RN(n3388), .Q(n3402), .QN(n1576) );
  DFFRX1 color1_reg_8__2_ ( .D(n1208), .CK(clk), .RN(n3389), .Q(color1[34]), 
        .QN(n3213) );
  DFFRX1 color1_reg_18__2_ ( .D(n1198), .CK(clk), .RN(n3377), .Q(color1[74]), 
        .QN(n3031) );
  DFFRX1 color1_reg_11__1_ ( .D(n1173), .CK(clk), .RN(n3395), .Q(color1[45]), 
        .QN(n3172) );
  DFFRX1 color1_reg_15__1_ ( .D(n1169), .CK(clk), .RN(n3399), .Q(color1[61]), 
        .QN(n3191) );
  DFFRX1 color1_reg_18__1_ ( .D(n1166), .CK(clk), .RN(n3374), .Q(color1[73]), 
        .QN(n3062) );
  DFFRX1 color1_reg_23__1_ ( .D(n1161), .CK(clk), .RN(n3396), .Q(color1[93]), 
        .QN(n3181) );
  DFFRX1 color1_reg_29__1_ ( .D(n1155), .CK(clk), .RN(n3398), .Q(color1[117]), 
        .QN(n3182) );
  DFFRX1 color1_reg_11__0_ ( .D(n1141), .CK(clk), .RN(n3398), .Q(color1[44]), 
        .QN(n3055) );
  DFFRX1 color1_reg_16__0_ ( .D(n1136), .CK(clk), .RN(n3398), .Q(color1[64]), 
        .QN(n3085) );
  DFFRX1 color1_reg_19__0_ ( .D(n1133), .CK(clk), .RN(n3398), .Q(color1[76]), 
        .QN(n3156) );
  DFFRX1 color1_reg_31__0_ ( .D(n1121), .CK(clk), .RN(n3398), .Q(color1[124]), 
        .QN(n3152) );
  EDFFXL colornow_reg_3_ ( .D(N922), .E(N1499), .CK(clk), .Q(colornow[3]) );
  EDFFXL colornow_reg_1_ ( .D(N920), .E(N1499), .CK(clk), .Q(colornow[1]) );
  EDFFXL colornow_reg_0_ ( .D(N919), .E(N1499), .CK(clk), .Q(colornow[0]) );
  DFFRX1 en_read2_reg ( .D(n1505), .CK(clk), .RN(n3385), .Q(en_read2), .QN(
        n3258) );
  DFFRX1 round2_reg_8_ ( .D(n1263), .CK(clk), .RN(n3381), .Q(round2[8]), .QN(
        n3266) );
  DFFRHQX4 counter_row_reg_1_ ( .D(n3025), .CK(clk), .RN(n3399), .Q(n3371) );
  DFFSX2 round2_reg_4_ ( .D(n1259), .CK(clk), .SN(n3399), .Q(round2[4]), .QN(
        n3267) );
  DFFSX2 round2_reg_0_ ( .D(n1264), .CK(clk), .SN(n3399), .Q(N1516), .QN(n3270) );
  DFFRX1 table1_reg_9__3_ ( .D(n1291), .CK(clk), .RN(n3392), .Q(table1[35]), 
        .QN(n3146) );
  DFFRX2 sram_d_reg_3_ ( .D(n1266), .CK(clk), .RN(n3389), .Q(n3412), .QN(n1572) );
  DFFRX1 color1_reg_27__1_ ( .D(n1157), .CK(clk), .RN(n3397), .Q(color1[109]), 
        .QN(n3068) );
  DFFRX1 color1_reg_17__0_ ( .D(n1135), .CK(clk), .RN(n3397), .Q(color1[68]), 
        .QN(n3058) );
  DFFRX1 color1_reg_15__0_ ( .D(n1137), .CK(clk), .RN(n3397), .Q(color1[60]), 
        .QN(n3158) );
  DFFRX1 color1_reg_29__0_ ( .D(n1123), .CK(clk), .RN(n3397), .Q(color1[116]), 
        .QN(n3053) );
  DFFRX1 table1_reg_4__3_ ( .D(n1286), .CK(clk), .RN(n3391), .Q(table1[15]), 
        .QN(n3349) );
  DFFRX1 table1_reg_5__3_ ( .D(n1287), .CK(clk), .RN(n3392), .Q(table1[19]), 
        .QN(n3145) );
  DFFRX1 table1_reg_1__3_ ( .D(n1283), .CK(clk), .RN(n3392), .Q(table1[3]), 
        .QN(n3144) );
  DFFRX1 table1_reg_8__3_ ( .D(n1290), .CK(clk), .RN(n3392), .Q(table1[31]), 
        .QN(n3143) );
  DFFRX1 table1_reg_3__1_ ( .D(n1313), .CK(clk), .RN(n3384), .Q(table1[9]), 
        .QN(n3364) );
  DFFRX2 sram_d_reg_0_ ( .D(n1269), .CK(clk), .RN(n3386), .Q(n3415), .QN(n1566) );
  MXI2X1 U1538 ( .A(n3290), .B(n2961), .S0(n2963), .Y(n1446) );
  MXI2X1 U1539 ( .A(n3289), .B(n2964), .S0(n2963), .Y(n1414) );
  MXI2X1 U1540 ( .A(n3090), .B(n2920), .S0(n2932), .Y(n1384) );
  CLKBUFX3 U1541 ( .A(n2866), .Y(n2960) );
  CLKBUFX8 U1542 ( .A(n2867), .Y(n2868) );
  CLKBUFX8 U1543 ( .A(n2867), .Y(n2869) );
  BUFX4 U1544 ( .A(n2853), .Y(n2887) );
  BUFX4 U1545 ( .A(n2898), .Y(n2906) );
  NOR2X1 U1546 ( .A(n3019), .B(n3261), .Y(n3021) );
  CLKBUFX3 U1547 ( .A(n3000), .Y(n3004) );
  INVX8 U1548 ( .A(N919), .Y(n2937) );
  INVX1 U1549 ( .A(n3011), .Y(n3010) );
  NOR2X4 U1550 ( .A(n2691), .B(n2655), .Y(n2670) );
  BUFX2 U1551 ( .A(n2904), .Y(n1547) );
  NOR2BX2 U1552 ( .AN(n2901), .B(n2900), .Y(n2916) );
  NOR2X2 U1553 ( .A(n2896), .B(n2965), .Y(n2918) );
  INVX8 U1554 ( .A(N920), .Y(n2898) );
  NAND2X2 U1555 ( .A(n2772), .B(n3262), .Y(n2894) );
  NOR2X1 U1556 ( .A(n2857), .B(n3247), .Y(n2410) );
  XOR2X1 U1557 ( .A(n2427), .B(round2[9]), .Y(n2430) );
  INVXL U1558 ( .A(n2912), .Y(n2902) );
  AND2X6 U1559 ( .A(n2696), .B(n2695), .Y(n2710) );
  NOR2X1 U1560 ( .A(n2728), .B(n2793), .Y(n2707) );
  NAND2X2 U1561 ( .A(n2900), .B(n2799), .Y(n2913) );
  NAND2X2 U1562 ( .A(n2421), .B(n2975), .Y(n2872) );
  OR2X1 U1563 ( .A(n2883), .B(round2[8]), .Y(n2428) );
  NOR2X1 U1564 ( .A(n2661), .B(n2665), .Y(n2702) );
  NOR2X6 U1565 ( .A(n2402), .B(n3132), .Y(n2891) );
  NOR2X2 U1566 ( .A(n3246), .B(n3012), .Y(n3011) );
  NOR2X2 U1567 ( .A(pixel_cal[1]), .B(n3012), .Y(n3007) );
  NAND3X1 U1568 ( .A(n3014), .B(pixel_cal[1]), .C(n3017), .Y(n3008) );
  INVX3 U1569 ( .A(n2421), .Y(n2424) );
  NAND2X6 U1570 ( .A(n2853), .B(n3132), .Y(n2857) );
  INVX1 U1571 ( .A(n2793), .Y(n2660) );
  INVX1 U1572 ( .A(n2631), .Y(n2632) );
  NAND3X1 U1573 ( .A(n3037), .B(counter_pixel[0]), .C(counter_pixel[2]), .Y(
        n3014) );
  INVX2 U1574 ( .A(n2439), .Y(n2783) );
  NOR2X4 U1575 ( .A(n2613), .B(n2612), .Y(n2748) );
  AND2X6 U1576 ( .A(n2505), .B(n2513), .Y(n2506) );
  INVX6 U1577 ( .A(n2647), .Y(n2285) );
  INVX8 U1578 ( .A(n2975), .Y(n2965) );
  NAND3X1 U1579 ( .A(n2623), .B(n2622), .C(n2621), .Y(n2626) );
  AO22X2 U1580 ( .A0(n2618), .A1(table1[22]), .B0(n2620), .B1(table1[26]), .Y(
        n2570) );
  NOR2X2 U1581 ( .A(n2468), .B(n2467), .Y(n2469) );
  NAND3X6 U1582 ( .A(n2464), .B(n2463), .C(n2462), .Y(n2465) );
  MXI2X2 U1583 ( .A(table1[48]), .B(table1[52]), .S0(n2641), .Y(n2480) );
  OR2X6 U1584 ( .A(n2459), .B(n2556), .Y(n2463) );
  OR2X1 U1585 ( .A(n2807), .B(round2[2]), .Y(n2817) );
  CLKINVX1 U1586 ( .A(n2472), .Y(n2473) );
  BUFX2 U1587 ( .A(n2642), .Y(n1536) );
  INVX8 U1588 ( .A(n2556), .Y(n2458) );
  ADDHXL U1589 ( .A(round2[1]), .B(N1516), .CO(n2808), .S(n2804) );
  INVX3 U1590 ( .A(n2552), .Y(n2544) );
  CLKAND2X3 U1591 ( .A(n2553), .B(table1[39]), .Y(n1597) );
  INVX4 U1592 ( .A(n2552), .Y(n2534) );
  BUFX6 U1593 ( .A(n2523), .Y(n1544) );
  INVX12 U1594 ( .A(n2550), .Y(n2540) );
  OAI21X1 U1595 ( .A0(n2443), .A1(n2494), .B0(n2495), .Y(n1677) );
  NOR3X1 U1596 ( .A(n1842), .B(n1841), .C(n1840), .Y(n1843) );
  NAND2X1 U1597 ( .A(n2346), .B(n2368), .Y(n2363) );
  NAND2X1 U1598 ( .A(n2299), .B(n2368), .Y(n2319) );
  NAND2X1 U1599 ( .A(n2369), .B(n2368), .Y(n2396) );
  NAND2X1 U1600 ( .A(n2337), .B(n2391), .Y(n2338) );
  INVX6 U1601 ( .A(n2563), .Y(n2675) );
  INVX1 U1602 ( .A(n2493), .Y(n1638) );
  NAND4BBX1 U1603 ( .AN(n1827), .BN(n1826), .C(n1825), .D(n1824), .Y(n1828) );
  NAND4X1 U1604 ( .A(n2323), .B(n2322), .C(n2321), .D(n2320), .Y(n2324) );
  NAND3X1 U1605 ( .A(n2336), .B(n2335), .C(n2334), .Y(n2337) );
  NOR2X4 U1606 ( .A(n2563), .B(n2562), .Y(n2597) );
  OAI22XL U1607 ( .A0(n2271), .A1(n3120), .B0(n2266), .B1(n3239), .Y(n1773) );
  OAI22XL U1608 ( .A0(n3055), .A1(n2905), .B0(n1545), .B1(n3161), .Y(n1804) );
  NAND2X4 U1609 ( .A(n1663), .B(n1675), .Y(n2492) );
  AOI2BB2X1 U1610 ( .B0(n2908), .B1(color2[78]), .A0N(n1884), .A1N(n3090), .Y(
        n1654) );
  AOI2BB2X2 U1611 ( .B0(n2205), .B1(n2250), .A0N(n1543), .A1N(n3123), .Y(n2231) );
  NAND2X1 U1612 ( .A(n2378), .B(table1[12]), .Y(n2327) );
  NOR2X8 U1613 ( .A(n2292), .B(data[2]), .Y(n2293) );
  AND2X6 U1614 ( .A(n1676), .B(n1662), .Y(n2489) );
  INVX4 U1615 ( .A(n1610), .Y(n2379) );
  INVX4 U1616 ( .A(n1610), .Y(n2386) );
  INVX6 U1617 ( .A(n2300), .Y(n2378) );
  OAI22XL U1618 ( .A0(n3073), .A1(n1896), .B0(n2911), .B1(n3028), .Y(n1876) );
  OAI22XL U1619 ( .A0(n3029), .A1(n1896), .B0(n2911), .B1(n3157), .Y(n1888) );
  OAI22XL U1620 ( .A0(n2905), .A1(n1599), .B0(n1545), .B1(n1598), .Y(n1695) );
  INVX8 U1621 ( .A(n2562), .Y(n2743) );
  INVX4 U1622 ( .A(n2300), .Y(n2370) );
  NAND2X4 U1623 ( .A(n2013), .B(n2012), .Y(n2014) );
  AOI22X1 U1624 ( .A0(n2917), .A1(color2[56]), .B0(n2903), .B1(color2[48]), 
        .Y(n1693) );
  OAI22XL U1625 ( .A0(n2426), .A1(n3093), .B0(n1727), .B1(n3199), .Y(n1714) );
  NAND2X4 U1626 ( .A(n2154), .B(n2278), .Y(n2155) );
  NOR2X1 U1627 ( .A(n2235), .B(n2234), .Y(n2239) );
  NOR2X1 U1628 ( .A(n2199), .B(n2198), .Y(n2203) );
  NOR2X1 U1629 ( .A(n2207), .B(n2206), .Y(n2211) );
  NOR2X1 U1630 ( .A(n2273), .B(n2272), .Y(n2274) );
  NOR2X1 U1631 ( .A(n2260), .B(n2259), .Y(n2261) );
  NOR2X1 U1632 ( .A(n2216), .B(n2215), .Y(n2217) );
  NAND2XL U1633 ( .A(n2908), .B(color2[15]), .Y(n1631) );
  OAI22X1 U1634 ( .A0(n2268), .A1(n3107), .B0(n2267), .B1(n3219), .Y(n2276) );
  NOR2X1 U1635 ( .A(n2223), .B(n2222), .Y(n2225) );
  BUFX8 U1636 ( .A(n1681), .Y(n2897) );
  INVX2 U1637 ( .A(n1675), .Y(n1662) );
  NAND2X4 U1638 ( .A(n2076), .B(n2241), .Y(n2119) );
  NAND2X1 U1639 ( .A(n2109), .B(color1[113]), .Y(n1977) );
  NAND2X4 U1640 ( .A(n2097), .B(n2278), .Y(n2117) );
  NOR2X1 U1641 ( .A(n2270), .B(n3233), .Y(n2223) );
  NOR2X1 U1642 ( .A(n2270), .B(n3117), .Y(n2273) );
  NOR2X1 U1643 ( .A(n2271), .B(n3241), .Y(n2222) );
  NOR2X1 U1644 ( .A(n2271), .B(n3127), .Y(n2272) );
  OAI22X1 U1645 ( .A0(n2796), .A1(n3153), .B0(n2267), .B1(n3080), .Y(n2198) );
  OAI22X1 U1646 ( .A0(n2796), .A1(n3104), .B0(n2267), .B1(n3217), .Y(n2215) );
  OAI22X1 U1647 ( .A0(n2796), .A1(n3054), .B0(n2267), .B1(n3190), .Y(n2208) );
  NOR2X1 U1648 ( .A(n2266), .B(n3208), .Y(n2236) );
  NOR2X1 U1649 ( .A(n2266), .B(n3193), .Y(n2200) );
  NOR2X1 U1650 ( .A(n2252), .B(n3128), .Y(n2232) );
  OAI22X1 U1651 ( .A0(n2245), .A1(n3031), .B0(n2268), .B1(n3163), .Y(n2216) );
  OAI22X1 U1652 ( .A0(n2245), .A1(n3072), .B0(n2268), .B1(n3038), .Y(n2199) );
  OAI22X1 U1653 ( .A0(n2245), .A1(n3165), .B0(n2268), .B1(n3039), .Y(n2247) );
  OAI22X1 U1654 ( .A0(n2271), .A1(n3034), .B0(n2266), .B1(n3026), .Y(n2213) );
  OAI22X1 U1655 ( .A0(n2266), .A1(n3213), .B0(n2245), .B1(n3064), .Y(n2221) );
  OAI22X1 U1656 ( .A0(n2271), .A1(n3027), .B0(n2266), .B1(n3040), .Y(n2243) );
  OAI22X1 U1657 ( .A0(n2258), .A1(n3106), .B0(n2267), .B1(n3218), .Y(n2220) );
  NOR2X1 U1658 ( .A(n2255), .B(n3170), .Y(n2237) );
  OAI22X1 U1659 ( .A0(n2265), .A1(n3155), .B0(n2258), .B1(n3113), .Y(n2235) );
  NOR2X1 U1660 ( .A(n2253), .B(n3157), .Y(n2233) );
  NAND4X2 U1661 ( .A(n2010), .B(n2009), .C(n2008), .D(n2007), .Y(n2011) );
  OAI22X1 U1662 ( .A0(n2270), .A1(n3049), .B0(n2252), .B1(n3114), .Y(n2214) );
  INVX8 U1663 ( .A(n2437), .Y(n2915) );
  INVX8 U1664 ( .A(n2435), .Y(n1856) );
  AND2X6 U1665 ( .A(n1774), .B(n1625), .Y(n1586) );
  NAND2X1 U1666 ( .A(n2109), .B(color1[121]), .Y(n2008) );
  NAND2X1 U1667 ( .A(n2110), .B(color1[89]), .Y(n2007) );
  NAND2XL U1668 ( .A(n2109), .B(color1[124]), .Y(n1954) );
  NAND2X1 U1669 ( .A(n2083), .B(color1[85]), .Y(n1985) );
  NOR2X1 U1670 ( .A(n2069), .B(n3063), .Y(n1974) );
  NOR2X4 U1671 ( .A(n2081), .B(n2080), .Y(n2087) );
  NOR2X2 U1672 ( .A(n2071), .B(n2070), .Y(n2075) );
  NAND2X1 U1673 ( .A(n2110), .B(color1[90]), .Y(n2111) );
  NAND2X1 U1674 ( .A(n2026), .B(color1[97]), .Y(n1971) );
  NAND2XL U1675 ( .A(n2110), .B(color1[80]), .Y(n1940) );
  OAI22X1 U1676 ( .A0(n2796), .A1(n3152), .B0(n2267), .B1(n1602), .Y(n2123) );
  NOR2X1 U1677 ( .A(n2254), .B(n3055), .Y(n2126) );
  OAI22X1 U1678 ( .A0(n2245), .A1(n3156), .B0(n2268), .B1(n3067), .Y(n2124) );
  OAI22X2 U1679 ( .A0(n2255), .A1(n3033), .B0(n2266), .B1(n3161), .Y(n2133) );
  NOR2X1 U1680 ( .A(n2252), .B(n3234), .Y(n2121) );
  INVX6 U1681 ( .A(n2796), .Y(n2269) );
  INVX6 U1682 ( .A(n2250), .Y(n2795) );
  NAND2X1 U1683 ( .A(n2110), .B(color1[83]), .Y(n2033) );
  NAND2XL U1684 ( .A(n2099), .B(color1[46]), .Y(n2090) );
  NAND2X1 U1685 ( .A(n2098), .B(color1[12]), .Y(n1949) );
  NOR2X1 U1686 ( .A(n2104), .B(n3061), .Y(n1960) );
  BUFX12 U1687 ( .A(n1739), .Y(n1625) );
  NOR2X1 U1688 ( .A(n2252), .B(n3235), .Y(n2159) );
  BUFX8 U1689 ( .A(n2125), .Y(n2266) );
  BUFX6 U1690 ( .A(n2125), .Y(n2254) );
  INVX16 U1691 ( .A(n1742), .Y(n2267) );
  INVX6 U1692 ( .A(n1939), .Y(n2083) );
  BUFX8 U1693 ( .A(n1775), .Y(n2252) );
  NAND2X1 U1694 ( .A(n2099), .B(color1[42]), .Y(n2102) );
  NAND2X1 U1695 ( .A(n2065), .B(color1[36]), .Y(n1913) );
  INVX8 U1696 ( .A(n1756), .Y(n2258) );
  NAND2X1 U1697 ( .A(n2098), .B(color1[6]), .Y(n2078) );
  NAND2X1 U1698 ( .A(n2098), .B(color1[4]), .Y(n1914) );
  NAND3BX2 U1699 ( .AN(n2030), .B(n2029), .C(n2028), .Y(n2032) );
  INVX4 U1700 ( .A(n1540), .Y(n1541) );
  BUFX16 U1701 ( .A(n1923), .Y(n2107) );
  INVX4 U1702 ( .A(n1950), .Y(n2069) );
  INVX6 U1703 ( .A(n1741), .Y(n1742) );
  INVX4 U1704 ( .A(n1746), .Y(n1778) );
  INVX8 U1705 ( .A(n2263), .Y(n1540) );
  INVX4 U1706 ( .A(n2120), .Y(n2132) );
  NAND2X1 U1707 ( .A(n2026), .B(color1[99]), .Y(n2029) );
  OR2X4 U1708 ( .A(n1924), .B(n1928), .Y(n1926) );
  AND2X6 U1709 ( .A(n2973), .B(n1917), .Y(n1950) );
  NOR2X4 U1710 ( .A(n2973), .B(n1920), .Y(n2082) );
  INVX16 U1711 ( .A(n1910), .Y(n2098) );
  NAND2BX2 U1712 ( .AN(n2900), .B(n1745), .Y(n1746) );
  NOR2X4 U1713 ( .A(n2973), .B(n1922), .Y(n1923) );
  NOR2X6 U1714 ( .A(n2896), .B(n1921), .Y(n2100) );
  INVX8 U1715 ( .A(n2027), .Y(n1910) );
  BUFX6 U1716 ( .A(n1921), .Y(n1925) );
  INVX4 U1717 ( .A(n3370), .Y(n2425) );
  BUFX16 U1718 ( .A(counter_row[4]), .Y(n2900) );
  BUFX6 U1719 ( .A(n1613), .Y(n1623) );
  AND2X6 U1720 ( .A(n3372), .B(n3373), .Y(n1616) );
  BUFX12 U1721 ( .A(n3372), .Y(n1624) );
  INVX6 U1722 ( .A(n3371), .Y(n1613) );
  OAI22X1 U1723 ( .A0(n2265), .A1(n3030), .B0(n2258), .B1(n3069), .Y(n2260) );
  CLKINVX1 U1724 ( .A(n2270), .Y(n1779) );
  OAI22X1 U1725 ( .A0(n2253), .A1(n3045), .B0(n2252), .B1(n3225), .Y(n2207) );
  NOR2X1 U1726 ( .A(n2237), .B(n2236), .Y(n2238) );
  NOR2XL U1727 ( .A(n1782), .B(n1781), .Y(n1783) );
  AOI2BB2X1 U1728 ( .B0(n2908), .B1(color2[79]), .A0N(n1884), .A1N(n3091), .Y(
        n1659) );
  NAND3XL U1729 ( .A(n1702), .B(n1701), .C(n1700), .Y(n1705) );
  OA22X2 U1730 ( .A0(n2569), .A1(n2600), .B0(n2568), .B1(n2624), .Y(n2573) );
  NAND4X4 U1731 ( .A(n1535), .B(n2096), .C(n2095), .D(n2094), .Y(n2097) );
  NAND2X2 U1732 ( .A(n2146), .B(n2241), .Y(n2156) );
  INVX12 U1733 ( .A(n2433), .Y(n1897) );
  NAND2XL U1734 ( .A(n2370), .B(table1[15]), .Y(n2349) );
  NAND3XL U1735 ( .A(n1839), .B(n1838), .C(n1837), .Y(n1842) );
  INVX8 U1736 ( .A(n1540), .Y(n1542) );
  AND2X1 U1737 ( .A(n2728), .B(n2660), .Y(n2718) );
  INVX3 U1738 ( .A(n2870), .Y(n2790) );
  INVX6 U1739 ( .A(n2435), .Y(n2909) );
  AOI22XL U1740 ( .A0(n2886), .A1(sram_wen), .B0(n2885), .B1(n2884), .Y(n2888)
         );
  NAND2XL U1741 ( .A(n3020), .B(counter_read[4]), .Y(n3019) );
  NOR2XL U1742 ( .A(n2967), .B(n3083), .Y(n2968) );
  NAND2XL U1743 ( .A(n3010), .B(row2[28]), .Y(n2985) );
  NOR2X1 U1744 ( .A(n3015), .B(pixel_cal[0]), .Y(n3017) );
  INVXL U1745 ( .A(n1615), .Y(n3025) );
  MXI2X1 U1746 ( .A(n2927), .B(n3175), .S0(n2926), .Y(n1396) );
  MXI2X1 U1747 ( .A(n3305), .B(n2964), .S0(n2962), .Y(n1417) );
  MXI2X1 U1748 ( .A(n3327), .B(n2920), .S0(n2963), .Y(n1382) );
  AOI21XL U1749 ( .A0(n3019), .A1(n3261), .B0(n3021), .Y(n1250) );
  INVXL U1750 ( .A(n2851), .Y(n1266) );
  NAND2X2 U1751 ( .A(n2904), .B(n2915), .Y(n2866) );
  CLKBUFX8 U1752 ( .A(n2866), .Y(n2867) );
  CLKBUFX3 U1753 ( .A(n2866), .Y(n2910) );
  CLKBUFX3 U1754 ( .A(n2866), .Y(n2930) );
  NAND4X6 U1755 ( .A(n2058), .B(n2059), .C(n2057), .D(n2056), .Y(n2060) );
  BUFX16 U1756 ( .A(n2099), .Y(n2065) );
  BUFX16 U1757 ( .A(n2456), .Y(n2782) );
  BUFX12 U1758 ( .A(n2907), .Y(n2914) );
  BUFX12 U1759 ( .A(n2907), .Y(n2919) );
  NOR2X6 U1760 ( .A(n2691), .B(n2652), .Y(n2663) );
  NAND2X4 U1761 ( .A(n2115), .B(n2250), .Y(n2116) );
  NAND2X2 U1762 ( .A(n1989), .B(n1542), .Y(n1990) );
  NAND2X4 U1763 ( .A(n2025), .B(n1542), .Y(n2039) );
  NOR2X2 U1764 ( .A(n1984), .B(n1983), .Y(n1988) );
  INVX3 U1765 ( .A(n2682), .Y(n2784) );
  INVX12 U1766 ( .A(n2402), .Y(n2853) );
  INVX1 U1767 ( .A(n2492), .Y(n1637) );
  INVX6 U1768 ( .A(n2567), .Y(n2725) );
  INVX6 U1769 ( .A(n2566), .Y(n2786) );
  NAND3X2 U1770 ( .A(n1674), .B(n1673), .C(n1672), .Y(n2494) );
  NOR3X1 U1771 ( .A(n2981), .B(n2970), .C(n3259), .Y(n2971) );
  BUFX12 U1772 ( .A(n2100), .Y(n2026) );
  NOR2BX2 U1773 ( .AN(n2799), .B(n2900), .Y(n2904) );
  INVX3 U1774 ( .A(n3008), .Y(n3009) );
  NAND4X1 U1775 ( .A(n2776), .B(n2840), .C(n2890), .D(n3196), .Y(n2837) );
  INVX3 U1776 ( .A(n3007), .Y(n3006) );
  INVX3 U1777 ( .A(n2970), .Y(n2776) );
  NAND2X4 U1778 ( .A(n1745), .B(n2900), .Y(n1741) );
  INVX1 U1779 ( .A(n2982), .Y(n2873) );
  INVX12 U1780 ( .A(n1613), .Y(n1905) );
  INVX3 U1781 ( .A(sram_wen), .Y(n2884) );
  NOR2X1 U1782 ( .A(round2[2]), .B(round2[1]), .Y(n2287) );
  INVX4 U1783 ( .A(data[3]), .Y(n2306) );
  BUFX8 U1784 ( .A(round1), .Y(n2854) );
  INVX16 U1785 ( .A(n2736), .Y(n2769) );
  BUFX8 U1786 ( .A(n2925), .Y(n2922) );
  BUFX8 U1787 ( .A(n2925), .Y(n2927) );
  INVX12 U1788 ( .A(n2730), .Y(n2635) );
  INVX1 U1789 ( .A(n2872), .Y(n2452) );
  INVX12 U1790 ( .A(n1539), .Y(n2673) );
  AOI211X2 U1791 ( .A0(n2790), .A1(color[3]), .B0(n2789), .C0(n2788), .Y(n2791) );
  NAND2X6 U1792 ( .A(n2549), .B(n2548), .Y(n2559) );
  NAND2X6 U1793 ( .A(n2539), .B(n2538), .Y(n2549) );
  NAND4X6 U1794 ( .A(n2485), .B(n2486), .C(n2484), .D(n2483), .Y(n1539) );
  INVX8 U1795 ( .A(n1544), .Y(n2537) );
  NAND4X4 U1796 ( .A(n2512), .B(n2511), .C(n2510), .D(n2509), .Y(n2514) );
  NAND3X4 U1797 ( .A(n2588), .B(n2587), .C(n2586), .Y(n2633) );
  INVX16 U1798 ( .A(n2676), .Y(n2641) );
  NAND3X1 U1799 ( .A(n2682), .B(n2693), .C(n2681), .Y(n2683) );
  NAND2X1 U1800 ( .A(n2689), .B(n2688), .Y(n2690) );
  INVX1 U1801 ( .A(n2702), .Y(n2668) );
  INVX1 U1802 ( .A(n2709), .Y(n2659) );
  INVX1 U1803 ( .A(n2716), .Y(n2654) );
  INVX1 U1804 ( .A(n2713), .Y(n2667) );
  INVX1 U1805 ( .A(n2687), .Y(n2689) );
  INVX1 U1806 ( .A(n2738), .Y(n2688) );
  NAND2X4 U1807 ( .A(n2049), .B(n2250), .Y(n2062) );
  INVX1 U1808 ( .A(n2849), .Y(n1268) );
  INVX1 U1809 ( .A(n2856), .Y(n1267) );
  INVX1 U1810 ( .A(n2842), .Y(n1269) );
  BUFX12 U1811 ( .A(n2561), .Y(n2614) );
  INVX4 U1812 ( .A(n2600), .Y(n2628) );
  NAND4X4 U1813 ( .A(n2499), .B(n2498), .C(n2497), .D(n2496), .Y(n2665) );
  INVX3 U1814 ( .A(n1715), .Y(n1716) );
  NAND3X2 U1815 ( .A(n2068), .B(n2067), .C(n2066), .Y(n2071) );
  NAND3X2 U1816 ( .A(n2018), .B(n2017), .C(n2016), .Y(n2020) );
  OR2X4 U1817 ( .A(n2053), .B(n1538), .Y(n2055) );
  NOR2X4 U1818 ( .A(n2032), .B(n2031), .Y(n2036) );
  INVX16 U1819 ( .A(n1926), .Y(n2109) );
  NAND3X2 U1820 ( .A(n1661), .B(n1660), .C(n1659), .Y(n2490) );
  NAND4X4 U1821 ( .A(n2283), .B(n2282), .C(n2281), .D(n2280), .Y(n2566) );
  NAND2X2 U1822 ( .A(n2279), .B(n2278), .Y(n2280) );
  NAND4BBX1 U1823 ( .AN(n1795), .BN(n1794), .C(n1793), .D(n1792), .Y(n1796) );
  NAND2X2 U1824 ( .A(n2227), .B(n2278), .Y(n2228) );
  INVX1 U1825 ( .A(n2921), .Y(n2432) );
  INVX12 U1826 ( .A(n1950), .Y(n2104) );
  INVX1 U1827 ( .A(n2967), .Y(n2969) );
  NAND2X2 U1828 ( .A(n2182), .B(n2181), .Y(n2183) );
  INVX1 U1829 ( .A(n2933), .Y(n2434) );
  NAND3X1 U1830 ( .A(n2978), .B(counter_cal[3]), .C(n2873), .Y(n2983) );
  INVX1 U1831 ( .A(n2934), .Y(n2436) );
  INVX1 U1832 ( .A(n2981), .Y(n2978) );
  INVX1 U1833 ( .A(n2936), .Y(n2438) );
  INVX12 U1834 ( .A(n1587), .Y(n2426) );
  INVX1 U1835 ( .A(n2416), .Y(n2832) );
  NAND3X1 U1836 ( .A(n3246), .B(n3014), .C(n3017), .Y(n3000) );
  INVX1 U1837 ( .A(n2876), .Y(n2412) );
  NAND2XL U1838 ( .A(n2876), .B(n2875), .Y(n2877) );
  NAND2X1 U1839 ( .A(n3023), .B(counter_read[2]), .Y(n3022) );
  INVX1 U1840 ( .A(n3013), .Y(n3015) );
  INVX12 U1841 ( .A(counter_row[3]), .Y(n2899) );
  NAND2X1 U1842 ( .A(counter_read[0]), .B(n3151), .Y(n3018) );
  NOR2X1 U1843 ( .A(round2[3]), .B(round2[4]), .Y(n2288) );
  INVX1 U1844 ( .A(data[0]), .Y(n2298) );
  AND2X2 U1845 ( .A(data[0]), .B(data[3]), .Y(n2391) );
  INVX1 U1846 ( .A(rom_q[5]), .Y(n2997) );
  INVX12 U1847 ( .A(1'b1), .Y(sram_d[7]) );
  INVX12 U1848 ( .A(1'b1), .Y(sram_d[6]) );
  INVX12 U1849 ( .A(1'b1), .Y(sram_d[5]) );
  INVX12 U1850 ( .A(1'b1), .Y(sram_d[4]) );
  CLKINVX1 U1855 ( .A(n2252), .Y(n1780) );
  NOR2X6 U1856 ( .A(n1624), .B(n1623), .Y(n1612) );
  BUFX8 U1857 ( .A(n2925), .Y(n2920) );
  AND3X4 U1858 ( .A(n2091), .B(n2090), .C(n2089), .Y(n1535) );
  NAND2X4 U1859 ( .A(n3373), .B(n1541), .Y(n1619) );
  MXI2X4 U1860 ( .A(n2633), .B(n2632), .S0(n2746), .Y(n2634) );
  AOI22X1 U1861 ( .A0(n2915), .A1(color1[101]), .B0(n2909), .B1(color1[97]), 
        .Y(n1824) );
  NAND4X8 U1862 ( .A(n2158), .B(n2157), .C(n2156), .D(n2155), .Y(n2563) );
  NAND2X2 U1863 ( .A(n2107), .B(color1[31]), .Y(n2050) );
  AOI22X4 U1864 ( .A0(n1537), .A1(table1[10]), .B0(n2553), .B1(table1[42]), 
        .Y(n2466) );
  CLKBUFX3 U1865 ( .A(n2794), .Y(n1543) );
  NOR2X4 U1866 ( .A(n2524), .B(n2537), .Y(n2532) );
  NAND2X6 U1867 ( .A(n2088), .B(n1542), .Y(n2118) );
  NAND2X4 U1868 ( .A(n1676), .B(n2896), .Y(n1663) );
  BUFX8 U1869 ( .A(n1664), .Y(n2491) );
  NOR2X6 U1870 ( .A(n2731), .B(n2633), .Y(n2630) );
  NOR2X6 U1871 ( .A(n1905), .B(counter_row[0]), .Y(n2263) );
  NOR2X4 U1872 ( .A(counter_row[0]), .B(n1623), .Y(n1774) );
  INVX16 U1873 ( .A(n2905), .Y(n2908) );
  BUFX20 U1874 ( .A(n2516), .Y(n1537) );
  NAND4X6 U1875 ( .A(n2087), .B(n2086), .C(n2085), .D(n2084), .Y(n2088) );
  OR2X4 U1876 ( .A(n2543), .B(n2542), .Y(n2547) );
  INVX20 U1877 ( .A(n2729), .Y(n2741) );
  AND2X4 U1878 ( .A(n2098), .B(color1[15]), .Y(n1538) );
  NAND2X6 U1879 ( .A(n1740), .B(n2900), .Y(n2161) );
  INVX3 U1880 ( .A(n2552), .Y(n2520) );
  NOR2X4 U1881 ( .A(n1911), .B(n1927), .Y(n2027) );
  OR2X6 U1882 ( .A(n2455), .B(n2554), .Y(n2464) );
  AOI2BB2X4 U1883 ( .B0(n1767), .B1(n2278), .A0N(n1766), .A1N(n2795), .Y(n1790) );
  AOI22X1 U1884 ( .A0(n2915), .A1(color1[39]), .B0(n2909), .B1(color1[35]), 
        .Y(n1885) );
  NAND2X4 U1885 ( .A(n2553), .B(table1[43]), .Y(n2541) );
  AO22X4 U1886 ( .A0(n2553), .A1(table1[38]), .B0(n2550), .B1(table1[50]), .Y(
        n2461) );
  OAI22X2 U1887 ( .A0(n2254), .A1(n3212), .B0(n2265), .B1(n3063), .Y(n2185) );
  NOR2X6 U1888 ( .A(n1906), .B(n1905), .Y(n1907) );
  OAI21X4 U1889 ( .A0(n2544), .A1(n3353), .B0(n2466), .Y(n2467) );
  NAND2X6 U1890 ( .A(n2406), .B(n2439), .Y(n2792) );
  NAND3X8 U1891 ( .A(n1916), .B(n2896), .C(n1915), .Y(n2973) );
  INVX8 U1892 ( .A(n2800), .Y(n1916) );
  INVX3 U1893 ( .A(n1537), .Y(n2481) );
  NAND2X2 U1894 ( .A(n2065), .B(color1[37]), .Y(n1981) );
  NAND2X6 U1895 ( .A(n2676), .B(n2740), .Y(n2556) );
  XNOR2X4 U1896 ( .A(n2566), .B(n2665), .Y(n2500) );
  NOR3X4 U1897 ( .A(n1635), .B(n1634), .C(n1633), .Y(n2493) );
  AND2X8 U1898 ( .A(n1906), .B(n2241), .Y(n1642) );
  NOR2X6 U1899 ( .A(n1818), .B(n1817), .Y(n2687) );
  NAND4X4 U1900 ( .A(n2363), .B(n2362), .C(n2361), .D(n2360), .Y(n2850) );
  NAND2X2 U1901 ( .A(n2350), .B(n2383), .Y(n2362) );
  NAND2X2 U1902 ( .A(n2878), .B(round2[1]), .Y(n2771) );
  NAND2X2 U1903 ( .A(n2065), .B(color1[40]), .Y(n1958) );
  OAI2BB1X1 U1904 ( .A0N(color1[38]), .A1N(n2099), .B0(n2077), .Y(n2079) );
  AND2X2 U1905 ( .A(n2099), .B(color1[43]), .Y(n2042) );
  OAI2BB1X1 U1906 ( .A0N(n2099), .A1N(color1[47]), .B0(n2052), .Y(n2053) );
  NAND2X2 U1907 ( .A(n2324), .B(n2368), .Y(n2341) );
  NOR2X2 U1908 ( .A(n2298), .B(data[3]), .Y(n2368) );
  OAI22X1 U1909 ( .A0(n3156), .A1(n2905), .B0(n2912), .B1(n3061), .Y(n1795) );
  XOR2X4 U1910 ( .A(n2724), .B(n2661), .Y(n2512) );
  NOR3X6 U1911 ( .A(n2742), .B(n2741), .C(n2740), .Y(n2751) );
  ADDHX1 U1912 ( .A(round2[8]), .B(n2882), .CO(n2427), .S(n2886) );
  NAND4BBX2 U1913 ( .AN(n1685), .BN(n1684), .C(n1683), .D(n1682), .Y(n1686) );
  OAI22X1 U1914 ( .A0(n3067), .A1(n2905), .B0(n2912), .B1(n3160), .Y(n1800) );
  OAI22X1 U1915 ( .A0(n2905), .A1(n3094), .B0(n2912), .B1(n3201), .Y(n1690) );
  NAND2X6 U1916 ( .A(n2725), .B(n2786), .Y(n2600) );
  NAND2X2 U1917 ( .A(n2724), .B(n2729), .Y(n2726) );
  NAND3X2 U1918 ( .A(n2327), .B(n2326), .C(n2325), .Y(n2328) );
  NAND2X4 U1919 ( .A(n2740), .B(n2641), .Y(n2554) );
  INVX8 U1920 ( .A(n2740), .Y(n2640) );
  NAND2X1 U1921 ( .A(n2026), .B(color1[101]), .Y(n1980) );
  NAND4X1 U1922 ( .A(n2305), .B(n2304), .C(n2303), .D(n2302), .Y(n2307) );
  INVX12 U1923 ( .A(n1754), .Y(n2245) );
  NOR2X2 U1924 ( .A(n2895), .B(n2981), .Y(n2966) );
  INVX16 U1925 ( .A(n1609), .Y(n2796) );
  OAI22X2 U1926 ( .A0(n2255), .A1(n3036), .B0(n2266), .B1(n3226), .Y(n2206) );
  INVX8 U1927 ( .A(n1778), .Y(n2255) );
  AOI2BB2X4 U1928 ( .B0(n2242), .B1(n2241), .A0N(n1543), .A1N(n3124), .Y(n2283) );
  NAND2X1 U1929 ( .A(n2370), .B(table1[17]), .Y(n2297) );
  OAI22X2 U1930 ( .A0(n2265), .A1(n3060), .B0(n2258), .B1(n3227), .Y(n2209) );
  NAND2X1 U1931 ( .A(n2083), .B(color1[92]), .Y(n1953) );
  AO21X4 U1932 ( .A0(round2[8]), .A1(n2420), .B0(n2419), .Y(n1271) );
  OAI211X4 U1933 ( .A0(n2854), .A1(n3083), .B0(n2418), .C0(n2417), .Y(n2419)
         );
  INVX4 U1934 ( .A(n1642), .Y(n1545) );
  INVX6 U1935 ( .A(n1642), .Y(n2912) );
  INVX4 U1936 ( .A(n1642), .Y(n1884) );
  NOR2X1 U1937 ( .A(n2233), .B(n2232), .Y(n2240) );
  OAI22X1 U1938 ( .A0(n2266), .A1(n3214), .B0(n2265), .B1(n3032), .Y(n2277) );
  OAI22X1 U1939 ( .A0(n2270), .A1(n3029), .B0(n2252), .B1(n3110), .Y(n2244) );
  NOR2X1 U1940 ( .A(n2270), .B(n3084), .Y(n2197) );
  NOR2X1 U1941 ( .A(n2197), .B(n2196), .Y(n2204) );
  OAI22X1 U1942 ( .A0(n2253), .A1(n3210), .B0(n2252), .B1(n3115), .Y(n2257) );
  INVX12 U1943 ( .A(n2132), .Y(n2270) );
  OAI22X1 U1944 ( .A0(n2265), .A1(n3062), .B0(n2258), .B1(n3162), .Y(n2180) );
  NOR2X1 U1945 ( .A(n2271), .B(n3082), .Y(n2201) );
  NAND2X1 U1946 ( .A(n1642), .B(color2[11]), .Y(n1632) );
  INVX12 U1947 ( .A(n1778), .Y(n2271) );
  NAND4BBX2 U1948 ( .AN(n2277), .BN(n2276), .C(n2275), .D(n2274), .Y(n2279) );
  INVX4 U1949 ( .A(n2727), .Y(n2728) );
  NOR2X8 U1950 ( .A(n1873), .B(n1872), .Y(n2727) );
  XOR2X2 U1951 ( .A(n1536), .B(n2785), .Y(n2511) );
  OAI22X1 U1952 ( .A0(n2255), .A1(n3065), .B0(n2254), .B1(n3164), .Y(n2256) );
  NAND2X1 U1953 ( .A(n2109), .B(color1[112]), .Y(n1941) );
  MXI2X2 U1954 ( .A(n3202), .B(n2906), .S0(n2932), .Y(n1416) );
  NAND2X1 U1955 ( .A(n2109), .B(color1[116]), .Y(n1930) );
  NAND2X1 U1956 ( .A(n2110), .B(color1[88]), .Y(n1962) );
  NAND2X1 U1957 ( .A(n2109), .B(color1[120]), .Y(n1963) );
  NAND2X1 U1958 ( .A(n2110), .B(color1[81]), .Y(n1976) );
  NAND4X2 U1959 ( .A(n1979), .B(n1978), .C(n1977), .D(n1976), .Y(n1991) );
  NAND2X4 U1960 ( .A(data[2]), .B(data[1]), .Y(n1610) );
  NAND2X1 U1961 ( .A(n2083), .B(color1[93]), .Y(n1997) );
  NAND4X2 U1962 ( .A(n1988), .B(n1987), .C(n1986), .D(n1985), .Y(n1989) );
  NAND2X1 U1963 ( .A(counter_cal[7]), .B(n2966), .Y(n2967) );
  NAND2X2 U1964 ( .A(n1648), .B(n2425), .Y(n1636) );
  AND2X1 U1965 ( .A(n2666), .B(n2665), .Y(n2716) );
  AOI22X1 U1966 ( .A0(n2917), .A1(color2[89]), .B0(n2903), .B1(color2[81]), 
        .Y(n1718) );
  NOR2X2 U1967 ( .A(n1961), .B(n1960), .Y(n1964) );
  NAND2X4 U1968 ( .A(n1927), .B(n1925), .Y(n1920) );
  INVX12 U1969 ( .A(n1939), .Y(n2110) );
  NAND3X2 U1970 ( .A(n2153), .B(n2152), .C(n2151), .Y(n2154) );
  NAND2X1 U1971 ( .A(n2269), .B(color1[112]), .Y(n2151) );
  OAI22XL U1972 ( .A0(n2426), .A1(n1605), .B0(n1727), .B1(n1604), .Y(n1689) );
  NAND2X2 U1973 ( .A(n2175), .B(n2174), .Y(n2176) );
  NOR2X2 U1974 ( .A(n2171), .B(n2170), .Y(n2175) );
  OAI22X1 U1975 ( .A0(n2271), .A1(n3035), .B0(n2254), .B1(n3112), .Y(n2170) );
  NAND3X2 U1976 ( .A(n2190), .B(n2189), .C(n2188), .Y(n2191) );
  NAND2X1 U1977 ( .A(n2269), .B(color1[113]), .Y(n2188) );
  CLKBUFX3 U1978 ( .A(n1774), .Y(n2278) );
  OAI22XL U1979 ( .A0(n3158), .A1(n1896), .B0(n2911), .B1(n3052), .Y(n1805) );
  OAI22XL U1980 ( .A0(n3152), .A1(n1896), .B0(n2911), .B1(n3053), .Y(n1799) );
  NAND2X1 U1981 ( .A(n2491), .B(n2441), .Y(n2446) );
  NAND2X1 U1982 ( .A(n2489), .B(n2442), .Y(n2445) );
  NAND2X1 U1983 ( .A(n2495), .B(n2443), .Y(n2444) );
  NAND2X1 U1984 ( .A(n2489), .B(n2488), .Y(n2499) );
  NOR2X2 U1985 ( .A(n2660), .B(n2727), .Y(n2701) );
  AND2X1 U1986 ( .A(n2693), .B(n2656), .Y(n2653) );
  NAND2X4 U1987 ( .A(n2857), .B(n2771), .Y(n2874) );
  NAND2XL U1988 ( .A(n2908), .B(color2[13]), .Y(n1710) );
  NAND2XL U1989 ( .A(n1642), .B(color2[9]), .Y(n1709) );
  NOR2X2 U1990 ( .A(n2740), .B(n2641), .Y(n2523) );
  NAND2X1 U1991 ( .A(n2065), .B(color1[32]), .Y(n1935) );
  NAND2X1 U1992 ( .A(n2099), .B(color1[39]), .Y(n2017) );
  NAND2XL U1993 ( .A(n2908), .B(color2[14]), .Y(n1621) );
  NAND2XL U1994 ( .A(n1642), .B(color2[10]), .Y(n1620) );
  NOR2X2 U1995 ( .A(n2540), .B(n3250), .Y(n2468) );
  INVX3 U1996 ( .A(n2529), .Y(n2545) );
  NAND2XL U1997 ( .A(n2614), .B(table1[0]), .Y(n2616) );
  NAND2XL U1998 ( .A(n2620), .B(table1[8]), .Y(n2615) );
  NAND2XL U1999 ( .A(n2618), .B(table1[4]), .Y(n2617) );
  NAND2XL U2000 ( .A(n2619), .B(table1[44]), .Y(n2622) );
  NAND2XL U2001 ( .A(n2620), .B(table1[52]), .Y(n2621) );
  NAND2XL U2002 ( .A(n2618), .B(table1[48]), .Y(n2623) );
  CLKINVX1 U2003 ( .A(n2591), .Y(n2607) );
  AOI22X1 U2004 ( .A0(n2614), .A1(table1[32]), .B0(n2619), .B1(table1[28]), 
        .Y(n2590) );
  OAI22X1 U2005 ( .A0(n2265), .A1(n3058), .B0(n2258), .B1(n3223), .Y(n2143) );
  NOR2XL U2006 ( .A(n2120), .B(n3158), .Y(n2122) );
  NAND2X1 U2007 ( .A(n2065), .B(color1[44]), .Y(n1948) );
  NAND2XL U2008 ( .A(n2026), .B(color1[108]), .Y(n1947) );
  NOR2X2 U2009 ( .A(n2006), .B(n2005), .Y(n2009) );
  NAND3X2 U2010 ( .A(n2004), .B(n2003), .C(n2002), .Y(n2006) );
  NAND2XL U2011 ( .A(n2100), .B(color1[109]), .Y(n1992) );
  OAI22X1 U2012 ( .A0(n2245), .A1(n3059), .B0(n2268), .B1(n3224), .Y(n2173) );
  NAND2X1 U2013 ( .A(n2098), .B(color1[14]), .Y(n2091) );
  NAND2XL U2014 ( .A(n2100), .B(color1[110]), .Y(n2089) );
  NAND2X2 U2015 ( .A(n2110), .B(color1[94]), .Y(n2093) );
  INVXL U2016 ( .A(n2271), .Y(n1747) );
  INVXL U2017 ( .A(n2591), .Y(n2580) );
  AO22X1 U2018 ( .A0(n2614), .A1(table1[19]), .B0(n2619), .B1(table1[15]), .Y(
        n2583) );
  AO22X1 U2019 ( .A0(n2618), .A1(table1[23]), .B0(n2620), .B1(table1[27]), .Y(
        n2582) );
  CLKBUFX3 U2020 ( .A(n2508), .Y(n2724) );
  OAI21X2 U2021 ( .A0(n2571), .A1(n2570), .B0(n2592), .Y(n2572) );
  OAI22XL U2022 ( .A0(n2426), .A1(n3078), .B0(n1727), .B1(n3188), .Y(n1684) );
  OAI22XL U2023 ( .A0(n2426), .A1(n3076), .B0(n1727), .B1(n3186), .Y(n1694) );
  NAND2X2 U2024 ( .A(n1944), .B(n2241), .Y(n1945) );
  NAND2X2 U2025 ( .A(n1966), .B(n2250), .Y(n1967) );
  OAI22XL U2026 ( .A0(n3084), .A1(n1896), .B0(n2911), .B1(n3045), .Y(n1860) );
  NAND2XL U2027 ( .A(n2269), .B(color1[115]), .Y(n2275) );
  OAI22XL U2028 ( .A0(n2270), .A1(n3051), .B0(n2252), .B1(n3129), .Y(n1765) );
  NOR2X4 U2029 ( .A(counter_row[3]), .B(counter_row[2]), .Y(n1753) );
  CLKBUFX3 U2030 ( .A(n2745), .Y(n2747) );
  NAND2X4 U2031 ( .A(n2900), .B(n2425), .Y(n2896) );
  NAND2XL U2032 ( .A(n1642), .B(color2[8]), .Y(n1700) );
  NAND2XL U2033 ( .A(n2908), .B(color2[12]), .Y(n1701) );
  OAI2BB2XL U2034 ( .B0(n2897), .B1(n1595), .A0N(color2[16]), .A1N(n1897), .Y(
        n1703) );
  OAI22XL U2035 ( .A0(n2426), .A1(n1596), .B0(n1727), .B1(n1593), .Y(n1704) );
  OAI22XL U2036 ( .A0(n3169), .A1(n1896), .B0(n2911), .B1(n3035), .Y(n1841) );
  NAND2X2 U2037 ( .A(n2183), .B(n1542), .Y(n2193) );
  CLKINVX1 U2038 ( .A(n2656), .Y(n2681) );
  OAI22XL U2039 ( .A0(n3082), .A1(n1896), .B0(n2911), .B1(n3036), .Y(n1869) );
  NAND4BBX1 U2040 ( .AN(n1854), .BN(n1853), .C(n1852), .D(n1851), .Y(n1855) );
  OAI22XL U2041 ( .A0(n3038), .A1(n2905), .B0(n1884), .B1(n3163), .Y(n1854) );
  OAI22XL U2042 ( .A0(n3027), .A1(n1896), .B0(n2911), .B1(n3170), .Y(n1899) );
  OAI2BB2XL U2043 ( .B0(n2897), .B1(n3065), .A0N(color1[19]), .A1N(n1897), .Y(
        n1898) );
  NOR2X1 U2044 ( .A(n2306), .B(data[0]), .Y(n2376) );
  INVX3 U2045 ( .A(n2664), .Y(n1904) );
  NAND2X4 U2046 ( .A(n2619), .B(n2628), .Y(n2505) );
  NAND2X6 U2047 ( .A(n2458), .B(n1537), .Y(n2647) );
  NOR2XL U2048 ( .A(n2965), .B(n2899), .Y(n2901) );
  CLKINVX1 U2049 ( .A(n2800), .Y(n2794) );
  NAND2X4 U2050 ( .A(n2700), .B(n2699), .Y(n2768) );
  NAND2X1 U2051 ( .A(n2717), .B(n2702), .Y(n2700) );
  NAND2X1 U2052 ( .A(n2717), .B(n2713), .Y(n2715) );
  NAND2X1 U2053 ( .A(n2717), .B(n2709), .Y(n2686) );
  NAND2X1 U2054 ( .A(n2717), .B(n2716), .Y(n2721) );
  NAND2X2 U2055 ( .A(n2900), .B(n2437), .Y(n1915) );
  NOR2X1 U2056 ( .A(n2492), .B(n1816), .Y(n1817) );
  INVX3 U2057 ( .A(n2666), .Y(n2661) );
  INVX3 U2058 ( .A(n2665), .Y(n2785) );
  INVX3 U2059 ( .A(n2647), .Y(n2406) );
  AOI22XL U2060 ( .A0(n2820), .A1(n2884), .B0(n2819), .B1(sram_wen), .Y(n2821)
         );
  NOR3XL U2061 ( .A(n2875), .B(n3270), .C(n2777), .Y(n2780) );
  NAND2XL U2062 ( .A(n2890), .B(counter_cal[0]), .Y(n2859) );
  NAND2XL U2063 ( .A(n2891), .B(n3408), .Y(n2773) );
  NOR2XL U2064 ( .A(n3259), .B(n2854), .Y(n2413) );
  NOR2XL U2065 ( .A(n3269), .B(n2854), .Y(n2403) );
  MX2X1 U2066 ( .A(color2[85]), .B(color1[85]), .S0(n2930), .Y(n1163) );
  MX2X1 U2067 ( .A(color2[84]), .B(color1[84]), .S0(n2868), .Y(n1131) );
  MX2X1 U2068 ( .A(color2[92]), .B(color1[92]), .S0(n2868), .Y(n1129) );
  MX2X1 U2069 ( .A(color2[125]), .B(color1[125]), .S0(n2869), .Y(n1153) );
  MX2X1 U2070 ( .A(color2[72]), .B(color1[72]), .S0(n2960), .Y(n1134) );
  MX2X1 U2071 ( .A(color2[108]), .B(color1[108]), .S0(n2869), .Y(n1125) );
  MX2X1 U2072 ( .A(color2[77]), .B(color1[77]), .S0(n2869), .Y(n1165) );
  MX2X1 U2073 ( .A(color2[58]), .B(color1[58]), .S0(n2867), .Y(n1202) );
  MX2X1 U2074 ( .A(color2[49]), .B(color1[49]), .S0(n2910), .Y(n1172) );
  MX2X1 U2075 ( .A(color2[59]), .B(color1[59]), .S0(n2930), .Y(n1233) );
  MX2X1 U2076 ( .A(color2[51]), .B(color1[51]), .S0(n2960), .Y(n1235) );
  MX2X1 U2077 ( .A(color2[79]), .B(color1[79]), .S0(n2868), .Y(n1228) );
  MX2X1 U2078 ( .A(color2[78]), .B(color1[78]), .S0(n2960), .Y(n1197) );
  MX2X1 U2079 ( .A(color2[18]), .B(color1[18]), .S0(n2930), .Y(n1212) );
  MX2X1 U2080 ( .A(color2[19]), .B(color1[19]), .S0(n2867), .Y(n1243) );
  MX2X1 U2081 ( .A(color2[121]), .B(color1[121]), .S0(n2910), .Y(n1154) );
  MX2X1 U2082 ( .A(color2[122]), .B(color1[122]), .S0(n2868), .Y(n1186) );
  MX2X1 U2083 ( .A(color2[90]), .B(color1[90]), .S0(n2960), .Y(n1194) );
  MX2X1 U2084 ( .A(color2[82]), .B(color1[82]), .S0(n2960), .Y(n1196) );
  MX2X1 U2085 ( .A(color2[94]), .B(color1[94]), .S0(n2869), .Y(n1193) );
  MX2X1 U2086 ( .A(color2[53]), .B(color1[53]), .S0(n2910), .Y(n1171) );
  MX2X1 U2087 ( .A(color2[86]), .B(color1[86]), .S0(n2869), .Y(n1195) );
  MX2X1 U2088 ( .A(color2[62]), .B(color1[62]), .S0(n2867), .Y(n1201) );
  MX2X1 U2089 ( .A(color2[123]), .B(color1[123]), .S0(n2910), .Y(n1217) );
  MX2X1 U2090 ( .A(color2[14]), .B(color1[14]), .S0(n2868), .Y(n1213) );
  MX2X1 U2091 ( .A(color2[36]), .B(color1[36]), .S0(n2869), .Y(n1143) );
  MX2X1 U2092 ( .A(color2[4]), .B(color1[4]), .S0(n2869), .Y(n1151) );
  MX2X1 U2093 ( .A(color2[101]), .B(color1[101]), .S0(n2869), .Y(n1159) );
  MX2X1 U2094 ( .A(color2[37]), .B(color1[37]), .S0(n2869), .Y(n1175) );
  MX2X1 U2095 ( .A(color2[5]), .B(color1[5]), .S0(n2960), .Y(n1183) );
  MX2X1 U2096 ( .A(color2[6]), .B(color1[6]), .S0(n2867), .Y(n1215) );
  MX2X1 U2097 ( .A(color2[39]), .B(color1[39]), .S0(n2910), .Y(n1238) );
  MX2X1 U2098 ( .A(color2[96]), .B(color1[96]), .S0(n2868), .Y(n1128) );
  MX2X1 U2099 ( .A(color2[32]), .B(color1[32]), .S0(n2867), .Y(n1144) );
  MX2X1 U2100 ( .A(color2[97]), .B(color1[97]), .S0(n2930), .Y(n1160) );
  MX2X1 U2101 ( .A(color2[33]), .B(color1[33]), .S0(n2910), .Y(n1176) );
  MX2X1 U2102 ( .A(color2[98]), .B(color1[98]), .S0(n2867), .Y(n1192) );
  MX2X1 U2103 ( .A(color2[99]), .B(color1[99]), .S0(n2960), .Y(n1223) );
  MX2X1 U2104 ( .A(color2[35]), .B(color1[35]), .S0(n2930), .Y(n1239) );
  MX2X1 U2105 ( .A(color2[52]), .B(color1[52]), .S0(n2868), .Y(n1139) );
  MX2X1 U2106 ( .A(color2[41]), .B(color1[41]), .S0(n2867), .Y(n1174) );
  MX2X1 U2107 ( .A(color2[11]), .B(color1[11]), .S0(n2960), .Y(n1245) );
  MX2X1 U2108 ( .A(color2[69]), .B(color1[69]), .S0(n2869), .Y(n1167) );
  MX2X1 U2109 ( .A(color2[24]), .B(color1[24]), .S0(n2930), .Y(n1146) );
  MX2X1 U2110 ( .A(color2[25]), .B(color1[25]), .S0(n2868), .Y(n1178) );
  MX2X1 U2111 ( .A(color2[20]), .B(color1[20]), .S0(n2867), .Y(n1147) );
  MX2X1 U2112 ( .A(color2[104]), .B(color1[104]), .S0(n2960), .Y(n1126) );
  MX2X1 U2113 ( .A(color2[40]), .B(color1[40]), .S0(n2930), .Y(n1142) );
  MX2X1 U2114 ( .A(color2[105]), .B(color1[105]), .S0(n2869), .Y(n1158) );
  MX2X1 U2115 ( .A(color2[29]), .B(color1[29]), .S0(n2960), .Y(n1177) );
  MXI2X1 U2116 ( .A(n3283), .B(n2961), .S0(n2921), .Y(n1444) );
  MX2X1 U2117 ( .A(color2[28]), .B(color1[28]), .S0(n2867), .Y(n1145) );
  NAND2XL U2118 ( .A(n3009), .B(rom_q[0]), .Y(n2986) );
  MX2X1 U2119 ( .A(color2[71]), .B(color1[71]), .S0(n2867), .Y(n1230) );
  MX2X1 U2120 ( .A(color2[46]), .B(color1[46]), .S0(n2867), .Y(n1205) );
  MX2X1 U2121 ( .A(color2[107]), .B(color1[107]), .S0(n2930), .Y(n1221) );
  MX2X1 U2122 ( .A(color2[43]), .B(color1[43]), .S0(n2910), .Y(n1237) );
  MX2X1 U2123 ( .A(color2[56]), .B(color1[56]), .S0(n2910), .Y(n1138) );
  MX2X1 U2124 ( .A(color2[100]), .B(color1[100]), .S0(n2866), .Y(n1127) );
  MX2X1 U2125 ( .A(color2[12]), .B(color1[12]), .S0(n2866), .Y(n1149) );
  MX2X1 U2126 ( .A(color2[80]), .B(color1[80]), .S0(n2866), .Y(n1132) );
  MX2X1 U2127 ( .A(color2[16]), .B(color1[16]), .S0(n2868), .Y(n1148) );
  MX2X1 U2128 ( .A(color2[103]), .B(color1[103]), .S0(n2910), .Y(n1222) );
  MX2X1 U2129 ( .A(color2[7]), .B(color1[7]), .S0(n2930), .Y(n1246) );
  MX2X1 U2130 ( .A(color2[38]), .B(color1[38]), .S0(n2868), .Y(n1207) );
  MX2X1 U2131 ( .A(color2[0]), .B(color1[0]), .S0(n2960), .Y(n1152) );
  MX2X1 U2132 ( .A(color2[3]), .B(color1[3]), .S0(n2910), .Y(n1247) );
  NAND2XL U2133 ( .A(n3005), .B(rom_q[0]), .Y(n3001) );
  OAI21XL U2134 ( .A0(n2878), .A1(n2884), .B0(n2881), .Y(n1281) );
  MX2X1 U2135 ( .A(color2[31]), .B(color1[31]), .S0(n2867), .Y(n1240) );
  MX2X1 U2136 ( .A(color2[119]), .B(color1[119]), .S0(n2930), .Y(n1218) );
  MX2X1 U2137 ( .A(color2[63]), .B(color1[63]), .S0(n2930), .Y(n1232) );
  MX2X1 U2138 ( .A(color2[67]), .B(color1[67]), .S0(n2868), .Y(n1231) );
  MX2X1 U2139 ( .A(color2[26]), .B(color1[26]), .S0(n2867), .Y(n1210) );
  MX2X1 U2140 ( .A(color2[21]), .B(color1[21]), .S0(n2930), .Y(n1179) );
  MX2X1 U2141 ( .A(color2[22]), .B(color1[22]), .S0(n2910), .Y(n1211) );
  MX2X1 U2142 ( .A(color2[110]), .B(color1[110]), .S0(n2867), .Y(n1189) );
  MX2X1 U2143 ( .A(color2[111]), .B(color1[111]), .S0(n2960), .Y(n1220) );
  MX2X1 U2144 ( .A(color2[47]), .B(color1[47]), .S0(n2960), .Y(n1236) );
  MX2X1 U2145 ( .A(color2[54]), .B(color1[54]), .S0(n2868), .Y(n1203) );
  MX2X1 U2146 ( .A(color2[118]), .B(color1[118]), .S0(n2867), .Y(n1187) );
  MX2X1 U2147 ( .A(color2[87]), .B(color1[87]), .S0(n2867), .Y(n1226) );
  MX2X1 U2148 ( .A(color2[127]), .B(color1[127]), .S0(n2960), .Y(n1248) );
  MX2X1 U2149 ( .A(color2[30]), .B(color1[30]), .S0(n2960), .Y(n1209) );
  MX2X1 U2150 ( .A(color2[120]), .B(color1[120]), .S0(n2910), .Y(n1122) );
  MX2X1 U2151 ( .A(color2[15]), .B(color1[15]), .S0(n2910), .Y(n1244) );
  MX2X1 U2152 ( .A(color2[126]), .B(color1[126]), .S0(n2869), .Y(n1185) );
  MX2X1 U2153 ( .A(color2[55]), .B(color1[55]), .S0(n2910), .Y(n1234) );
  MX2X1 U2154 ( .A(color2[106]), .B(color1[106]), .S0(n2867), .Y(n1190) );
  MX2X1 U2155 ( .A(color2[23]), .B(color1[23]), .S0(n2960), .Y(n1242) );
  MX2X1 U2156 ( .A(color2[89]), .B(color1[89]), .S0(n2869), .Y(n1162) );
  MX2X1 U2157 ( .A(color2[88]), .B(color1[88]), .S0(n2930), .Y(n1130) );
  MX2X1 U2158 ( .A(color2[91]), .B(color1[91]), .S0(n2867), .Y(n1225) );
  MX2X1 U2159 ( .A(color2[8]), .B(color1[8]), .S0(n2910), .Y(n1150) );
  MX2X1 U2160 ( .A(color2[9]), .B(color1[9]), .S0(n2869), .Y(n1182) );
  MX2X1 U2161 ( .A(color2[13]), .B(color1[13]), .S0(n2867), .Y(n1181) );
  MX2X1 U2162 ( .A(color2[17]), .B(color1[17]), .S0(n2869), .Y(n1180) );
  AOI22XL U2163 ( .A0(n2810), .A1(n2884), .B0(n2809), .B1(sram_wen), .Y(n2811)
         );
  AOI22XL U2164 ( .A0(n2805), .A1(n2884), .B0(n2804), .B1(sram_wen), .Y(n2806)
         );
  MXI2X1 U2165 ( .A(n1924), .B(n2899), .S0(n2965), .Y(n1521) );
  XOR2X1 U2166 ( .A(n2975), .B(counter_row[0]), .Y(n1524) );
  MX2X1 U2167 ( .A(color2[124]), .B(color1[124]), .S0(n2866), .Y(n1121) );
  MX2X1 U2168 ( .A(color2[116]), .B(color1[116]), .S0(n2930), .Y(n1123) );
  MX2X1 U2169 ( .A(color2[112]), .B(color1[112]), .S0(n2869), .Y(n1124) );
  MX2X1 U2170 ( .A(color2[76]), .B(color1[76]), .S0(n2868), .Y(n1133) );
  MX2X1 U2171 ( .A(color2[68]), .B(color1[68]), .S0(n2869), .Y(n1135) );
  MX2X1 U2172 ( .A(color2[64]), .B(color1[64]), .S0(n2868), .Y(n1136) );
  MX2X1 U2173 ( .A(color2[60]), .B(color1[60]), .S0(n2910), .Y(n1137) );
  MX2X1 U2174 ( .A(color2[44]), .B(color1[44]), .S0(n2867), .Y(n1141) );
  MX2X1 U2175 ( .A(color2[113]), .B(color1[113]), .S0(n2869), .Y(n1156) );
  MX2X1 U2176 ( .A(color2[109]), .B(color1[109]), .S0(n2869), .Y(n1157) );
  MX2X1 U2177 ( .A(color2[93]), .B(color1[93]), .S0(n2867), .Y(n1161) );
  MX2X1 U2178 ( .A(color2[73]), .B(color1[73]), .S0(n2868), .Y(n1166) );
  MX2X1 U2179 ( .A(color2[61]), .B(color1[61]), .S0(n2868), .Y(n1169) );
  MX2X1 U2180 ( .A(color2[45]), .B(color1[45]), .S0(n2869), .Y(n1173) );
  MX2X1 U2181 ( .A(color2[1]), .B(color1[1]), .S0(n2869), .Y(n1184) );
  MX2X1 U2182 ( .A(color2[114]), .B(color1[114]), .S0(n2867), .Y(n1188) );
  MX2X1 U2183 ( .A(color2[74]), .B(color1[74]), .S0(n2867), .Y(n1198) );
  MX2X1 U2184 ( .A(color2[2]), .B(color1[2]), .S0(n2868), .Y(n1216) );
  MX2X1 U2185 ( .A(color2[115]), .B(color1[115]), .S0(n2930), .Y(n1219) );
  MX2X1 U2186 ( .A(color2[75]), .B(color1[75]), .S0(n2868), .Y(n1229) );
  AOI22XL U2187 ( .A0(n2815), .A1(sram_wen), .B0(n2814), .B1(n2884), .Y(n2816)
         );
  OAI211XL U2188 ( .A0(read_from_rom), .A1(n3133), .B0(n3258), .C0(n2802), .Y(
        n1503) );
  NOR2XL U2189 ( .A(n2801), .B(n2976), .Y(N472) );
  NAND2XL U2190 ( .A(n2891), .B(n3402), .Y(n2418) );
  OAI21XL U2191 ( .A0(n2860), .A1(n2778), .B0(n2878), .Y(n2417) );
  OA21XL U2192 ( .A0(color[2]), .A1(n2451), .B0(n2931), .Y(n1514) );
  AND2X1 U2193 ( .A(n2872), .B(n2871), .Y(n15160) );
  NOR2XL U2194 ( .A(n2970), .B(n2981), .Y(n2972) );
  NAND2XL U2195 ( .A(n3006), .B(row2[13]), .Y(n2996) );
  NAND2XL U2196 ( .A(n3006), .B(row2[12]), .Y(n2990) );
  NAND2XL U2197 ( .A(n3007), .B(rom_q[1]), .Y(n2995) );
  NAND2XL U2198 ( .A(n3007), .B(rom_q[0]), .Y(n2989) );
  NAND2XL U2199 ( .A(n3004), .B(row2[4]), .Y(n2988) );
  INVXL U2200 ( .A(rom_q[1]), .Y(n2999) );
  NAND2XL U2201 ( .A(n3004), .B(row2[1]), .Y(n2998) );
  NAND2XL U2202 ( .A(n3011), .B(rom_q[5]), .Y(n2992) );
  NAND2XL U2203 ( .A(n3011), .B(rom_q[1]), .Y(n2994) );
  NAND2XL U2204 ( .A(n3011), .B(rom_q[0]), .Y(n2987) );
  NAND2XL U2205 ( .A(n3009), .B(rom_q[1]), .Y(n2993) );
  INVXL U2206 ( .A(n2976), .Y(n2977) );
  NAND2BX1 U2207 ( .AN(set), .B(n2837), .Y(n1525) );
  OAI21XL U2208 ( .A0(n2895), .A1(n2770), .B0(n2890), .Y(n1517) );
  INVX6 U2209 ( .A(n1681), .Y(n2917) );
  INVX12 U2210 ( .A(counter_row[2]), .Y(n1906) );
  OAI2BB1X1 U2211 ( .A0N(round2[7]), .A1N(n2420), .B0(n2405), .Y(n1272) );
  ADDHX1 U2212 ( .A(round2[3]), .B(n2818), .CO(n2812), .S(n2819) );
  XNOR2X1 U2213 ( .A(n2817), .B(round2[3]), .Y(n2820) );
  AND2XL U2214 ( .A(round2[7]), .B(round2[8]), .Y(n2778) );
  INVX12 U2215 ( .A(n1548), .Y(rom_a[0]) );
  INVX12 U2216 ( .A(n1553), .Y(rom_a[5]) );
  INVX12 U2217 ( .A(n1552), .Y(rom_a[4]) );
  INVX12 U2218 ( .A(n1551), .Y(rom_a[3]) );
  INVX12 U2219 ( .A(n1550), .Y(rom_a[2]) );
  INVX12 U2220 ( .A(n1549), .Y(rom_a[1]) );
  ADDHXL U2221 ( .A(round2[6]), .B(n2827), .CO(n2843), .S(n2830) );
  OR2X2 U2222 ( .A(n2828), .B(round2[6]), .Y(n2844) );
  ADDHXL U2223 ( .A(round2[4]), .B(n2812), .CO(n2822), .S(n2815) );
  OR2X2 U2224 ( .A(n2813), .B(round2[4]), .Y(n2823) );
  NAND2XL U2225 ( .A(round2[3]), .B(round2[4]), .Y(n2875) );
  NOR2XL U2226 ( .A(round2[5]), .B(round2[6]), .Y(n2289) );
  AOI21XL U2227 ( .A0(round2[6]), .A1(round2[5]), .B0(n2832), .Y(n2833) );
  NOR3X1 U2228 ( .A(n2862), .B(round2[5]), .C(n2876), .Y(n2414) );
  AOI22XL U2229 ( .A0(n2825), .A1(sram_wen), .B0(n2824), .B1(n2884), .Y(n2826)
         );
  AOI22XL U2230 ( .A0(n2830), .A1(sram_wen), .B0(n2829), .B1(n2884), .Y(n2831)
         );
  AOI22XL U2231 ( .A0(n2846), .A1(sram_wen), .B0(n2845), .B1(n2884), .Y(n2847)
         );
  AOI22XL U2232 ( .A0(n3270), .A1(sram_wen), .B0(n3270), .B1(n2884), .Y(n2803)
         );
  INVX16 U2233 ( .A(n3257), .Y(sram_wen) );
  INVX12 U2234 ( .A(n1560), .Y(finish) );
  NOR2X2 U2235 ( .A(read_complete), .B(reset), .Y(N1603) );
  INVX12 U2236 ( .A(n3245), .Y(sram_a[1]) );
  INVX12 U2237 ( .A(n3242), .Y(sram_a[0]) );
  INVX12 U2238 ( .A(n3244), .Y(sram_a[4]) );
  INVX12 U2239 ( .A(n3243), .Y(sram_a[9]) );
  INVX12 U2240 ( .A(n1566), .Y(sram_d[0]) );
  AOI222XL U2241 ( .A0(n2841), .A1(n2854), .B0(n2852), .B1(colornow[0]), .C0(
        n3415), .C1(n2853), .Y(n2842) );
  INVX12 U2242 ( .A(n1568), .Y(sram_d[1]) );
  AOI222XL U2243 ( .A0(n2848), .A1(n2854), .B0(n2853), .B1(n3414), .C0(n2852), 
        .C1(colornow[1]), .Y(n2849) );
  INVX12 U2244 ( .A(n1570), .Y(sram_d[2]) );
  AOI222XL U2245 ( .A0(n2855), .A1(n2854), .B0(n2853), .B1(n3413), .C0(n2852), 
        .C1(colornow[2]), .Y(n2856) );
  INVX12 U2246 ( .A(n1572), .Y(sram_d[3]) );
  AOI222XL U2247 ( .A0(n2850), .A1(n2854), .B0(n2853), .B1(n3412), .C0(n2852), 
        .C1(colornow[3]), .Y(n2851) );
  INVX16 U2248 ( .A(n1574), .Y(sram_a[2]) );
  INVX16 U2249 ( .A(n1576), .Y(sram_a[8]) );
  INVX12 U2250 ( .A(n1578), .Y(sram_a[6]) );
  INVX16 U2251 ( .A(n1580), .Y(sram_a[5]) );
  OAI21X1 U2252 ( .A0(n2836), .A1(n3252), .B0(n2415), .Y(n1274) );
  INVX12 U2253 ( .A(n1582), .Y(sram_a[7]) );
  INVX16 U2254 ( .A(n1584), .Y(sram_a[3]) );
  AOI22XL U2255 ( .A0(n2891), .A1(n3407), .B0(counter_cal[3]), .B1(n2890), .Y(
        n2892) );
  OAI21X1 U2256 ( .A0(n2441), .A1(n2490), .B0(n2491), .Y(n1678) );
  AND2X8 U2257 ( .A(n1542), .B(n1625), .Y(n1587) );
  AND2X4 U2258 ( .A(n1748), .B(n2900), .Y(n1609) );
  AND2X2 U2259 ( .A(n2099), .B(color1[35]), .Y(n2030) );
  NOR2X1 U2260 ( .A(n2104), .B(n3062), .Y(n2005) );
  CLKINVX1 U2261 ( .A(n2606), .Y(n2608) );
  NAND2XL U2262 ( .A(n2618), .B(table1[36]), .Y(n2589) );
  NOR2X4 U2263 ( .A(n2530), .B(n2529), .Y(n2531) );
  NOR2X2 U2264 ( .A(n1975), .B(n1974), .Y(n1978) );
  OAI21X1 U2265 ( .A0(n2442), .A1(n2488), .B0(n2489), .Y(n1679) );
  XOR2X1 U2266 ( .A(n2640), .B(n2738), .Y(n2646) );
  NOR2X4 U2267 ( .A(n1906), .B(n2899), .Y(n1748) );
  NAND2X2 U2268 ( .A(n2191), .B(n2278), .Y(n2192) );
  OAI22XL U2269 ( .A0(n3191), .A1(n1896), .B0(n2911), .B1(n3044), .Y(n1832) );
  OAI22XL U2270 ( .A0(n3080), .A1(n1896), .B0(n2911), .B1(n3190), .Y(n1848) );
  NAND2XL U2271 ( .A(n2293), .B(table1[7]), .Y(n2348) );
  OR2X2 U2272 ( .A(n2440), .B(n2492), .Y(n2447) );
  NAND4X1 U2273 ( .A(n2297), .B(n2296), .C(n2295), .D(n2294), .Y(n2299) );
  INVX3 U2274 ( .A(n1774), .Y(n1776) );
  NOR2X1 U2275 ( .A(n2785), .B(n2666), .Y(n2709) );
  BUFX12 U2276 ( .A(n1619), .Y(n2905) );
  AND3X1 U2277 ( .A(round2[2]), .B(round2[5]), .C(n2778), .Y(n2779) );
  AOI22XL U2278 ( .A0(n2878), .A1(n2877), .B0(counter_cal[4]), .B1(n2890), .Y(
        n2879) );
  NAND2XL U2279 ( .A(n2980), .B(counter_cal[1]), .Y(n2979) );
  MX2X1 U2280 ( .A(color2[57]), .B(color1[57]), .S0(n2868), .Y(n1170) );
  MX2X1 U2281 ( .A(color2[50]), .B(color1[50]), .S0(n2867), .Y(n1204) );
  MX2X1 U2282 ( .A(color2[83]), .B(color1[83]), .S0(n2867), .Y(n1227) );
  MX2X1 U2283 ( .A(color2[102]), .B(color1[102]), .S0(n2868), .Y(n1191) );
  MX2X1 U2284 ( .A(color2[65]), .B(color1[65]), .S0(n2869), .Y(n1168) );
  MX2X1 U2285 ( .A(color2[95]), .B(color1[95]), .S0(n2868), .Y(n1224) );
  MX2X1 U2286 ( .A(color2[70]), .B(color1[70]), .S0(n2866), .Y(n1199) );
  MX2X1 U2287 ( .A(color2[66]), .B(color1[66]), .S0(n2930), .Y(n1200) );
  MX2X1 U2288 ( .A(color2[48]), .B(color1[48]), .S0(n2866), .Y(n1140) );
  MX2X1 U2289 ( .A(color2[42]), .B(color1[42]), .S0(n2868), .Y(n1206) );
  MX2X1 U2290 ( .A(color2[27]), .B(color1[27]), .S0(n2868), .Y(n1241) );
  MX2X1 U2291 ( .A(color2[81]), .B(color1[81]), .S0(n2869), .Y(n1164) );
  MX2X1 U2292 ( .A(color2[117]), .B(color1[117]), .S0(n2866), .Y(n1155) );
  MX2X1 U2293 ( .A(color2[34]), .B(color1[34]), .S0(n2867), .Y(n1208) );
  OAI21X1 U2294 ( .A0(n2881), .A1(n3245), .B0(n2411), .Y(n1278) );
  INVX12 U2295 ( .A(n3024), .Y(rom_a[6]) );
  NAND2X2 U2296 ( .A(read_complete), .B(set), .Y(n1611) );
  NOR2X6 U2297 ( .A(n1611), .B(n2854), .Y(n2975) );
  BUFX20 U2298 ( .A(n1612), .Y(n2241) );
  NAND2XL U2299 ( .A(n2965), .B(n1623), .Y(n1614) );
  OAI31XL U2300 ( .A0(n2965), .A1(n2241), .A2(n1542), .B0(n1614), .Y(n1615) );
  NAND2X8 U2301 ( .A(n1905), .B(n1616), .Y(n2437) );
  NOR2X8 U2302 ( .A(n1906), .B(n1624), .Y(n1908) );
  CLKINVX6 U2303 ( .A(n1908), .Y(n1617) );
  NOR2X6 U2304 ( .A(n1617), .B(n1905), .Y(n1618) );
  INVX12 U2305 ( .A(n1618), .Y(n2435) );
  AOI22X1 U2306 ( .A0(n2915), .A1(color2[6]), .B0(n2909), .B1(color2[2]), .Y(
        n1622) );
  NAND3X2 U2307 ( .A(n1622), .B(n1621), .C(n1620), .Y(n1629) );
  BUFX12 U2308 ( .A(counter_row[2]), .Y(n1739) );
  INVX12 U2309 ( .A(n1586), .Y(n1727) );
  OAI22X1 U2310 ( .A0(n2426), .A1(n3042), .B0(n1727), .B1(n3183), .Y(n1628) );
  NAND2X4 U2311 ( .A(n2241), .B(n1625), .Y(n1681) );
  NOR2X8 U2312 ( .A(n1905), .B(n1624), .Y(n2250) );
  NOR2X4 U2313 ( .A(n2795), .B(n1625), .Y(n1626) );
  INVX8 U2314 ( .A(n1626), .Y(n2433) );
  OAI2BB2X1 U2315 ( .B0(n2897), .B1(n3175), .A0N(color2[18]), .A1N(n1897), .Y(
        n1627) );
  NOR3X2 U2316 ( .A(n1629), .B(n1628), .C(n1627), .Y(n2440) );
  INVX3 U2317 ( .A(n2440), .Y(n1639) );
  INVX8 U2318 ( .A(n2435), .Y(n1648) );
  AOI22X1 U2319 ( .A0(n2915), .A1(color2[7]), .B0(n1648), .B1(color2[3]), .Y(
        n1630) );
  NAND3X2 U2320 ( .A(n1632), .B(n1631), .C(n1630), .Y(n1635) );
  OAI22X1 U2321 ( .A0(n2426), .A1(n3075), .B0(n1727), .B1(n3185), .Y(n1634) );
  OAI2BB2X1 U2322 ( .B0(n2897), .B1(n3177), .A0N(color2[19]), .A1N(n1897), .Y(
        n1633) );
  NAND2BX4 U2323 ( .AN(n2900), .B(n1636), .Y(n1676) );
  XOR2X4 U2324 ( .A(n1648), .B(n2899), .Y(n1675) );
  OAI21X4 U2325 ( .A0(n1639), .A1(n1638), .B0(n1637), .Y(n1680) );
  OAI22X1 U2326 ( .A0(n2426), .A1(n3173), .B0(n1727), .B1(n1592), .Y(n1641) );
  OAI2BB2X1 U2327 ( .B0(n2897), .B1(n1594), .A0N(color2[114]), .A1N(n1897), 
        .Y(n1640) );
  NOR2X2 U2328 ( .A(n1641), .B(n1640), .Y(n1645) );
  AOI22X1 U2329 ( .A0(n2915), .A1(color2[102]), .B0(n1648), .B1(color2[98]), 
        .Y(n1644) );
  AOI2BB2X1 U2330 ( .B0(n2908), .B1(color2[110]), .A0N(n1884), .A1N(n3086), 
        .Y(n1643) );
  NAND3X2 U2331 ( .A(n1645), .B(n1644), .C(n1643), .Y(n2442) );
  OAI22X1 U2332 ( .A0(n2426), .A1(n3043), .B0(n1727), .B1(n3081), .Y(n1647) );
  OAI2BB2X1 U2333 ( .B0(n2897), .B1(n3079), .A0N(color2[115]), .A1N(n1897), 
        .Y(n1646) );
  NOR2X2 U2334 ( .A(n1647), .B(n1646), .Y(n1651) );
  AOI22X1 U2335 ( .A0(n2915), .A1(color2[103]), .B0(n1648), .B1(color2[99]), 
        .Y(n1650) );
  AOI2BB2X1 U2336 ( .B0(n2908), .B1(color2[111]), .A0N(n1545), .A1N(n3088), 
        .Y(n1649) );
  NAND3X2 U2337 ( .A(n1651), .B(n1650), .C(n1649), .Y(n2488) );
  INVX12 U2338 ( .A(n1587), .Y(n1896) );
  OAI22X1 U2339 ( .A0(n1896), .A1(n3077), .B0(n1727), .B1(n3187), .Y(n1653) );
  OAI2BB2X1 U2340 ( .B0(n2897), .B1(n3180), .A0N(color2[82]), .A1N(n1897), .Y(
        n1652) );
  NOR2X2 U2341 ( .A(n1653), .B(n1652), .Y(n1656) );
  AOI22X1 U2342 ( .A0(n2915), .A1(color2[70]), .B0(n2909), .B1(color2[66]), 
        .Y(n1655) );
  NAND3X2 U2343 ( .A(n1656), .B(n1655), .C(n1654), .Y(n2441) );
  OAI22X1 U2344 ( .A0(n2426), .A1(n3070), .B0(n1727), .B1(n3167), .Y(n1658) );
  OAI2BB2X1 U2345 ( .B0(n2897), .B1(n3179), .A0N(color2[83]), .A1N(n1897), .Y(
        n1657) );
  NOR2X2 U2346 ( .A(n1658), .B(n1657), .Y(n1661) );
  AOI22X1 U2347 ( .A0(n2915), .A1(color2[71]), .B0(n1856), .B1(color2[67]), 
        .Y(n1660) );
  NOR2X2 U2348 ( .A(n1663), .B(n1662), .Y(n1664) );
  OAI22X1 U2349 ( .A0(n2426), .A1(n3074), .B0(n1727), .B1(n3184), .Y(n1666) );
  OAI2BB2X1 U2350 ( .B0(n2897), .B1(n3176), .A0N(color2[50]), .A1N(n1897), .Y(
        n1665) );
  NOR2X2 U2351 ( .A(n1666), .B(n1665), .Y(n1669) );
  AOI22X1 U2352 ( .A0(n2915), .A1(color2[38]), .B0(n1856), .B1(color2[34]), 
        .Y(n1668) );
  AOI2BB2X1 U2353 ( .B0(n2908), .B1(color2[46]), .A0N(n1884), .A1N(n3087), .Y(
        n1667) );
  NAND3X2 U2354 ( .A(n1669), .B(n1668), .C(n1667), .Y(n2443) );
  OAI22X1 U2355 ( .A0(n2426), .A1(n3041), .B0(n1727), .B1(n3166), .Y(n1671) );
  OAI2BB2X1 U2356 ( .B0(n2897), .B1(n3178), .A0N(color2[51]), .A1N(n1897), .Y(
        n1670) );
  NOR2X2 U2357 ( .A(n1671), .B(n1670), .Y(n1674) );
  AOI22X1 U2358 ( .A0(n2915), .A1(color2[39]), .B0(n1856), .B1(color2[35]), 
        .Y(n1673) );
  AOI2BB2X1 U2359 ( .B0(n2908), .B1(color2[47]), .A0N(n1884), .A1N(n3089), .Y(
        n1672) );
  NOR2X6 U2360 ( .A(n1676), .B(n1675), .Y(n2495) );
  AND4X4 U2361 ( .A(n1680), .B(n1679), .C(n1678), .D(n1677), .Y(n1738) );
  OAI22XL U2362 ( .A0(n2905), .A1(n3096), .B0(n2912), .B1(n3203), .Y(n1685) );
  INVX8 U2363 ( .A(n2433), .Y(n2903) );
  AOI22X1 U2364 ( .A0(n2917), .A1(color2[88]), .B0(n2903), .B1(color2[80]), 
        .Y(n1683) );
  AOI22X1 U2365 ( .A0(n2915), .A1(color2[68]), .B0(n1856), .B1(color2[64]), 
        .Y(n1682) );
  NAND2X2 U2366 ( .A(n2491), .B(n1686), .Y(n1699) );
  AOI22X1 U2367 ( .A0(n2917), .A1(color2[120]), .B0(n2903), .B1(color2[112]), 
        .Y(n1688) );
  AOI22X1 U2368 ( .A0(n2915), .A1(color2[100]), .B0(n1856), .B1(color2[96]), 
        .Y(n1687) );
  NAND4BBX1 U2369 ( .AN(n1690), .BN(n1689), .C(n1688), .D(n1687), .Y(n1691) );
  NAND2X2 U2370 ( .A(n2489), .B(n1691), .Y(n1698) );
  AOI22X1 U2371 ( .A0(n2915), .A1(color2[36]), .B0(n1856), .B1(color2[32]), 
        .Y(n1692) );
  NAND4BBX1 U2372 ( .AN(n1695), .BN(n1694), .C(n1693), .D(n1692), .Y(n1696) );
  NAND2X2 U2373 ( .A(n2495), .B(n1696), .Y(n1697) );
  NAND3X4 U2374 ( .A(n1699), .B(n1698), .C(n1697), .Y(n1708) );
  AOI22X1 U2375 ( .A0(n2915), .A1(color2[4]), .B0(n1856), .B1(color2[0]), .Y(
        n1702) );
  NOR3X2 U2376 ( .A(n1705), .B(n1704), .C(n1703), .Y(n1706) );
  NOR2X4 U2377 ( .A(n2492), .B(n1706), .Y(n1707) );
  NOR2X8 U2378 ( .A(n1708), .B(n1707), .Y(n2693) );
  OAI2BB2XL U2379 ( .B0(n2897), .B1(n3198), .A0N(color2[17]), .A1N(n1897), .Y(
        n1713) );
  AOI22X1 U2380 ( .A0(n2915), .A1(color2[5]), .B0(n1856), .B1(color2[1]), .Y(
        n1711) );
  NAND3X2 U2381 ( .A(n1711), .B(n1710), .C(n1709), .Y(n1712) );
  OR3X2 U2382 ( .A(n1714), .B(n1713), .C(n1712), .Y(n1715) );
  NOR2X4 U2383 ( .A(n2492), .B(n1716), .Y(n1737) );
  OAI22X1 U2384 ( .A0(n2905), .A1(n3095), .B0(n2912), .B1(n3202), .Y(n1720) );
  OAI22X1 U2385 ( .A0(n2426), .A1(n3071), .B0(n1727), .B1(n3168), .Y(n1719) );
  AOI22X1 U2386 ( .A0(n2915), .A1(color2[69]), .B0(n1856), .B1(color2[65]), 
        .Y(n1717) );
  NAND4BBX1 U2387 ( .AN(n1720), .BN(n1719), .C(n1718), .D(n1717), .Y(n1721) );
  NAND2X2 U2388 ( .A(n2491), .B(n1721), .Y(n1735) );
  OAI22X1 U2389 ( .A0(n2905), .A1(n3047), .B0(n2912), .B1(n3200), .Y(n1725) );
  OAI22X1 U2390 ( .A0(n2426), .A1(n1607), .B0(n1727), .B1(n1591), .Y(n1724) );
  AOI22X1 U2391 ( .A0(n2917), .A1(color2[121]), .B0(n2903), .B1(color2[113]), 
        .Y(n1723) );
  AOI22X1 U2392 ( .A0(n2915), .A1(color2[101]), .B0(n1856), .B1(color2[97]), 
        .Y(n1722) );
  NAND4BBX1 U2393 ( .AN(n1725), .BN(n1724), .C(n1723), .D(n1722), .Y(n1726) );
  NAND2X2 U2394 ( .A(n2489), .B(n1726), .Y(n1734) );
  OAI22X1 U2395 ( .A0(n2905), .A1(n16030), .B0(n1545), .B1(n1600), .Y(n1731)
         );
  OAI22X1 U2396 ( .A0(n2426), .A1(n3174), .B0(n1727), .B1(n1588), .Y(n1730) );
  AOI22X1 U2397 ( .A0(n2917), .A1(color2[57]), .B0(n2903), .B1(color2[49]), 
        .Y(n1729) );
  AOI22X1 U2398 ( .A0(n2915), .A1(color2[37]), .B0(n1856), .B1(color2[33]), 
        .Y(n1728) );
  NAND4BBX1 U2399 ( .AN(n1731), .BN(n1730), .C(n1729), .D(n1728), .Y(n1732) );
  NAND2X2 U2400 ( .A(n2495), .B(n1732), .Y(n1733) );
  NAND3X2 U2401 ( .A(n1735), .B(n1734), .C(n1733), .Y(n1736) );
  NOR2X6 U2402 ( .A(n1737), .B(n1736), .Y(n2487) );
  BUFX12 U2403 ( .A(n2487), .Y(n2656) );
  NAND3X8 U2404 ( .A(n1738), .B(n2693), .C(n2656), .Y(n2513) );
  NOR2X8 U2405 ( .A(n1739), .B(n2899), .Y(n1740) );
  NAND2BX4 U2406 ( .AN(n2900), .B(n1740), .Y(n2125) );
  AND2X4 U2407 ( .A(n2900), .B(n1753), .Y(n1754) );
  OAI22X1 U2408 ( .A0(n2266), .A1(n3046), .B0(n2245), .B1(n3192), .Y(n1744) );
  INVX12 U2409 ( .A(n2161), .Y(n1756) );
  NOR2X6 U2410 ( .A(n1906), .B(n2425), .Y(n1745) );
  OAI22X1 U2411 ( .A0(n2258), .A1(n3204), .B0(n2267), .B1(n3097), .Y(n1743) );
  NOR2X1 U2412 ( .A(n1744), .B(n1743), .Y(n1752) );
  NAND2BX4 U2413 ( .AN(n2900), .B(n1748), .Y(n2120) );
  NAND2X1 U2414 ( .A(n1779), .B(row2[12]), .Y(n1751) );
  NAND2X1 U2415 ( .A(n1747), .B(row2[4]), .Y(n1750) );
  NAND2X1 U2416 ( .A(n2269), .B(row2[28]), .Y(n1749) );
  NAND4X1 U2417 ( .A(n1752), .B(n1751), .C(n1750), .D(n1749), .Y(n1767) );
  NAND2X8 U2418 ( .A(n3331), .B(n1753), .Y(n1775) );
  INVX8 U2419 ( .A(n1754), .Y(n2265) );
  CLKINVX1 U2420 ( .A(n2265), .Y(n1755) );
  NAND2X1 U2421 ( .A(n1755), .B(row2[19]), .Y(n1762) );
  INVX12 U2422 ( .A(n1756), .Y(n2268) );
  CLKINVX1 U2423 ( .A(n2268), .Y(n1757) );
  NAND2X1 U2424 ( .A(n1757), .B(row2[27]), .Y(n1761) );
  CLKINVX1 U2425 ( .A(n2267), .Y(n1758) );
  NAND2X1 U2426 ( .A(n1758), .B(row2[23]), .Y(n1760) );
  NAND2X1 U2427 ( .A(n2269), .B(row2[31]), .Y(n1759) );
  NAND4X1 U2428 ( .A(n1762), .B(n1761), .C(n1760), .D(n1759), .Y(n1764) );
  OAI22X1 U2429 ( .A0(n2271), .A1(n3050), .B0(n2266), .B1(n3125), .Y(n1763) );
  NOR3X2 U2430 ( .A(n1765), .B(n1764), .C(n1763), .Y(n1766) );
  NAND2X1 U2431 ( .A(n1779), .B(row2[14]), .Y(n1772) );
  NAND2X1 U2432 ( .A(n1780), .B(row2[2]), .Y(n1771) );
  OAI22X1 U2433 ( .A0(n2245), .A1(n3108), .B0(n2268), .B1(n3230), .Y(n1769) );
  OAI22X1 U2434 ( .A0(n2796), .A1(n3109), .B0(n2267), .B1(n3231), .Y(n1768) );
  NOR2X1 U2435 ( .A(n1769), .B(n1768), .Y(n1770) );
  NAND4BX2 U2436 ( .AN(n1773), .B(n1772), .C(n1771), .D(n1770), .Y(n1777) );
  NOR2X8 U2437 ( .A(n1776), .B(n1775), .Y(n2800) );
  AOI2BB2X2 U2438 ( .B0(n1777), .B1(n1542), .A0N(n1543), .A1N(n3209), .Y(n1789) );
  OAI22X1 U2439 ( .A0(n2255), .A1(n3048), .B0(n2266), .B1(n3207), .Y(n1786) );
  NAND2X1 U2440 ( .A(n1779), .B(row2[13]), .Y(n1785) );
  NAND2X1 U2441 ( .A(n1780), .B(row2[1]), .Y(n1784) );
  OAI22X1 U2442 ( .A0(n2265), .A1(n3099), .B0(n2258), .B1(n3206), .Y(n1782) );
  OAI22X1 U2443 ( .A0(n2796), .A1(n3205), .B0(n2267), .B1(n3098), .Y(n1781) );
  NAND4BX1 U2444 ( .AN(n1786), .B(n1785), .C(n1784), .D(n1783), .Y(n1787) );
  NAND2X2 U2445 ( .A(n1787), .B(n2241), .Y(n1788) );
  NAND3X4 U2446 ( .A(n1790), .B(n1789), .C(n1788), .Y(n2682) );
  CLKINVX1 U2447 ( .A(n2682), .Y(n1791) );
  OR2X8 U2448 ( .A(n2513), .B(n1791), .Y(n2787) );
  INVX12 U2449 ( .A(n1586), .Y(n2911) );
  OAI22XL U2450 ( .A0(n1602), .A1(n1896), .B0(n2911), .B1(n1601), .Y(n1794) );
  AOI22X1 U2451 ( .A0(n2917), .A1(color1[88]), .B0(color1[80]), .B1(n1897), 
        .Y(n1793) );
  AOI22X1 U2452 ( .A0(n2915), .A1(color1[68]), .B0(n1856), .B1(color1[64]), 
        .Y(n1792) );
  NAND2X1 U2453 ( .A(n2491), .B(n1796), .Y(n1809) );
  AOI22X1 U2454 ( .A0(n2917), .A1(color1[120]), .B0(color1[112]), .B1(n1897), 
        .Y(n1798) );
  AOI22X1 U2455 ( .A0(n2915), .A1(color1[100]), .B0(n1856), .B1(color1[96]), 
        .Y(n1797) );
  NAND4BBX1 U2456 ( .AN(n1800), .BN(n1799), .C(n1798), .D(n1797), .Y(n1801) );
  NAND2X1 U2457 ( .A(n2489), .B(n1801), .Y(n1808) );
  AOI22X1 U2458 ( .A0(n2917), .A1(color1[56]), .B0(color1[48]), .B1(n1897), 
        .Y(n1803) );
  AOI22X1 U2459 ( .A0(n2915), .A1(color1[36]), .B0(n1856), .B1(color1[32]), 
        .Y(n1802) );
  NAND4BBX1 U2460 ( .AN(n1805), .BN(n1804), .C(n1803), .D(n1802), .Y(n1806) );
  NAND2X1 U2461 ( .A(n2495), .B(n1806), .Y(n1807) );
  NAND3X2 U2462 ( .A(n1809), .B(n1808), .C(n1807), .Y(n1818) );
  AOI22X1 U2463 ( .A0(n2915), .A1(color1[4]), .B0(n1856), .B1(color1[0]), .Y(
        n1812) );
  NAND2X1 U2464 ( .A(n2908), .B(color1[12]), .Y(n1811) );
  NAND2X1 U2465 ( .A(n1642), .B(color1[8]), .Y(n1810) );
  NAND3X1 U2466 ( .A(n1812), .B(n1811), .C(n1810), .Y(n1815) );
  OAI22X1 U2467 ( .A0(n3189), .A1(n1896), .B0(n2911), .B1(n3066), .Y(n1814) );
  OAI2BB2XL U2468 ( .B0(n2897), .B1(n3033), .A0N(color1[16]), .A1N(n1897), .Y(
        n1813) );
  NOR3X1 U2469 ( .A(n1815), .B(n1814), .C(n1813), .Y(n1816) );
  OAI22XL U2470 ( .A0(n1590), .A1(n2905), .B0(n2912), .B1(n3062), .Y(n1822) );
  OAI22XL U2471 ( .A0(n3181), .A1(n1896), .B0(n2911), .B1(n1589), .Y(n1821) );
  AOI22X1 U2472 ( .A0(n2917), .A1(color1[89]), .B0(color1[81]), .B1(n1897), 
        .Y(n1820) );
  AOI22X1 U2473 ( .A0(n2915), .A1(color1[69]), .B0(n1856), .B1(color1[65]), 
        .Y(n1819) );
  NAND4BBX1 U2474 ( .AN(n1822), .BN(n1821), .C(n1820), .D(n1819), .Y(n1823) );
  NAND2X1 U2475 ( .A(n2491), .B(n1823), .Y(n1836) );
  OAI22XL U2476 ( .A0(n3068), .A1(n2905), .B0(n2912), .B1(n3162), .Y(n1827) );
  OAI22XL U2477 ( .A0(n1606), .A1(n1896), .B0(n2911), .B1(n3182), .Y(n1826) );
  AOI22X1 U2478 ( .A0(n2917), .A1(color1[121]), .B0(color1[113]), .B1(n2903), 
        .Y(n1825) );
  NAND2X1 U2479 ( .A(n2489), .B(n1828), .Y(n1835) );
  OAI22XL U2480 ( .A0(n3172), .A1(n2905), .B0(n1545), .B1(n3056), .Y(n1831) );
  AOI22X1 U2481 ( .A0(n2917), .A1(color1[57]), .B0(color1[49]), .B1(n2903), 
        .Y(n1830) );
  AOI22X1 U2482 ( .A0(n2915), .A1(color1[37]), .B0(n2909), .B1(color1[33]), 
        .Y(n1829) );
  NAND4BBX1 U2483 ( .AN(n1832), .BN(n1831), .C(n1830), .D(n1829), .Y(n1833) );
  NAND2X1 U2484 ( .A(n2495), .B(n1833), .Y(n1834) );
  NAND3X2 U2485 ( .A(n1836), .B(n1835), .C(n1834), .Y(n1845) );
  AOI22X1 U2486 ( .A0(n2915), .A1(color1[5]), .B0(n2909), .B1(color1[1]), .Y(
        n1839) );
  NAND2X1 U2487 ( .A(n2908), .B(color1[13]), .Y(n1838) );
  NAND2X1 U2488 ( .A(n1642), .B(color1[9]), .Y(n1837) );
  OAI2BB2XL U2489 ( .B0(n2897), .B1(n3159), .A0N(color1[17]), .A1N(n1897), .Y(
        n1840) );
  NOR2X2 U2490 ( .A(n2492), .B(n1843), .Y(n1844) );
  NOR2X8 U2491 ( .A(n1845), .B(n1844), .Y(n2738) );
  NAND2X4 U2492 ( .A(n2687), .B(n2738), .Y(n2652) );
  OAI22X1 U2493 ( .A0(n3072), .A1(n2905), .B0(n1884), .B1(n3031), .Y(n1849) );
  AOI22X1 U2494 ( .A0(n2917), .A1(color1[90]), .B0(color1[82]), .B1(n2903), 
        .Y(n1847) );
  AOI22X1 U2495 ( .A0(n2915), .A1(color1[70]), .B0(n2909), .B1(color1[66]), 
        .Y(n1846) );
  NAND4BBX1 U2496 ( .AN(n1849), .BN(n1848), .C(n1847), .D(n1846), .Y(n1850) );
  NAND2X1 U2497 ( .A(n2491), .B(n1850), .Y(n1864) );
  OAI22XL U2498 ( .A0(n3153), .A1(n1896), .B0(n2911), .B1(n3054), .Y(n1853) );
  AOI22X1 U2499 ( .A0(n2917), .A1(color1[122]), .B0(color1[114]), .B1(n2903), 
        .Y(n1852) );
  AOI22XL U2500 ( .A0(n2915), .A1(color1[102]), .B0(n2909), .B1(color1[98]), 
        .Y(n1851) );
  NAND2X2 U2501 ( .A(n2489), .B(n1855), .Y(n1863) );
  OAI22X1 U2502 ( .A0(n3193), .A1(n2905), .B0(n1884), .B1(n3026), .Y(n1859) );
  AOI22X1 U2503 ( .A0(n2917), .A1(color1[58]), .B0(color1[50]), .B1(n2903), 
        .Y(n1858) );
  AOI22X1 U2504 ( .A0(n2915), .A1(color1[38]), .B0(n1856), .B1(color1[34]), 
        .Y(n1857) );
  NAND4BBX1 U2505 ( .AN(n1860), .BN(n1859), .C(n1858), .D(n1857), .Y(n1861) );
  NAND2X1 U2506 ( .A(n2495), .B(n1861), .Y(n1862) );
  NAND3X4 U2507 ( .A(n1864), .B(n1863), .C(n1862), .Y(n1873) );
  AOI22X1 U2508 ( .A0(n2915), .A1(color1[6]), .B0(n2909), .B1(color1[2]), .Y(
        n1867) );
  NAND2X1 U2509 ( .A(n2908), .B(color1[14]), .Y(n1866) );
  NAND2X1 U2510 ( .A(n1642), .B(color1[10]), .Y(n1865) );
  NAND3X1 U2511 ( .A(n1867), .B(n1866), .C(n1865), .Y(n1870) );
  OAI2BB2XL U2512 ( .B0(n2897), .B1(n3034), .A0N(color1[18]), .A1N(n1897), .Y(
        n1868) );
  NOR3X1 U2513 ( .A(n1870), .B(n1869), .C(n1868), .Y(n1871) );
  NOR2X2 U2514 ( .A(n2492), .B(n1871), .Y(n1872) );
  OAI22X1 U2515 ( .A0(n3039), .A1(n2905), .B0(n2912), .B1(n3069), .Y(n1877) );
  AOI22X1 U2516 ( .A0(n2917), .A1(color1[123]), .B0(color1[115]), .B1(n1897), 
        .Y(n1875) );
  AOI22X1 U2517 ( .A0(n2915), .A1(color1[103]), .B0(n2909), .B1(color1[99]), 
        .Y(n1874) );
  NAND4BBX1 U2518 ( .AN(n1877), .BN(n1876), .C(n1875), .D(n1874), .Y(n1878) );
  NAND2X1 U2519 ( .A(n2489), .B(n1878), .Y(n1892) );
  OAI22XL U2520 ( .A0(n3165), .A1(n2905), .B0(n1545), .B1(n3030), .Y(n1882) );
  OAI22X1 U2521 ( .A0(n3171), .A1(n1896), .B0(n2911), .B1(n3057), .Y(n1881) );
  AOI22X1 U2522 ( .A0(n2917), .A1(color1[91]), .B0(color1[83]), .B1(n2903), 
        .Y(n1880) );
  AOI22X1 U2523 ( .A0(n2915), .A1(color1[71]), .B0(n2909), .B1(color1[67]), 
        .Y(n1879) );
  NAND4BBX1 U2524 ( .AN(n1882), .BN(n1881), .C(n1880), .D(n1879), .Y(n1883) );
  NAND2X1 U2525 ( .A(n2491), .B(n1883), .Y(n1891) );
  OAI22X1 U2526 ( .A0(n3040), .A1(n2905), .B0(n2912), .B1(n3164), .Y(n1887) );
  AOI22X1 U2527 ( .A0(n2917), .A1(color1[59]), .B0(color1[51]), .B1(n2903), 
        .Y(n1886) );
  NAND4BBX1 U2528 ( .AN(n1888), .BN(n1887), .C(n1886), .D(n1885), .Y(n1889) );
  NAND2X1 U2529 ( .A(n2495), .B(n1889), .Y(n1890) );
  NAND3X2 U2530 ( .A(n1892), .B(n1891), .C(n1890), .Y(n1903) );
  AOI22X1 U2531 ( .A0(n2915), .A1(color1[7]), .B0(n2909), .B1(color1[3]), .Y(
        n1895) );
  NAND2X1 U2532 ( .A(n2908), .B(color1[15]), .Y(n1894) );
  NAND2X1 U2533 ( .A(n1642), .B(color1[11]), .Y(n1893) );
  NAND3X1 U2534 ( .A(n1895), .B(n1894), .C(n1893), .Y(n1900) );
  NOR3X1 U2535 ( .A(n1900), .B(n1899), .C(n1898), .Y(n1901) );
  NOR2X2 U2536 ( .A(n2492), .B(n1901), .Y(n1902) );
  NOR2X8 U2537 ( .A(n1903), .B(n1902), .Y(n2793) );
  AND2X8 U2538 ( .A(n2727), .B(n2793), .Y(n2664) );
  NOR3X6 U2539 ( .A(n2787), .B(n2652), .C(n1904), .Y(n2286) );
  NOR2X8 U2540 ( .A(n1908), .B(n1907), .Y(n1909) );
  NAND2X8 U2541 ( .A(n1909), .B(n2437), .Y(n1921) );
  INVX12 U2542 ( .A(n1921), .Y(n2781) );
  NAND2X8 U2543 ( .A(n2781), .B(n3331), .Y(n1911) );
  XNOR2X4 U2544 ( .A(n2437), .B(n3370), .Y(n1924) );
  INVX8 U2545 ( .A(n1924), .Y(n1927) );
  NOR2X8 U2546 ( .A(n1911), .B(n2899), .Y(n2099) );
  NAND2X1 U2547 ( .A(n2026), .B(color1[100]), .Y(n1912) );
  NAND3X2 U2548 ( .A(n1914), .B(n1913), .C(n1912), .Y(n1919) );
  NOR2X2 U2549 ( .A(n1921), .B(n2425), .Y(n1917) );
  NOR2X1 U2550 ( .A(n2104), .B(n3058), .Y(n1918) );
  NOR2X2 U2551 ( .A(n1919), .B(n1918), .Y(n1932) );
  BUFX20 U2552 ( .A(n2082), .Y(n2108) );
  NAND2X2 U2553 ( .A(n1921), .B(n1924), .Y(n1922) );
  AOI22X1 U2554 ( .A0(color1[52]), .A1(n2108), .B0(n2107), .B1(color1[20]), 
        .Y(n1931) );
  NAND2X6 U2555 ( .A(n1925), .B(n2973), .Y(n1928) );
  OR2X8 U2556 ( .A(n1928), .B(n1927), .Y(n1939) );
  NAND2X1 U2557 ( .A(n2083), .B(color1[84]), .Y(n1929) );
  NAND4X2 U2558 ( .A(n1932), .B(n1931), .C(n1930), .D(n1929), .Y(n1933) );
  NAND2X2 U2559 ( .A(n1933), .B(n1542), .Y(n1946) );
  NAND2X1 U2560 ( .A(n2098), .B(color1[0]), .Y(n1936) );
  NAND2X1 U2561 ( .A(n2026), .B(color1[96]), .Y(n1934) );
  NAND3X2 U2562 ( .A(n1936), .B(n1935), .C(n1934), .Y(n1938) );
  NOR2X1 U2563 ( .A(n2104), .B(n3085), .Y(n1937) );
  NOR2X2 U2564 ( .A(n1938), .B(n1937), .Y(n1943) );
  AOI22X1 U2565 ( .A0(color1[48]), .A1(n2108), .B0(n2107), .B1(color1[16]), 
        .Y(n1942) );
  NAND4X2 U2566 ( .A(n1943), .B(n1942), .C(n1941), .D(n1940), .Y(n1944) );
  NAND2X4 U2567 ( .A(n1946), .B(n1945), .Y(n1970) );
  NAND3X2 U2568 ( .A(n1949), .B(n1948), .C(n1947), .Y(n1952) );
  NOR2X1 U2569 ( .A(n2069), .B(n3156), .Y(n1951) );
  NOR2X4 U2570 ( .A(n1952), .B(n1951), .Y(n1956) );
  AOI22X1 U2571 ( .A0(color1[60]), .A1(n2108), .B0(n2107), .B1(color1[28]), 
        .Y(n1955) );
  NAND4X2 U2572 ( .A(n1956), .B(n1955), .C(n1954), .D(n1953), .Y(n1968) );
  AOI22X2 U2573 ( .A0(color1[56]), .A1(n2108), .B0(n2107), .B1(color1[24]), 
        .Y(n1965) );
  NAND2X1 U2574 ( .A(n2098), .B(color1[8]), .Y(n1959) );
  NAND2X1 U2575 ( .A(n2026), .B(color1[104]), .Y(n1957) );
  NAND3X2 U2576 ( .A(n1959), .B(n1958), .C(n1957), .Y(n1961) );
  NAND4X2 U2577 ( .A(n1965), .B(n1964), .C(n1963), .D(n1962), .Y(n1966) );
  OAI2BB1X4 U2578 ( .A0N(n2278), .A1N(n1968), .B0(n1967), .Y(n1969) );
  NOR2X8 U2579 ( .A(n1970), .B(n1969), .Y(n2676) );
  AOI22X1 U2580 ( .A0(color1[49]), .A1(n2108), .B0(n2107), .B1(color1[17]), 
        .Y(n1979) );
  NAND2X2 U2581 ( .A(n2098), .B(color1[1]), .Y(n1973) );
  NAND2X2 U2582 ( .A(n2065), .B(color1[33]), .Y(n1972) );
  NAND3X2 U2583 ( .A(n1973), .B(n1972), .C(n1971), .Y(n1975) );
  NAND2X2 U2584 ( .A(n2098), .B(color1[5]), .Y(n1982) );
  NAND3X2 U2585 ( .A(n1982), .B(n1981), .C(n1980), .Y(n1984) );
  NOR2X1 U2586 ( .A(n2104), .B(n3059), .Y(n1983) );
  AOI22X2 U2587 ( .A0(color1[53]), .A1(n2108), .B0(n2107), .B1(color1[21]), 
        .Y(n1987) );
  NAND2X1 U2588 ( .A(n2109), .B(color1[117]), .Y(n1986) );
  OAI2BB1X4 U2589 ( .A0N(n2241), .A1N(n1991), .B0(n1990), .Y(n2015) );
  AOI22X2 U2590 ( .A0(color1[61]), .A1(n2108), .B0(n2107), .B1(color1[29]), 
        .Y(n2000) );
  NAND2X1 U2591 ( .A(n2099), .B(color1[45]), .Y(n1994) );
  NAND2X2 U2592 ( .A(n2098), .B(color1[13]), .Y(n1993) );
  NAND3X2 U2593 ( .A(n1994), .B(n1993), .C(n1992), .Y(n1996) );
  NOR2X1 U2594 ( .A(n2104), .B(n1590), .Y(n1995) );
  NOR2X2 U2595 ( .A(n1996), .B(n1995), .Y(n1999) );
  NAND2X1 U2596 ( .A(n2109), .B(color1[125]), .Y(n1998) );
  NAND4X2 U2597 ( .A(n2000), .B(n1999), .C(n1998), .D(n1997), .Y(n2001) );
  NAND2X4 U2598 ( .A(n2001), .B(n2278), .Y(n2013) );
  AOI22X2 U2599 ( .A0(color1[57]), .A1(n2108), .B0(n2107), .B1(color1[25]), 
        .Y(n2010) );
  NAND2X2 U2600 ( .A(n2098), .B(color1[9]), .Y(n2004) );
  NAND2X2 U2601 ( .A(n2065), .B(color1[41]), .Y(n2003) );
  NAND2X1 U2602 ( .A(n2026), .B(color1[105]), .Y(n2002) );
  NAND2X2 U2603 ( .A(n2011), .B(n2250), .Y(n2012) );
  NOR2X8 U2604 ( .A(n2015), .B(n2014), .Y(n2740) );
  NAND2X2 U2605 ( .A(n2098), .B(color1[7]), .Y(n2018) );
  NAND2X2 U2606 ( .A(n2026), .B(color1[103]), .Y(n2016) );
  NOR2X2 U2607 ( .A(n2069), .B(n3155), .Y(n2019) );
  NOR2X4 U2608 ( .A(n2020), .B(n2019), .Y(n2024) );
  AOI22X2 U2609 ( .A0(color1[55]), .A1(n2108), .B0(n2107), .B1(color1[23]), 
        .Y(n2023) );
  NAND2X2 U2610 ( .A(n2109), .B(color1[119]), .Y(n2022) );
  NAND2X2 U2611 ( .A(n2083), .B(color1[87]), .Y(n2021) );
  NAND4X4 U2612 ( .A(n2024), .B(n2023), .C(n2022), .D(n2021), .Y(n2025) );
  NAND2X1 U2613 ( .A(n2027), .B(color1[3]), .Y(n2028) );
  NOR2X2 U2614 ( .A(n2104), .B(n3032), .Y(n2031) );
  AOI22X2 U2615 ( .A0(color1[51]), .A1(n2108), .B0(n2107), .B1(color1[19]), 
        .Y(n2035) );
  NAND2X2 U2616 ( .A(n2109), .B(color1[115]), .Y(n2034) );
  NAND4X4 U2617 ( .A(n2036), .B(n2035), .C(n2034), .D(n2033), .Y(n2037) );
  NAND2X6 U2618 ( .A(n2037), .B(n2241), .Y(n2038) );
  NAND2X6 U2619 ( .A(n2039), .B(n2038), .Y(n2064) );
  NAND2X1 U2620 ( .A(n2100), .B(color1[107]), .Y(n2041) );
  NAND2X2 U2621 ( .A(n2098), .B(color1[11]), .Y(n2040) );
  NAND3BX4 U2622 ( .AN(n2042), .B(n2041), .C(n2040), .Y(n2044) );
  NOR2X2 U2623 ( .A(n2069), .B(n3030), .Y(n2043) );
  NOR2X4 U2624 ( .A(n2044), .B(n2043), .Y(n2048) );
  AOI22X2 U2625 ( .A0(color1[59]), .A1(n2108), .B0(n2107), .B1(color1[27]), 
        .Y(n2047) );
  NAND2X2 U2626 ( .A(n2109), .B(color1[123]), .Y(n2046) );
  NAND2X2 U2627 ( .A(n2083), .B(color1[91]), .Y(n2045) );
  NAND4X4 U2628 ( .A(n2048), .B(n2047), .C(n2046), .D(n2045), .Y(n2049) );
  NAND2X2 U2629 ( .A(color1[63]), .B(n2108), .Y(n2051) );
  AND2X4 U2630 ( .A(n2051), .B(n2050), .Y(n2059) );
  NAND2X1 U2631 ( .A(n2100), .B(color1[111]), .Y(n2052) );
  NOR2X2 U2632 ( .A(n2104), .B(n3165), .Y(n2054) );
  NOR2X6 U2633 ( .A(n2055), .B(n2054), .Y(n2058) );
  NAND2X2 U2634 ( .A(n2109), .B(color1[127]), .Y(n2057) );
  NAND2X2 U2635 ( .A(n2083), .B(color1[95]), .Y(n2056) );
  NAND2X6 U2636 ( .A(n2060), .B(n2278), .Y(n2061) );
  NAND2X8 U2637 ( .A(n2062), .B(n2061), .Y(n2063) );
  NOR2X8 U2638 ( .A(n2064), .B(n2063), .Y(n2456) );
  INVX12 U2639 ( .A(n2456), .Y(n2642) );
  NAND2X2 U2640 ( .A(n2065), .B(color1[34]), .Y(n2068) );
  NAND2X2 U2641 ( .A(n2098), .B(color1[2]), .Y(n2067) );
  NAND2X1 U2642 ( .A(n2100), .B(color1[98]), .Y(n2066) );
  NOR2X2 U2643 ( .A(n2069), .B(n3064), .Y(n2070) );
  AOI22X2 U2644 ( .A0(color1[50]), .A1(n2108), .B0(n2107), .B1(color1[18]), 
        .Y(n2074) );
  NAND2X2 U2645 ( .A(n2109), .B(color1[114]), .Y(n2073) );
  NAND2X2 U2646 ( .A(n2083), .B(color1[82]), .Y(n2072) );
  NAND4X4 U2647 ( .A(n2075), .B(n2074), .C(n2073), .D(n2072), .Y(n2076) );
  NAND2X1 U2648 ( .A(n2100), .B(color1[102]), .Y(n2077) );
  NAND2BX4 U2649 ( .AN(n2079), .B(n2078), .Y(n2081) );
  NOR2X2 U2650 ( .A(n2104), .B(n3060), .Y(n2080) );
  AOI22X2 U2651 ( .A0(color1[54]), .A1(n2082), .B0(n2107), .B1(color1[22]), 
        .Y(n2086) );
  NAND2X2 U2652 ( .A(n2109), .B(color1[118]), .Y(n2085) );
  NAND2X2 U2653 ( .A(n2083), .B(color1[86]), .Y(n2084) );
  NOR2X2 U2654 ( .A(n2104), .B(n3072), .Y(n2092) );
  NOR2BX4 U2655 ( .AN(n2093), .B(n2092), .Y(n2096) );
  NAND2X2 U2656 ( .A(n2109), .B(color1[126]), .Y(n2095) );
  AOI22X4 U2657 ( .A0(color1[62]), .A1(n2108), .B0(n2107), .B1(color1[30]), 
        .Y(n2094) );
  NAND2X2 U2658 ( .A(n2098), .B(color1[10]), .Y(n2103) );
  NAND2X1 U2659 ( .A(n2100), .B(color1[106]), .Y(n2101) );
  NAND3X4 U2660 ( .A(n2103), .B(n2102), .C(n2101), .Y(n2106) );
  NOR2X2 U2661 ( .A(n2104), .B(n3031), .Y(n2105) );
  NOR2X4 U2662 ( .A(n2106), .B(n2105), .Y(n2114) );
  AOI22X4 U2663 ( .A0(color1[58]), .A1(n2108), .B0(n2107), .B1(color1[26]), 
        .Y(n2113) );
  NAND2X2 U2664 ( .A(n2109), .B(color1[122]), .Y(n2112) );
  NAND4X4 U2665 ( .A(n2114), .B(n2113), .C(n2112), .D(n2111), .Y(n2115) );
  NAND4X8 U2666 ( .A(n2119), .B(n2118), .C(n2117), .D(n2116), .Y(n2508) );
  NOR2X8 U2667 ( .A(n2642), .B(n2508), .Y(n2516) );
  BUFX16 U2668 ( .A(n2516), .Y(n2551) );
  NOR2X1 U2669 ( .A(n2122), .B(n2121), .Y(n2130) );
  NOR2X4 U2670 ( .A(n2124), .B(n2123), .Y(n2129) );
  NOR2X1 U2671 ( .A(n2255), .B(n3189), .Y(n2127) );
  NOR2X2 U2672 ( .A(n2127), .B(n2126), .Y(n2128) );
  NAND3X2 U2673 ( .A(n2130), .B(n2129), .C(n2128), .Y(n2131) );
  AOI2BB2X4 U2674 ( .B0(n2131), .B1(n2250), .A0N(n1543), .A1N(n3121), .Y(n2158) );
  INVX6 U2675 ( .A(n2132), .Y(n2253) );
  OAI22X1 U2676 ( .A0(n2253), .A1(n3101), .B0(n2252), .B1(n3228), .Y(n2134) );
  NOR2X2 U2677 ( .A(n2134), .B(n2133), .Y(n2138) );
  OAI22X1 U2678 ( .A0(n2796), .A1(n3102), .B0(n2267), .B1(n3216), .Y(n2136) );
  OAI22X1 U2679 ( .A0(n2245), .A1(n3061), .B0(n2161), .B1(n3160), .Y(n2135) );
  NOR2X2 U2680 ( .A(n2136), .B(n2135), .Y(n2137) );
  NAND2X2 U2681 ( .A(n2138), .B(n2137), .Y(n2139) );
  NAND2X2 U2682 ( .A(n2139), .B(n1542), .Y(n2157) );
  OAI22X2 U2683 ( .A0(n2271), .A1(n3066), .B0(n2266), .B1(n3222), .Y(n2141) );
  OAI22X1 U2684 ( .A0(n2270), .A1(n3052), .B0(n2252), .B1(n3221), .Y(n2140) );
  NOR2X2 U2685 ( .A(n2141), .B(n2140), .Y(n2145) );
  OAI22X1 U2686 ( .A0(n2796), .A1(n3053), .B0(n2267), .B1(n1601), .Y(n2142) );
  NOR2X2 U2687 ( .A(n2143), .B(n2142), .Y(n2144) );
  NAND2X2 U2688 ( .A(n2145), .B(n2144), .Y(n2146) );
  OAI22X1 U2689 ( .A0(n2258), .A1(n3118), .B0(n2267), .B1(n3238), .Y(n2148) );
  OAI22X1 U2690 ( .A0(n2254), .A1(n3211), .B0(n2245), .B1(n3085), .Y(n2147) );
  NOR2X2 U2691 ( .A(n2148), .B(n2147), .Y(n2153) );
  NOR2X1 U2692 ( .A(n2270), .B(n3116), .Y(n2150) );
  NOR2X1 U2693 ( .A(n2271), .B(n3126), .Y(n2149) );
  NOR2X2 U2694 ( .A(n2150), .B(n2149), .Y(n2152) );
  NOR2X4 U2695 ( .A(n2270), .B(n3191), .Y(n2160) );
  NOR2X1 U2696 ( .A(n2160), .B(n2159), .Y(n2168) );
  OAI22X1 U2697 ( .A0(n2796), .A1(n1606), .B0(n2267), .B1(n3181), .Y(n2163) );
  OAI22X1 U2698 ( .A0(n2265), .A1(n1590), .B0(n2161), .B1(n3068), .Y(n2162) );
  NOR2X2 U2699 ( .A(n2163), .B(n2162), .Y(n2167) );
  NOR2X1 U2700 ( .A(n2271), .B(n3169), .Y(n2165) );
  NOR2X1 U2701 ( .A(n2266), .B(n3172), .Y(n2164) );
  NOR2X2 U2702 ( .A(n2165), .B(n2164), .Y(n2166) );
  NAND3X2 U2703 ( .A(n2168), .B(n2167), .C(n2166), .Y(n2169) );
  AOI2BB2X4 U2704 ( .B0(n2169), .B1(n2250), .A0N(n1543), .A1N(n3122), .Y(n2195) );
  OAI22X1 U2705 ( .A0(n2270), .A1(n3044), .B0(n2252), .B1(n3111), .Y(n2171) );
  OAI22X1 U2706 ( .A0(n2796), .A1(n3182), .B0(n2267), .B1(n1589), .Y(n2172) );
  NOR2X2 U2707 ( .A(n2173), .B(n2172), .Y(n2174) );
  NAND2X2 U2708 ( .A(n2176), .B(n2241), .Y(n2194) );
  OAI22X1 U2709 ( .A0(n2253), .A1(n3100), .B0(n2252), .B1(n3229), .Y(n2178) );
  OAI22X1 U2710 ( .A0(n2271), .A1(n3159), .B0(n2254), .B1(n3056), .Y(n2177) );
  NOR2X2 U2711 ( .A(n2178), .B(n2177), .Y(n2182) );
  OAI22X1 U2712 ( .A0(n2796), .A1(n3103), .B0(n2267), .B1(n3215), .Y(n2179) );
  NOR2X2 U2713 ( .A(n2180), .B(n2179), .Y(n2181) );
  OAI22X1 U2714 ( .A0(n2268), .A1(n3119), .B0(n2267), .B1(n3237), .Y(n2184) );
  NOR2X2 U2715 ( .A(n2185), .B(n2184), .Y(n2190) );
  NOR2X1 U2716 ( .A(n2253), .B(n3232), .Y(n2187) );
  NOR2X1 U2717 ( .A(n2255), .B(n3240), .Y(n2186) );
  NOR2X2 U2718 ( .A(n2187), .B(n2186), .Y(n2189) );
  NAND4X8 U2719 ( .A(n2195), .B(n2194), .C(n2193), .D(n2192), .Y(n2562) );
  BUFX20 U2720 ( .A(n2597), .Y(n2619) );
  NOR2X1 U2721 ( .A(n2252), .B(n3236), .Y(n2196) );
  NOR2X1 U2722 ( .A(n2201), .B(n2200), .Y(n2202) );
  NAND3X2 U2723 ( .A(n2204), .B(n2203), .C(n2202), .Y(n2205) );
  NOR2X1 U2724 ( .A(n2209), .B(n2208), .Y(n2210) );
  NAND2X1 U2725 ( .A(n2211), .B(n2210), .Y(n2212) );
  NAND2X2 U2726 ( .A(n2212), .B(n2241), .Y(n2230) );
  NOR2X1 U2727 ( .A(n2214), .B(n2213), .Y(n2218) );
  NAND2X2 U2728 ( .A(n2218), .B(n2217), .Y(n2219) );
  NAND2X2 U2729 ( .A(n2219), .B(n1542), .Y(n2229) );
  NOR2X1 U2730 ( .A(n2221), .B(n2220), .Y(n2226) );
  NAND2X1 U2731 ( .A(n2269), .B(color1[114]), .Y(n2224) );
  NAND3X2 U2732 ( .A(n2226), .B(n2225), .C(n2224), .Y(n2227) );
  NAND4X4 U2733 ( .A(n2231), .B(n2230), .C(n2229), .D(n2228), .Y(n2567) );
  OAI22X1 U2734 ( .A0(n2796), .A1(n3028), .B0(n2267), .B1(n3057), .Y(n2234) );
  NAND3X2 U2735 ( .A(n2240), .B(n2239), .C(n2238), .Y(n2242) );
  NOR2X1 U2736 ( .A(n2244), .B(n2243), .Y(n2249) );
  OAI22X1 U2737 ( .A0(n2796), .A1(n3073), .B0(n2267), .B1(n3171), .Y(n2246) );
  NOR2X1 U2738 ( .A(n2247), .B(n2246), .Y(n2248) );
  NAND2X2 U2739 ( .A(n2249), .B(n2248), .Y(n2251) );
  NAND2X2 U2740 ( .A(n2251), .B(n2250), .Y(n2282) );
  NOR2X1 U2741 ( .A(n2257), .B(n2256), .Y(n2262) );
  OAI22X1 U2742 ( .A0(n2796), .A1(n3105), .B0(n2267), .B1(n3220), .Y(n2259) );
  NAND2X2 U2743 ( .A(n2262), .B(n2261), .Y(n2264) );
  NAND2X2 U2744 ( .A(n2264), .B(n1542), .Y(n2281) );
  INVX3 U2745 ( .A(n2505), .Y(n2284) );
  NAND3X8 U2746 ( .A(n2286), .B(n2285), .C(n2284), .Y(n2870) );
  NOR2X8 U2747 ( .A(n2870), .B(n3248), .Y(n2421) );
  NOR2X4 U2748 ( .A(n2872), .B(n3249), .Y(n2451) );
  NAND2X1 U2749 ( .A(n2451), .B(color[2]), .Y(n2931) );
  NAND2X1 U2750 ( .A(n2288), .B(n2287), .Y(n2876) );
  NAND2X1 U2751 ( .A(n2412), .B(n2289), .Y(n2416) );
  INVX8 U2752 ( .A(data[2]), .Y(n2290) );
  NOR2X4 U2753 ( .A(n2290), .B(data[1]), .Y(n2291) );
  INVX4 U2754 ( .A(n2291), .Y(n2300) );
  INVX12 U2755 ( .A(data[1]), .Y(n2292) );
  NAND2X1 U2756 ( .A(n2293), .B(table1[9]), .Y(n2296) );
  NAND2X1 U2757 ( .A(n2386), .B(table1[25]), .Y(n2295) );
  NOR2X4 U2758 ( .A(data[1]), .B(data[2]), .Y(n2301) );
  BUFX4 U2759 ( .A(n2301), .Y(n2371) );
  NAND2X1 U2760 ( .A(n2371), .B(table1[1]), .Y(n2294) );
  NAND2X1 U2761 ( .A(n2378), .B(table1[45]), .Y(n2305) );
  NAND2X1 U2762 ( .A(n2293), .B(table1[37]), .Y(n2304) );
  NAND2X1 U2763 ( .A(n2379), .B(table1[49]), .Y(n2303) );
  BUFX4 U2764 ( .A(n2301), .Y(n2387) );
  NAND2X1 U2765 ( .A(n2387), .B(table1[29]), .Y(n2302) );
  NAND2X1 U2766 ( .A(n2307), .B(n2376), .Y(n2318) );
  NAND2X1 U2767 ( .A(n2378), .B(table1[13]), .Y(n2310) );
  NAND2X1 U2768 ( .A(n2293), .B(table1[5]), .Y(n2309) );
  NAND2X1 U2769 ( .A(n2379), .B(table1[21]), .Y(n2308) );
  NAND3X1 U2770 ( .A(n2310), .B(n2309), .C(n2308), .Y(n2311) );
  NOR2X1 U2771 ( .A(data[3]), .B(data[0]), .Y(n2383) );
  NAND2X1 U2772 ( .A(n2311), .B(n2383), .Y(n2317) );
  NAND2X1 U2773 ( .A(n2293), .B(table1[41]), .Y(n2314) );
  NAND2X1 U2774 ( .A(n2386), .B(table1[53]), .Y(n2313) );
  NAND2X1 U2775 ( .A(n2371), .B(table1[33]), .Y(n2312) );
  NAND3X1 U2776 ( .A(n2314), .B(n2313), .C(n2312), .Y(n2315) );
  NAND2X1 U2777 ( .A(n2315), .B(n2391), .Y(n2316) );
  NAND4X4 U2778 ( .A(n2319), .B(n2318), .C(n2317), .D(n2316), .Y(n2848) );
  NAND2X1 U2779 ( .A(n2378), .B(table1[16]), .Y(n2323) );
  NAND2X1 U2780 ( .A(n2293), .B(table1[8]), .Y(n2322) );
  NAND2X1 U2781 ( .A(n2379), .B(table1[24]), .Y(n2321) );
  NAND2X1 U2782 ( .A(n2387), .B(table1[0]), .Y(n2320) );
  NAND2X1 U2783 ( .A(n2293), .B(table1[4]), .Y(n2326) );
  NAND2X1 U2784 ( .A(n2386), .B(table1[20]), .Y(n2325) );
  NAND2X1 U2785 ( .A(n2328), .B(n2383), .Y(n2340) );
  NAND2X1 U2786 ( .A(n2370), .B(table1[44]), .Y(n2332) );
  NAND2X1 U2787 ( .A(n2293), .B(table1[36]), .Y(n2331) );
  NAND2X1 U2788 ( .A(n2386), .B(table1[48]), .Y(n2330) );
  NAND2X1 U2789 ( .A(n2371), .B(table1[28]), .Y(n2329) );
  NAND4X2 U2790 ( .A(n2332), .B(n2331), .C(n2330), .D(n2329), .Y(n2333) );
  NAND2X1 U2791 ( .A(n2333), .B(n2376), .Y(n2339) );
  NAND2X1 U2792 ( .A(n2293), .B(table1[40]), .Y(n2336) );
  NAND2X1 U2793 ( .A(n2379), .B(table1[52]), .Y(n2335) );
  NAND2X1 U2794 ( .A(n2387), .B(table1[32]), .Y(n2334) );
  NAND4X2 U2795 ( .A(n2341), .B(n2340), .C(n2339), .D(n2338), .Y(n2841) );
  NOR2X4 U2796 ( .A(n2848), .B(n2841), .Y(n2399) );
  NAND2X1 U2797 ( .A(n2370), .B(table1[19]), .Y(n2345) );
  NAND2X1 U2798 ( .A(n2293), .B(table1[11]), .Y(n2344) );
  NAND2X1 U2799 ( .A(n2379), .B(table1[27]), .Y(n2343) );
  NAND2X1 U2800 ( .A(n2371), .B(table1[3]), .Y(n2342) );
  NAND4X1 U2801 ( .A(n2345), .B(n2344), .C(n2343), .D(n2342), .Y(n2346) );
  NAND2X1 U2802 ( .A(n2379), .B(table1[23]), .Y(n2347) );
  NAND3X1 U2803 ( .A(n2349), .B(n2348), .C(n2347), .Y(n2350) );
  NAND2X1 U2804 ( .A(n2378), .B(table1[47]), .Y(n2354) );
  NAND2X1 U2805 ( .A(n2293), .B(table1[39]), .Y(n2353) );
  NAND2X1 U2806 ( .A(n2386), .B(table1[51]), .Y(n2352) );
  NAND2X1 U2807 ( .A(n2387), .B(table1[31]), .Y(n2351) );
  NAND4X1 U2808 ( .A(n2354), .B(n2353), .C(n2352), .D(n2351), .Y(n2355) );
  NAND2X1 U2809 ( .A(n2355), .B(n2376), .Y(n2361) );
  NAND2X1 U2810 ( .A(n2293), .B(table1[43]), .Y(n2358) );
  NAND2X1 U2811 ( .A(n2386), .B(table1[55]), .Y(n2357) );
  NAND2X1 U2812 ( .A(n2371), .B(table1[35]), .Y(n2356) );
  NAND3X1 U2813 ( .A(n2358), .B(n2357), .C(n2356), .Y(n2359) );
  NAND2X1 U2814 ( .A(n2359), .B(n2391), .Y(n2360) );
  INVX3 U2815 ( .A(n2850), .Y(n2398) );
  NAND2X1 U2816 ( .A(n2378), .B(table1[18]), .Y(n2367) );
  NAND2X1 U2817 ( .A(n2293), .B(table1[10]), .Y(n2366) );
  NAND2X1 U2818 ( .A(n2386), .B(table1[26]), .Y(n2365) );
  NAND2X1 U2819 ( .A(n2387), .B(table1[2]), .Y(n2364) );
  NAND4X1 U2820 ( .A(n2367), .B(n2366), .C(n2365), .D(n2364), .Y(n2369) );
  NAND2X1 U2821 ( .A(n2370), .B(table1[46]), .Y(n2375) );
  NAND2X1 U2822 ( .A(n2293), .B(table1[38]), .Y(n2374) );
  NAND2X1 U2823 ( .A(n2379), .B(table1[50]), .Y(n2373) );
  NAND2X1 U2824 ( .A(n2371), .B(table1[30]), .Y(n2372) );
  NAND4X2 U2825 ( .A(n2375), .B(n2374), .C(n2373), .D(n2372), .Y(n2377) );
  NAND2X1 U2826 ( .A(n2377), .B(n2376), .Y(n2395) );
  NAND2X1 U2827 ( .A(n2378), .B(table1[14]), .Y(n2382) );
  NAND2X1 U2828 ( .A(n2293), .B(table1[6]), .Y(n2381) );
  NAND2X1 U2829 ( .A(n2379), .B(table1[22]), .Y(n2380) );
  NAND3X2 U2830 ( .A(n2382), .B(n2381), .C(n2380), .Y(n2384) );
  NAND2X1 U2831 ( .A(n2384), .B(n2383), .Y(n2394) );
  NAND2X1 U2832 ( .A(n2293), .B(table1[42]), .Y(n2390) );
  NAND2X1 U2833 ( .A(n2386), .B(table1[54]), .Y(n2389) );
  NAND2X1 U2834 ( .A(n2387), .B(table1[34]), .Y(n2388) );
  NAND3X1 U2835 ( .A(n2390), .B(n2389), .C(n2388), .Y(n2392) );
  NAND2X1 U2836 ( .A(n2392), .B(n2391), .Y(n2393) );
  NAND4X2 U2837 ( .A(n2396), .B(n2395), .C(n2394), .D(n2393), .Y(n2855) );
  INVX3 U2838 ( .A(n2855), .Y(n2397) );
  NAND3X4 U2839 ( .A(n2399), .B(n2398), .C(n2397), .Y(n2401) );
  NAND2X2 U2840 ( .A(n2401), .B(n2854), .Y(n2400) );
  BUFX8 U2841 ( .A(n2400), .Y(n2862) );
  INVX3 U2842 ( .A(n2854), .Y(n2890) );
  OR2X8 U2843 ( .A(n2401), .B(n2890), .Y(n2402) );
  OAI21X1 U2844 ( .A0(n2832), .A1(n2862), .B0(n2857), .Y(n2420) );
  NOR3X1 U2845 ( .A(n2862), .B(round2[7]), .C(n2416), .Y(n2404) );
  AOI211X1 U2846 ( .A0(n2891), .A1(n3403), .B0(n2404), .C0(n2403), .Y(n2405)
         );
  NOR2X8 U2847 ( .A(n2505), .B(n2787), .Y(n2439) );
  NOR2X4 U2848 ( .A(n2870), .B(n3249), .Y(n2408) );
  NAND2X2 U2849 ( .A(n2682), .B(n2681), .Y(n2694) );
  OAI21X1 U2850 ( .A0(n2787), .A1(n2743), .B0(n2694), .Y(n2407) );
  AOI211X4 U2851 ( .A0(n2640), .A1(n2439), .B0(n2408), .C0(n2407), .Y(n2409)
         );
  OAI21X4 U2852 ( .A0(n2738), .A1(n2792), .B0(n2409), .Y(N920) );
  INVX3 U2853 ( .A(n2891), .Y(n2881) );
  NOR2X2 U2854 ( .A(n2862), .B(round2[1]), .Y(n2772) );
  AOI211X1 U2855 ( .A0(counter_cal[1]), .A1(n2890), .B0(n2410), .C0(n2772), 
        .Y(n2411) );
  OA21X2 U2856 ( .A0(n2412), .A1(n2862), .B0(n2857), .Y(n2836) );
  AOI211X1 U2857 ( .A0(n2891), .A1(n3405), .B0(n2414), .C0(n2413), .Y(n2415)
         );
  NOR3X1 U2858 ( .A(n2416), .B(round2[7]), .C(round2[8]), .Y(n2860) );
  INVX12 U2859 ( .A(n2862), .Y(n2878) );
  OAI22X1 U2860 ( .A0(n2787), .A1(n2675), .B0(n2693), .B1(n2784), .Y(n2422) );
  AOI21X1 U2861 ( .A0(n2439), .A1(n2641), .B0(n2422), .Y(n2423) );
  OAI211X4 U2862 ( .A0(n2687), .A1(n2792), .B0(n2424), .C0(n2423), .Y(N919) );
  BUFX20 U2863 ( .A(n2937), .Y(n2961) );
  NOR2X4 U2864 ( .A(n2965), .B(n2425), .Y(n2799) );
  NOR2X1 U2865 ( .A(n2913), .B(n2426), .Y(n2921) );
  OR2X1 U2866 ( .A(N1516), .B(round2[1]), .Y(n2807) );
  OR2X2 U2867 ( .A(n2817), .B(round2[3]), .Y(n2813) );
  OR2X2 U2868 ( .A(n2823), .B(round2[5]), .Y(n2828) );
  OR2X1 U2869 ( .A(n2844), .B(round2[7]), .Y(n2883) );
  XNOR2X1 U2870 ( .A(n2428), .B(round2[9]), .Y(n2429) );
  AOI22X2 U2871 ( .A0(n2430), .A1(sram_wen), .B0(n2429), .B1(n2884), .Y(n2431)
         );
  MXI2X2 U2872 ( .A(n3268), .B(n2431), .S0(n2887), .Y(n1280) );
  BUFX20 U2873 ( .A(n2898), .Y(n2964) );
  MXI2X1 U2874 ( .A(n2964), .B(n3282), .S0(n2432), .Y(n1412) );
  NOR2X1 U2875 ( .A(n2913), .B(n2433), .Y(n2933) );
  MXI2X1 U2876 ( .A(n2964), .B(n3095), .S0(n2434), .Y(n1415) );
  NOR2X1 U2877 ( .A(n2913), .B(n2435), .Y(n2934) );
  MXI2X1 U2878 ( .A(n2964), .B(n3071), .S0(n2436), .Y(n1411) );
  NOR2X1 U2879 ( .A(n2913), .B(n2437), .Y(n2936) );
  MXI2X1 U2880 ( .A(n2964), .B(n3318), .S0(n2438), .Y(n1418) );
  INVX12 U2881 ( .A(n2508), .Y(n2457) );
  NOR2X2 U2882 ( .A(n2457), .B(n2783), .Y(n2449) );
  NAND4X4 U2883 ( .A(n2447), .B(n2446), .C(n2445), .D(n2444), .Y(n2666) );
  OAI22X1 U2884 ( .A0(n2787), .A1(n2725), .B0(n2661), .B1(n2784), .Y(n2448) );
  AOI211X2 U2885 ( .A0(n2790), .A1(color[2]), .B0(n2449), .C0(n2448), .Y(n2450) );
  OAI21X4 U2886 ( .A0(n2727), .A1(n2792), .B0(n2450), .Y(N921) );
  AOI2BB1X1 U2887 ( .A0N(color[1]), .A1N(n2452), .B0(n2451), .Y(n1515) );
  NOR2X4 U2888 ( .A(n2508), .B(n2456), .Y(n2453) );
  BUFX20 U2889 ( .A(n2453), .Y(n2553) );
  NOR2X8 U2890 ( .A(n2642), .B(n2457), .Y(n2454) );
  BUFX20 U2891 ( .A(n2454), .Y(n2552) );
  AOI222X2 U2892 ( .A0(table1[34]), .A1(n2553), .B0(n2552), .B1(table1[18]), 
        .C0(n2551), .C1(table1[2]), .Y(n2455) );
  NOR2X8 U2893 ( .A(n2782), .B(n2457), .Y(n2550) );
  AOI222X2 U2894 ( .A0(table1[30]), .A1(n2553), .B0(n2552), .B1(table1[14]), 
        .C0(n2550), .C1(table1[46]), .Y(n2459) );
  AO22X4 U2895 ( .A0(n2552), .A1(table1[22]), .B0(table1[6]), .B1(n2551), .Y(
        n2460) );
  OAI21X4 U2896 ( .A0(n2461), .A1(n2460), .B0(n1544), .Y(n2462) );
  INVX8 U2897 ( .A(n2465), .Y(n2471) );
  NAND2X4 U2898 ( .A(n2641), .B(n2640), .Y(n2529) );
  NAND2BX4 U2899 ( .AN(n2469), .B(n2545), .Y(n2470) );
  NAND2X8 U2900 ( .A(n2471), .B(n2470), .Y(n2730) );
  MXI2X1 U2901 ( .A(table1[36]), .B(table1[40]), .S0(n2641), .Y(n2477) );
  INVX3 U2902 ( .A(n2553), .Y(n2472) );
  NAND2X2 U2903 ( .A(n2473), .B(n2640), .Y(n2476) );
  MX2X2 U2904 ( .A(table1[20]), .B(table1[24]), .S0(n2641), .Y(n2474) );
  NAND3X2 U2905 ( .A(n2474), .B(n2552), .C(n2640), .Y(n2475) );
  OA21X4 U2906 ( .A0(n2477), .A1(n2476), .B0(n2475), .Y(n2486) );
  AOI222X2 U2907 ( .A0(table1[28]), .A1(n2553), .B0(n2552), .B1(table1[12]), 
        .C0(n2550), .C1(table1[44]), .Y(n2479) );
  AOI222X2 U2908 ( .A0(table1[32]), .A1(n2553), .B0(n2552), .B1(table1[16]), 
        .C0(n2551), .C1(table1[0]), .Y(n2478) );
  OA22X4 U2909 ( .A0(n2479), .A1(n2556), .B0(n2478), .B1(n2554), .Y(n2485) );
  OR3X2 U2910 ( .A(n2480), .B(n2740), .C(n2540), .Y(n2484) );
  MXI2X4 U2911 ( .A(table1[4]), .B(table1[8]), .S0(n2641), .Y(n2482) );
  OR3X2 U2912 ( .A(n2482), .B(n2481), .C(n2740), .Y(n2483) );
  XOR2X1 U2913 ( .A(n2487), .B(n2562), .Y(n2501) );
  NAND2X2 U2914 ( .A(n2491), .B(n2490), .Y(n2498) );
  OR2X4 U2915 ( .A(n2493), .B(n2492), .Y(n2497) );
  NAND2X2 U2916 ( .A(n2495), .B(n2494), .Y(n2496) );
  CLKAND2X8 U2917 ( .A(n2501), .B(n2500), .Y(n2504) );
  XOR2X2 U2918 ( .A(n2693), .B(n2563), .Y(n2503) );
  XNOR2X2 U2919 ( .A(n2567), .B(n2666), .Y(n2502) );
  NAND3X6 U2920 ( .A(n2504), .B(n2503), .C(n2502), .Y(n2507) );
  NAND2X8 U2921 ( .A(n2507), .B(n2506), .Y(n2649) );
  CLKBUFX8 U2922 ( .A(n2649), .Y(n2746) );
  XOR2X2 U2923 ( .A(n2641), .B(n2693), .Y(n2510) );
  XOR2X4 U2924 ( .A(n2640), .B(n2656), .Y(n2509) );
  NAND3X6 U2925 ( .A(n2647), .B(n2514), .C(n2513), .Y(n2650) );
  INVX3 U2926 ( .A(n2650), .Y(n2515) );
  NAND4X8 U2927 ( .A(n2635), .B(n2673), .C(n2746), .D(n2515), .Y(n2742) );
  AOI222X2 U2928 ( .A0(table1[33]), .A1(n2553), .B0(n2552), .B1(table1[17]), 
        .C0(n2516), .C1(table1[1]), .Y(n2518) );
  AOI222X2 U2929 ( .A0(table1[29]), .A1(n2553), .B0(n2552), .B1(table1[13]), 
        .C0(n2550), .C1(table1[45]), .Y(n2517) );
  OAI22X4 U2930 ( .A0(n2518), .A1(n2554), .B0(n2517), .B1(n2556), .Y(n2533) );
  NOR2X2 U2931 ( .A(n2540), .B(n3253), .Y(n2522) );
  AOI22X4 U2932 ( .A0(n1537), .A1(table1[5]), .B0(table1[37]), .B1(n2553), .Y(
        n2519) );
  OAI21X4 U2933 ( .A0(n2520), .A1(n3354), .B0(n2519), .Y(n2521) );
  NOR2X4 U2934 ( .A(n2522), .B(n2521), .Y(n2524) );
  NOR2X4 U2935 ( .A(n2540), .B(n3251), .Y(n2528) );
  INVX3 U2936 ( .A(n2552), .Y(n2526) );
  AOI22X4 U2937 ( .A0(n1537), .A1(table1[9]), .B0(table1[41]), .B1(n2553), .Y(
        n2525) );
  OAI21X4 U2938 ( .A0(n2526), .A1(n3351), .B0(n2525), .Y(n2527) );
  NOR2X6 U2939 ( .A(n2528), .B(n2527), .Y(n2530) );
  NOR3X6 U2940 ( .A(n2533), .B(n2532), .C(n2531), .Y(n2745) );
  NOR2X4 U2941 ( .A(n2540), .B(n3130), .Y(n2536) );
  OAI2BB2X4 U2942 ( .B0(n2534), .B1(n3147), .A0N(table1[7]), .A1N(n1537), .Y(
        n2535) );
  OR3X6 U2943 ( .A(n2536), .B(n2535), .C(n1597), .Y(n2539) );
  INVX6 U2944 ( .A(n2537), .Y(n2538) );
  NOR2X4 U2945 ( .A(n2540), .B(n3131), .Y(n2543) );
  INVX3 U2946 ( .A(n2541), .Y(n2542) );
  OAI2BB2X4 U2947 ( .B0(n2544), .B1(n3148), .A0N(table1[11]), .A1N(n1537), .Y(
        n2546) );
  OAI21X4 U2948 ( .A0(n2547), .A1(n2546), .B0(n2545), .Y(n2548) );
  AOI222X2 U2949 ( .A0(table1[31]), .A1(n2553), .B0(n2552), .B1(table1[15]), 
        .C0(n2550), .C1(table1[47]), .Y(n2557) );
  AOI222X2 U2950 ( .A0(table1[35]), .A1(n2553), .B0(n2552), .B1(table1[19]), 
        .C0(n2551), .C1(table1[3]), .Y(n2555) );
  OAI22X4 U2951 ( .A0(n2557), .A1(n2556), .B0(n2555), .B1(n2554), .Y(n2558) );
  NOR2X8 U2952 ( .A(n2559), .B(n2558), .Y(n2631) );
  AND2X8 U2953 ( .A(n2745), .B(n2631), .Y(n2729) );
  NOR3X4 U2954 ( .A(n2742), .B(n2741), .C(n2782), .Y(n2638) );
  NOR2X6 U2955 ( .A(n2743), .B(n2563), .Y(n2560) );
  BUFX20 U2956 ( .A(n2560), .Y(n2618) );
  NOR2X4 U2957 ( .A(n2675), .B(n2562), .Y(n2561) );
  AO22X4 U2958 ( .A0(n2614), .A1(table1[34]), .B0(n2619), .B1(table1[30]), .Y(
        n2565) );
  AND2X8 U2959 ( .A(n2563), .B(n2562), .Y(n2620) );
  INVX6 U2960 ( .A(n2620), .Y(n2605) );
  NOR2X2 U2961 ( .A(n2605), .B(n3194), .Y(n2564) );
  AOI211X1 U2962 ( .A0(n2618), .A1(table1[38]), .B0(n2565), .C0(n2564), .Y(
        n2574) );
  NAND2BX2 U2963 ( .AN(n2786), .B(n2725), .Y(n2591) );
  AOI222X2 U2964 ( .A0(n2614), .A1(table1[2]), .B0(n2618), .B1(table1[6]), 
        .C0(n2620), .C1(table1[10]), .Y(n2569) );
  AOI222X2 U2965 ( .A0(n2618), .A1(table1[50]), .B0(n2620), .B1(table1[54]), 
        .C0(n2619), .C1(table1[46]), .Y(n2568) );
  NAND2X2 U2966 ( .A(n2567), .B(n2566), .Y(n2624) );
  AO22X2 U2967 ( .A0(n2614), .A1(table1[18]), .B0(n2619), .B1(table1[14]), .Y(
        n2571) );
  NOR2BX4 U2968 ( .AN(n2786), .B(n2725), .Y(n2592) );
  OAI211X4 U2969 ( .A0(n2574), .A1(n2591), .B0(n2573), .C0(n2572), .Y(n2731)
         );
  NAND2X2 U2970 ( .A(n2618), .B(table1[39]), .Y(n2576) );
  NAND2X2 U2971 ( .A(n2619), .B(table1[31]), .Y(n2575) );
  NAND2X2 U2972 ( .A(n2576), .B(n2575), .Y(n2577) );
  AOI21X2 U2973 ( .A0(table1[35]), .A1(n2614), .B0(n2577), .Y(n2579) );
  NOR2X2 U2974 ( .A(n2605), .B(n3092), .Y(n2578) );
  NOR2BX4 U2975 ( .AN(n2579), .B(n2578), .Y(n2581) );
  NAND2BX4 U2976 ( .AN(n2581), .B(n2580), .Y(n2588) );
  OAI21X2 U2977 ( .A0(n2583), .A1(n2582), .B0(n2592), .Y(n2587) );
  AOI222X1 U2978 ( .A0(n2614), .A1(table1[3]), .B0(n2618), .B1(table1[7]), 
        .C0(n2620), .C1(table1[11]), .Y(n2585) );
  AOI222X1 U2979 ( .A0(n2618), .A1(table1[51]), .B0(n2620), .B1(table1[55]), 
        .C0(n2619), .C1(table1[47]), .Y(n2584) );
  OA22X4 U2980 ( .A0(n2585), .A1(n2600), .B0(n2584), .B1(n2624), .Y(n2586) );
  OAI211X1 U2981 ( .A0(n2605), .A1(n3255), .B0(n2590), .C0(n2589), .Y(n2596)
         );
  AOI22X1 U2982 ( .A0(n2614), .A1(table1[16]), .B0(n2619), .B1(table1[12]), 
        .Y(n2594) );
  AOI22X1 U2983 ( .A0(n2618), .A1(table1[20]), .B0(n2620), .B1(table1[24]), 
        .Y(n2593) );
  INVX3 U2984 ( .A(n2592), .Y(n2601) );
  AOI21X1 U2985 ( .A0(n2594), .A1(n2593), .B0(n2601), .Y(n2595) );
  AOI211X4 U2986 ( .A0(n2596), .A1(n2607), .B0(n2595), .C0(n2649), .Y(n2671)
         );
  AOI222X1 U2987 ( .A0(n2614), .A1(table1[1]), .B0(n2618), .B1(table1[5]), 
        .C0(n2620), .C1(table1[9]), .Y(n2599) );
  AOI222X1 U2988 ( .A0(n2618), .A1(table1[49]), .B0(n2620), .B1(table1[53]), 
        .C0(n2597), .C1(table1[45]), .Y(n2598) );
  OAI22X2 U2989 ( .A0(n2600), .A1(n2599), .B0(n2598), .B1(n2624), .Y(n2613) );
  AOI22X1 U2990 ( .A0(n2614), .A1(table1[17]), .B0(n2619), .B1(table1[13]), 
        .Y(n2603) );
  AOI22X1 U2991 ( .A0(n2618), .A1(table1[21]), .B0(n2620), .B1(table1[25]), 
        .Y(n2602) );
  AOI21X2 U2992 ( .A0(n2603), .A1(n2602), .B0(n2601), .Y(n2611) );
  AOI22X1 U2993 ( .A0(n2614), .A1(table1[33]), .B0(n2619), .B1(table1[29]), 
        .Y(n2609) );
  NAND2X2 U2994 ( .A(n2618), .B(table1[37]), .Y(n2604) );
  OAI21X4 U2995 ( .A0(n2605), .A1(n3254), .B0(n2604), .Y(n2606) );
  OAI2BB1X4 U2996 ( .A0N(n2609), .A1N(n2608), .B0(n2607), .Y(n2610) );
  NAND2BX4 U2997 ( .AN(n2611), .B(n2610), .Y(n2612) );
  NAND3X2 U2998 ( .A(n2617), .B(n2616), .C(n2615), .Y(n2627) );
  CLKINVX1 U2999 ( .A(n2624), .Y(n2625) );
  AOI22X4 U3000 ( .A0(n2628), .A1(n2627), .B0(n2626), .B1(n2625), .Y(n2672) );
  AND2X8 U3001 ( .A(n2748), .B(n2672), .Y(n2629) );
  NAND3X8 U3002 ( .A(n2630), .B(n2671), .C(n2629), .Y(n2744) );
  OAI21X4 U3003 ( .A0(n2786), .A1(n2744), .B0(n2634), .Y(n2637) );
  AND2X8 U3004 ( .A(n2650), .B(n2649), .Y(n2692) );
  NAND3X8 U3005 ( .A(n2673), .B(n2692), .C(n2635), .Y(n2739) );
  NOR3X4 U3006 ( .A(n2739), .B(n2793), .C(n2741), .Y(n2636) );
  OR3X8 U3007 ( .A(n2638), .B(n2637), .C(n2636), .Y(n2639) );
  INVX20 U3008 ( .A(n2639), .Y(n2723) );
  XOR2X1 U3009 ( .A(n2724), .B(n2727), .Y(n2645) );
  XOR2X1 U3010 ( .A(n2641), .B(n2687), .Y(n2644) );
  XOR2X1 U3011 ( .A(n2793), .B(n1536), .Y(n2643) );
  NAND4X2 U3012 ( .A(n2646), .B(n2645), .C(n2644), .D(n2643), .Y(n2648) );
  AND4X4 U3013 ( .A(n2649), .B(n2648), .C(n2647), .D(n2682), .Y(n2651) );
  NAND2X8 U3014 ( .A(n2651), .B(n2650), .Y(n2691) );
  NOR2X6 U3015 ( .A(n2692), .B(n2784), .Y(n2658) );
  NAND2X4 U3016 ( .A(n2658), .B(n2653), .Y(n2662) );
  AOI2BB2X4 U3017 ( .B0(n2718), .B1(n2663), .A0N(n2662), .A1N(n2654), .Y(n2762) );
  MXI2X2 U3018 ( .A(n2723), .B(n3142), .S0(n2762), .Y(n1294) );
  AOI2BB2X4 U3019 ( .B0(n2663), .B1(n2707), .A0N(n2662), .A1N(n2659), .Y(n2760) );
  MXI2X2 U3020 ( .A(n2723), .B(n3143), .S0(n2760), .Y(n1290) );
  NAND2BX1 U3021 ( .AN(n2687), .B(n2738), .Y(n2655) );
  NOR2BX1 U3022 ( .AN(n2656), .B(n2693), .Y(n2657) );
  NAND2X4 U3023 ( .A(n2658), .B(n2657), .Y(n2669) );
  AOI2BB2X4 U3024 ( .B0(n2670), .B1(n2707), .A0N(n2669), .A1N(n2659), .Y(n2759) );
  MXI2X2 U3025 ( .A(n2723), .B(n3146), .S0(n2759), .Y(n1291) );
  AOI2BB2X4 U3026 ( .B0(n2663), .B1(n2701), .A0N(n2662), .A1N(n2668), .Y(n2761) );
  MXI2X2 U3027 ( .A(n2723), .B(n3349), .S0(n2761), .Y(n1286) );
  NOR2X1 U3028 ( .A(n2666), .B(n2665), .Y(n2713) );
  AOI2BB2X4 U3029 ( .B0(n2670), .B1(n2664), .A0N(n2669), .A1N(n2667), .Y(n2758) );
  MXI2X2 U3030 ( .A(n2723), .B(n3144), .S0(n2758), .Y(n1283) );
  AOI2BB2X4 U3031 ( .B0(n2670), .B1(n2701), .A0N(n2669), .A1N(n2668), .Y(n2763) );
  MXI2X2 U3032 ( .A(n2723), .B(n3145), .S0(n2763), .Y(n1287) );
  AO22X4 U3033 ( .A0(n2673), .A1(n2746), .B0(n2672), .B1(n2671), .Y(n2674) );
  OAI21X4 U3034 ( .A0(n2675), .A1(n2744), .B0(n2674), .Y(n2679) );
  NOR3X4 U3035 ( .A(n2742), .B(n2676), .C(n2741), .Y(n2678) );
  NOR3X4 U3036 ( .A(n2739), .B(n2687), .C(n2741), .Y(n2677) );
  OR3X8 U3037 ( .A(n2679), .B(n2678), .C(n2677), .Y(n2680) );
  INVX20 U3038 ( .A(n2680), .Y(n2722) );
  MXI2X2 U3039 ( .A(n2722), .B(n3341), .S0(n2760), .Y(n1332) );
  MXI2X2 U3040 ( .A(n2722), .B(n3336), .S0(n2763), .Y(n1329) );
  MXI2X2 U3041 ( .A(n2722), .B(n3337), .S0(n2759), .Y(n1333) );
  MXI2X2 U3042 ( .A(n2722), .B(n3339), .S0(n2761), .Y(n1328) );
  MXI2X2 U3043 ( .A(n2722), .B(n3343), .S0(n2762), .Y(n1336) );
  MXI2X2 U3044 ( .A(n2722), .B(n3344), .S0(n2758), .Y(n1325) );
  NOR2X6 U3045 ( .A(n2692), .B(n2683), .Y(n2717) );
  NAND2BX1 U3046 ( .AN(n2738), .B(n2687), .Y(n2684) );
  NOR2X8 U3047 ( .A(n2691), .B(n2684), .Y(n2719) );
  NAND2X2 U3048 ( .A(n2719), .B(n2707), .Y(n2685) );
  NAND2X4 U3049 ( .A(n2686), .B(n2685), .Y(n2766) );
  MXI2X2 U3050 ( .A(n3366), .B(n2722), .S0(n2766), .Y(n1334) );
  NOR2X8 U3051 ( .A(n2691), .B(n2690), .Y(n2708) );
  NAND2X2 U3052 ( .A(n2708), .B(n2718), .Y(n2698) );
  INVX3 U3053 ( .A(n2692), .Y(n2696) );
  NOR2X1 U3054 ( .A(n2694), .B(n2693), .Y(n2695) );
  NAND2X2 U3055 ( .A(n2710), .B(n2716), .Y(n2697) );
  NAND2X4 U3056 ( .A(n2698), .B(n2697), .Y(n2764) );
  MXI2X2 U3057 ( .A(n3357), .B(n2722), .S0(n2764), .Y(n1338) );
  NAND2X2 U3058 ( .A(n2719), .B(n2701), .Y(n2699) );
  MXI2X2 U3059 ( .A(n3352), .B(n2722), .S0(n2768), .Y(n1330) );
  NAND2X2 U3060 ( .A(n2708), .B(n2701), .Y(n2704) );
  NAND2X2 U3061 ( .A(n2710), .B(n2702), .Y(n2703) );
  NAND2X4 U3062 ( .A(n2704), .B(n2703), .Y(n2754) );
  MXI2X2 U3063 ( .A(n3355), .B(n2722), .S0(n2754), .Y(n1331) );
  NAND2X2 U3064 ( .A(n2708), .B(n2664), .Y(n2706) );
  NAND2X2 U3065 ( .A(n2710), .B(n2713), .Y(n2705) );
  NAND2X4 U3066 ( .A(n2706), .B(n2705), .Y(n2756) );
  MXI2X2 U3067 ( .A(n3367), .B(n2722), .S0(n2756), .Y(n1327) );
  NAND2X2 U3068 ( .A(n2708), .B(n2707), .Y(n2712) );
  NAND2X2 U3069 ( .A(n2710), .B(n2709), .Y(n2711) );
  NAND2X4 U3070 ( .A(n2712), .B(n2711), .Y(n2755) );
  MXI2X2 U3071 ( .A(n3255), .B(n2722), .S0(n2755), .Y(n1335) );
  NAND2X2 U3072 ( .A(n2719), .B(n2664), .Y(n2714) );
  NAND2X4 U3073 ( .A(n2715), .B(n2714), .Y(n2767) );
  MXI2X2 U3074 ( .A(n3368), .B(n2722), .S0(n2767), .Y(n1326) );
  NAND2X2 U3075 ( .A(n2719), .B(n2718), .Y(n2720) );
  NAND2X4 U3076 ( .A(n2721), .B(n2720), .Y(n2765) );
  MXI2X2 U3077 ( .A(n3358), .B(n2722), .S0(n2765), .Y(n1337) );
  MXI2X2 U3078 ( .A(n3148), .B(n2723), .S0(n2754), .Y(n1289) );
  MXI2X2 U3079 ( .A(n3150), .B(n2723), .S0(n2756), .Y(n1285) );
  MXI2X2 U3080 ( .A(n3149), .B(n2723), .S0(n2766), .Y(n1292) );
  MXI2X2 U3081 ( .A(n3092), .B(n2723), .S0(n2755), .Y(n1293) );
  MXI2X2 U3082 ( .A(n3147), .B(n2723), .S0(n2768), .Y(n1288) );
  MXI2X2 U3083 ( .A(n3131), .B(n2723), .S0(n2764), .Y(n1296) );
  MXI2X2 U3084 ( .A(n3361), .B(n2723), .S0(n2767), .Y(n1284) );
  MXI2X2 U3085 ( .A(n3130), .B(n2723), .S0(n2765), .Y(n1295) );
  OAI22X4 U3086 ( .A0(n2726), .A1(n2742), .B0(n2744), .B1(n2725), .Y(n2735) );
  NAND2X2 U3087 ( .A(n2729), .B(n2728), .Y(n2733) );
  MXI2X2 U3088 ( .A(n2731), .B(n2730), .S0(n2746), .Y(n2732) );
  OAI21X4 U3089 ( .A0(n2733), .A1(n2739), .B0(n2732), .Y(n2734) );
  OR2X8 U3090 ( .A(n2735), .B(n2734), .Y(n2736) );
  MXI2X2 U3091 ( .A(n3353), .B(n2769), .S0(n2754), .Y(n1303) );
  MXI2X2 U3092 ( .A(n3194), .B(n2769), .S0(n2755), .Y(n1307) );
  MXI2X2 U3093 ( .A(n3362), .B(n2769), .S0(n2756), .Y(n1299) );
  NOR2X2 U3094 ( .A(en_read2), .B(n3154), .Y(n3013) );
  NAND3XL U3095 ( .A(n3013), .B(n3133), .C(n3037), .Y(n3002) );
  OAI31XL U3096 ( .A0(counter_pixel[0]), .A1(counter_pixel[1]), .A2(n3154), 
        .B0(counter_pixel[2]), .Y(n2737) );
  OAI211XL U3097 ( .A0(counter_pixel[2]), .A1(n3002), .B0(n3258), .C0(n2737), 
        .Y(n1504) );
  NOR3X6 U3098 ( .A(n2739), .B(n2738), .C(n2741), .Y(n2752) );
  NOR2X4 U3099 ( .A(n2744), .B(n2743), .Y(n2750) );
  MXI2X4 U3100 ( .A(n2748), .B(n2747), .S0(n2746), .Y(n2749) );
  NOR4X6 U3101 ( .A(n2752), .B(n2751), .C(n2750), .D(n2749), .Y(n2753) );
  BUFX20 U3102 ( .A(n2753), .Y(n2757) );
  MXI2X2 U3103 ( .A(n2757), .B(n3335), .S0(n2763), .Y(n1315) );
  MXI2X2 U3104 ( .A(n2757), .B(n3345), .S0(n2758), .Y(n1311) );
  MXI2X2 U3105 ( .A(n2757), .B(n3338), .S0(n2759), .Y(n1319) );
  MXI2X2 U3106 ( .A(n2757), .B(n3346), .S0(n2762), .Y(n1322) );
  MXI2X2 U3107 ( .A(n2757), .B(n3342), .S0(n2760), .Y(n1318) );
  MXI2X2 U3108 ( .A(n2757), .B(n3340), .S0(n2761), .Y(n1314) );
  MXI2X2 U3109 ( .A(n3351), .B(n2757), .S0(n2754), .Y(n1317) );
  MXI2X2 U3110 ( .A(n3254), .B(n2757), .S0(n2755), .Y(n1321) );
  MXI2X2 U3111 ( .A(n3360), .B(n2757), .S0(n2766), .Y(n1320) );
  MXI2X2 U3112 ( .A(n3354), .B(n2757), .S0(n2768), .Y(n1316) );
  MXI2X2 U3113 ( .A(n3363), .B(n2757), .S0(n2767), .Y(n1312) );
  MXI2X2 U3114 ( .A(n3364), .B(n2757), .S0(n2756), .Y(n1313) );
  MXI2X2 U3115 ( .A(n3251), .B(n2757), .S0(n2764), .Y(n1324) );
  MXI2X2 U3116 ( .A(n3253), .B(n2757), .S0(n2765), .Y(n1323) );
  MXI2X2 U3117 ( .A(n2769), .B(n3332), .S0(n2758), .Y(n1297) );
  MXI2X2 U3118 ( .A(n2769), .B(n3347), .S0(n2759), .Y(n1305) );
  MXI2X2 U3119 ( .A(n2769), .B(n3350), .S0(n2760), .Y(n1304) );
  MXI2X2 U3120 ( .A(n2769), .B(n3348), .S0(n2761), .Y(n1300) );
  MXI2X2 U3121 ( .A(n2769), .B(n3334), .S0(n2762), .Y(n1308) );
  MXI2X2 U3122 ( .A(n2769), .B(n3333), .S0(n2763), .Y(n1301) );
  MXI2X2 U3123 ( .A(n3250), .B(n2769), .S0(n2764), .Y(n1310) );
  MXI2X2 U3124 ( .A(n3356), .B(n2769), .S0(n2765), .Y(n1309) );
  MXI2X2 U3125 ( .A(n3369), .B(n2769), .S0(n2766), .Y(n1306) );
  MXI2X2 U3126 ( .A(n3365), .B(n2769), .S0(n2767), .Y(n1298) );
  MXI2X2 U3127 ( .A(n3359), .B(n2769), .S0(n2768), .Y(n1302) );
  NAND3X2 U3128 ( .A(counter_cal[0]), .B(counter_cal[1]), .C(counter_cal[2]), 
        .Y(n2982) );
  NAND3BX2 U3129 ( .AN(n2982), .B(counter_cal[3]), .C(counter_cal[4]), .Y(
        n2970) );
  NAND3X1 U3130 ( .A(counter_cal[5]), .B(counter_cal[6]), .C(n2776), .Y(n2895)
         );
  NAND3XL U3131 ( .A(counter_cal[9]), .B(counter_cal[7]), .C(counter_cal[8]), 
        .Y(n2770) );
  OAI211X1 U3132 ( .A0(n2854), .A1(n3263), .B0(n2773), .C0(n2894), .Y(n2774)
         );
  AO21X2 U3133 ( .A0(round2[2]), .A1(n2874), .B0(n2774), .Y(n1277) );
  NOR2X1 U3134 ( .A(n3018), .B(n3197), .Y(n3023) );
  NOR2X1 U3135 ( .A(n3022), .B(n3256), .Y(n3020) );
  AOI21XL U3136 ( .A0(n3022), .A1(n3256), .B0(n3020), .Y(n1252) );
  NAND3BX1 U3137 ( .AN(counter_cal[5]), .B(n3195), .C(n3083), .Y(n2775) );
  NOR3X1 U3138 ( .A(counter_cal[7]), .B(counter_cal[9]), .C(n2775), .Y(n2840)
         );
  AOI21XL U3139 ( .A0(n3018), .A1(n3197), .B0(n3023), .Y(n1253) );
  NAND4XL U3140 ( .A(round2[1]), .B(n2854), .C(round2[6]), .D(round2[9]), .Y(
        n2777) );
  AO22X1 U3141 ( .A0(n2780), .A1(n2779), .B0(n3416), .B1(n2890), .Y(n1255) );
  INVXL U3142 ( .A(reset), .Y(n3400) );
  MXI2XL U3143 ( .A(n2781), .B(n3373), .S0(n2965), .Y(n1522) );
  NOR2X2 U3144 ( .A(n2783), .B(n2782), .Y(n2789) );
  OAI22X1 U3145 ( .A0(n2787), .A1(n2786), .B0(n2785), .B1(n2784), .Y(n2788) );
  OAI21X4 U3146 ( .A0(n2793), .A1(n2792), .B0(n2791), .Y(N922) );
  CLKBUFX3 U3147 ( .A(n3400), .Y(n3374) );
  CLKBUFX3 U3148 ( .A(n3374), .Y(n3394) );
  CLKBUFX3 U3149 ( .A(n3400), .Y(n3375) );
  CLKBUFX3 U3150 ( .A(n3375), .Y(n3378) );
  CLKBUFX3 U3151 ( .A(n3378), .Y(n3397) );
  CLKBUFX3 U3152 ( .A(n3375), .Y(n3399) );
  CLKBUFX3 U3153 ( .A(n3374), .Y(n3377) );
  CLKBUFX3 U3154 ( .A(n3377), .Y(n3398) );
  CLKBUFX3 U3155 ( .A(n3374), .Y(n3385) );
  CLKBUFX3 U3156 ( .A(n3374), .Y(n3396) );
  CLKBUFX3 U3157 ( .A(n3375), .Y(n3391) );
  CLKBUFX3 U3158 ( .A(n3374), .Y(n3383) );
  CLKBUFX3 U3159 ( .A(n3374), .Y(n3381) );
  CLKBUFX3 U3160 ( .A(n3375), .Y(n3389) );
  CLKBUFX3 U3161 ( .A(n3375), .Y(n3387) );
  CLKBUFX3 U3162 ( .A(n3375), .Y(n3393) );
  CLKBUFX3 U3163 ( .A(n3375), .Y(n3392) );
  CLKBUFX3 U3164 ( .A(n3374), .Y(n3379) );
  CLKBUFX3 U3165 ( .A(n3375), .Y(n3380) );
  CLKBUFX3 U3166 ( .A(n3375), .Y(n3395) );
  CLKBUFX3 U3167 ( .A(n3375), .Y(n3386) );
  CLKBUFX3 U3168 ( .A(n3375), .Y(n3382) );
  CLKBUFX3 U3169 ( .A(n3374), .Y(n3390) );
  CLKBUFX3 U3170 ( .A(n3374), .Y(n3388) );
  CLKBUFX3 U3171 ( .A(n3375), .Y(n3384) );
  NOR3XL U3172 ( .A(n1543), .B(n2854), .C(n3151), .Y(n2797) );
  OAI22XL U3173 ( .A0(n2797), .A1(en_read2), .B0(n2796), .B1(n2795), .Y(n2798)
         );
  OAI21XL U3174 ( .A0(n3258), .A1(n2890), .B0(n2798), .Y(n1505) );
  MX2X1 U3175 ( .A(color2[10]), .B(color1[10]), .S0(n2866), .Y(n1214) );
  AOI21XL U3176 ( .A0(read_complete), .A1(n2800), .B0(read), .Y(n2801) );
  NOR3XL U3177 ( .A(counter_pixel[0]), .B(counter_pixel[2]), .C(n3037), .Y(
        n2976) );
  NAND2XL U3178 ( .A(n3013), .B(n3133), .Y(n2802) );
  MXI2X1 U3179 ( .A(n3270), .B(n2803), .S0(n2887), .Y(n1264) );
  XNOR2X1 U3180 ( .A(N1516), .B(round2[1]), .Y(n2805) );
  MXI2X1 U3181 ( .A(n3247), .B(n2806), .S0(n2887), .Y(n1256) );
  XNOR2X1 U3182 ( .A(n2807), .B(round2[2]), .Y(n2810) );
  ADDHXL U3183 ( .A(round2[2]), .B(n2808), .CO(n2818), .S(n2809) );
  MXI2X1 U3184 ( .A(n3262), .B(n2811), .S0(n2887), .Y(n1257) );
  XNOR2X1 U3185 ( .A(n2813), .B(round2[4]), .Y(n2814) );
  MXI2X1 U3186 ( .A(n3267), .B(n2816), .S0(n2887), .Y(n1259) );
  MXI2X1 U3187 ( .A(n3265), .B(n2821), .S0(n2887), .Y(n1258) );
  ADDHXL U3188 ( .A(round2[5]), .B(n2822), .CO(n2827), .S(n2825) );
  XNOR2X1 U3189 ( .A(n2823), .B(round2[5]), .Y(n2824) );
  MXI2X1 U3190 ( .A(n3252), .B(n2826), .S0(n2887), .Y(n1260) );
  XNOR2X1 U3191 ( .A(n2828), .B(round2[6]), .Y(n2829) );
  MXI2X1 U3192 ( .A(n3260), .B(n2831), .S0(n2887), .Y(n1261) );
  CLKINVX1 U3193 ( .A(rom_q[4]), .Y(n2991) );
  MXI2X1 U3194 ( .A(n2991), .B(n3097), .S0(n3008), .Y(n1480) );
  MXI2X1 U3195 ( .A(n2997), .B(n3048), .S0(n3004), .Y(n1495) );
  OAI22X1 U3196 ( .A0(n2862), .A1(n2833), .B0(n2854), .B1(n3195), .Y(n2834) );
  AOI21X1 U3197 ( .A0(n2891), .A1(n3404), .B0(n2834), .Y(n2835) );
  OAI21X1 U3198 ( .A0(n2836), .A1(n3260), .B0(n2835), .Y(n1273) );
  OR2X1 U3199 ( .A(read_complete), .B(n3196), .Y(n2839) );
  NOR2BX2 U3200 ( .AN(n2837), .B(n2854), .Y(n2838) );
  NAND2X2 U3201 ( .A(n2839), .B(n2838), .Y(n2981) );
  XOR2X1 U3202 ( .A(n2971), .B(counter_cal[6]), .Y(n1507) );
  NOR2X1 U3203 ( .A(n2840), .B(n1517), .Y(n2852) );
  ADDHXL U3204 ( .A(round2[7]), .B(n2843), .CO(n2882), .S(n2846) );
  XNOR2X1 U3205 ( .A(n2844), .B(round2[7]), .Y(n2845) );
  MXI2X1 U3206 ( .A(n3264), .B(n2847), .S0(n2887), .Y(n1262) );
  CLKINVX1 U3207 ( .A(n2857), .Y(n2863) );
  OAI21X1 U3208 ( .A0(n2863), .A1(n2878), .B0(N1516), .Y(n2858) );
  OAI211X1 U3209 ( .A0(n2881), .A1(n3242), .B0(n2859), .C0(n2858), .Y(n1279)
         );
  XNOR2X1 U3210 ( .A(n2860), .B(round2[9]), .Y(n2861) );
  AOI2BB2X1 U3211 ( .B0(counter_cal[9]), .B1(n2890), .A0N(n2862), .A1N(n2861), 
        .Y(n2865) );
  NAND2X1 U3212 ( .A(n2863), .B(round2[9]), .Y(n2864) );
  OAI211X1 U3213 ( .A0(n2881), .A1(n3243), .B0(n2865), .C0(n2864), .Y(n1270)
         );
  MXI2X1 U3214 ( .A(n3098), .B(n2997), .S0(n3009), .Y(n1479) );
  OAI21XL U3215 ( .A0(n2870), .A1(n2965), .B0(n3248), .Y(n2871) );
  NOR2BX1 U3216 ( .AN(counter_cal[0]), .B(n2981), .Y(n2980) );
  XOR2X1 U3217 ( .A(n2979), .B(n3263), .Y(n1511) );
  XNOR2X1 U3218 ( .A(n2983), .B(counter_cal[4]), .Y(n1509) );
  AO21X4 U3219 ( .A0(n2878), .A1(round2[2]), .B0(n2874), .Y(n2889) );
  NAND2X2 U3220 ( .A(n2889), .B(round2[4]), .Y(n2880) );
  OAI211X1 U3221 ( .A0(n2881), .A1(n3244), .B0(n2880), .C0(n2879), .Y(n1275)
         );
  XNOR2X1 U3222 ( .A(n2883), .B(round2[8]), .Y(n2885) );
  MXI2X1 U3223 ( .A(n3266), .B(n2888), .S0(n2887), .Y(n1263) );
  NAND2X2 U3224 ( .A(n2889), .B(round2[3]), .Y(n2893) );
  OAI211X1 U3225 ( .A0(round2[3]), .A1(n2894), .B0(n2893), .C0(n2892), .Y(
        n1276) );
  XOR2X1 U3226 ( .A(n2968), .B(counter_cal[9]), .Y(n1519) );
  NAND2X1 U3227 ( .A(n2918), .B(n2915), .Y(n2938) );
  MXI2X1 U3228 ( .A(n2898), .B(n3312), .S0(n2938), .Y(n1410) );
  NAND2X1 U3229 ( .A(n2918), .B(n2902), .Y(n2928) );
  MXI2X1 U3230 ( .A(n2906), .B(n3299), .S0(n2928), .Y(n1409) );
  NOR2X1 U3231 ( .A(n2913), .B(n2897), .Y(n2935) );
  MXI2X1 U3232 ( .A(n3168), .B(n2898), .S0(n2935), .Y(n1413) );
  NAND2X1 U3233 ( .A(n1547), .B(n2908), .Y(n2947) );
  MXI2X1 U3234 ( .A(n2937), .B(n3321), .S0(n2947), .Y(n1464) );
  NAND2X1 U3235 ( .A(n1547), .B(n2902), .Y(n2944) );
  MXI2X1 U3236 ( .A(n2937), .B(n3300), .S0(n2944), .Y(n1465) );
  NAND2X1 U3237 ( .A(n1547), .B(n2903), .Y(n2949) );
  MXI2X1 U3238 ( .A(n2937), .B(n3293), .S0(n2949), .Y(n1463) );
  NAND2X1 U3239 ( .A(n1547), .B(n2909), .Y(n2957) );
  MXI2X1 U3240 ( .A(n2937), .B(n1596), .S0(n2957), .Y(n1459) );
  NAND2X1 U3241 ( .A(n1547), .B(n1587), .Y(n2926) );
  MXI2X1 U3242 ( .A(n2937), .B(n1595), .S0(n2926), .Y(n1460) );
  MXI2X1 U3243 ( .A(n2906), .B(n3198), .S0(n2926), .Y(n1428) );
  NAND2X1 U3244 ( .A(n2918), .B(n2908), .Y(n2929) );
  MXI2X1 U3245 ( .A(n2906), .B(n3200), .S0(n2929), .Y(n1408) );
  NAND2X1 U3246 ( .A(n2918), .B(n2903), .Y(n2940) );
  MXI2X1 U3247 ( .A(n2906), .B(n3047), .S0(n2940), .Y(n1407) );
  INVX6 U3248 ( .A(N922), .Y(n2907) );
  MXI2X1 U3249 ( .A(n2919), .B(n3140), .S0(n2938), .Y(n1346) );
  NAND2X1 U3250 ( .A(n1547), .B(n1586), .Y(n2942) );
  MXI2X1 U3251 ( .A(n2919), .B(n3325), .S0(n2942), .Y(n1366) );
  NAND2X1 U3252 ( .A(n2916), .B(n2902), .Y(n2946) );
  MXI2X1 U3253 ( .A(n2919), .B(n3296), .S0(n2946), .Y(n1361) );
  MXI2X1 U3254 ( .A(n2919), .B(n3138), .S0(n2947), .Y(n1368) );
  NAND2X1 U3255 ( .A(n2916), .B(n2903), .Y(n2952) );
  MXI2X1 U3256 ( .A(n2919), .B(n3273), .S0(n2952), .Y(n1359) );
  MXI2X1 U3257 ( .A(n2919), .B(n3134), .S0(n2940), .Y(n1343) );
  NAND2X1 U3258 ( .A(n1547), .B(n2917), .Y(n2958) );
  MXI2X1 U3259 ( .A(n2919), .B(n3185), .S0(n2958), .Y(n1365) );
  NAND2X1 U3260 ( .A(n2918), .B(n2909), .Y(n2955) );
  MXI2X1 U3261 ( .A(n2919), .B(n3043), .S0(n2955), .Y(n1339) );
  NOR2X1 U3262 ( .A(n2913), .B(n2905), .Y(n2932) );
  MXI2X1 U3263 ( .A(n3167), .B(n2919), .S0(n2935), .Y(n1349) );
  MXI2X1 U3264 ( .A(n3275), .B(n2919), .S0(n2933), .Y(n1351) );
  MXI2X1 U3265 ( .A(n3179), .B(n2919), .S0(n2921), .Y(n1348) );
  MXI2X1 U3266 ( .A(n2914), .B(n3135), .S0(n2949), .Y(n1367) );
  NAND2X1 U3267 ( .A(n2916), .B(n1586), .Y(n2951) );
  MXI2X1 U3268 ( .A(n2914), .B(n3326), .S0(n2951), .Y(n1358) );
  MXI2X1 U3269 ( .A(n2914), .B(n3139), .S0(n2928), .Y(n1345) );
  MXI2X1 U3270 ( .A(n2914), .B(n3136), .S0(n2944), .Y(n1369) );
  NAND2X1 U3271 ( .A(n2916), .B(n2908), .Y(n2953) );
  MXI2X1 U3272 ( .A(n2914), .B(n3089), .S0(n2953), .Y(n1360) );
  MXI2X1 U3273 ( .A(n2914), .B(n3177), .S0(n2926), .Y(n1364) );
  NAND2X1 U3274 ( .A(n2916), .B(n1587), .Y(n2943) );
  MXI2X1 U3275 ( .A(n2914), .B(n3178), .S0(n2943), .Y(n1356) );
  MXI2X1 U3276 ( .A(n2914), .B(n3075), .S0(n2957), .Y(n1363) );
  NAND2X1 U3277 ( .A(n2918), .B(n1587), .Y(n2945) );
  MXI2X1 U3278 ( .A(n2914), .B(n3079), .S0(n2945), .Y(n1340) );
  NAND2X1 U3279 ( .A(n2916), .B(n2917), .Y(n2954) );
  MXI2X1 U3280 ( .A(n2914), .B(n3166), .S0(n2954), .Y(n1357) );
  NAND2X1 U3281 ( .A(n2916), .B(n2909), .Y(n2959) );
  MXI2X1 U3282 ( .A(n2914), .B(n3041), .S0(n2959), .Y(n1355) );
  MXI2X1 U3283 ( .A(n2914), .B(n3137), .S0(n2910), .Y(n1370) );
  NOR2X1 U3284 ( .A(n2913), .B(n2911), .Y(n2963) );
  MXI2X1 U3285 ( .A(n3328), .B(n2914), .S0(n2963), .Y(n1350) );
  NOR2X1 U3286 ( .A(n2913), .B(n1884), .Y(n2962) );
  MXI2X1 U3287 ( .A(n3304), .B(n2914), .S0(n2962), .Y(n1353) );
  MXI2X1 U3288 ( .A(n3091), .B(n2914), .S0(n2932), .Y(n1352) );
  MXI2X1 U3289 ( .A(n3070), .B(n2914), .S0(n2934), .Y(n1347) );
  MXI2X1 U3290 ( .A(n3317), .B(n2914), .S0(n2936), .Y(n1354) );
  NAND2X1 U3291 ( .A(n2918), .B(n1586), .Y(n2950) );
  MXI2X1 U3292 ( .A(n2919), .B(n3141), .S0(n2950), .Y(n1342) );
  NAND2X1 U3293 ( .A(n2916), .B(n2915), .Y(n2948) );
  MXI2X1 U3294 ( .A(n2919), .B(n3309), .S0(n2948), .Y(n1362) );
  MXI2X1 U3295 ( .A(n2919), .B(n3088), .S0(n2929), .Y(n1344) );
  NAND2X1 U3296 ( .A(n2918), .B(n2917), .Y(n2956) );
  MXI2X1 U3297 ( .A(n2919), .B(n3081), .S0(n2956), .Y(n1341) );
  INVX6 U3298 ( .A(N921), .Y(n2925) );
  MXI2X1 U3299 ( .A(n2920), .B(n3324), .S0(n2951), .Y(n1390) );
  MXI2X1 U3300 ( .A(n2922), .B(n3295), .S0(n2946), .Y(n1393) );
  MXI2X1 U3301 ( .A(n2920), .B(n1592), .S0(n2956), .Y(n1373) );
  MXI2X1 U3302 ( .A(n2920), .B(n3074), .S0(n2959), .Y(n1387) );
  MXI2X1 U3303 ( .A(n2920), .B(n3184), .S0(n2954), .Y(n1389) );
  MXI2X1 U3304 ( .A(n2922), .B(n3176), .S0(n2943), .Y(n1388) );
  MXI2X1 U3305 ( .A(n2922), .B(n3183), .S0(n2958), .Y(n1397) );
  MXI2X1 U3306 ( .A(n3077), .B(n2922), .S0(n2934), .Y(n1379) );
  MXI2X1 U3307 ( .A(n3303), .B(n2922), .S0(n2962), .Y(n1385) );
  MXI2X1 U3308 ( .A(n3180), .B(n2922), .S0(n2921), .Y(n1380) );
  BUFX8 U3309 ( .A(n2925), .Y(n2924) );
  MXI2X1 U3310 ( .A(n2924), .B(n3323), .S0(n2950), .Y(n1374) );
  MXI2X1 U3311 ( .A(n2924), .B(n3307), .S0(n2938), .Y(n1378) );
  MXI2X1 U3312 ( .A(n2924), .B(n3284), .S0(n2867), .Y(n1402) );
  MXI2X1 U3313 ( .A(n2924), .B(n3272), .S0(n2952), .Y(n1391) );
  BUFX8 U3314 ( .A(n2925), .Y(n2923) );
  MXI2X1 U3315 ( .A(n2923), .B(n3308), .S0(n2948), .Y(n1394) );
  MXI2X1 U3316 ( .A(n2923), .B(n3271), .S0(n2940), .Y(n1375) );
  MXI2X1 U3317 ( .A(n2923), .B(n3294), .S0(n2928), .Y(n1377) );
  MXI2X1 U3318 ( .A(n2924), .B(n1594), .S0(n2945), .Y(n1372) );
  MXI2X1 U3319 ( .A(n2924), .B(n3087), .S0(n2953), .Y(n1392) );
  MXI2X1 U3320 ( .A(n2923), .B(n3086), .S0(n2929), .Y(n1376) );
  MXI2X1 U3321 ( .A(n2923), .B(n3173), .S0(n2955), .Y(n1371) );
  MXI2X1 U3322 ( .A(n3187), .B(n2923), .S0(n2935), .Y(n1381) );
  MXI2X1 U3323 ( .A(n3274), .B(n2923), .S0(n2933), .Y(n1383) );
  MXI2X1 U3324 ( .A(n3316), .B(n2924), .S0(n2936), .Y(n1386) );
  MXI2X1 U3325 ( .A(n2927), .B(n3276), .S0(n2949), .Y(n1399) );
  MXI2X1 U3326 ( .A(n2927), .B(n3291), .S0(n2947), .Y(n1400) );
  MXI2X1 U3327 ( .A(n2927), .B(n3322), .S0(n2942), .Y(n1398) );
  MXI2X1 U3328 ( .A(n2927), .B(n3277), .S0(n2944), .Y(n1401) );
  MXI2X1 U3329 ( .A(n2927), .B(n3042), .S0(n2957), .Y(n1395) );
  BUFX4 U3330 ( .A(n2937), .Y(n2941) );
  MXI2X1 U3331 ( .A(n2941), .B(n3314), .S0(n2948), .Y(n1458) );
  MXI2X1 U3332 ( .A(n2961), .B(n3330), .S0(n2942), .Y(n1462) );
  MXI2X1 U3333 ( .A(n2961), .B(n3302), .S0(n2928), .Y(n1441) );
  MXI2X1 U3334 ( .A(n2961), .B(n3288), .S0(n2950), .Y(n1438) );
  MXI2X1 U3335 ( .A(n2961), .B(n3287), .S0(n2951), .Y(n1454) );
  MXI2X1 U3336 ( .A(n2961), .B(n1598), .S0(n2953), .Y(n1456) );
  MXI2X1 U3337 ( .A(n2961), .B(n1593), .S0(n2958), .Y(n1461) );
  MXI2X1 U3338 ( .A(n2961), .B(n3201), .S0(n2929), .Y(n1440) );
  MXI2X1 U3339 ( .A(n2961), .B(n3076), .S0(n2959), .Y(n1451) );
  MXI2X1 U3340 ( .A(n2961), .B(n3313), .S0(n2930), .Y(n1466) );
  XNOR2X1 U3341 ( .A(n2931), .B(color[3]), .Y(n1513) );
  MXI2X1 U3342 ( .A(n3203), .B(n2961), .S0(n2932), .Y(n1448) );
  MXI2X1 U3343 ( .A(n3096), .B(n2961), .S0(n2933), .Y(n1447) );
  MXI2X1 U3344 ( .A(n3078), .B(n2961), .S0(n2934), .Y(n1443) );
  MXI2X1 U3345 ( .A(n3188), .B(n2961), .S0(n2935), .Y(n1445) );
  MXI2X1 U3346 ( .A(n3319), .B(n2961), .S0(n2936), .Y(n1450) );
  BUFX4 U3347 ( .A(n2937), .Y(n2939) );
  MXI2X1 U3348 ( .A(n2939), .B(n3280), .S0(n2943), .Y(n1452) );
  MXI2X1 U3349 ( .A(n2939), .B(n3281), .S0(n2945), .Y(n1436) );
  MXI2X1 U3350 ( .A(n2939), .B(n3301), .S0(n2946), .Y(n1457) );
  MXI2X1 U3351 ( .A(n2961), .B(n3315), .S0(n2938), .Y(n1442) );
  MXI2X1 U3352 ( .A(n2941), .B(n1599), .S0(n2952), .Y(n1455) );
  MXI2X1 U3353 ( .A(n2941), .B(n1605), .S0(n2955), .Y(n1435) );
  MXI2X1 U3354 ( .A(n2939), .B(n1604), .S0(n2956), .Y(n1437) );
  MXI2X1 U3355 ( .A(n2961), .B(n3094), .S0(n2940), .Y(n1439) );
  MXI2X1 U3356 ( .A(n2941), .B(n3186), .S0(n2954), .Y(n1453) );
  MXI2X1 U3357 ( .A(n2964), .B(n3329), .S0(n2942), .Y(n1430) );
  MXI2X1 U3358 ( .A(n2964), .B(n3278), .S0(n2943), .Y(n1420) );
  MXI2X1 U3359 ( .A(n2964), .B(n3297), .S0(n2944), .Y(n1433) );
  MXI2X1 U3360 ( .A(n2964), .B(n3279), .S0(n2945), .Y(n1404) );
  MXI2X1 U3361 ( .A(n2964), .B(n3298), .S0(n2946), .Y(n1425) );
  MXI2X1 U3362 ( .A(n2964), .B(n3320), .S0(n2947), .Y(n1432) );
  MXI2X1 U3363 ( .A(n2964), .B(n3311), .S0(n2948), .Y(n1426) );
  MXI2X1 U3364 ( .A(n2964), .B(n3292), .S0(n2949), .Y(n1431) );
  MXI2X1 U3365 ( .A(n2964), .B(n3286), .S0(n2950), .Y(n1406) );
  MXI2X1 U3366 ( .A(n2964), .B(n3285), .S0(n2951), .Y(n1422) );
  MXI2X1 U3367 ( .A(n2964), .B(n16030), .S0(n2952), .Y(n1423) );
  MXI2X1 U3368 ( .A(n2964), .B(n1600), .S0(n2953), .Y(n1424) );
  MXI2X1 U3369 ( .A(n2964), .B(n1588), .S0(n2954), .Y(n1421) );
  MXI2X1 U3370 ( .A(n2964), .B(n1607), .S0(n2955), .Y(n1403) );
  MXI2X1 U3371 ( .A(n2964), .B(n1591), .S0(n2956), .Y(n1405) );
  MXI2X1 U3372 ( .A(n2964), .B(n3093), .S0(n2957), .Y(n1427) );
  MXI2X1 U3373 ( .A(n2964), .B(n3199), .S0(n2958), .Y(n1429) );
  MXI2X1 U3374 ( .A(n2964), .B(n3174), .S0(n2959), .Y(n1419) );
  MXI2X1 U3375 ( .A(n2964), .B(n3310), .S0(n2960), .Y(n1434) );
  MXI2X1 U3376 ( .A(n3306), .B(n2961), .S0(n2962), .Y(n1449) );
  NOR2X1 U3377 ( .A(reset), .B(n2965), .Y(N1499) );
  OA21XL U3378 ( .A0(counter_cal[7]), .A1(n2966), .B0(n2967), .Y(n1506) );
  AOI2BB1X1 U3379 ( .A0N(n2969), .A1N(counter_cal[8]), .B0(n2968), .Y(n1518)
         );
  AOI2BB1X1 U3380 ( .A0N(counter_cal[5]), .A1N(n2972), .B0(n2971), .Y(n1508)
         );
  NAND2XL U3381 ( .A(n2975), .B(n2973), .Y(n2974) );
  OAI21XL U3382 ( .A0(n3331), .A1(n2975), .B0(n2974), .Y(n1520) );
  OAI21XL U3383 ( .A0(en_read2), .A1(n3151), .B0(n2977), .Y(n1501) );
  AOI2BB1X1 U3384 ( .A0N(counter_cal[0]), .A1N(n2978), .B0(n2980), .Y(n1526)
         );
  OA21XL U3385 ( .A0(counter_cal[1]), .A1(n2980), .B0(n2979), .Y(n1512) );
  NOR2XL U3386 ( .A(n2982), .B(n2981), .Y(n2984) );
  OA21XL U3387 ( .A0(counter_cal[3]), .A1(n2984), .B0(n2983), .Y(n1510) );
  NAND3X1 U3388 ( .A(n3013), .B(pixel_cal[0]), .C(n3014), .Y(n3012) );
  OAI21XL U3389 ( .A0(n3010), .A1(n2991), .B0(n2985), .Y(n1472) );
  OAI21XL U3390 ( .A0(n3009), .A1(n3192), .B0(n2986), .Y(n1484) );
  OAI21XL U3391 ( .A0(n3011), .A1(n3204), .B0(n2987), .Y(n1476) );
  OAI21XL U3392 ( .A0(n3004), .A1(n2991), .B0(n2988), .Y(n1496) );
  OAI21XL U3393 ( .A0(n3007), .A1(n3046), .B0(n2989), .Y(n1492) );
  OAI21XL U3394 ( .A0(n3006), .A1(n2991), .B0(n2990), .Y(n1488) );
  OAI21XL U3395 ( .A0(n3011), .A1(n3205), .B0(n2992), .Y(n1471) );
  OAI21XL U3396 ( .A0(n3009), .A1(n3099), .B0(n2993), .Y(n1483) );
  OAI21XL U3397 ( .A0(n3011), .A1(n3206), .B0(n2994), .Y(n1475) );
  OAI21XL U3398 ( .A0(n3007), .A1(n3207), .B0(n2995), .Y(n1491) );
  OAI21XL U3399 ( .A0(n3006), .A1(n2997), .B0(n2996), .Y(n1487) );
  OAI21XL U3400 ( .A0(n3004), .A1(n2999), .B0(n2998), .Y(n14990) );
  CLKINVX1 U3401 ( .A(n3000), .Y(n3005) );
  OAI21XL U3402 ( .A0(n3005), .A1(n3209), .B0(n3001), .Y(n1500) );
  NOR2XL U3404 ( .A(counter_pixel[0]), .B(n3154), .Y(n3003) );
  OAI31XL U3405 ( .A0(en_read2), .A1(n3003), .A2(n3037), .B0(n3002), .Y(n1502)
         );
  AO22X1 U3406 ( .A0(n3005), .A1(rom_q[2]), .B0(n3004), .B1(row2[2]), .Y(n1498) );
  AO22X1 U3407 ( .A0(n3005), .A1(rom_q[3]), .B0(n3004), .B1(row2[3]), .Y(n1497) );
  AO22X1 U3408 ( .A0(n3005), .A1(rom_q[6]), .B0(n3004), .B1(row2[6]), .Y(n1494) );
  AO22X1 U3409 ( .A0(n3005), .A1(rom_q[7]), .B0(n3004), .B1(row2[7]), .Y(n1493) );
  AO22X1 U3410 ( .A0(n3007), .A1(rom_q[2]), .B0(n3006), .B1(row2[10]), .Y(
        n1490) );
  AO22X1 U3411 ( .A0(n3007), .A1(rom_q[3]), .B0(n3006), .B1(row2[11]), .Y(
        n1489) );
  AO22X1 U3412 ( .A0(n3007), .A1(rom_q[6]), .B0(n3006), .B1(row2[14]), .Y(
        n1486) );
  AO22X1 U3413 ( .A0(n3007), .A1(rom_q[7]), .B0(n3006), .B1(row2[15]), .Y(
        n1485) );
  AO22X1 U3414 ( .A0(n3009), .A1(rom_q[2]), .B0(n3008), .B1(row2[18]), .Y(
        n1482) );
  AO22X1 U3415 ( .A0(n3009), .A1(rom_q[3]), .B0(n3008), .B1(row2[19]), .Y(
        n1481) );
  AO22X1 U3416 ( .A0(n3009), .A1(rom_q[6]), .B0(n3008), .B1(row2[22]), .Y(
        n1478) );
  AO22X1 U3417 ( .A0(n3009), .A1(rom_q[7]), .B0(n3008), .B1(row2[23]), .Y(
        n1477) );
  AO22X1 U3418 ( .A0(n3011), .A1(rom_q[2]), .B0(n3010), .B1(row2[26]), .Y(
        n1474) );
  AO22X1 U3419 ( .A0(n3011), .A1(rom_q[3]), .B0(n3010), .B1(row2[27]), .Y(
        n1473) );
  AO22X1 U3420 ( .A0(n3011), .A1(rom_q[6]), .B0(n3010), .B1(row2[30]), .Y(
        n1470) );
  AO22X1 U3421 ( .A0(n3011), .A1(rom_q[7]), .B0(n3010), .B1(row2[31]), .Y(
        n1469) );
  OA21XL U3422 ( .A0(pixel_cal[0]), .A1(n3013), .B0(n3012), .Y(n1468) );
  INVXL U3423 ( .A(n3017), .Y(n3016) );
  OAI222XL U3424 ( .A0(n3017), .A1(n3246), .B0(n3016), .B1(pixel_cal[1]), .C0(
        n3015), .C1(n3014), .Y(n1467) );
  OA21XL U3425 ( .A0(counter_read[0]), .A1(n3151), .B0(n3018), .Y(n1254) );
  OA21XL U3426 ( .A0(n3020), .A1(counter_read[4]), .B0(n3019), .Y(n1251) );
  AOI2BB2X1 U3427 ( .B0(counter_read[6]), .B1(n3021), .A0N(counter_read[6]), 
        .A1N(n3021), .Y(n1249) );
  OA21XL U3428 ( .A0(n3023), .A1(counter_read[2]), .B0(n3022), .Y(n1120) );
endmodule

