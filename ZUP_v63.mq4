//|----------------------------------------------------------------------|
//|ZigZag óíèâåðñàëüíûé ñ ïàòòåðíàìè Ïåñàâåíòî                           |
//|----------------------------------------------------------------------|
//|                                                                      |
//|               "Parameters for ZigZag"                                |
//|                                                                      |
//|----------------------------------------------------------------------|
//|ExtIndicator - âûáîð âàðèàíòà èíäèêàòîðà, íà îñíîâå êîòîðîãî          |
//|               ñòðîÿòñÿ ïàòòåðíû Ïåñàâåíòî                            |
//|           0 - Zigzag èç ìåòàòðåéäåðà, ñòàíäàðòíûé                    |
//|           1 - Zigzag Àëåêñà,                                         |
//|           2 - èíäèêàòîð ïîäîáíûé âñòðîåííîìó â Ensign                |
//|           3 - ZigZag Ensign ñ ïåðåìåííûì çíà÷åíèåì minBars           |
//|           4 - ZigZag, ðàçðàáîòàë tauber                              |
//|           5 - âàðèàöèÿ íà òåìó ñâèíãîâ Ãàííà                         |
//|           6 - DT-ZigZag ñ âíåøíèì ZigZag_new_nen3.mq4                |
//|           7 - DT-ZigZag ñ âíåøíèì DT_ZZ.mq4 (ðàçðàáîòàë klot)        |
//|           8 - DT-ZigZag ñ âíåøíèì CZigZag.mq4 (ðàçðàáîòàë Candid)    |
//|          10 - DT-ZigZag ñ âíåøíèì Swing_zz - ýòî ExtIndicator=5      |
//|               â ðåæèìå DT                                            |
//|          11 - âêëþ÷àåò ïîèñê ïàòòåðíîâ Gartley                       |
//|          12 - ZigZag, ðàçðàáîòàë Talex                               |
//|                                                                      |
//|minBars - ôèëüòð áàðîâûé (çàäàåòñÿ êîëè÷åñòâî áàðîâ)                  |
//|minSize - ôèëüòð ïî êîëè÷åñòâó ïóíêòîâ (çàäàåòñÿ êîëè÷åñòâî ïóíêòîâ)  |
//|                                                                      |
//|ExtDeviation è ExtBackstep - ïàðàìåòðû îñòàâøèåñÿ îò ZigZag èç MT4    |
//|                                                                      |
//|GrossPeriod - çíà÷åíèå òàéìôðåéìà, âûðàæåííîå â ìèíóòàõ (÷èñëî ìèíóò),|
//| äàííûå ñ êîòîðîãî áåðóòñÿ äëÿ ïîñòðîåíèÿ ZigZag â ðåæèìå DT-ZigZag   |
//|                                                                      |
//|minPercent - ïðîöåíòíûé ôèëüòð (çàäàåòñÿ ïðîöåíò, íàïðèìåð 0.5)       |
//|             Åñëè èñïîëüçóþòñÿ ïðîöåíòû - ñòàâèòå ÷èñëî, à minSize=0; |
//|                                                                      |
//|ExtPoint=11 -   êîëè÷åñòâî òî÷åê çèãçàãà äëÿ çèãçàãà Talex            |
//|                                                                      |
//|ExtStyleZZ - = true - çàäàåò ñòèëü ëèíèé ZigZag ÷åðåç âêëàäêó ÖÂÅÒÀ   |
//|             = false - Zigzag âûâîäèòñÿ òî÷êàìè ó ýêñòðåìóìîâ         |
//|----------------------------------------------------------------------|
//|                                                                      |
//|               "Parameters for fibo Levels"                           |
//|                                                                      |
//|----------------------------------------------------------------------|
//|ExtFiboDinamic - ðàçðåøàåò âûâîä äíàìè÷åñêèõ óðîâíåé ôèáî.            |
//|                 Äèíàìè÷åñêèå óðîâíè ôèáî âûâîäÿòñÿ íà ïåðâîì ëó÷å    |
//|                 ZigZag-a.                                            |
//|                                                                      |
//|ExtFiboStatic - ðàçðåøàåò âûâîä ñòàòè÷åñêèõ óðîâíåé ôèáî              |
//|                                                                      |
//|ExtFiboStaticNum - íîìåð ëó÷à ZigZag-a, íà êîòîðîì áóäóò âûâîäèòüñÿ   |
//|                   ñòàòè÷åñêèå óðîâíè Ôèáîíà÷÷è. 1<ExtFiboStaticNum<=9|
//|                                                                      |
//|ExtFiboD è ExtFiboS - âûáîð öâåòà äèíàìè÷åñêèõ è ñòàòè÷åñêèõ ôèá.     |
//|                                                                      |
//|ExtFiboCorrectionExpansion = false - êîððåêöèÿ Ôèáîíà÷÷è              |
//|                           = true  - ðàñøèðåíèå Ôèáîíà÷÷è             |
//|----------------------------------------------------------------------|
//|                                                                      |
//|               "Parameters for Pesavento Patterns"                    |
//|                                                                      |
//|----------------------------------------------------------------------|
//|ExtPPWithBars - âûâîäèòñÿ äîïîëíèòåëüíàÿ èíôîðìàöèÿ ïîñëå çíà÷åíèé    |
//|                ðåòðåñìåíòîâ ïàòòåðíîâ Ïåñàâåíòî.                     |
//|                                                                      |
//|             0 - âûâîäÿòñÿ ðåòðåñìåíòû êàê áûëî ðàíåå                 |
//|             1 - âûâîäèòñÿ êîëè÷åñòâî áàðîâ ìåæäó òî÷êàìè, ñâÿçàííûìè |
//|                 "ðåòðåñìåíòîì" (ïàòòåðíîì Ïåñàâåíòî)                 |
//|             2 - âûâîäèòñÿ êîëè÷åñòâî áàðîâ äëÿ ïåðâîãî è âòîðîãî     |
//|                 óñëîâíîãî ëó÷à çèãçàãà, ìåæäó êîòîðûìè ïîñòðîåí      |
//|                 "ðåòðåñìåíò" (ïàòòåðíîì Ïåñàâåíòî)                   |
//|             3 - âûâîäèòñÿ âðåìåííÎé ðåòðåñìåíò ïîñëå öåíîâîãî        |
//|                 ðåòðåñìåíòà. ÂðåìåííÎé ðåòðåñìåíò ðàññ÷èòûâàåòñÿ êàê |
//|                 îòíîøåíèå êîëè÷åñòâà áàðîâ íà âòîðîì ëó÷å çèãçàãà ê  |
//|                 êîëè÷åñòâó áàðîâ íà ïåðâîì ëó÷å çèãçàãà              |
//|             4 - âûâîäèòñÿ âðåìåííÎé ðåòðåñìåíò, ðàññ÷èòàííûé êàê     |
//|                 îòíîøåíèå âðåìåíè ðàçâèòèÿ âòîðîãî ëó÷à ê âðåìåíè    |
//|                 ðàçâèòèÿ ïåðâîãî ëó÷à                                |
//|                                                                      |
//|             6 - âûâîäèò êîëè÷åñòâî ïóíêòîâ è ïðîöåíòîâ, íà êîòîðûå   |
//|                 òåêóùàÿ öåíà ïåðåëîìà çèãçàãà îòëè÷àåòñÿ îò          |
//|                 ÷èñëà Ïåñàâåíòî                                      |
//|                                                                      |
//|             7 - âûâîäèò çíà÷åíèå ñêîðîñòè äëÿ ïåðâîãî è âòîðîãî ëó÷åé|
//|                 Äàííûé ïàðàìåòð òàêæå ìîæíî èñïîëüçîâàòü äëÿ îïðåäå- |
//|                 ëåíèÿ çíà÷åíèÿ ìàñøòàáà. Äàííîå çíà÷åíèå èñïîëüçóåòñÿ|
//|                 ïðè àâòîìàòè÷åñêîì ìàñøòàáèðîâàíèè ôèáî äóã.         |
//|                                                                      |
//|ExtHidden - 0 - ëèíèè è ÷èñëà ïàòòåðíîâ Ïåñàâåíòî ñêðûòû.             |
//|            1 - ïîêàçûâàåò âñå ëèíèè ìåæäó ôðàêòàëàìè, ó êîòîðûõ      |
//|                ïðîöåíò âîññòàíîâëåíèÿ >0.14 è <5.                    |
//|            2 - ïîêàçûâàåò òîëüêî òå  ëèíèè, ãäå ïðîöåíò âîññòàíî-    |
//|                âëåíèÿ ðàâåí ÷èñëàì Ïåñàâåíòî (è 0.447, 0.886, 2.236, |
//|                3.14, 3,618 äëÿ ïîñòðîåíèÿ ïàòòåðíîâ Gartley)         |
//|            3 - ïîêàçûâàåò ÷èñëà, ïåðå÷èñëåííûå â ïóíêòå 2            |
//|                è ñîîòâåòñòâóþùèå ëèíèè                               |
//|            4 - ïîêàçûâàåò ÷èñëà íå Ïåñàâåíòî è ñîîòâåòñòâóþùèå ëèíèè |
//|            5 - ñêðûâàåò âñþ îñíàñòêó. Îñòàåòñÿ òîëüêî ZigZag         |
//|                                                                      |
//|ExtFractal - êîëè÷åñòâî ôðàêòàëîâ (ìàêñèìóìîâ, ìèíèìóìîâ),            |
//|             îò êîòîðûõ èäóò ëèíèè ê äðóãèì ôðàêòàëàì                 |
//|                                                                      |
//|ExtFractalEnd - êîëè÷åñòâî ôðàêòàëîâ, ê êîòîðûì èäóò ëèíèè            |
//|                äàëüøå ýòîãî ôðàêòàëà ñîåäèíÿþùèõ ëèíèé íå áóäåò      |
//|                Åñëè ExtFractalEnd=0 òî ïîñëåäíèé ôðàêòàë ðàâåí       |
//|                ìàêñèìàëüíîìó ÷èñëó ôðàêòàëîâ.                        |
//|                Ìèíèìàëüíîå çíà÷åíèå ExtFractalEnd=1                  |
//|                                                                      |
//|ExtFiboChoice - âûáîð íàáîðà ÷èñåë ÷èñåë äëÿ ïîñòðîåíèÿ ïàòòåðíîâ     |
//|                Ïåñàâåíòî. Ïàðàìåòð çàäàåòñÿ ÷èñëàìè îò 0 äî 11       |
//|                                                                      |
//|ExtFiboZigZag - ðàçðåøàåò âûâîä "ZiaZag Fibonacci"                    |
//|                                                                      |
//|ExtDelta - (äîïóñê) îòêëîíåíèå â ðàñ÷åòå. Çàäàåò âåëè÷èíó             |
//|           ïîòåíöèàëüíîé ðàçâîðîòíîé çîíû.                            |
//|                  äîëæíî áûòü 0<ExtDelta<1                            |
//|                                                                      |
//|ExtDeltaType -    0 - âûâîäÿòñÿ ïðîöåíòû âîññòàíîâëåíèÿ "êàê åñòü"    |
//|                      ñ îêðóãëåíèåì äî 2 öèôð ïîñëå çàïÿòîé           |
//|                  1 - ðàñ÷åò äîïóñêà (%-÷èñëî Ïåñàâåíòî)<ExtDelta     |
//|                  2 - ((%-÷èñëî Ïåñàâåíòî)/÷èñëî Ïåñàâåíòî)<ExtDelta  |
//|                  3 - âûâîäÿòñÿ ïðîöåíòû âîññòàíîâëåíèÿ "êàê åñòü"    |
//|                      ñ îêðóãëåíèåì äî 3 öèôð ïîñëå çàïÿòîé           |
//|                                                                      |
//|ExtSizeTxt - ðàçìåð øðèôòà äëÿ âûâîäà ÷èñåë                           |
//|                                                                      |
//|ExtLine - âûáîð öâåòà ñîåäèíèòåëüíûõ ëèíèé                            |
//|                                                ðåòðåñìåíòîâ          |
//|ExtLine886 - âûáîð öâåòà ñîåäèíèòåëüíûõ ëèíèé ñ ÷èñëàìè Ïåñàâåíòî     |
//|                                                ðåòðåñìåíòîâ          |
//|ExtNotFibo - âûáîð öâåòà âñåõ îñòàëüíûõ ÷èñåë                         |
//|                                                                      |
//|ExtPesavento - âûáîð öâåòà ÷èñåë Ïåñàâåíòî                            |
//|                                                                      |
//|ExtGartley886 - âûáîð öâåòà ÷èñëà .886 è äðóãèõ äîïîëíèòåëüíûõ        |
//|----------------------------------------------------------------------|
//|                                                                      |
//|               "Parameters for Gartley Patterns"                      |
//|                                                                      |
//|----------------------------------------------------------------------|
//|maxDepth - ìàêñèìàëüíîå çíà÷åíèå Depth (minBars), äî êîòîðîãî ìîæåò   |
//|           èçìåíÿòüñÿ ïàðàìåòð Depth çèãçàãà ïðè àêòèâíîì ñêàíèðîâàíèè|
//|           äëÿ ïîèñêà ïàòòåðíîâ Gartley                               |
//|minDepth - çàäàåò ìèíèìàëüíîå çíà÷åíèå Depth äëÿ ïîèñêà ïàòòåðíîâ     |
//|           Gartley.                                                   |
//|                                                                      |
//|DirectionOfSearchMaxMin - çàäàåò íàïðàâëåíèå ïîèñêà:                  |
//|           false - îò minDepth ê maxDepth                             |
//|           true - îò maxDepth ê minDepth                              |
//|                                                                      |
//|ExtGartleyOnOff - âêëþ÷àåò ïîêàç ïàòòåðíîâ Gartley.                   |
//|                                                                      |
//|maxBarToD - çàäàåò ìàêñèìàëüíîå êîëè÷åñòâî áàðîâ îò íóëåâîãî          |
//|            äî òî÷êè D ïàòòåðíà                                       |
//|                                                                      |
//|RangeForPointD - ðàçðåøàåò ïîêàç çîíû ðàçâèòèÿ òî÷êè D                |
//|                                                                      |
//|ExtColorRangeForPointD - öâåò ðàìêè çîíû ðàçâèòèÿ òî÷êè D             |
//|                                                                      |
//|ExtDeltaGartley - äîïóñê íà îòêëîíåíèå öåíû äëÿ ïîèñêà ïàòòåðíîâ      |
//|                  ïî óìîë÷àíèþ 9% - 0.09                              |
//|                                                                      |
//|ExtColorPatterns - öâåò òðåóãîëüíèêîâ ïàòòåðíîâ                       |
//|                                                                      |
//|ExtCD - âåëè÷èíà ëó÷à CD ïàòòåðíà îòíîñèòåëüíî ëó÷à BC ïîñëå êîòîðîé  |
//|        íà÷èíàåòñÿ ïîèñê ïàòòåðíîâ (âîçìîæíî - ýòî ëèøíèé ïàðàìåòð)   |
//|----------------------------------------------------------------------|
//|                                                                      |
//|               "Parameters for Andrews Pitchfork"                     |
//|                                                                      |
//|----------------------------------------------------------------------|
//|ExtPitchforkDinamic > 0 (=1) âûâîäÿòñÿ äèíàìè÷åñêèå âèëû Ýíäðþñà îò   |
//|             ïîñëåäíèõ äâóõ ýêñòðåìóìîâ ZigZag                        |
//|             =2 50% ìåäèàíà                                           |
//|             =3 50% âèëû                                              |
//|             =4 ëèíèè Øèôôà                                           |
//|                                                                      |
//|ExtPitchforkStatic > 0 (=1) âûâîäÿòñÿ ñòàòè÷åñêèå âèëû Ýíäðþñà îò     |
//|             ýêñòðåìóìà ZigZag ñ íîìåðîì ExtPitchforkStaticNum        |
//|             =2 50% ìåäèàíà                                           |
//|             =3 50% âèëû                                              |
//|             =4 ëèíèè Øèôôà                                           |
//|                                                                      |
//|3<ExtPitchforkStaticNum<=9 - íîìåð âåðøèíû ZigZag, îò êîòîðîé         |
//|           íà÷èíàþòñÿ ñòàòè÷åñêèå âèëû                                |
//|                                                                      |
//|ExtLinePitchforkD è                                                   | 
//|ExtLinePitchforkS çàäàåò öâåò äèíàìè÷åñêèõ è ñòàòè÷åñêèõ âèë          |
//|                                                                      |
//|ExtPitchforkStaticColor - çàäàåò öâåò çàêðàñêè êàíàëà âèë             |
//|                                                                      |
//|ExtPitchforkStyle - çàäàåò ñòèëü âûâîäà âèë.                          |
//|             0 - Ñïëîøíàÿ ëèíèÿ                                       |
//|             1 - Øòðèõîâàÿ ëèíèÿ                                      |
//|             2 - Ïóíêòèðíàÿ ëèíèÿ                                     |
//|             3 - Øòðèõ-ïóíêòèðíàÿ ëèíèÿ                               |
//|             4 - Øòðèõ-ïóíêòèðíàÿ ëèíèÿ ñ äâîéíûìè òî÷êàìè            |
//|             5-10 - çàäàåò òîëùèíó Ñïëîøíîé ëèíèè                     |
//|                                                                      |
//|ExtFiboFanDinamic - ðàçðåøàåò âûâîä äèíàìè÷åñêèõ ôèáî-âååðîâ          |
//|                                                                      |
//|ExtFiboFanStatic - ðàçðåøàåò âûâîä ñòàòè÷åñêèõ ôèáî-âååðîâ            |
//|                   âûâîäèòñÿ òîëüêî ñî ñòàòè÷åñêèìè âèëàìè            |
//|                                                                      |
//|ExtFiboFanD - çàäàåò öâåò äèíàìè÷åñêèõ ôèáî-âååðîâ                    |
//|                                                                      |
//|ExtFiboFanS - çàäàåò öâåò ñòàòè÷åñêèõ ôèáî-âååðîâ                     |
//|                                                                      |
//|ExtFiboFanExp - êîëè÷åñòâî ëó÷åé ôèáî âååðà. true=6, false=4          |
//|                                                                      |
//|ExtFiboFanHidden - ðàçðåøàåò âûâîä ìàðêèðîâêè ëó÷åé ôèáî-âååðîâ       |
//|                                                                      |
//|ExtFiboFanMedianaDinamicColor è                                       |
//|ExtFiboFanMedianaStaticColor - çàäàþò öâåò ôèáî-âååðîâ íà             |
//|    ñðåäèííîé ëèíèè äèíàìè÷åñêèõ è ñòàòè÷åñêèõ âèë                    |
//|                                                                      |
//|   Âðåìåííûå çîíû ôèáî âûâîäÿòñÿ òîëüêî äëÿ ñòàòè÷åñêèõ âèë           |
//|ExtFiboTime1 - âêëþ÷àåò âðåìåííûå çîíû ôèáî 1.                        |
//|                                                                      |
//|ExtFiboTime2 - âêëþ÷àåò âðåìåííûå çîíû ôèáî 2.                        |
//|                                                                      |
//|ExtFiboTime1C - çàäàåò öâåò ëèíèé âðåìåííîé çîíû 1.                   |
//|                                                                      |
//|ExtFiboTime2C - çàäàåò öâåò ëèíèé âðåìåííîé çîíû 2.                   |
//|                                                                      |
//|ExtPivotZoneDinamicColor - çàäàåò öâåò çàêðàñêè äèíàìè÷. Pivot Zone   |
//|                                                                      |
//|ExtPivotZoneStaticColor - çàäàåò öâåò çàêðàñêè ñòàòè÷. Pivot Zone     |
//|                                                                      |
//|ExtPivotZoneFramework - âûâîä Pivot Zone â âèäå ðàìêè (ïî óìîë÷àíèþ)  |
//|                        èëè â âèäå çàêðàøåííîãî ïðÿìîóãîëüíèêà        |
//|                                                                      |
//|ExtUTL - âêëþ÷àåò âåðõíþþ êîíòðîëüíóþ ëèíèþ âèë Ýíäðþñà               |
//|                                                                      |
//|ExtLTL - âêëþ÷àåò íèæíþþ êîíòðîëüíóþ ëèíèþ âèë Ýíäðþñà                |
//|                                                                      |
//|ExtUWL - âêëþ÷àåò âåðõíèå ïðåäóïðåæäàþùèå ëèíèè                       |
//|                                                                      |
//|ExtLWL - âêëþ÷àåò íèæíèå ïðåäóïðåæäàþùèå ëèíèè                        |
//|                                                                      |
//|ExtISLDinamic - âêëþ÷àåò âíóòðåííèå ñèãíàëüíûå ëèíèè                  |
//|                äëÿ äèíàìè÷åñêèõ âèë Ýíäðþñà                          |
//|ExtISLStatic  - âêëþ÷àåò âíóòðåííèå ñèãíàëüíûå ëèíèè                  |
//|                äëÿ ñòàòè÷åñêèõ âèë Ýíäðþñà                           |
//|                                                                      |
//|ExtRLine - ðàçðåøàåò âûâîä ëèíèé ðåàêöèè âäîëü âèë Ýíäðþñà            |
//|                                                                      |
//|ExtRLineBase - ñêðûâàåò íàïðàâëÿþùèå ëèíèé ðåàêöèè                    |
//|                                                                      |
//|ExtPitchforkCandle - âêëþ÷àåò âûâîä êîìïëåêòà âèë îò âûáðàííûõ ñâå÷åé |
//|                                                                      |
//|ExtDateTimePitchfork_1, ExtDateTimePitchfork_2,                       |
//|                                                                      |
//|ExtDateTimePitchfork_3 - çàäàåòñÿ äàòà è âðåìÿ ñâå÷åé, îò êîòîðûõ     |
//|  áóäóò ñòðîèòüñÿ âèëû Ýíäðþñà                                        |
//|                                                                      |
//|ExtPitchfork_1_HighLow - ïðè ïîñòðîåíèè âèë îò âûáðàííûõ ñâå÷åé çà-   |
//|  äàåò îò ìàêñèìóìà èëè ìèíèìóìà ñâå÷è ñòðîèòü ïåðâóþ òî÷êó âèë       |
//|----------------------------------------------------------------------|
//|                                                                      |
//|               "Parameters for micmed Channels"                       |
//|                                                                      |
//|----------------------------------------------------------------------|
//|ExtCM_0_1A_2B - êàíàëû micmed'a. Çíà÷åíèå âûáèðàåòñÿ èç 0-4           |
//| Êàíàëû micmed'a ñòðîÿòñÿ ñ ïîìîùüþ âèë Ýíäðþñà                       |
//|                                                                      |
//|ExtCM_Fibo - çàäàåòñÿ ïîëîæåíèå ñðåäèííîé ëèíèè âèë Ýíäðþñà äëÿ       |
//|             ïîñòðîåíèÿ êàíàëîâ micmed'a                              |
//|----------------------------------------------------------------------|
//|                                                                      |
//|               "Parameters for fibo Fan"                              |
//|                                                                      |
//|----------------------------------------------------------------------|
//|ExtFiboFanColor - âêëþ÷àåò ïðîèçâîëüíûå ôèáîâååðû çàäàíèåì öâåòà.     |
//|                                                                      |
//|ExtFiboFanNum - íîìåð ëó÷à ZigZag-a, íà êîòîðîì áóäóò âûâîäèòüñÿ      |
//|                  ïðîèçâîëüíûå ôèáîâååðû. 1<ExtFiboStaticNum<=9       |
//|----------------------------------------------------------------------|
//|                                                                      |
//|               "Parameters for fibo Expansion"                        |
//|                                                                      |
//|----------------------------------------------------------------------|
//|ExtFiboExpansion - ðàñøèðåíèÿ Ôèáîíà÷÷è, êàê â Ìåòàòðåéäåðå           |
//|                 < 2 ðàñøèðåíèÿ Ôèáîíà÷÷è íå âûâîäÿòñÿ                |
//|                 = 2 äèíàìè÷åñêîå ðàñøèðåíè Ôèáîíà÷÷è                 |
//|                 >2 è <=9 ñòàòè÷åñêèå ðàñøèðåíèÿ Ôèáîíà÷÷è            |
//|                                                                      |
//|ExtFiboExpansionColor - çàäàåò öâåò ëèíèé ðàñøèðåíèé Ôèáîíà÷÷è        |
//|----------------------------------------------------------------------|
//|                                                                      |
//|               "Parameters for versum Levels"                         |
//|                                                                      |
//|----------------------------------------------------------------------|
//|ExtVLDinamicColor - âêëþ÷àå Versum Levels äèíàìè÷åñêèå âûáîðîì öâåòà  |
//|                                                                      |
//|ExtVLStaticColor - âêëþ÷àåò Versum Levels ñòàòè÷åñêèå âûáîðîì öâåòà   |
//|                                                                      |
//|ExtVLStaticNum - çàäàåò íîìåð âåðøèíû, îò êîòîðîé âûâîäÿòñÿ           |
//|                 Versum Levels                                        |
//|----------------------------------------------------------------------|
//|                                                                      |
//|               "Parameters for fibo Arc"                              |
//|                                                                      |
//|----------------------------------------------------------------------|
//|ExtArcDinamicNum - çàäàåò íîìåð ïåðåëîìîâ ZigZag äî êîòîðûõ           |
//|                   ñòðîÿòñÿ äèíàìè÷åñêèå ôèáî äóãè                    |
//|                                                                      |
//|ExtArcStaticNum - çàäàåò íîìåð ïåðåëîìîâ ZigZag íà êîòîðûõ            |
//|                   ñòðîÿòñÿ ñòàòè÷åñêèå ôèáî äóãè                     |
//|                                                                      |
//|ExtArcDinamicColor - çàäàåò öâåò äèíàìè÷åñêèõ ôèáî äóã                |
//|                                                                      |
//|ExtArcStaticColor - çàäàåò öâåò ñòàòè÷åñêèõ ôèáî äóã                  |
//|                                                                      |
//|ExtArcDinamicScale - çàäàåò ìàñøòàá äèíàìè÷åñêèõ ôèáî äóã             |
//|          0 - àâòîìàñøòàá; >0 - ìàñøòàá çàäàåòñÿ ïîëüçîâàòåëåì        |
//|                                                                      |
//|ExtArcStaticScale çàäàåò ìàñøòàá ñòàìè÷åñêèõ ôèáî äóã                 |
//|          0 - àâòîìàñøòàá; >0 - ìàñøòàá çàäàåòñÿ ïîëüçîâàòåëåì        |
//|----------------------------------------------------------------------|
//|                                                                      |
//|               "Parameters Exp"                                       |
//|                                                                      |
//|----------------------------------------------------------------------|
//|chHL     = true     - Åñëè õîòèòå ïîñìîòðåòü óðîâíè ïîäòâåðæäåíèÿ     |
//|                                                                      |
//|PeakDet  = true     - Åñëè õîòèòå ïîñìîòðåòü óðîâíè ïðåäûäóùèõ        |
//|                      ìàêñèìóìîâ                                      |
//|                                                                      |
//|chHL_PeakDet_or_vts - true - Ïî óìîë÷àíèþ ðàçðåøàåò âûâîä ëèíèé       |
//| ïîäòâåðæäåíèÿ (öåíîâîé êàíàë) è óðîâíè ïðåäûäóùèõ ìàêñèìóìîâ ZigZag. |
//|  false - âûâîäèòñÿ èíäèêàòîð i-vts.                                  |
//|                                                                      |
//|NumberOfBars - Êîëè÷åñòâî áàðîâ îáñ÷¸òà (0-âñå) äëÿ i-vts.            |
//|                                                                      |
//|NumberOfVTS - ýòî, ÿ òàê ïîíèìàþ, ïàðàìåòð ñãëàæèâàíèÿ äëÿ i-vts.     |
//|                                                                      |
//|NumberOfVTS1 - ïàðàìåòð ñãëàæèâàíèÿ äëÿ âòîðîé êîïèè i-vts.           |
//|----------------------------------------------------------------------|
//|                                                                      |
//|               "Common Parameters"                                    |
//|                                                                      |
//|----------------------------------------------------------------------|
//|ExtFiboType = true - ôèáû ñ ÷èñëàìè Ïåñàâåíòî è ò.ä.                  |
//|              false - ñòàíäàðòíûå ôèáû                                |
//|                                                                      |
//|ExtObjectColor - çàäàåò öâåò ëèíèè, ñîåäèíÿþùåé áàçîâûå òî÷êè îáúåêòîâ|
//|                                                                      |
//|ExtObjectStyle - çàäàåò còèëü ëèíèè,                                  |
//|                                    ñîåäèíÿþùåé áàçîâûå òî÷êè îáúåêòîâ|
//|                                                                      |
//|ExtObjectWidth - çàäàåò òîëùèíó ëèíèè,                                |
//|                                    ñîåäèíÿþùåé áàçîâûå òî÷êè îáúåêòîâ|
//|                                                                      |
//|ZigZagHighLow - çàäàåò, îò êàêèõ òî÷åê äåëàòü ïîñòðîåíèå              |
//|                ïàòòåðíîâ Ïåñàâåíòî, âèë Ýíäðþñà è ò.ä.               |
//|true - îò ýêñòðåìóìîâ áàðîâ                                           |
//|false - îò ïåðåëîìîâ ZigZag, êîãäà îíè âèñÿò â "âîçäóõå"              |
//|                                                                      |
//|ExtSendMail - îòïðàâêà ñîîáùåíèÿ íà email î ïîÿâèâøåìñÿ ïàòòåðíå.     |
//|                                                                      |
//|ExtAlert - ðàçðåøàåò âûâîä ñîîáùåíèÿ è çâóêîâîãî ñèãíàëà ïðè          |
//|           âîçíèêíîâåíèè íîâîãî ëó÷à ZigZag                           |
//|                                                                      |
//|ExtBack - çàäàåò âûâîä âñåõ îáúåêòîâ â âèäå ôîíà                      |
//|                                                                      |
//|ExtSave - ðàçðåøàåò ñîõðàíåíèå êîìïëåêòà ñòàòè÷åñêèõ âèë è            |
//|          Fibo Time                                                   |
//|                                                                      |
//|infoTF - âêëþ÷àåò èíôîðìàöèþ ïî 5 ñòàðøèì òàéìôðåéìàì.                |
//|         Âûâîäèòñÿ íàèìåíîâàíèå òàéìôðåéìà. Ðàçìåð ñâå÷è â ïóíêòàõ.   |
//|         Òåêóùåå ïîëîæåíèå öåíû îòíîñèòåëüíî ìèíèìóìà.                |
//|         Òàêæå ïîêàçûâàåò Âûñîòó ëó÷à çèãçàãà âûðàæåííóþ â ïðîöåíòàõ. |
//|         Ïîêàçûâàåò íàçâàíèÿ ïàòòåðíîâ Gartley è ðàçìåð çîíû          |
//|         âîçìîæíîãî ðàçâèòèÿ òî÷êè D äëÿ ïàòòåðíîâ Gartley.           |
//|                                                                      |
//|ExtComplekt - çàäàåò íîìåð èíäèêàòîðà. Ïðè âûâîäå íà ãðàôèê íåñêîëüêèõ|
//|              èíäèêàòîðîâ ÷åðåç ýòîò ïàðàìåòð çàäàåòñÿ íîìåð êîïèè.   |
//|              Ïðè ýòîì âñå êîïèè èíäèêàòîðà áóäóò ðàáîòàòü êîððåêòíî. |
//+----------------------------------------------------------------------+
#property copyright "nen"
#property link      "http://onix-trade.net/forum/index.php?s=&showtopic=118&view=findpost&p=213210"
// îïèñàíèå http://onix-trade.net/forum/index.php?s=&showtopic=373&view=findpost&p=72865

#property stacksize 16384
#property indicator_chart_window
#property indicator_buffers 6
#property indicator_color1 Aqua 
#property indicator_color2 Green
#property indicator_color3 Orange
#property indicator_color4 LightSkyBlue
#property indicator_color5 LemonChiffon
#property indicator_color6 Yellow
//===================================
//---- indicator parameters
extern string Var0___________________________ = "Parameters for ZigZag";
extern int    ExtIndicator  = 11;
extern int    minBars       = 8;
extern int    minSize       = 55;
// Ïåðåìåííûå îò ZigZag èç ÌÒ
extern int    ExtDeviation  = 5;
extern int    ExtBackstep   = 3;
// Ïåðåìåííàÿ äëÿ nen-ZigZag
extern int    GrossPeriod   = 1440;
//----
extern double minPercent    = 0;
extern int    ExtPoint=11; // êîëè÷åñòâî òî÷åê çèãçàãà äëÿ çèãçàãà Talex 
extern bool   ExtStyleZZ = true;
//----
extern string Var1___________________________ = "Parameters for fibo Levels";
extern bool   ExtFiboDinamic   = false;
extern bool   ExtFiboStatic    = false;
extern int    ExtFiboStaticNum = 2;
extern color  ExtFiboD         = Sienna;
extern color  ExtFiboS         = Teal;
extern bool   ExtFiboCorrectionExpansion = false;
//-------------------------------------
extern string Var2___________________________ = "Parameters for Pesavento Patterns";
extern int    ExtPPWithBars = 0;
extern int    ExtHidden     = 1;
extern int    ExtFractal    = 7;
extern int    ExtFractalEnd = 7;
extern int    ExtFiboChoice    = 2;
extern bool   ExtFiboZigZag = false;
extern double ExtDelta      = 0.04;
extern int    ExtDeltaType  = 2;
extern int    ExtSizeTxt       = 7;
extern color  ExtLine          = DarkBlue;
extern color  ExtLine886       = Purple;
extern color  ExtNotFibo       = SlateGray;
extern color  ExtPesavento     = Yellow;
extern color  ExtGartley886    = GreenYellow;
       color  colorPPattern;
// Ïàòòåðíû Gartley
extern string Var3___________________________ = "Parameters for Gartley Patterns";
extern int    maxDepth                = 33;
extern int    minDepth                = 3;
extern bool   DirectionOfSearchMaxMin = true;
extern bool   ExtGartleyOnOff         = false;
//extern int    VarDisplay=0;
extern int    maxBarToD               = 15;
extern bool   RangeForPointD          = true;
extern color  ExtColorRangeForPointD  = Red;
extern double ExtDeltaGartley         = 0.09;
extern color  ExtColorPatterns        = Blue;
extern double ExtCD                   = 0.886;
//----------------------------------------------------------------------
// Êîìïëåêò èíñòðóìåíòîâ, ðàáîòàþùèõ ñîâìåñòíî ñ âèëàìè Ýíäðþñà. Íà÷àëî.
//----------------------------------------------------------------------
// Ïåðåìåííûå äëÿ âèë Ýíäðþñà
extern string Var4___________________________ = "Parameters for Andrews Pitchfork";
extern int    ExtPitchforkDinamic     = 0;
extern int    ExtPitchforkStatic      = 0;
extern int    ExtPitchforkStaticNum   = 3;
extern color  ExtLinePitchforkD       = MediumSlateBlue;
extern color  ExtLinePitchforkS       = MediumBlue;
extern color  ExtPitchforkStaticColor = CLR_NONE;
extern int    ExtPitchforkStyle       = 1;
// Ïåðåìåííûå äëÿ ôèáîâååðîâ
extern bool   ExtFiboFanDinamic = false;  // ìîæåò âûâîäèòüñÿ ñàìîñòîÿòåëüíî
extern bool   ExtFiboFanStatic  = false;  // âûâîäèòñÿ òîëüêî ñîâìåñòíî ñî ñòàòè÷åñêèìè âèëàìè
extern bool   ExtFiboFanExp     = true;
extern bool   ExtFiboFanHidden  = false;
extern color  ExtFiboFanD       = Sienna;
extern color  ExtFiboFanS       = Teal;

extern color  ExtFiboFanMedianaDinamicColor = CLR_NONE;
extern color  ExtFiboFanMedianaStaticColor  = CLR_NONE;

// Âðåìåííûå çîíû Ôèáî
extern bool   ExtFiboTime1      = false;
extern bool   ExtFiboTime2      = false;
extern color  ExtFiboTime1C     = Teal;
extern color  ExtFiboTime2C     = Sienna;

// Pivot Zone
extern color  ExtPivotZoneDinamicColor = CLR_NONE;
extern color  ExtPivotZoneStaticColor = CLR_NONE;
extern bool   ExtPivotZoneFramework   = false;

// Âêëþ÷åíèå ïðåäóïðåæäàþùèõ è êîíòðîëüíûõ ëèíèé
extern bool   ExtUTL = false;
extern bool   ExtLTL = false;
extern bool   ExtUWL = false;
extern bool   ExtLWL = false;
extern bool   ExtISLDinamic = false;
extern bool   ExtISLStatic  = false;

// Âêëþ÷åíèå ëèíèé ðåàêöèè
extern bool   ExtRLine     = true;
extern bool   ExtRLineBase = true;
//----------------------------------------------------------------------
//extern bool     ExtPitchforkCandle = false;
//extern bool     ExtPitchfork_1_HighLow = false;
//extern datetime ExtDateTimePitchfork_1 = D'11.07.2006 00:00';
//extern datetime ExtDateTimePitchfork_2 = D'19.07.2006 00:00';
//extern datetime ExtDateTimePitchfork_3 = D'09.08.2006 00:00';
//----------------------------------------------------------------------
// Íèæå âûáðàíû âðåìåííûå ïàðàìåòðû äëÿ ïîñòðîåíèÿ âèë Ýíäðþñà äëÿ âñåé èñòîðèè eurusd äëÿ äíåâîê
//----------------------------------------------------------------------
extern bool     ExtPitchforkCandle     = false;
extern datetime ExtDateTimePitchfork_1 = D'15.06.1989 00:00';
extern datetime ExtDateTimePitchfork_2 = D'08.03.1995 00:00';
extern datetime ExtDateTimePitchfork_3 = D'26.10.2000 00:00';
extern bool     ExtPitchfork_1_HighLow = false;
//----------------------------------------------------------------------
// Êàíàëû micmed'a
extern string Var5___________________________ = "Parameters for micmed Channels";
extern int    ExtCM_0_1A_2B = 0;
extern double ExtCM_Fibo    = 0.618;
//----------------------------------------------------------------------
// Êîìïëåêò èíñòðóìåíòîâ, ðàáîòàþùèõ ñîâìåñòíî ñ âèëàìè Ýíäðþñà. Êîíåö.
//----------------------------------------------------------------------
// Ôèáîâååðû äîïîëíèòåëüíûå
extern string Var6___________________________ = "Parameters for fibo Fan";
extern color  ExtFiboFanColor = CLR_NONE;
extern int    ExtFiboFanNum = 0;
// Ðàñøèðåíèÿ Ôèáîíà÷÷è
extern string Var7___________________________ = "Parameters for fibo Expansion";
extern int    ExtFiboExpansion = 0;
extern color  ExtFiboExpansionColor = Yellow;
//--------------------------------------
extern string Var8___________________________ = "Parameters for versum Levels";
extern color  ExtVLDinamicColor = CLR_NONE;
extern color  ExtVLStaticColor = CLR_NONE;
extern int    ExtVLStaticNum = 0;
//--------------------------------------
extern string Var9___________________________ = "Parameters for fibo Arc";
extern int ExtArcDinamicNum     = 0;
extern int ExtArcStaticNum      = 0;
extern color ExtArcDinamicColor = Sienna;
extern color ExtArcStaticColor  = Teal;
extern double ExtArcDinamicScale= 0;
extern double ExtArcStaticScale = 0;
//extern int ExtArcStyle          = 0;
//extern int ExtArcWidth          = 1;
extern string Var10__________________________ = "Parameters Exp";
extern bool   chHL = false;
extern bool   PeakDet = false;
// Ïåðåìåííûå äëÿ i-vts
extern bool   chHL_PeakDet_or_vts = true;
extern int    NumberOfBars = 1000;     // Êîëè÷åñòâî áàðîâ îáñ÷¸òà (0-âñå)
extern int    NumberOfVTS  = 13;
extern int    NumberOfVTS1 = 1;
extern string Var11__________________________ = "Common Parameters";
//--------------------------------------
extern bool   ExtFiboType      = true;
extern color  ExtObjectColor   = CLR_NONE;
extern int    ExtObjectStyle   = 1;
extern int    ExtObjectWidth   = 0; 
extern bool   ZigZagHighLow    = true;
// --------------------------------
// Äîïîëíèòåëüíûå ôèíêöèè
extern bool   ExtSendMail = false;
extern bool   ExtAlert = false;
// Âûâîä îáúåêòîâ â âèäå ôîíà
extern bool   ExtBack = true;
// Ñîõðàíåíèå ñòàòè÷åñêèõ âèë Ýíäðþñà, Fibo Time è ò.ä.
extern bool   ExtSave = false;
extern bool   infoTF = false;
extern int    ExtComplekt=0;
//===================================

// Ìàññèâû äëÿ ZigZag 
// Ìàññèâ äëÿ îòðèñîâêè ZigZag
double zz[];
// Ìàññèâ ìèíèìóìîâ ZigZag
double zzL[];
// Ìàññèâ ìàêñèìóìîâ ZigZag
double zzH[];
// Ìàññèâû äëÿ nen-ZigZag
double nen_ZigZag[];
// Ìàññèâ äëÿ îïòèìèçèðîâàííîãî ZigZag
//double TempBuffer[1],ZigZagBuffer[1];
// Ïåðåìåííûå äëÿ îñíàâñòêè
// Ìàññèâ ÷èñåë Ïåñàâåíòî (Ôèáû è ìîäèôèöèðîâàííûå Ôèáû)
//double fi[]={0.146, 0.236, 0.382, 0.447, 0.5, 0.618, 0.707, 0.786, 0.841, 0.886, 1.0, 1.128, 1.272, 1.414, 1.5, 1.618, 1.732, 1.902, 2.0, 2.236, 2.414, 2.618, 3.14, 3.618, 4.0};
//string fitxt[]={"0.146", "0.236", ".382", ".447", ".5", ".618", ".707", ".786", ".841", ".886", "1.0", "1.128", "1.272", "1.414", "1.5", "1.618", "1.732", "1.902", "2.0", "2.236", "2.414", "2.618", "3.14", "3.618", "4.0"};
//double fi1[]={0.146, 0.236, 0.382, 0.5, 0.618, 0.764, 0.854, 1.0, 1.236, 1.618};
//string fitxt1[]={"0.146", "0.236", ".382", ".5", ".618", ".764", ".854", "1.0", "1.236", "1.618"};

color ExtLine_;

int minBarsSave, minBarsX;

double number[64];
string numbertxt[64];
int    numberFibo[64];
int    numberPesavento[64];
int    numberGartley[64];
int    numberMix[64];
int    numberGilmorQuality[64];
int    numberGilmorGeometric[64];
int    numberGilmorHarmonic[64];
int    numberGilmorArithmetic[64];
int    numberGilmorGoldenMean[64];
int    numberSquare[64];
int    numberCube[64];
int    numberRectangle[64];
int    numberExt[64];

string nameObj,nameObjtxt,save;
// 
bool descript_b=false;
// PPWithBars - òåêñò, âûâîäèìûé ó ñîåäèíèòåëüíîé ëèíèè
// descript - îïèñàíèå îáúåêòîâ
string PPWithBars, descript;
// Ìàòðèöà äëÿ ïîèñêà èñ÷åçíóâøèõ áàðîâ afr - ìàññèâ çíà÷åíèé âðåìåíè ïÿòè ïîñëåäíèõ ôðàêòàëîâ è îòðèñîâêè äèíàìè÷åñêèõ è ñòàòè÷åñêèõ ôèá
// afrl - ìèíèìóìû, afrh - ìàêñèìóìû
int afr[]={0,0,0,0,0,0,0,0,0,0};
double afrl[]={0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0}, afrh[]={0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0}, afrx[]={0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0};
// Ïàðàìåòðû òàéìôðéìîâ
double openTF[]={0.0,0.0,0.0,0.0,0.0}, closeTF[]={0.0,0.0,0.0,0.0,0.0}, lowTF[]={0.0,0.0,0.0,0.0,0.0}, highTF[]={0.0,0.0,0.0,0.0,0.0};
double close_TF=0;
string TF[]={"MN","W1","D1","H4","H1","m30","m15","m5","m1"};
string Period_tf;
bool afrm=true;
double ExtHL;
double HL,HLp,kk,kj,Angle;
// LowPrim,HighPrim,LowLast,HighLast - çíà÷åíèÿ ìèíèìóìîâ è ìàêñèìóìîâ áàðîâ
double LowPrim,HighPrim,LowLast,HighLast;
// numLowPrim,numHighPrim,numLowLast,numHighLast -íîìåðà áàðîâ
int numLowPrim,numHighPrim,numLowLast,numHighLast,k,k1,k2,ki,kiPRZ=0,countLow1,countHigh1,shift,shift1;
string txtkk;
// Âðåìÿ ñâå÷è ñ ïåðâûì îò íóëåâîãî áàðà ôðàêòàëîì
int timeFr1new;
// Ñ÷åò÷èê ôðàêòàëîâ
int countFr;
// Áàð, äî êîòîðîãî íàäî ðèñîâàòü ñîåäèíèòåëüíûå ëèíèè îò íóëåâîãî áàðà
int countBarEnd=0,TimeBarEnd;
// Áàð, äî êîòîðîãî íàäî ïåðåñ÷èòûâàòü îò íóëåâîãî áàðà
int numBar=0;
// Íîìåð îáúåêòà
int numOb;
// flagFrNew=true - îáðàçîâàëñÿ íîâûé ôðàêòàë èëè ïåðâûé ôðàêòàë ñìåñòèëñÿ íà äðóãîé áàð. =false - ïî óìîë÷àíèþ.
bool flagFrNew=false;
// flagGartle - ïîÿâëåíèå íîâîãî ïàòòåðíà Gartley èëè èñ÷åçíîâåíèå ïàòòåðíà Gartley
bool flagGartle=false;
// Ïåðèîä òåêóùåãî ãðàôèêà
int perTF;
bool Demo;

double int_to_d=0, int_to_d1=0, int_to_d2=0;

int counted_bars, cbi, iBar;

// ñðåäíèé ðàçìåð áàðà òåêóùåãî òàéìôðåéìà
// The average size of a bar
double ASBar;

// Ïåðåìåííûå äëÿ ZigZag Àëåêñà è èíäèêàòîðà ïîäîáíîãî âñòðîåííîìó â Ensign
double ha[],la[],hi,li,si,sip,di,hm,lm,ham[],lam[],him,lim,lLast=0,hLast=0;
int fs=0,fsp,countBar;
int ai,aip,bi,bip,ai0,aip0,bi0,bip0;
datetime tai,tbi,taip,tbip,ti;
// fcount0 - ïðè îáíóëåíèè ñ÷åò÷èêà ïðîïóùåííûõ áàðîâ íà 0 áàðå fcount0=true.
// Íà ñëåäóþùåì áàðå =false è ìîæíî îïðåäåëÿòü òî÷êó ïåðåëîìà
bool fh=false,fl=false,fcount0;

// Ïåðåìåííûå äëÿ Ñâèíãîâ Ãàííà
double lLast_m=0, hLast_m=0;
int countBarExt; // ñ÷åò÷èê âíåøíèõ áàðîâ
int countBarl,countBarh;

// Ïåðåìåííûå äëÿ nen-ZigZag
bool hi_nen;
bool init_zz=true;

// Ïåðåìåííûå äëÿ ðàñøèðåííîãî ðåæèìà ðàáîòû èíäèêàòîðà
int mFibo[]={0,0}, mPitch[]={0,0,0}, mFan[]={0,0}, mExpansion[]={0,0,0}, mVL[]={0,0,0}, mArcS[]={0,0}, mArcD[]={0,0};
// Ïåðåìåííûå äëÿ ïîñòðîåíèÿ âèë Ýíäðþñà ïî ñâå÷àì
datetime mPitchTime[]={0,0,0};
int mPitchTimeSave;
double mPitchCena[]={0.0,0.0,0.0};

// ïåðåìåííûå äëÿ vts
double ms[2];
// Ïåðåìåííûå äëÿ ïàòòåðíîâ Gartley
string   vBullBear    = ""; // ïåðåìåííàÿ äëÿ îáîçíà÷åíèÿ áû÷èé èëè ìåäâåæèé ïàòòåðí
string   vNamePattern = ""; // ïåðåìåííàÿ äëÿ îáîçíà÷åíèÿ íàèìåíîâàíèÿ ïàòòåðíà
int maxPeak, vPatOnOff, vPatNew=0;
double hBar, lBar;
datetime tiZZ; 
bool     FlagForD  = true;  // Ðàçðåøåíèå íà ïîèñê ìîìåíòà îáðàçîâàíèÿ òî÷êè D ïàòòåðíà (Gartley)
datetime TimeForDmin  = 0;
datetime TimeForDmax  = 0;
double   LevelForDmin = 0;
double   LevelForDmax = 0;
// Ïåðåìåííûå äëÿ çèãçàãà Talex
static int    endbar = 0;
static double endpr  = 0;

//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int init()
  {
   string aa,aa1;
   int aa2, i;

   minBarsSave=minBars;

   IndicatorBuffers(8);

   if (ExtStyleZZ) {SetIndexStyle(0,DRAW_SECTION);}
   else {SetIndexStyle(0,DRAW_ARROW); SetIndexArrow(0,159);}
   SetIndexLabel(0,"ZUP"+ExtComplekt+" (zz"+ExtIndicator+")");
   if (ExtIndicator==6) SetIndexLabel(5,"ZUP"+ExtComplekt+" DT6_"+minBars+"/"+ExtDeviation+"/"+ExtBackstep+"/GP"+GrossPeriod+"");
   else if (ExtIndicator==7) SetIndexLabel(5,"ZUP"+ExtComplekt+" DT7_"+minBars+"/GP"+GrossPeriod+"");
   else if (ExtIndicator==8) SetIndexLabel(5,"ZUP"+ExtComplekt+" DT8_"+minBars+"/"+ExtDeviation+"/GP"+GrossPeriod+"");
   if (chHL_PeakDet_or_vts)
     {
      SetIndexLabel(1,"ZUP"+ExtComplekt+" zz"+ExtIndicator+" H_PeakDet");
      SetIndexLabel(2,"ZUP"+ExtComplekt+" zz"+ExtIndicator+" L_PeakDet");
      SetIndexLabel(3,"ZUP"+ExtComplekt+" zz"+ExtIndicator+" H_chHL");
      SetIndexLabel(4,"ZUP"+ExtComplekt+" zz"+ExtIndicator+" L_chHL");
     }
   else
     {
      SetIndexLabel(1,"ZUP"+ExtComplekt+" zz"+ExtIndicator+" H_vts");
      SetIndexLabel(2,"ZUP"+ExtComplekt+" zz"+ExtIndicator+" L_vts");
      SetIndexLabel(3,"ZUP"+ExtComplekt+" zz"+ExtIndicator+" H_vts1");
      SetIndexLabel(4,"ZUP"+ExtComplekt+" zz"+ExtIndicator+" L_vts1");
     }

   SetIndexBuffer(0,zz);
   SetIndexBuffer(5,nen_ZigZag);
   SetIndexBuffer(6,zzL);
   SetIndexBuffer(7,zzH);

   SetIndexStyle(5,DRAW_ARROW);
   SetIndexArrow(5,159);
// Óðîâíè ïðåäûäóùèõ ïèêîâ
   SetIndexStyle(1,DRAW_LINE,STYLE_DOT);
   SetIndexStyle(2,DRAW_LINE,STYLE_DOT); 
   SetIndexBuffer(1,ham);
   SetIndexBuffer(2,lam);
// Óðîâíè ïîäòâåðæäåíèÿ
   SetIndexStyle(3,DRAW_LINE,STYLE_DOT);
   SetIndexStyle(4,DRAW_LINE,STYLE_DOT);
   SetIndexBuffer(3,ha);
   SetIndexBuffer(4,la);

   SetIndexEmptyValue(0,0.0);
   SetIndexEmptyValue(1,0.0);
   SetIndexEmptyValue(2,0.0);
   SetIndexEmptyValue(3,0.0);
   SetIndexEmptyValue(4,0.0);
   SetIndexEmptyValue(5,0.0);
   SetIndexEmptyValue(6,0.0);
   SetIndexEmptyValue(7,0.0);

   if (ExtIndicator<6 || ExtIndicator>10)
     {
      switch (Period())
        {
         case 1     : {Period_tf=TF[8];break;}
         case 5     : {Period_tf=TF[7];break;}
         case 15    : {Period_tf=TF[6];break;}
         case 30    : {Period_tf=TF[5];break;}
         case 60    : {Period_tf=TF[4];break;}
         case 240   : {Period_tf=TF[3];break;}
         case 1440  : {Period_tf=TF[2];break;}
         case 10080 : {Period_tf=TF[1];break;}
         case 43200 : {Period_tf=TF[0];break;}
        }
     }
   else
      switch (GrossPeriod)
        {
         case 1     : {Period_tf=TF[8];break;}
         case 5     : {Period_tf=TF[7];break;}
         case 15    : {Period_tf=TF[6];break;}
         case 30    : {Period_tf=TF[5];break;}
         case 60    : {Period_tf=TF[4];break;}
         case 240   : {Period_tf=TF[3];break;}
         case 1440  : {Period_tf=TF[2];break;}
         case 10080 : {Period_tf=TF[1];break;}
         case 43200 : {Period_tf=TF[0];break;}
        }

   if (ExtIndicator==1) if (minSize!=0) di=minSize*Point/2;
   if (ExtIndicator==2) {di=minSize*Point; countBar=minBars;}
   if (ExtIndicator==3) {countBar=minBars;}

   if (ExtIndicator>5 && ExtIndicator<11 && GrossPeriod>Period())
     {
      if (GrossPeriod==43200 && Period()==10080) maxBarToD=maxBarToD*5; else maxBarToD=maxBarToD*GrossPeriod/Period();
     }
   
   if (ExtIndicator<6 ||ExtIndicator>10) GrossPeriod=Period();

// Ïðîâåðêà ïðàâèëüíîñòè ââåäåííûõ âíåøíèõ ïåðåìåííûõ
   if (ExtDelta<=0) ExtDelta=0.001;
   if (ExtDelta>1) ExtDelta=0.999;

   if (ExtHidden<0) ExtHidden=0;
   if (ExtHidden>5) ExtHidden=5;
 
   if (ExtDeltaType<0) ExtDeltaType=0;
   if (ExtDeltaType>3) ExtDeltaType=3;

   if (ExtFiboChoice<0) ExtFiboChoice=0;
   if (ExtFiboChoice>11) ExtFiboChoice=11;

   if (ExtFractalEnd>0)
     {
      if (ExtFractalEnd<1) ExtFractalEnd=1;
     }

   if (ExtCM_Fibo<0) ExtCM_Fibo=0;
   if (ExtCM_Fibo>1) ExtCM_Fibo=1;

   if (ExtPitchforkStatic>4) ExtPitchforkStatic=4;
   if (ExtPitchforkDinamic>4) ExtPitchforkDinamic=4;

   if (ExtCM_0_1A_2B<0) ExtCM_0_1A_2B=0;
   if (ExtCM_0_1A_2B>4) ExtCM_0_1A_2B=4;
   if (ExtCM_Fibo<0) ExtCM_Fibo=0;
   if (ExtCM_Fibo>1) ExtCM_Fibo=1;

//--------------------------------------------
   if (ExtPitchforkStaticNum<3) ExtPitchforkStaticNum=3;
   
   if (ExtFiboStaticNum<2) ExtFiboStaticNum=2;

   if (ExtFiboStaticNum>9)
     {
      aa=DoubleToStr(ExtFiboStaticNum,0);
      aa1=StringSubstr(aa,0,1);
      mFibo[0]=StrToInteger(aa1);
      aa1=StringSubstr(aa,1,1);
      mFibo[1]=StrToInteger(aa1);
     }
   else
     {
      mFibo[0]=ExtFiboStaticNum;
      mFibo[1]=ExtFiboStaticNum-1;
     }

   if (ExtFiboFanNum<1) ExtFiboFanNum=1;

   if (ExtFiboFanNum>9)
     {
      aa=DoubleToStr(ExtFiboFanNum,0);
      aa1=StringSubstr(aa,0,1);
      mFan[0]=StrToInteger(aa1);
      aa1=StringSubstr(aa,1,1);
      mFan[1]=StrToInteger(aa1);
     }
   else
     {
      mFan[0]=ExtFiboFanNum;
      mFan[1]=ExtFiboFanNum-1;
     }

   if (ExtPitchforkStaticNum>99)
     {
      aa=DoubleToStr(ExtPitchforkStaticNum,0);
      aa1=StringSubstr(aa,0,1);
      mPitch[0]=StrToInteger(aa1);
      aa1=StringSubstr(aa,1,1);
      mPitch[1]=StrToInteger(aa1);
      aa1=StringSubstr(aa,2,1);
      mPitch[2]=StrToInteger(aa1);
     }
   else
     {
      mPitch[0]=ExtPitchforkStaticNum;
      mPitch[1]=ExtPitchforkStaticNum-1;
      mPitch[2]=ExtPitchforkStaticNum-2;
     }

   if (ExtFiboExpansion<2) ExtFiboExpansion=0;
   
   if (ExtFiboExpansion>0)
     {
      if (ExtFiboExpansion>99)
        {
         aa=DoubleToStr(ExtFiboExpansion,0);
         aa1=StringSubstr(aa,0,1);
         mExpansion[0]=StrToInteger(aa1);
         aa1=StringSubstr(aa,1,1);
         mExpansion[1]=StrToInteger(aa1);
         aa1=StringSubstr(aa,2,1);
         mExpansion[2]=StrToInteger(aa1);
        }
      else
        {
         mExpansion[0]=ExtFiboExpansion;
         mExpansion[1]=ExtFiboExpansion-1;
         mExpansion[2]=ExtFiboExpansion-2;
        }
     }
   
   if (ExtPitchforkCandle)
     {
      mPitchTime[0]=ExtDateTimePitchfork_1;
      mPitchTime[1]=ExtDateTimePitchfork_2;
      mPitchTime[2]=ExtDateTimePitchfork_3;

      if (ExtPitchfork_1_HighLow)
        {
         mPitchCena[0]=High[iBarShift(Symbol(),Period(),ExtDateTimePitchfork_1,true)];
         mPitchCena[1]=Low[iBarShift(Symbol(),Period(),ExtDateTimePitchfork_2,true)];
         mPitchCena[2]=High[iBarShift(Symbol(),Period(),ExtDateTimePitchfork_3,true)];
        }
      else
        {
         mPitchCena[0]=Low[iBarShift(Symbol(),Period(),ExtDateTimePitchfork_1,true)];
         mPitchCena[1]=High[iBarShift(Symbol(),Period(),ExtDateTimePitchfork_2,true)];
         mPitchCena[2]=Low[iBarShift(Symbol(),Period(),ExtDateTimePitchfork_3,true)];
        }

      if (mPitchCena[0]<=0 || mPitchCena[1]<=0 || mPitchCena[2]<=0) {ExtPitchforkCandle=false;ExtPitchforkStatic=0;}
     }

   if (ExtVLStaticNum>0)
     {
      if (ExtVLStaticNum<2) ExtVLStaticNum=2;

      if (ExtVLStaticNum>99)
        {
         aa=DoubleToStr(ExtVLStaticNum,0);
         aa1=StringSubstr(aa,0,1);
         mVL[0]=StrToInteger(aa1);
         aa1=StringSubstr(aa,1,1);
         mVL[1]=StrToInteger(aa1);
         aa1=StringSubstr(aa,2,1);
         mVL[2]=StrToInteger(aa1);
        }
      else
        {
         mVL[0]=ExtVLStaticNum;
         mVL[1]=ExtVLStaticNum-1;
         mVL[2]=ExtVLStaticNum-2;
        }
     }

   if (ExtArcStaticNum>0)
     {
      if (ExtArcStaticNum<2) ExtArcStaticNum=2;
      if (ExtArcStaticNum<12 && ExtArcStaticNum>9) ExtArcStaticNum=9;

      if (ExtArcStaticNum>=12)
        {
         aa=DoubleToStr(ExtArcStaticNum,0);
         aa1=StringSubstr(aa,1,1);
         mArcS[0]=StrToInteger(aa1);
         aa1=StringSubstr(aa,0,1);
         mArcS[1]=StrToInteger(aa1);
         if (mArcS[0]==0) {ExtArcStaticNum=0; mArcS[1]=0;}
        }
      else
        {
         mArcS[1]=ExtArcStaticNum;
         mArcS[0]=ExtArcStaticNum-1;
        }
     }

   if (ExtArcDinamicNum>0)
     {
      if (ExtArcDinamicNum>90) ExtArcStaticNum=90;

      if (ExtArcDinamicNum>9)
        {
         aa=DoubleToStr(ExtArcDinamicNum,0);
         aa1=StringSubstr(aa,1,1);
         mArcD[0]=StrToInteger(aa1);
         aa1=StringSubstr(aa,0,1);
         mArcD[1]=StrToInteger(aa1);
         if (mArcD[0]>0) mArcD[0]=0;
        }
      else
        {
         mArcD[1]=0;
         mArcD[0]=ExtArcDinamicNum;
        }
     }

   if (ExtSave)
     {
      MathSrand(LocalTime());
      save=MathRand();
     }

   if (ExtCM_0_1A_2B==4)
     {
      for (i=Bars-1; i>-1; i--)
        {
         ASBar=ASBar + iHigh(NULL,GrossPeriod,0) - iLow(NULL,GrossPeriod,0) + Point;
        }
      ASBar=ASBar/Bars;
     }
   
//   Comment("");
   array_();
   perTF=Period();
   Demo=IsDemo();
   delete_objects1();
   return(0);
  }
//+------------------------------------------------------------------+
//| Äåèíèöèàëèçàöèÿ. Óäàëåíèå âñåõ òðåíäîâûõ ëèíèé è òåêñòîâûõ îáúåêòîâ
//+------------------------------------------------------------------+
int deinit()
  {
   int i;
   delete_objects_dinamic();
   delete_objects3();

   ObjectDelete("fiboS" + ExtComplekt+"_");
   ObjectDelete("fiboFanS" + ExtComplekt+"_");
   ObjectDelete("RLineS" + ExtComplekt+"_");
   ObjectDelete("pitchforkS" + ExtComplekt+"_");
   ObjectDelete("pmedianaS" + ExtComplekt+"_");
   ObjectDelete("1-2pmedianaS" + ExtComplekt+"_");
   ObjectDelete("fiboTime1" + ExtComplekt+"_");ObjectDelete("fiboTime2" + ExtComplekt+"_");
   ObjectDelete("UTL" + ExtComplekt+"_");ObjectDelete("LTL" + ExtComplekt+"_");
   ObjectDelete("UWL" + ExtComplekt+"_");ObjectDelete("LWL" + ExtComplekt+"_");
   ObjectDelete("ISL_S" + ExtComplekt+"_");
   ObjectDelete("CL" + ExtComplekt+"_");
   ObjectDelete("PivotZoneS" + ExtComplekt+"_");
   ObjectDelete("FanMedianaStatic" + ExtComplekt+"_");
   ObjectDelete("FiboFan" + ExtComplekt+"_");
   ObjectDelete("FiboArcS" + ExtComplekt+"_");
//   ObjectDelete("_"+ExtComplekt+"PointD");
   Comment("");
 
   for (i=0; i<7; i++)
     {
      nameObj="VLS"+i+" " + ExtComplekt+"_";
      ObjectDelete(nameObj);
     }
   return(0);
  }
//********************************************************

// ÍÀ×ÀËÎ
int start()
  {
   if ((ExtIndicator==6 || ExtIndicator==7 || ExtIndicator==8 || ExtIndicator==10) && Period()>GrossPeriod) 
     {
      for (iBar=Bars-1; iBar>0; iBar--) {zzL[iBar]=0.0; zzH[iBar]=0.0; zz[iBar]=0.0; nen_ZigZag[iBar]=0.0;}
      init_zz=true;
      return;
     }

   counted_bars=IndicatorCounted();
  
   if (perTF!=Period())
     {
      delete_objects1();  
      perTF=Period();
     }

   if (Demo!=IsDemo())
     {
      delete_objects1();  
      Demo=IsDemo();
      counted_bars=0;
     }

//-----------------------------------------
//
//     1.
//
// Áëîê çàïîëíåíèÿ áóôåðîâ. Íà÷àëî. 
//-----------------------------------------   
// zz[] - áóôåð, äàííûå èç êîòîðîãî áåðóòñÿ äëÿ îòðèñîâêè ñàìîãî ZigZag-a
// zzL[] - ìàññèâ ìèíèìóìîâ ÷åðíîâîé
// zzH[] - ìàññèâ ìàêñèìóìîâ ÷åðíîâîé
//
//-----------------------------------------   

if (Bars-IndicatorCounted()>2)
  {
   cbi=Bars-1; tiZZ=0;
   for (iBar=cbi; iBar>0; iBar--) {zzL[iBar]=0.0; zzH[iBar]=0.0; zz[iBar]=0.0; nen_ZigZag[iBar]=0.0;}
   init_zz=true; afrm=true; delete_objects_dinamic(); delete_objects3();
  }
else cbi=Bars-IndicatorCounted()+1;

if (lBar<=iLow(NULL,GrossPeriod,0) && hBar>=iHigh(NULL,GrossPeriod,0) && tiZZ==iTime(NULL,GrossPeriod,0)) return(0);
else
  {
   lBar=iLow(NULL,GrossPeriod,0); hBar=iHigh(NULL,GrossPeriod,0); tiZZ=iTime(NULL,GrossPeriod,0);

   switch (ExtIndicator)
     {
      case 0     : {ZigZag_();      break;}
      case 1     : {ang_AZZ_();     break;}
      case 2     : {Ensign_ZZ();    break;}
      case 3     : {Ensign_ZZ();    break;}
      case 4     : {ZigZag_tauber();break;}
      case 5     : {GannSwing();    break;}
      case 6     : {nenZigZag();    break;} // DT-ZigZag - ñ èñïðàâëåííûì, îïòèìèçèðîâàííûì çèãçàãîì ZigZag_new_nen3.mq4
      case 7     : {nenZigZag();    break;} // DT-ZigZag - âàðèàíò çèãçàãà, êîòîðûé ëþáåçíî ïðåäîñòàâèë klot - DT_ZZ.mq4
      case 8     : {nenZigZag();    break;} // DT-ZigZag - âàðèàíò çèãçàãà, êîòîðûé ëþáåçíî ïðåäîñòàâèë Candid - CZigZag.mq4
      case 10    : {nenZigZag();    break;} // DT-ZigZag - âàðèàíò çèãçàãà ExtIndicator=5 â ðåæèìå DT - âíåøíèé çèãçàã Swing_zz.mq4
// Ïîèñê ïàòòåðíîâ
      case 11    : 
       {
        ZigZag_();

        if (vPatOnOff==1 && vPatNew==0)
          {
           afrm=true; delete_objects_dinamic(); vPatNew=1; flagGartle=true; counted_bars=0; minBarsSave=minBarsX;
           if (ExtSendMail) _SendMail("There was a pattern","on  " + Symbol() + " " + Period() + " pattern " + vBullBear + " " + vNamePattern);
          }
        else if (vPatOnOff==0 && vPatNew==1)
          {
           afrm=true; delete_objects_dinamic(); vPatNew=0; flagGartle=true; counted_bars=0; FlagForD=true; minBarsSave=minBarsX;
          }
        else if (minBarsSave!=minBarsX)
          {
           afrm=true; delete_objects_dinamic(); vPatNew=1; flagGartle=true; counted_bars=0; minBarsSave=minBarsX;
          }
        break;
       } 

      case 12    : {ZZTalex(minBars);break;}
     }
  }

if (ExtHidden<5) // Ðàçðåøåíèå íà âûâîä îñíàñòêè. Íà÷àëî.
  {
   if(!chHL_PeakDet_or_vts) {i_vts(); i_vts1();}
   // Èíèöèàëèçàöèÿ ìàòðèöû
   matriza();
   if (infoTF) if (close_TF!=Close[0]) info_TF();
  }


//-----------------------------------------
// Áëîê çàïîëíåíèÿ áóôåðîâ. Êîíåö.
//-----------------------------------------   

if (ExtHidden>0 && ExtHidden<5) // Ðàçðåøåíèå íà âûâîä îñíàñòêè. Íà÷àëî.
  {
//======================
//======================
//======================

//-----------------------------------------
//
//     2.
//
// Áëîê ïîäãîòîâêè äàííûõ. Íà÷àëî.
//-----------------------------------------   

   if (Bars - counted_bars>2 || flagFrNew)
     {

      // Ïîèñê âðåìåíè è íîìåðà áàðà, äî êîòîðîãî áóäóò ðèñîâàòüñÿ ñîåäèíèòåëüíûå ëèíèè 
      if (countBarEnd==0)
        {
         if (ExtFractalEnd>0)
           {
            k=ExtFractalEnd;
            for (shift=0; shift<Bars && k>0; shift++) 
              { 
               if (zz[shift]>0 && zzH[shift]>0) {countBarEnd=shift; TimeBarEnd=Time[shift]; k--;}
              }
           }
         else 
           {
            countBarEnd=Bars-3;
            TimeBarEnd=Time[Bars-3];
           }
        }
      else
        {
         countBarEnd=iBarShift(Symbol(),Period(),TimeBarEnd); 
        }

     }
//-----------------------------------------
// Áëîê ïîäãîòîâêè äàííûõ. Êîíåö.
//-----------------------------------------   


//-----------------------------------------
//
//     3.
//
// Áëîê ïðîâåðîê è óäàëåíèÿ ëèíèé, 
// ïîòåðÿâøèõ àêòóàëüíîñòü. Íà÷àëî.
//-----------------------------------------   
// Êîððåêöèÿ ñîåäèíÿþùèõ ëèíèé è ÷èñåë. Íà÷àëî.

if (Bars - counted_bars<3)
  {
   // Ïîèñê âðåìåíè áàðà ïåðâîãî ýêñòðåìóìà, ñ÷èòàÿ îò íóëåâîãî áàðà
   for (shift1=0; shift1<Bars; shift1++) 
     {
      if (zz[shift1]>0.0 && (zzH[shift1]==zz[shift1] || zzL[shift1]==zz[shift1])) 
       {
        timeFr1new=Time[shift1];
        break;
       }
     }
   // Ïîèñê áàðà, íà êîòîðîì ïåðâûé ýêñòðåìóì áûë ðàíåå.
   shift=iBarShift(Symbol(),Period(),afr[0]); 


   // Ïîÿâèëñÿ íîâûé ëó÷ ZigZag
   if ((zzH[shift1]>0 && afrl[0]>0) || (zzL[shift1]>0 && afrh[0]>0))
     {
      ExtFiboStatic=false;
      ExtPitchforkStatic=0;
      ExtFiboExpansion=0;
      ExtFiboFanNum=0;
      
      if (ExtAlert)
       {
        Alert (Symbol(),"  ",Period(),"  ïîÿâèëñÿ íîâûé ëó÷ ZigZag");
        PlaySound("alert.wav");
       }
     }

   // Ñðàâíåíèå òåêóùåãî çíà÷åíèÿ ýêñòðåìóìà ñ òåì, êîòîðûé áûë ðàíåå

   // Îáðàçîâàëñÿ íîâûé ýêñòðåìóì
   if (timeFr1new!=afr[0])
     {
      flagFrNew=true;
      if (shift>=shift1) numBar=shift; else  numBar=shift1;
      afrm=true;
     }

   // Ýêñòðåìóì íà ìàêñèìóìå ñäâèíóëñÿ íà äðóãîé áàð
   if (afrh[0]>0 && zz[shift]==0.0)
     {
      flagFrNew=true;
      if (numBar<shift) numBar=shift;
      afrm=true;
     }
   // Ýêñòðåìóì íà ìèíèìóìå ñäâèíóëñÿ íà äðóãîé áàð
   if (afrl[0]>0 && zz[shift]==0.0)
     {
      flagFrNew=true;
      if (numBar<shift) numBar=shift;
      afrm=true;
     }


//-----------3 Ñìåñòèëñÿ ìàêñèìóì èëè ìèíèìóì, íî îñòàëñÿ íà òîì æå áàðå. Íà÷àëî.

//============= 1 ñìåñòèëñÿ ìàêñèìóì. Íà÷àëî.
if (afrh[0]-High[shift]!=0 && afrh[0]>0)
  {
   flagFrNew=true;
   numBar=0;
   delete_objects2(afr[0]);
   afrh[0]=High[shift];
   if (ExtFiboFanDinamic) screenFiboFanD();
   if (mFibo[1]==0 && ExtFiboStatic) screenFiboS();
   if (ExtFiboDinamic) screenFiboD();
   if (ExtPitchforkDinamic>0) screenPitchforkD();
   if (ExtVLDinamicColor>0) VLD();
   if (mVL[2]==0 && ExtVLStaticNum>0) VLS();
   if (ExtPitchforkStatic>0)
     {
      if (ExtPitchforkCandle)
        {
         if (iBarShift(Symbol(),Period(),ExtDateTimePitchfork_3)==0) screenPitchforkS();
        }
      else
        {
         if (mPitch[2]==0) screenPitchforkS();
        }
     }
   if (mExpansion[2]==0 && ExtFiboExpansion>0) FiboExpansion();
   if (mFan[1]==0 && ExtFiboFanNum>0 && ExtFiboFanColor>0) screenFiboFan();
   if (ExtArcDinamicNum>0) screenFiboArcD();
   if (ExtArcStaticNum>0) screenFiboArcS();
  }
//============= 1 ñìåñòèëñÿ ìàêñèìóì. Êîíåö.
//
//============= 1 ñìåñòèëñÿ ìèíèìóì. Íà÷àëî.
if (afrl[0]-Low[shift]!=0 && afrl[0]>0)
  {
   flagFrNew=true;
   numBar=0;
   delete_objects2(afr[0]);
   afrl[0]=Low[shift];
   if (mFibo[1]==0 && ExtFiboStatic) screenFiboS();
   if (ExtFiboDinamic) screenFiboD();
   if (ExtFiboFanDinamic) screenFiboFanD();
   if (ExtVLDinamicColor>0) VLD();
   if (mVL[2]==0 && ExtVLStaticNum>0) VLS();
   if (ExtPitchforkStatic>0)
     {
      if (ExtPitchforkCandle)
        {
         if (iBarShift(Symbol(),Period(),ExtDateTimePitchfork_3)==0) screenPitchforkS();
        }
      else
        {
         if (mPitch[2]==0) screenPitchforkS();
        }
     }
   if (mExpansion[2]==0 && ExtFiboExpansion>0) FiboExpansion();
   if (mFan[1]==0 && ExtFiboFanNum>0 && ExtFiboFanColor>0) screenFiboFan();
   if (ExtArcDinamicNum>0) screenFiboArcD();
   if (ExtArcStaticNum>0) screenFiboArcS();
  }
//============= 1 ñìåñòèëñÿ ìèíèìóì. Êîíåö.
//-----------3 Ñìåñòèëñÿ ìàêñèìóì èëè ìèíèìóì, íî îñòàëñÿ íà òîì æå áàðå. Êîíåö.


   // Ïîèñê èñ÷åçíóâøèõ ôðàêòàëîâ è óäàëåíèå ëèíèé, èñõîäÿùèõ îò ýòèõ ôðàêòàëîâ. Íà÷àëî.
   countBarEnd=iBarShift(Symbol(),Period(),TimeBarEnd); 
   for (k=0; k<5; k++)
     {

      // Ïðîâåðêà ìàêñèìóìîâ.
      if (afrh[k]>0)
        {
         // Ïîèñê áàðà, íà êîòîðîì áûë ýòîò ôðàêòàë
         shift=iBarShift(Symbol(),Period(),afr[k]); 
         if (zz[shift]==0)
           {
            flagFrNew=true;
            if (shift>numBar) numBar=shift;
            afrm=true;
            numHighPrim=shift; numHighLast=0;HighLast=0.0;
            for (k1=shift+1; k1<=countBarEnd; k1++)
              {
               if (zzH[k1]>0) 
                 {
                  if (ZigZagHighLow) HighLast=High[k1]; else HighLast=zzH[k1];
                  numHighLast=k1;

                  nameObj="_" + ExtComplekt + "ph" + Time[numHighPrim] + "_" + Time[numHighLast];

                  numOb=ObjectFind(nameObj);
                  if (numOb>-1)
                    {
                     ObjectDelete(nameObj); 

                     nameObjtxt="_" + ExtComplekt + "phtxt" + Time[numHighPrim] + "_" + Time[numHighLast];

                     ObjectDelete(nameObjtxt);
                    }
                 }
              }
           }
        }
      
      // Ïðîâåðêà ìèíèìóìîâ.
      if (afrl[k]>0)
        {
         // Ïîèñê áàðà, íà êîòîðîì áûë ýòîò ôðàêòàë
         shift=iBarShift(Symbol(),Period(),afr[k]); 
         if (zz[shift]==0)
           {
            flagFrNew=true;
            if (shift>numBar) numBar=shift;

            afrm=true;
            numLowPrim=shift; numLowLast=0;LowLast=10000000;
            for (k1=shift+1; k1<=countBarEnd; k1++)
              {
               if (zzL[k1]>0) 
                 {
                  if (ZigZagHighLow) LowLast=Low[k1]; else LowLast=zzL[k1];
                  numLowLast=k1;

                  nameObj="_" + ExtComplekt + "pl" + Time[numLowPrim] + "_" + Time[numLowLast];

                  numOb=ObjectFind(nameObj);
                  if (numOb>-1)
                    {
                     ObjectDelete(nameObj); 

                     nameObjtxt="_" + ExtComplekt + "pltxt" + Time[numLowPrim] + "_" + Time[numLowLast];

                     ObjectDelete(nameObjtxt);
                    }
                 }
              }
           }
        }
     }
   // Ïîèñê èñ÷åçíóâøèõ ôðàêòàëîâ è óäàëåíèå ëèíèé, èñõîäÿùèõ îò ýòèõ ôðàêòàëîâ. Êîíåö.

   // Ïåðåçàïèñü ìàòðèöû. Íà÷àëî.
   matriza ();
   // Ïåðåçàïèñü ìàòðèöû. Êîíåö.

  }
// Êîððåêöèÿ ñîåäèíÿþùèõ ëèíèé è ÷èñåë. Êîíåö.
//-----------------------------------------
// Áëîê ïðîâåðîê è óäàëåíèÿ ëèíèé, 
// ïîòåðÿâøèõ àêòóàëüíîñòü. Êîíåö.
//-----------------------------------------   


  // Ïîäñ÷åò êîëè÷åñòâà ôðàêòàëîâ. Íà÷àëî.
  countFractal();
  // Ïîäñ÷åò êîëè÷åñòâà ôðàêòàëîâ. Êîíåö.

//-----------------------------------------
//
//     4.
//
// Áëîê âûâîäà ñîåäèíèòåëüíûõ ëèíèé. Íà÷àëî.
//-----------------------------------------   
if (Bars - counted_bars>2)
  {
//-----------1 Îòðèñîâêà ìàêñèìóìîâ. Íà÷àëî.
//+--------------------------------------------------------------------------+
//| Âûâîä ñîåäèíÿþùèõ ëèíèé è ÷èñåë Ïåñàâåíòî è 0.886 äëÿ ìàêñèìóìîâ ZigZag-a
//| Îòðèñîâêà íà÷èíàåòñÿ îò íóëåâîãî áàðà
//+--------------------------------------------------------------------------+

   numLowPrim=0; numLowLast=0;
   numHighPrim=0; numHighLast=0;

   LowPrim=0.0; LowLast=0.0;
   HighPrim=0.0; HighLast=0.0;

   Angle=-100;
   
   if (flagFrNew && !flagGartle) countFr=1;
   else countFr=ExtFractal;

   for (k=0; (k<Bars-1 && countHigh1>0 && countFr>0); k++)
     {
      if (zzL[k]>0.0 && (zzL[k]<LowPrim || LowPrim==0.0) && HighPrim>0 && zzL[k]==zz[k])
        {
         if (ZigZagHighLow) LowPrim=Low[k]; else LowPrim=zzL[k]; 
         numLowPrim=k;
        }
      if (zzH[k]>0.0 && zzH[k]==zz[k])
        {
         if (HighPrim>0) 
           {

            if (ZigZagHighLow) HighLast=High[k]; else HighLast=zzH[k];
            numHighLast=k;

            HL=HighLast-LowPrim;
            kj=(HighPrim-HighLast)*1000/(numHighLast-numHighPrim);
            if (HL>0 && (Angle>=kj || Angle==-100))  // Ïðîâåðêà óãëà íàêëîíà ëèíèè
              {
               Angle=kj;
               // Ñîçäàíèå ëèíèè è òåêñòîâîãî îáúåêòà
               HLp=HighPrim-LowPrim;
               k1=MathCeil((numHighPrim+numHighLast)/2);
               kj=HLp/HL;

               
               if (ExtPPWithBars==0) PPWithBars="";
               else if (ExtPPWithBars==1) PPWithBars=" ("+(numHighLast-numHighPrim)+")";
               else if (ExtPPWithBars==2) PPWithBars=" ("+(numHighLast-numLowPrim)+"-"+(numLowPrim-numHighPrim)+")";
               else if (ExtPPWithBars==3)
                 {
                  int_to_d1=(numLowPrim-numHighPrim);
                  int_to_d2=(numHighLast-numLowPrim);
                  int_to_d=int_to_d1/int_to_d2;
                  PPWithBars=" ("+DoubleToStr(int_to_d,2)+")";
                 }
               else if (ExtPPWithBars==4)
                 {
                  int_to_d1=(Time[numLowPrim]-Time[numHighPrim]);
                  int_to_d2=(Time[numHighLast]-Time[numLowPrim]);
                  int_to_d=int_to_d1/int_to_d2;
                  PPWithBars=" ("+DoubleToStr(int_to_d,2)+")";
                 }
               else if (ExtPPWithBars==5)
                 {
                  int_to_d1=(numLowPrim-numHighPrim)*(High[numHighPrim]-Low[numLowPrim]);
                  int_to_d2=(numHighLast-numLowPrim)*(High[numHighLast]-Low[numLowPrim]);
                  int_to_d=int_to_d1/int_to_d2;
                  PPWithBars=" ("+DoubleToStr(int_to_d,2)+")";
                 }
               else if (ExtPPWithBars==7)
                 {
                  int_to_d1=((High[numHighLast]-Low[numLowPrim])/Point)/(numHighLast-numLowPrim);
                  int_to_d2=((High[numHighPrim]-Low[numLowPrim])/Point)/(numLowPrim-numHighPrim);
                  PPWithBars=" ("+DoubleToStr(int_to_d1,3)+"/"+DoubleToStr(int_to_d2,3)+")";
                 }
// ExtPPWithBars=6 Âû÷èñëÿåòñÿ êîëè÷ñòâî ïóíêòîâ è ïðîöåíò îòêëîíåíèÿ îò ðåòðåñìåíòà "Ïåñàâåíòî"

               ExtLine_=ExtLine;
               if (kj>0.1 && kj<9.36)
                 {
                  // Ñîçäàíèå òåêñòîâîãî îáúåêòà (÷èñëà Ïåñàâåíòî). % âîññòàíîâëåíèÿ ìåæäó ìàêñèìóìàìè
                  kk=kj;
                  k2=1;
                  Pesavento_patterns();
                  if (k2<0)
                    // ïðîöåíò âîññòàíîâëåíèÿ ÷èñëà Ïåñàâåíòî è 0.886
                    {
                    ExtLine_=ExtLine886;
                    if (ExtHidden!=4)
                      {
                       nameObj="_" + ExtComplekt + "phtxt" + Time[numHighPrim] + "_" + Time[numHighLast];
                       ObjectCreate(nameObj,OBJ_TEXT,0,Time[k1],(HighPrim+HighLast)/2);

                       if (ExtPPWithBars==6)
                         {
                          int_to_d=MathAbs((kk-kj)/kk)*100;
                          PPWithBars=" ("+DoubleToStr((LowPrim+(HighLast-LowPrim)*kk-HighPrim)/Point,0)+"/"+DoubleToStr(int_to_d,2)+"%)";
                         }
                       descript=txtkk;
                       ObjectSetText(nameObj,txtkk+PPWithBars,ExtSizeTxt,"Arial", colorPPattern);
                       if (ExtPPWithBars==6) PPWithBars="";
                      }
                     }
                  else
                    // ïðîöåíò âîññòàíîâëåíèÿ (íå Ïåñàâåíòî è 0.886)
                    {
                     if (ExtHidden==1 || ExtHidden==4)
                       {
                        nameObj="_" + ExtComplekt + "phtxt" + Time[numHighPrim] + "_" + Time[numHighLast];

                        ObjectCreate(nameObj,OBJ_TEXT,0,Time[k1],(HighPrim+HighLast)/2);

                        descript=DoubleToStr(kk,3);
                        if (ExtDeltaType==3)
                          {
                           ObjectSetText(nameObj,""+DoubleToStr(kk,3)+PPWithBars,ExtSizeTxt,"Arial",colorPPattern);
                          }
                        else
                          {
                           ObjectSetText(nameObj,""+DoubleToStr(kk,2)+PPWithBars,ExtSizeTxt,"Arial",colorPPattern);
                          }
                       }
                    }

                  if ((ExtHidden==2 && k2<0) || ExtHidden!=2)
                    {
                     nameObj="_" + ExtComplekt + "ph" + Time[numHighPrim] + "_" + Time[numHighLast];
                     ObjectCreate(nameObj,OBJ_TREND,0,Time[numHighLast],HighLast,Time[numHighPrim],HighPrim);

                     if (descript_b) ObjectSetText(nameObj,"ZUP"+ExtComplekt+" zz"+ExtIndicator+" PPesavento "+"Line High "+descript);
                     ObjectSet(nameObj,OBJPROP_RAY,false);
                     ObjectSet(nameObj,OBJPROP_STYLE,STYLE_DOT);
                     ObjectSet(nameObj,OBJPROP_COLOR,ExtLine_);
                     ObjectSet(nameObj,OBJPROP_BACK,ExtBack);
                    }
                  if (ExtFiboZigZag) k=countBarEnd;
                 }
              }
           }
         else 
           {
            if (ZigZagHighLow) HighPrim=High[k]; else HighPrim=zzH[k];
            numHighPrim=k;
           }
        }
       // Ïåðåõîä íà ñëåäóþùèé ýêñòðåìóì
       if (k>countBarEnd) 
         {
          k=numHighPrim+1; countHigh1--; countFr--;

          numLowPrim=0; numLowLast=0;
          numHighPrim=0; numHighLast=0;

          LowPrim=0.0; LowLast=0.0;
          HighPrim=0.0; HighLast=0.0;
   
          Angle=-100;
         }
     }
//-----------1 Îòðèñîâêà ìàêñèìóìîâ. Êîíåö.

//-----------2 Îòðèñîâêà ìèíèìóìîâ. Íà÷àëî.
//+-------------------------------------------------------------------------+
//| Âûâîä ñîåäèíÿþùèõ ëèíèé è ÷èñåë Ïåñàâåíòî è 0.886 äëÿ ìèíèìóìîâ ZigZag-a
//| Îòðèñîâêà èäåò îò íóëåâîãî áàðà
//+-------------------------------------------------------------------------+

   numLowPrim=0; numLowLast=0;
   numHighPrim=0; numHighLast=0;

   LowPrim=0.0; LowLast=0.0;
   HighPrim=0.0; HighLast=0.0;
   
   Angle=-100;

   if (flagFrNew && !flagGartle) countFr=1;
   else countFr=ExtFractal;
   flagFrNew=false;
   flagGartle=false;

   for (k=0; (k<Bars-1 && countLow1>0 && countFr>0); k++)
     {
      if (zzH[k]>HighPrim && LowPrim>0)
        {
         if (ZigZagHighLow) HighPrim=High[k]; else HighPrim=zzH[k];
         numHighPrim=k;
        }

      if (zzL[k]>0.0 && zzL[k]==zz[k]) 
        {
         if (LowPrim>0) 
           {

            if (ZigZagHighLow) LowLast=Low[k]; else LowLast=zzL[k];
            numLowLast=k;

            // âûâîä ñîåäèíÿþùèõ ëèíèé è ïðîöåíòîâ âîññòàíîâëåíèÿ(÷èñåë Ïåñàâåíòî)
            HL=HighPrim-LowLast;
            kj=(LowPrim-LowLast)*1000/(numLowLast-numLowPrim);
            if (HL>0 && (Angle<=kj || Angle==-100))  // Ïðîâåðêà óãëà íàêëîíà ëèíèè
              {
               Angle=kj;

               HLp=HighPrim-LowPrim;
               k1=MathCeil((numLowPrim+numLowLast)/2);
               kj=HLp/HL;

               if (ExtPPWithBars==0) PPWithBars="";
               else if (ExtPPWithBars==1) PPWithBars=" ("+(numLowLast-numLowPrim)+")";
               else if (ExtPPWithBars==2) PPWithBars=" ("+(numLowLast-numHighPrim)+"-"+(numHighPrim-numLowPrim)+")";
               else if (ExtPPWithBars==3)
                 {
                  int_to_d1=(numHighPrim-numLowPrim);
                  int_to_d2=(numLowLast-numHighPrim);
                  int_to_d=int_to_d1/int_to_d2;
                  PPWithBars=" ("+DoubleToStr(int_to_d,2)+")";
                 }
               else if (ExtPPWithBars==4)
                 {
                  int_to_d1=(Time[numHighPrim]-Time[numLowPrim]);
                  int_to_d2=(Time[numLowLast]-Time[numHighPrim]);
                  int_to_d=int_to_d1/int_to_d2;
                  PPWithBars=" ("+DoubleToStr(int_to_d,2)+")";
                 }
               else if (ExtPPWithBars==5)
                 {
                  int_to_d1=(numHighPrim-numLowPrim)*(High[numHighPrim]-Low[numLowPrim]);
                  int_to_d2=(numLowLast-numHighPrim)*(High[numHighPrim]-Low[numLowLast]);
                  int_to_d=int_to_d1/int_to_d2;
                  PPWithBars=" ("+DoubleToStr(int_to_d,2)+")";
                 }
               else if (ExtPPWithBars==7)
                 {
                  int_to_d1=((High[numHighPrim]-Low[numLowLast])/Point)/(numLowLast-numHighPrim);
                  int_to_d2=((High[numHighPrim]-Low[numLowPrim])/Point)/(numHighPrim-numLowPrim);
                  PPWithBars=" ("+DoubleToStr(int_to_d1,3)+"/"+DoubleToStr(int_to_d2,3)+")";
                 }
// ExtPPWithBars=6 Âû÷èñëÿåòñÿ êîëè÷ñòâî ïóíêòîâ è ïðîöåíò îòêëîíåíèÿ îò ðåòðåñìåíòà "Ïåñàâåíòî"

               ExtLine_=ExtLine;
               if ( kj>0.1 && kj<9.36)
                 {
                  // Ñîçäàíèå òåêñòîâîãî îáúåêòà (÷èñëà Ïåñàâåíòî). % âîññòàíîâëåíèÿ ìåæäó ìèíèìóìàìè
                  kk=kj;
                  k2=1;
                  Pesavento_patterns();
                  if (k2<0)
                  // ïðîöåíò âîññòàíîâëåíèÿ ÷èñëà Ïåñàâåíòî è 0.886
                    {
                     ExtLine_=ExtLine886;
                     if (ExtHidden!=4)                  
                       {
                        nameObj="_" + ExtComplekt + "pltxt" + Time[numLowPrim] + "_" + Time[numLowLast];
                        ObjectCreate(nameObj,OBJ_TEXT,0,Time[k1],(LowPrim+LowLast)/2);

                        if (ExtPPWithBars==6)
                          {
                           int_to_d=MathAbs((kk-kj)/kk)*100;
                           PPWithBars=" ("+DoubleToStr((HighPrim-(HighPrim-LowLast)*kk-LowPrim)/Point,0)+"/"+DoubleToStr(int_to_d,2)+"%)";
                          }
                        descript=txtkk;
                        ObjectSetText(nameObj,txtkk+PPWithBars,ExtSizeTxt,"Arial", colorPPattern);
                        if (ExtPPWithBars==6) PPWithBars="";
                       }
                    }
                  else 
                    // ïðîöåíò âîññòàíîâëåíèÿ (íå Ïåñàâåíòî è 0.886)
                    { 
                     if (ExtHidden==1 || ExtHidden==4)
                       {
                        nameObj="_" + ExtComplekt + "pltxt" + Time[numLowPrim] + "_" + Time[numLowLast];

                        ObjectCreate(nameObj,OBJ_TEXT,0,Time[k1],(LowPrim+LowLast)/2);

                        descript=DoubleToStr(kk,3);
                        if (ExtDeltaType==3)
                          {
                           ObjectSetText(nameObj,""+DoubleToStr(kk,3)+PPWithBars,ExtSizeTxt,"Arial",colorPPattern);
                          }
                        else
                          {
                           ObjectSetText(nameObj,""+DoubleToStr(kk,2)+PPWithBars,ExtSizeTxt,"Arial",colorPPattern);
                          }
                       }
                     }
                     
                   if ((ExtHidden==2 && k2<0) || ExtHidden!=2)
                     {
                      nameObj="_" + ExtComplekt + "pl" + Time[numLowPrim] + "_" + Time[numLowLast];

                      ObjectCreate(nameObj,OBJ_TREND,0,Time[numLowLast],LowLast,Time[numLowPrim],LowPrim);

                      if (descript_b) ObjectSetText(nameObj,"ZUP"+ExtComplekt+" zz"+ExtIndicator+" PPesavento "+"Line Low "+descript);
                      ObjectSet(nameObj,OBJPROP_RAY,false);
                      ObjectSet(nameObj,OBJPROP_STYLE,STYLE_DOT);
                      ObjectSet(nameObj,OBJPROP_COLOR,ExtLine_);
                      ObjectSet(nameObj,OBJPROP_BACK,ExtBack);
                     }
                   if (ExtFiboZigZag) k=countBarEnd;
                  }
               }
           }
         else
           {
            numLowPrim=k; 
            if (ZigZagHighLow) LowPrim=Low[k]; else LowPrim=zzL[k];
           }
        }
       // Ïåðåõîä íà ñëåäóþùèé ýêñòðåìóì
       if (k>countBarEnd) 
         {
          k=numLowPrim+1; countLow1--; countFr--;

          numLowPrim=0; numLowLast=0;
          numHighPrim=0; numHighLast=0;

          LowPrim=0.0; LowLast=0.0;
          HighPrim=0.0; HighLast=0.0;
  
          Angle=-100;
         }
     }

//-----------2 Îòðèñîâêà ìèíèìóìîâ. Êîíåö.

  }
//-----------------------------------------
// Áëîê âûâîäà ñîåäèíèòåëüíûõ ëèíèé. Êîíåö.
//-----------------------------------------   

//======================
//======================
//======================
  } // Ðàçðåøåíèå íà âûâîä îñíàñòêè. Êîíåö.
// ÊÎÍÅÖ
  } // start


//----------------------------------------------------
//  Ïîäïðîãðàììû è ôóíêöèè
//----------------------------------------------------

//--------------------------------------------------------
// Ïîäñ÷åò êîëè÷åñòâà ýêñòðåìóìîâ. Ìèíèìóìîâ è ìàêñèìóìîâ. Íà÷àëî.
//--------------------------------------------------------
void countFractal()
  {
   int shift;
   countLow1=0;
   countHigh1=0;
   if (flagFrNew && !flagGartle)
     {
      for(shift=0; shift<=numBar; shift++)
        {
         if (zzL[shift]>0.0) {countLow1++;}
         if (zzH[shift]>0.0) {countHigh1++;}    
        }

      numBar=0;  
      counted_bars=Bars-4;
     }
   else
     {
      if (flagGartle)  {counted_bars=0;}
      for(shift=0; shift<=countBarEnd; shift++)
        {
         if (zzL[shift]>0.0) {countLow1++;}
         if (zzH[shift]>0.0) {countHigh1++;}
        }
     }
  }
//--------------------------------------------------------
// Ïîäñ÷åò êîëè÷åñòâà ýêñòðåìóìîâ. Ìèíèìóìîâ è ìàêñèìóìîâ. Êîíåö.
//--------------------------------------------------------

//--------------------------------------------------------
// Ôîðìèðîâàíèå ìàòðèöû. Íà÷àëî.
//
// Ìàòðèöà èñïîëüçóåòñÿ äëÿ ïîèñêà èñ÷åçíóâøèõ ýêñòðåìóìîâ.
// Ýòî èíñòðóìåíò êîìïåíñàöèè íåïðåäâèäåííûõ çàêèäîíîâ ñòàíäàðòíîãî ZigZag-a.
//
// Òàêæå âûâîäÿòñÿ ñòàòè÷åñêèå è äèíàìè÷åñêèå ôèáû è âååðû Ôèáîíà÷÷è,
// âèëû Ýíäðþñà...
//------------------------------------------------------
void matriza()
  {
   if (afrm)
     {
      afrm=false;
      int shift,k;
      
      k=0;
      for (shift=0; shift<Bars && k<10; shift++)
        {
         if (zz[shift]>0)
           {
            afrx[k]=zz[shift];
            afr[k]=Time[shift];
            if (zz[shift]==zzL[shift])
              {
               if (ZigZagHighLow) afrl[k]=Low[shift]; 
               else
                 {
                  if (k==0) afrl[k]=Low[shift]; else  afrl[k]=zzL[shift];
                 }
               afrh[k]=0.0;
              }
            if (zz[shift]==zzH[shift])
              {
               if (ZigZagHighLow) afrh[k]=High[shift]; 
               else
                 {
                  if (k==0) afrh[k]=High[shift]; else afrh[k]=zzH[shift];
                 }
               afrl[k]=0.0;
              }
            k++;
           }
        }
      // Âûâîä âèë Ýíäðþñà
      if (ExtPitchforkStatic>0)
        {
         if (mPitch[2]>0) {screenPitchforkS(); ExtPitchforkStatic=0;}
         if (ExtPitchforkCandle)
           {
            if (iBarShift(Symbol(),Period(),ExtDateTimePitchfork_3)==0) screenPitchforkS();
           }
         else
           {
            if (mPitch[2]==0) screenPitchforkS();
           }
        }
      if (ExtPitchforkDinamic>0) screenPitchforkD();

      // Âûâîä ñòàòè÷åñêèõ è äèíàìè÷åñêèõ ôèá.
      if (ExtFiboStatic)
        {
         if (mFibo[1]>0) {ExtFiboStatic=false; screenFiboS();}
         if (mFibo[1]==0) screenFiboS();
        }
      if (ExtFiboDinamic) {screenFiboD();}

      // Ðàñøèðåíèÿ Ôèáîíà÷÷è
      if (ExtFiboExpansion>0)
        {
         if (mExpansion[2]>0) {FiboExpansion(); ExtFiboExpansion=0;}
         if (mExpansion[2]==0) FiboExpansion();
        }

      // Âûâîä ôèáîâååðîâ
      if (ExtFiboFanNum>0 && ExtFiboFanColor>0)
        {
         if (mFan[1]>0) {screenFiboFan(); ExtFiboFanNum=0;}
         if (mFan[1]==0) screenFiboFan();
        }
      if (ExtFiboFanDinamic) screenFiboFanD();

      // Âûâîä Versum Levels
      if (ExtVLStaticColor>0)
        {
         if (mVL[2]>0) {ExtVLStaticNum=0; VLS();}
         if (mVL[2]==0) VLS();
        }
      if (ExtVLDinamicColor>0) {VLD();}

      // Âûâîä ôèáîäóã
      if (ExtArcDinamicNum>0) screenFiboArcD();
      if (ExtArcStaticNum>0) {screenFiboArcS(); ExtArcStaticNum=0;}

      // Ïîèñê ïàòòåðíîâ Gartley
      if (ExtGartleyOnOff)
        {
         switch (ExtIndicator)
           {
            case 0     : {_Gartley("ExtIndicator=0_" + minBars+"/"+ExtDeviation+"/"+ExtBackstep);break;}
            case 1     : {_Gartley("ExtIndicator=1_" + minSize+"/"+minPercent);break;}
            case 2     : {_Gartley("ExtIndicator=2_" + minBars+"/"+minSize);break;}
            case 3     : {_Gartley("ExtIndicator=3_" + minBars);break;}
            case 4     : {_Gartley("ExtIndicator=4_" + minSize);break;}
            case 5     : {_Gartley("ExtIndicator=5_" + minBars);break;}
            case 6     : {_Gartley("ExtIndicator=6_" + minBars+"/"+ExtDeviation+"/"+ExtBackstep);break;}
            case 7     : {_Gartley("ExtIndicator=7_" + minBars);break;}
            case 8     : {_Gartley("ExtIndicator=8_" + minBars+"/"+ExtDeviation);break;}
            case 10    : {_Gartley("ExtIndicator=10_" + minBars);break;}
            case 12    : {_Gartley("ExtIndicator=12_" + minBars);break;}
           }
         if (vPatOnOff==1 && vPatNew==0)
           {
            vPatNew=1;
            if (ExtSendMail) _SendMail("There was a pattern","on  " + Symbol() + " " + Period() + " pattern " + vBullBear + " " + vNamePattern);
           }
         else if (vPatOnOff==0 && vPatNew==1) {vPatNew=0; FlagForD=true;}
        }
      
      ExtSave=false;
     }
  }
//--------------------------------------------------------
// Ôîðìèðîâàíèå ìàòðèöû. Êîíåö.
//--------------------------------------------------------

//--------------------------------------------------------
// Âûâîä Versum Levels ñòàòè÷åñêèõ. Íà÷àëî.
//--------------------------------------------------------
void VLS()
  {
   VL(mVL[0],mVL[1],mVL[2],ExtVLStaticColor,"VLS");
  }
//--------------------------------------------------------
// Âûâîä Versum Levels ñòàòè÷åñêèõ. Êîíåöî.
//--------------------------------------------------------

//--------------------------------------------------------
// Âûâîä Versum Levels äèíàìè÷åñêèõ. Íà÷àëî.
//--------------------------------------------------------
void VLD()
  {
   VL(2,1,0,ExtVLDinamicColor,"VLD");
  }
//--------------------------------------------------------
// Âûâîä Versum Levels äèíàìè÷åñêèõ. Êîíåö.
//--------------------------------------------------------

//--------------------------------------------------------
// Versum Levels. Íà÷àëî.
//--------------------------------------------------------
void VL(int na,int nb,int nc,color color_line,string vl)
  {
   double line_pesavento[7]={0.236, 0.382, 0.447, 0.5, 0.618, 0.786, 0.886}, line_fibo[7]={0.236, 0.382, 0.455, 0.5, 0.545, 0.618, 0.764};
   int c_bar1, c_bar2, i;
   double H_L, mediana, tangens, cena;

   c_bar1=iBarShift(Symbol(),Period(),afr[na])-iBarShift(Symbol(),Period(),afr[nb]); // êîëè÷åñòâî áàð â îòðåçêå AB
   c_bar2=iBarShift(Symbol(),Period(),afr[nb])-iBarShift(Symbol(),Period(),afr[nc]); // êîëè÷åñòâî áàð â îòðåçêå ÂÑ
   if (afrl[na]>0)
    {
     H_L=afrh[nb]-afrl[nc]; // âûñîòà îòðåçêà ÂÑ

     for (i=0; i<7; i++)
       {
        if (ExtFiboType)
          {
           mediana=line_pesavento[i]*H_L+afrl[nc];
           tangens=(mediana-afrl[na])/(c_bar1+(1-line_pesavento[i])*c_bar2);
           cena=c_bar2*line_pesavento[i]*tangens+mediana;
           nameObj=vl+i+" " + ExtComplekt+"_";
           ObjectDelete(nameObj);
           ObjectCreate(nameObj,OBJ_TREND,0,afr[na],afrl[na],afr[nc],cena);
           ObjectSetText(nameObj,"ZUP"+ExtComplekt+" zz"+ExtIndicator+" "+vl+" "+DoubleToStr(line_pesavento[i]*100,1)+"");
           ObjectSet(nameObj,OBJPROP_COLOR,color_line);
          }
        else
          {
           mediana=line_fibo[i]*H_L+afrl[nc];
           tangens=(mediana-afrl[na])/(c_bar1+(1-line_fibo[i])*c_bar2);
           cena=c_bar2*line_fibo[i]*tangens+mediana;
           nameObj=vl+i+" " + ExtComplekt+"_";
           ObjectDelete(nameObj);
           ObjectCreate(nameObj,OBJ_TREND,0,afr[na],afrl[na],afr[nc],cena);
           ObjectSetText(nameObj,"ZUP"+ExtComplekt+" zz"+ExtIndicator+" "+vl+" "+DoubleToStr(line_fibo[i]*100,1)+"");
           ObjectSet(nameObj,OBJPROP_COLOR,color_line);
          }
       }
    }
   else
    {
     H_L=afrh[nc]-afrl[nb]; // âûñîòà îòðåçêà ÂÑ

     for (i=0; i<7; i++)
       {
        if (ExtFiboType)
          {
           mediana=afrh[nc]-line_pesavento[i]*H_L;
           tangens=(afrh[na]-mediana)/(c_bar1+(1-line_pesavento[i])*c_bar2);
           cena=mediana-c_bar2*line_pesavento[i]*tangens;
           nameObj=vl+i+" " + ExtComplekt+"_";
           ObjectDelete(nameObj);
           ObjectCreate(nameObj,OBJ_TREND,0,afr[na],afrh[na],afr[nc],cena);
           ObjectSetText(nameObj,"ZUP"+ExtComplekt+" zz"+ExtIndicator+" "+vl+" "+DoubleToStr(line_pesavento[i]*100,1)+"");
           ObjectSet(nameObj,OBJPROP_COLOR,color_line);
          }
        else
          {
           mediana=afrh[nc]-line_fibo[i]*H_L;
           tangens=(afrh[na]-mediana)/(c_bar1+(1-line_fibo[i])*c_bar2);
           cena=mediana-c_bar2*line_fibo[i]*tangens;
           nameObj=vl+i+" " + ExtComplekt+"_";
           ObjectDelete(nameObj);
           ObjectCreate(nameObj,OBJ_TREND,0,afr[na],afrh[na],afr[nc],cena);
           ObjectSetText(nameObj,"ZUP"+ExtComplekt+" zz"+ExtIndicator+" "+vl+" "+DoubleToStr(line_fibo[i]*100,1)+"");
           ObjectSet(nameObj,OBJPROP_COLOR,color_line);
          }
       }
    }
  }
//--------------------------------------------------------
// Versum Levels. Êîíåö.
//--------------------------------------------------------


//--------------------------------------------------------
// Âûâîä âèë Ýíäðþñà ñòàòè÷åñêèõ. Íà÷àëî.
//--------------------------------------------------------
void screenPitchforkS()
  {
   int k1,n,nbase1,nbase2;
   double a1,b1,c1,ab1,bc1,ab2,bc2,tangens,n1,cl1,ch1,cena;
   datetime ta1,tb1,tc1,tab2,tbc2,tcl1,tch1;
   bool fo1=false,fo2=false;
   datetime  pitch_time[]={0,0,0}; 
   double pitch_cena[]={0,0,0};
   double TLine, m618=0.618, m382=0.382;
   int mirror1, mirror2;

   if (ExtPitchforkCandle)
     {
      if (iBarShift(Symbol(),Period(),ExtDateTimePitchfork_3)==0)
        {
         if (ExtPitchfork_1_HighLow)
           {
            mPitchCena[2]=High[iBarShift(Symbol(),Period(),ExtDateTimePitchfork_3)];
           }
         else
           {
            mPitchCena[2]=Low[iBarShift(Symbol(),Period(),ExtDateTimePitchfork_3)];
           }
        }
     }

   if (ExtPitchforkCandle)
     {
      cena=mPitchCena[0];
      if (ExtPitchfork_1_HighLow)
        {
         if (ExtCM_0_1A_2B==1)
           {
            cena=mPitchCena[0]-(mPitchCena[0]-mPitchCena[1])*ExtCM_Fibo;
           }
         else if (ExtCM_0_1A_2B==4)
           {
            mPitchTimeSave=mPitchTime[0];
            mPitchTime[0]=mPitchTime[1];
            if (maxGipotenuza(mPitchTime,mPitchCena))
              {
               cena=mPitchCena[1]+(mPitchCena[2]-mPitchCena[1])*m618;
              }
            else
              {
               cena=mPitchCena[1]+(mPitchCena[2]-mPitchCena[1])*m382;
              }
           }
         else if (ExtCM_0_1A_2B>1)
           {
            if (ExtCM_0_1A_2B==2) mPitchTime[0]=mPitchTime[1];
            cena=mPitchCena[1]+(mPitchCena[2]-mPitchCena[1])*ExtCM_Fibo;
           }
        }
      else
        {
         if (ExtCM_0_1A_2B==1)
           {
            cena=mPitchCena[0]+(mPitchCena[1]-mPitchCena[0])*ExtCM_Fibo;
           }
         else if (ExtCM_0_1A_2B==4)
           {
            mPitchTimeSave=mPitchTime[0];
            mPitchTime[0]=mPitchTime[1];
//            if (MathAbs(mPitchCena[0]-mPitchCena[1])>MathAbs(mPitchCena[1]-mPitchCena[2]))
            if (maxGipotenuza(mPitchTime,mPitchCena))
              {
               cena=mPitchCena[1]-(mPitchCena[1]-mPitchCena[2])*m618;
              }
            else
              {
               cena=mPitchCena[1]-(mPitchCena[1]-mPitchCena[2])*m382;
              }
           }
         else if (ExtCM_0_1A_2B>1)
           {
            if (ExtCM_0_1A_2B==2) mPitchTime[0]=mPitchTime[1];
            cena=mPitchCena[1]-(mPitchCena[1]-mPitchCena[2])*ExtCM_Fibo;
           }
        }
     }
   else
     {
      mPitchTime[0]=afr[mPitch[0]]; mPitchTime[1]=afr[mPitch[1]]; mPitchTime[2]=afr[mPitch[2]];

      if (afrl[mPitch[0]]>0)
        {
         cena=afrl[mPitch[0]]; 
         mPitchCena[0]=afrl[mPitch[0]]; mPitchCena[1]=afrh[mPitch[1]]; mPitchCena[2]=afrl[mPitch[2]];
         if (ExtCM_0_1A_2B==1)
           {
            cena=mPitchCena[0]+(mPitchCena[1]-mPitchCena[0])*ExtCM_Fibo;
           }
         else if (ExtCM_0_1A_2B==4)
           {
            mPitchTimeSave=mPitchTime[0];
            mPitchTime[0]=mPitchTime[1];
            if (maxGipotenuza(mPitchTime,mPitchCena))
              {
               cena=mPitchCena[1]-(mPitchCena[1]-mPitchCena[2])*m618;
              }
            else
              {
               cena=mPitchCena[1]-(mPitchCena[1]-mPitchCena[2])*m382;
              }
           }
         else if (ExtCM_0_1A_2B>1)
           {
            if (ExtCM_0_1A_2B==2) mPitchTime[0]=mPitchTime[1];
            cena=mPitchCena[1]-(mPitchCena[1]-mPitchCena[2])*ExtCM_Fibo;
           }
        }
      else
        {
         cena=afrh[mPitch[0]];
         mPitchCena[0]=afrh[mPitch[0]]; mPitchCena[1]=afrl[mPitch[1]]; mPitchCena[2]=afrh[mPitch[2]];
         if (ExtCM_0_1A_2B==1)
           {
            cena=mPitchCena[0]-(mPitchCena[0]-mPitchCena[1])*ExtCM_Fibo;
           }
         else if (ExtCM_0_1A_2B==4)
           {
            mPitchTimeSave=mPitchTime[0];
            mPitchTime[0]=mPitchTime[1];
            if (maxGipotenuza(mPitchTime,mPitchCena))
              {
               cena=mPitchCena[1]+(mPitchCena[2]-mPitchCena[1])*m618;
              }
            else
              {
               cena=mPitchCena[1]+(mPitchCena[2]-mPitchCena[1])*m382;
              }
           }
         else if (ExtCM_0_1A_2B>1)
           {
            if (ExtCM_0_1A_2B==2) mPitchTime[0]=mPitchTime[1];
            cena=mPitchCena[1]+(mPitchCena[2]-mPitchCena[1])*ExtCM_Fibo;
           }
        }
     }

   mPitchCena[0]=cena;

   if (ExtFiboFanStatic) {ExtFiboFanStatic=false; screenFiboFanS();}
 
   nameObj="pmedianaS" + ExtComplekt+"_";
   ObjectDelete(nameObj);

   if (ExtSave)
     {
      if (ExtPitchforkCandle && iBarShift(Symbol(),Period(),ExtDateTimePitchfork_3)>0)
        {
         nameObj=nameObj + save;
        }
      else
        {
         if (mPitch[2]>0)
           {
            nameObj=nameObj + save;
           }
        }
     }

   coordinaty_1_2_mediany_AP(mPitchCena[0], mPitchCena[1], mPitchCena[2], mPitchTime[0], mPitchTime[1], mPitchTime[2], tab2, tbc2, ab1, bc1);

   pitch_time[0]=tab2;pitch_cena[0]=ab1;

   if (ExtPitchforkStatic==2)
     {
      ObjectCreate(nameObj,OBJ_TREND,0,tab2,ab1,tbc2,bc1);
      ObjectSet(nameObj,OBJPROP_STYLE,STYLE_DASH);
      ObjectSet(nameObj,OBJPROP_COLOR,ExtLinePitchforkS);
      ObjectSet(nameObj,OBJPROP_BACK,ExtBack);

      nameObj="1-2pmedianaS" + ExtComplekt+"_";

      if (ExtSave)
        {
         if (ExtPitchforkCandle && iBarShift(Symbol(),Period(),ExtDateTimePitchfork_3)>0)
           {
            nameObj=nameObj + save;
           }
         else
           {
            if (mPitch[2]>0)
              {
               nameObj=nameObj + save;
              }
           }
        }
      ObjectDelete(nameObj);
      ObjectCreate(nameObj,OBJ_TEXT,0,tab2,ab1+3*Point);
      ObjectSetText(nameObj,"     1/2 ML",9,"Arial", ExtLinePitchforkS);
     }   

   nameObj="pitchforkS" + ExtComplekt+"_";
   if (ExtSave)
     {
      if (ExtPitchforkCandle && iBarShift(Symbol(),Period(),ExtDateTimePitchfork_3)>0)
        {
         nameObj=nameObj + save;
        }
      else
        {
         if (mPitch[2]>0)
           {
            nameObj=nameObj + save;
           }
        }
     }

   ObjectDelete(nameObj);

   if (ExtPitchforkStatic!=4)
     {
      pitch_time[0]=mPitchTime[0];pitch_cena[0]=mPitchCena[0];
      if (ExtPitchforkStatic==3) pitch_cena[0]=ab1;
     }
   pitch_time[1]=mPitchTime[1];pitch_cena[1]=mPitchCena[1];
   pitch_time[2]=mPitchTime[2];pitch_cena[2]=mPitchCena[2];

   ObjectCreate(nameObj,OBJ_PITCHFORK,0,pitch_time[0],pitch_cena[0],pitch_time[1],pitch_cena[1],pitch_time[2],pitch_cena[2]);
   if (ExtPitchforkStyle<5)
     {
      ObjectSet(nameObj,OBJPROP_STYLE,ExtPitchforkStyle);
     }
   else if(ExtPitchforkStyle<11)
     {
      ObjectSet(nameObj,OBJPROP_WIDTH,ExtPitchforkStyle-5);
     }
   ObjectSet(nameObj,OBJPROP_COLOR,ExtLinePitchforkS);
   ObjectSet(nameObj,OBJPROP_BACK,ExtBack);

   if (ExtFiboFanMedianaStaticColor>0)
     {
      coordinaty_mediany_AP(pitch_cena[0], pitch_cena[1], pitch_cena[2], pitch_time[0], pitch_time[1], pitch_time[2], tb1, b1);      
/*
      nameObj="FanMedianaStatic" + ExtComplekt+"_";

      if (ExtSave)
        {
         if (ExtPitchforkCandle && iBarShift(Symbol(),Period(),ExtDateTimePitchfork_3)>0)
           {
            nameObj=nameObj + save;
           }
         else
           {
            if (mPitch[2]>0)
              {
               nameObj=nameObj + save;
              }
           }
        }
*/
      ObjectDelete(nameObj);

      ObjectSet(nameObj,OBJPROP_COLOR,CLR_NONE);
      ObjectCreate(nameObj,OBJ_FIBOFAN,0,pitch_time[0],pitch_cena[0],tb1,b1);
      ObjectSet(nameObj,OBJPROP_LEVELSTYLE,STYLE_DASH);
      ObjectSet(nameObj,OBJPROP_LEVELCOLOR,ExtFiboFanMedianaStaticColor);
      ObjectSet(nameObj,OBJPROP_BACK,ExtBack);

      screenFibo();

     }
//-------------------------------------------------------

   if (ExtUTL)
     {
      nameObj="UTL" + ExtComplekt+"_";
      if (ExtSave)
        {
         if (ExtPitchforkCandle && iBarShift(Symbol(),Period(),ExtDateTimePitchfork_3)>0)
           {
            nameObj=nameObj + save;
           }
         else
           {
            if (mPitch[2]>0)
              {
               nameObj=nameObj + save;
              }
           }
        }

      ObjectDelete(nameObj);
      if (pitch_cena[1]>pitch_cena[2])
        {
         ObjectCreate(nameObj,OBJ_TREND,0,pitch_time[0],pitch_cena[0],pitch_time[1],pitch_cena[1]);
        }
      else
        {
         ObjectCreate(nameObj,OBJ_TREND,0,pitch_time[0],pitch_cena[0],pitch_time[2],pitch_cena[2]);
        }
      ObjectSet(nameObj,OBJPROP_STYLE,STYLE_SOLID);
      ObjectSet(nameObj,OBJPROP_COLOR,ExtLinePitchforkS);
      ObjectSet(nameObj,OBJPROP_BACK,ExtBack);
     }

   if (ExtPivotZoneStaticColor>0 && ExtPitchforkStatic<4) PivotZone(pitch_time, pitch_cena, ExtPivotZoneStaticColor, "PivotZoneS");

   if (ExtLTL)
     {
      nameObj="LTL" + ExtComplekt+"_";
      if (ExtSave)
        {
         if (ExtPitchforkCandle && iBarShift(Symbol(),Period(),ExtDateTimePitchfork_3)>0)
           {
            nameObj=nameObj + save;
           }
         else
           {
            if (mPitch[2]>0)
              {
               nameObj=nameObj + save;
              }
           }
        }

      ObjectDelete(nameObj);
      if (pitch_cena[1]>pitch_cena[2])
        {
         ObjectCreate(nameObj,OBJ_TREND,0,pitch_time[0],pitch_cena[0],pitch_time[2],pitch_cena[2]);
        }
      else
        {
         ObjectCreate(nameObj,OBJ_TREND,0,pitch_time[0],pitch_cena[0],pitch_time[1],pitch_cena[1]);
        }
      ObjectSet(nameObj,OBJPROP_STYLE,STYLE_SOLID);
      ObjectSet(nameObj,OBJPROP_COLOR,ExtLinePitchforkS);
      ObjectSet(nameObj,OBJPROP_BACK,ExtBack);
     }
//-------------------------------------------------------

   if (ExtISLStatic)
     {
      n1=iBarShift(Symbol(),Period(),pitch_time[0])-(iBarShift(Symbol(),Period(),pitch_time[1])+iBarShift(Symbol(),Period(),pitch_time[2]))/2.0;
      ta1=pitch_time[1];
      a1=pitch_cena[1];
      tangens=(pitch_cena[0]-(pitch_cena[1]+pitch_cena[2])/2.0)/n1;

      ML_RL400(tangens, pitch_cena, pitch_time, tb1, b1, true);

      tc1=pitch_time[2];
      c1=pitch_cena[2];

      nameObj="ISL_S" + ExtComplekt+"_";
      if (ExtSave)
        {
         if (ExtPitchforkCandle && iBarShift(Symbol(),Period(),ExtDateTimePitchfork_3)>0)
           {
            nameObj=nameObj + save;
           }
         else
           {
            if (mPitch[2]>0)
              {
               nameObj=nameObj + save;
              }
           }
         }

         ObjectDelete(nameObj);

         ObjectCreate(nameObj,OBJ_FIBOCHANNEL,0,ta1,a1,tb1,b1,tc1,c1);
         ObjectSet(nameObj,OBJPROP_LEVELCOLOR,ExtLinePitchforkS);
         ObjectSet(nameObj,OBJPROP_LEVELSTYLE,ExtPitchforkStyle);
         ObjectSet(nameObj,OBJPROP_RAY,false);
         ObjectSet(nameObj,OBJPROP_BACK,ExtBack);
         ObjectSet(nameObj,OBJPROP_COLOR,CLR_NONE);
         ObjectSet(nameObj,OBJPROP_FIBOLEVELS,6);

         if (ExtFiboType)
           {
            ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+0,-0.886);
            ObjectSetFiboDescription(nameObj, 0, "   I S L 88.6"); 

            ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+1,-0.786);
            ObjectSetFiboDescription(nameObj, 1, "    I S L 78.6"); 

            ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+2,-0.618);
            ObjectSetFiboDescription(nameObj, 2, "    I S L 61.8"); 
           }
         else
           {
            ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+0,-0.854);
            ObjectSetFiboDescription(nameObj, 0, "   I S L 85.4"); 

            ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+1,-0.764);
            ObjectSetFiboDescription(nameObj, 1, "    I S L 76.4"); 

            ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+2,-0.618);
            ObjectSetFiboDescription(nameObj, 2, "    I S L 61.8"); 
           }

         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+3,-0.382);
         ObjectSetFiboDescription(nameObj, 3, "    I S L 38.2"); 

         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+4,-0.236);
         ObjectSetFiboDescription(nameObj, 4, "    I S L 23.6"); 

         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+5,-0.146);
         ObjectSetFiboDescription(nameObj, 5, "    I S L 14.6"); 
     }

//-------------------------------------------------------

   if (ExtUWL || ExtLWL)
     {
      n1=iBarShift(Symbol(),Period(),pitch_time[0])-(iBarShift(Symbol(),Period(),pitch_time[1])+iBarShift(Symbol(),Period(),pitch_time[2]))/2.0;
      ta1=pitch_time[0];
      tb1=Time[0];
      a1=pitch_cena[0];
      tangens=(pitch_cena[0]-(pitch_cena[1]+pitch_cena[2])/2.0)/n1;
      b1=pitch_cena[0]-tangens*iBarShift(Symbol(),Period(),pitch_time[0]);

      ML_RL400(tangens, pitch_cena, pitch_time, tb1, b1, false);

      if (pitch_cena[1]>pitch_cena[2])
        {
         if (ExtUWL)
           {
            ch1=pitch_cena[1];
            tch1=pitch_time[1];
           }
         if (ExtLWL)
           {
            cl1=pitch_cena[2];
            tcl1=pitch_time[2];
           }
        }
      else
        {
         if (ExtUWL)
           {
            ch1=pitch_cena[2];
            tch1=pitch_time[2];
           }
         if (ExtLWL)
           {
            cl1=pitch_cena[1];
            tcl1=pitch_time[1];
           }
        }
//      if (fo2) {fo2=false; b1=b1+tangens;}

      if (ExtUWL)
        {
         nameObj="UWL" + ExtComplekt+"_";
         if (ExtSave)
           {
            if (ExtPitchforkCandle && iBarShift(Symbol(),Period(),ExtDateTimePitchfork_3)>0)
              {
               nameObj=nameObj + save;
              }
            else
              {
               if (mPitch[2]>0)
                 {
                  nameObj=nameObj + save;
                 }
              }
           }
  
         ObjectDelete(nameObj);

         ObjectCreate(nameObj,OBJ_FIBOCHANNEL,0,ta1,a1,tb1,b1,tch1,ch1);
         ObjectSet(nameObj,OBJPROP_LEVELCOLOR,ExtLinePitchforkS);
         ObjectSet(nameObj,OBJPROP_LEVELSTYLE,STYLE_DOT);
         ObjectSet(nameObj,OBJPROP_RAY,false);
         ObjectSet(nameObj,OBJPROP_BACK,ExtBack);
         ObjectSet(nameObj,OBJPROP_COLOR,CLR_NONE);
         ObjectSet(nameObj,OBJPROP_FIBOLEVELS,12);

         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+0,0.146);
         ObjectSetFiboDescription(nameObj, 0, "U W L 14.6"); 

         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+1,0.236);
         ObjectSetFiboDescription(nameObj, 1, "U W L 23.6"); 

         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+2,0.382);
         ObjectSetFiboDescription(nameObj, 2, "U W L 38.2"); 

         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+3,0.5);
         ObjectSetFiboDescription(nameObj, 3, "U W L 50.0"); 

         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+4,0.618);
         ObjectSetFiboDescription(nameObj, 4, "U W L 61.8"); 

         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+5,0.764);
         ObjectSetFiboDescription(nameObj, 5, "U W L 76.4"); 

         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+6,0.854);
         ObjectSetFiboDescription(nameObj, 6, "U W L 85.4"); 

        ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+7,1.0);
         ObjectSetFiboDescription(nameObj, 7, "U W L 100.0"); 

         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+8,1.618);
         ObjectSetFiboDescription(nameObj, 8, "U W L 161.8"); 

         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+9,2.0);
         ObjectSetFiboDescription(nameObj, 9, "U W L 200.0"); 

         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+10,2.618);
         ObjectSetFiboDescription(nameObj, 10, "U W L 261.8"); 

         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+11,4.0);
         ObjectSetFiboDescription(nameObj, 11, "U W L 400.0"); 
        }

      if (ExtLWL)
        {
         nameObj="LWL" + ExtComplekt+"_";
         if (ExtSave)
           {
            if (ExtPitchforkCandle && iBarShift(Symbol(),Period(),ExtDateTimePitchfork_3)>0)
              {
               nameObj=nameObj + save;
              }
            else
              {
               if (mPitch[2]>0)
                 {
                  nameObj=nameObj + save;
                 }
              }
           }

         ObjectDelete(nameObj);

         ObjectCreate(nameObj,OBJ_FIBOCHANNEL,0,ta1,a1,tb1,b1,tcl1,cl1);
         ObjectSet(nameObj,OBJPROP_LEVELCOLOR,ExtLinePitchforkS);
         ObjectSet(nameObj,OBJPROP_LEVELSTYLE,STYLE_DOT);
         ObjectSet(nameObj,OBJPROP_RAY,false);
         ObjectSet(nameObj,OBJPROP_BACK,ExtBack);
         ObjectSet(nameObj,OBJPROP_COLOR,CLR_NONE);
         ObjectSet(nameObj,OBJPROP_FIBOLEVELS,12);

         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+0,0.146);
         ObjectSetFiboDescription(nameObj, 0, "L W L 14.6"); 

         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+1,0.236);
         ObjectSetFiboDescription(nameObj, 1, "L W L 23.6"); 

         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+2,0.382);
         ObjectSetFiboDescription(nameObj, 2, "L W L 38.2"); 

         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+3,0.5);
         ObjectSetFiboDescription(nameObj, 3, "L W L 50.0"); 

         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+4,0.618);
         ObjectSetFiboDescription(nameObj, 4, "L W L 61.8"); 

         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+5,0.764);
         ObjectSetFiboDescription(nameObj, 5, "L W L 76.4"); 

         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+6,0.854);
         ObjectSetFiboDescription(nameObj, 6, "L W L 85.4"); 

         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+7,1.0);
         ObjectSetFiboDescription(nameObj, 7, "L W L 100.0"); 

         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+8,1.618);
         ObjectSetFiboDescription(nameObj, 8, "L W L 161.8"); 

         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+9,2.0);
         ObjectSetFiboDescription(nameObj, 9, "L W L 200.0"); 

         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+10,2.618);
         ObjectSetFiboDescription(nameObj, 10, "L W L 261.8"); 

         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+11,4.0);
         ObjectSetFiboDescription(nameObj, 11, "L W L 400.0"); 
        }

     }

//-------------------------------------------------------

   if (ExtPitchforkStaticColor>0)
     {

      n1=iBarShift(Symbol(),Period(),pitch_time[0])-(iBarShift(Symbol(),Period(),pitch_time[1])+iBarShift(Symbol(),Period(),pitch_time[2]))/2.0;
   
      TLine=pitch_cena[1]-iBarShift(Symbol(),Period(),pitch_time[1])*(pitch_cena[0]-(pitch_cena[2]+pitch_cena[1])/2)/n1;

      nameObj="CL" + ExtComplekt+"_";
/*
      if (ExtSave)
        {
         if (ExtPitchforkCandle && iBarShift(Symbol(),Period(),ExtDateTimePitchfork_3)>0)
           {
            nameObj=nameObj + save;
           }
         else
           {
            if (mPitch[2]>0)
              {
               nameObj=nameObj + save;
              }
           }
        }
*/
      ObjectDelete(nameObj);

      ObjectCreate(nameObj,OBJ_CHANNEL,0,pitch_time[1],pitch_cena[1],Time[0],TLine,pitch_time[2],pitch_cena[2]);
      ObjectSet(nameObj, OBJPROP_BACK, true);
      ObjectSet(nameObj, OBJPROP_COLOR, ExtPitchforkStaticColor); 
     }
//-------------------------------------------------------

   if (ExtRLine)
     {
      n=iBarShift(Symbol(),Period(),pitch_time[0])-(iBarShift(Symbol(),Period(),pitch_time[1])+iBarShift(Symbol(),Period(),pitch_time[2]))/2.0;

      nbase1=iBarShift(Symbol(),Period(),mPitchTime[1]);
      nbase2=iBarShift(Symbol(),Period(),mPitchTime[2]);

      if (nbase1+n<=Bars)
        {
         mirror1=1;
         mirror2=0;

         ta1=Time[nbase1+n];
         tb1=Time[nbase2+n];
         tc1=mPitchTime[1];

         a1=(pitch_cena[0]-(mPitchCena[1]+mPitchCena[2])/2)+mPitchCena[1];
         b1=(pitch_cena[0]-(mPitchCena[1]+mPitchCena[2])/2)+mPitchCena[2];
         c1=mPitchCena[1];
        }
      else
        {
         mirror1=-1;
         mirror2=-1;

         ta1=mPitchTime[2];
         tb1=mPitchTime[1];
         tc1=Time[nbase2+n];

         a1=mPitchCena[2];
         b1=mPitchCena[1];
         c1=(pitch_cena[0]-(mPitchCena[1]+mPitchCena[2])/2)+mPitchCena[2];
        }

      nameObj="RLineS" + ExtComplekt+"_";
      if (ExtSave)
        {
         if (ExtPitchforkCandle && iBarShift(Symbol(),Period(),ExtDateTimePitchfork_3)>0)
           {
            nameObj=nameObj + save;
           }
         else
           {
            if (mPitch[2]>0)
              {
               nameObj=nameObj + save;
              }
           }
        }

      ObjectDelete(nameObj);

      ObjectCreate(nameObj,OBJ_FIBOCHANNEL,0,ta1,a1,tb1,b1,tc1,c1);

      ObjectSet(nameObj,OBJPROP_LEVELCOLOR,ExtLinePitchforkS);

      if (ExtRLineBase) 
        {
         ObjectSet(nameObj,OBJPROP_COLOR,CLR_NONE);
        }
      else
        {
         ObjectSet(nameObj,OBJPROP_COLOR,ExtLinePitchforkS);
        }

      fiboRL(nameObj, mirror1, mirror2);
     }
//-------------------------------------------------------

      // Âðåìåííûå çîíû Ôèáî
      if (ExtFiboTime1)
        {
         nameObj="fiboTime1" + ExtComplekt+"_";
         if (ExtSave)
           {
            if (ExtPitchforkCandle && iBarShift(Symbol(),Period(),ExtDateTimePitchfork_3)>0)
              {
               nameObj=nameObj + save;
              }
            else
              {
               if (mPitch[2]>0)
                 {
                  nameObj=nameObj + save;
                 }
              }
           }

         ObjectDelete(nameObj);

         if (ExtPitchforkCandle)
           {
            if (!ExtPitchfork_1_HighLow)
              {
               if (mPitchCena[0]>mPitchCena[2])
                 {
                  ObjectCreate(nameObj,OBJ_FIBOTIMES,0,mPitchTime[0],mPitchCena[2]-5*Point,mPitchTime[2],mPitchCena[2]-5*Point);
                 }
               else
                 {
                  ObjectCreate(nameObj,OBJ_FIBOTIMES,0,mPitchTime[0],mPitchCena[0]-5*Point,mPitchTime[2],mPitchCena[0]-5*Point);
                 }
              }
            else
              {
               ObjectCreate(nameObj,OBJ_FIBOTIMES,0,mPitchTime[0],mPitchCena[1]-5*Point,mPitchTime[2],mPitchCena[1]-5*Point);
              }
           }
         else
           {
            if (afrl[mPitch[0]]>0)
              {
               if (afrl[mPitch[0]]>afrl[mPitch[2]])
                 {
                  ObjectCreate(nameObj,OBJ_FIBOTIMES,0,mPitchTime[0],mPitchCena[2]-5*Point,mPitchTime[2],mPitchCena[2]-5*Point);
                 }
               else
                 {
                  ObjectCreate(nameObj,OBJ_FIBOTIMES,0,mPitchTime[0],mPitchCena[0]-5*Point,mPitchTime[2],mPitchCena[0]-5*Point);
                 }
              }
            else
              {
               ObjectCreate(nameObj,OBJ_FIBOTIMES,0,mPitchTime[0],mPitchCena[1]-5*Point,mPitchTime[2],afrl[mPitch[1]]-5*Point);
              }
           }

         ObjectSet(nameObj,OBJPROP_LEVELCOLOR,ExtFiboTime1C);

         fiboTime (nameObj);
        }

      if (ExtFiboTime2)
        {
         nameObj="fiboTime2" + ExtComplekt+"_";
         if (ExtSave)
           {
            if (ExtPitchforkCandle && iBarShift(Symbol(),Period(),ExtDateTimePitchfork_3)>0)
              {
               nameObj=nameObj + save;
              }
            else
              {
               if (mPitch[2]>0)
                 {
                  nameObj=nameObj + save;
                 }
              }
           }

         ObjectDelete(nameObj);

         if (ExtPitchforkCandle)
           {
            if (ExtPitchfork_1_HighLow)
              {
               ObjectCreate(nameObj,OBJ_FIBOTIMES,0,mPitchTime[1],mPitchCena[1]-8*Point,mPitchTime[2],mPitchCena[1]-8*Point);
              }
            else
              {
               ObjectCreate(nameObj,OBJ_FIBOTIMES,0,mPitchTime[1],mPitchCena[2]-8*Point,mPitchTime[2],mPitchCena[2]-8*Point);
              }
           }
         else
           {
            if (afrl[mPitch[1]]>0)
              {
               ObjectCreate(nameObj,OBJ_FIBOTIMES,0,mPitchTime[1],mPitchCena[1]-8*Point,mPitchTime[2],mPitchCena[1]-8*Point);
              }
            else
              {
               ObjectCreate(nameObj,OBJ_FIBOTIMES,0,mPitchTime[1],mPitchCena[2]-8*Point,mPitchTime[2],mPitchCena[2]-8*Point);
              }
           }

         ObjectSet(nameObj,OBJPROP_LEVELCOLOR,ExtFiboTime2C);

         fiboTime (nameObj);
        }

  }
//--------------------------------------------------------
// Âûâîä âèë Ýíäðþñà ñòàòè÷åñêèõ. Êîíåö.
//--------------------------------------------------------

//--------------------------------------------------------
// ôèáî-Time. Íà÷àëî.
//--------------------------------------------------------
void fiboTime (string nameObj)
  {
   ObjectSet(nameObj,OBJPROP_COLOR,ExtObjectColor);
//   ObjectSet(nameObj,OBJPROP_STYLE,STYLE_DOT);
   ObjectSet(nameObj,OBJPROP_STYLE,ExtObjectStyle);
   ObjectSet(nameObj,OBJPROP_WIDTH,ExtObjectWidth);
   ObjectSet(nameObj,OBJPROP_LEVELSTYLE,STYLE_DOT);
   ObjectSet(nameObj,OBJPROP_BACK,ExtBack);
   if (ExtFiboType)
     {
      ObjectSet(nameObj,OBJPROP_FIBOLEVELS,17);

      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+0,0.0);
      ObjectSetFiboDescription(nameObj, 0, "0"); 

      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+1,1.0);
      ObjectSetFiboDescription(nameObj, 1, "1"); 

      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+2,1.382);
      ObjectSetFiboDescription(nameObj, 2, "Ft .382"); 

      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+3,1.5);
      ObjectSetFiboDescription(nameObj, 3, "Ft .5"); 

      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+4,1.618);
      ObjectSetFiboDescription(nameObj, 4, "Ft .618"); 

      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+5,1.707);
      ObjectSetFiboDescription(nameObj, 5, "Ft .707"); 

      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+6,1.786);
      ObjectSetFiboDescription(nameObj, 6, "Ft .786"); 

      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+7,1.886);
      ObjectSetFiboDescription(nameObj, 7, "Ft .886"); 

      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+8,2.0);
      ObjectSetFiboDescription(nameObj, 8, "Ft 1."); 

      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+9,2.272);
      ObjectSetFiboDescription(nameObj, 9, "Ft 1.272"); 

      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+10,2.414);
      ObjectSetFiboDescription(nameObj, 10, "Ft 1.414"); 

      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+11,2.618);
      ObjectSetFiboDescription(nameObj, 11, "Ft 1.618"); 

      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+12,3.0);
      ObjectSetFiboDescription(nameObj, 12, "Ft 2."); 

      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+13,3.414);
      ObjectSetFiboDescription(nameObj, 13, "Ft 2.414"); 

      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+15,3.618);
      ObjectSetFiboDescription(nameObj, 15, "Ft 2.618"); 

      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+16,4.0);
      ObjectSetFiboDescription(nameObj, 16, "Ft 3."); 

     }
   else
     {
      ObjectSet(nameObj,OBJPROP_FIBOLEVELS,15);

      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+0,0.0);
      ObjectSetFiboDescription(nameObj, 0, "0"); 

      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+1,1.0);
      ObjectSetFiboDescription(nameObj, 1, "1"); 

      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+2,1.146);
      ObjectSetFiboDescription(nameObj, 2, "Ft .146"); 

      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+3,1.236);
      ObjectSetFiboDescription(nameObj, 3, "Ft .236"); 

      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+4,1.382);
      ObjectSetFiboDescription(nameObj, 4, "Ft .382"); 

      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+5,1.5);
      ObjectSetFiboDescription(nameObj, 5, "Ft .5"); 

      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+6,1.618);
      ObjectSetFiboDescription(nameObj, 6, "Ft .618"); 

      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+7,1.764);
      ObjectSetFiboDescription(nameObj, 7, "Ft .764"); 

      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+8,1.854);
      ObjectSetFiboDescription(nameObj, 8, "Ft .854"); 

      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+9,2.0);
      ObjectSetFiboDescription(nameObj, 9, "Ft 1."); 

      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+10,2.236);
      ObjectSetFiboDescription(nameObj, 10, "Ft 1.236"); 

      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+11,2.618);
      ObjectSetFiboDescription(nameObj, 11, "Ft 1.618"); 

      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+12,3.0);
      ObjectSetFiboDescription(nameObj, 12, "Ft 2."); 

      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+13,3.618);
      ObjectSetFiboDescription(nameObj, 13, "Ft 2.618"); 

      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+14,5.0);
      ObjectSetFiboDescription(nameObj, 14, "Ft 4."); 
     }
  }
//--------------------------------------------------------
// ôèáî-Time. Êîíåö.
//--------------------------------------------------------


//--------------------------------------------------------
// Âûâîä âèë Ýíäðþñà äèíàìè÷åñêèõ. Íà÷àëî.
//--------------------------------------------------------
void screenPitchforkD()
  {
   int k1,n,nbase1,nbase2;
   double a1,b1,c1,ab1,bc1,ab2,bc2,d,n1,cena,m618=0.618,m382=0.382, tangens;
   datetime ta1,tb1,tc1,tab2,tbc2;
   bool fo1=false,fo2=false;
   datetime   pitch_time[]={0,0,0}; 
   double pitch_cena[]={0,0,0};
   int mirror1, mirror2;

   mPitchTime[0]=afr[2]; mPitchTime[1]=afr[1]; mPitchTime[2]=afr[0];
   mPitchCena[0]=afrx[2]; mPitchCena[1]=afrx[1]; mPitchCena[2]=afrx[0];

   cena=afrx[2]; 

   if (afrl[2]>0)
     {
      if (ExtCM_0_1A_2B==1)
        {
         cena=mPitchCena[0]+(mPitchCena[1]-mPitchCena[0])*ExtCM_Fibo;
        }
      else if (ExtCM_0_1A_2B==4)
        {
         mPitchTimeSave=mPitchTime[0];
         mPitchTime[0]=mPitchTime[1];
         if (maxGipotenuza(mPitchTime,mPitchCena))
           {
            cena=mPitchCena[1]-(mPitchCena[1]-mPitchCena[2])*m618;
           }
         else
           {
            cena=mPitchCena[1]-(mPitchCena[1]-mPitchCena[2])*m382;
           }
        }
      else if (ExtCM_0_1A_2B>1)
        {
         if (ExtCM_0_1A_2B==2) mPitchTime[0]=mPitchTime[1];
         cena=mPitchCena[1]-(mPitchCena[1]-mPitchCena[2])*ExtCM_Fibo;
        }
     }
   else
     {
      if (ExtCM_0_1A_2B==1)
        {
         cena=mPitchCena[0]-(mPitchCena[0]-mPitchCena[1])*ExtCM_Fibo;
        }
      else if (ExtCM_0_1A_2B==4)
        {
         mPitchTimeSave=mPitchTime[0];
         mPitchTime[0]=mPitchTime[1];
         if (maxGipotenuza(mPitchTime,mPitchCena))
           {
            cena=mPitchCena[1]+(mPitchCena[2]-mPitchCena[1])*m618;
           }
         else
           {
            cena=mPitchCena[1]+(mPitchCena[2]-mPitchCena[1])*m382;
           }
        }
      else if (ExtCM_0_1A_2B>1)
        {
         if (ExtCM_0_1A_2B==2) mPitchTime[0]=mPitchTime[1];
         cena=mPitchCena[1]+(mPitchCena[2]-mPitchCena[1])*ExtCM_Fibo;
        }
     }

   mPitchCena[0]=cena;

   coordinaty_1_2_mediany_AP(mPitchCena[0], mPitchCena[1], mPitchCena[2], mPitchTime[0], mPitchTime[1], mPitchTime[2], tab2, tbc2, ab1, bc1);
      
   pitch_time[0]=tab2;pitch_cena[0]=ab1;

   nameObj="pmedianaD" + ExtComplekt+"_";
   ObjectDelete(nameObj);
     
   if (ExtPitchforkDinamic==2)
     {
      ObjectCreate(nameObj,OBJ_TREND,0,tab2,ab1,tbc2,bc1);
      ObjectSet(nameObj,OBJPROP_STYLE,STYLE_DASH);
      ObjectSet(nameObj,OBJPROP_COLOR,ExtLinePitchforkD);
      ObjectSet(nameObj,OBJPROP_BACK,ExtBack);

      nameObj="1-2pmedianaD" + ExtComplekt+"_";
      ObjectDelete(nameObj);
      ObjectCreate(nameObj,OBJ_TEXT,0,tab2,ab1+3*Point);
      ObjectSetText(nameObj,"     1/2 ML",9,"Arial", ExtLinePitchforkD);
     }

   nameObj="pitchforkD" + ExtComplekt+"_";
   ObjectDelete(nameObj);

   if (ExtPitchforkDinamic!=4)
     {
      pitch_time[0]=mPitchTime[0];pitch_cena[0]=mPitchCena[0];
      if (ExtPitchforkDinamic==3) pitch_cena[0]=ab1;
     }
   pitch_time[1]=mPitchTime[1];pitch_cena[1]=mPitchCena[1];
   pitch_time[2]=mPitchTime[2];pitch_cena[2]=mPitchCena[2];

   ObjectCreate(nameObj,OBJ_PITCHFORK,0,pitch_time[0],pitch_cena[0],pitch_time[1],pitch_cena[1],pitch_time[2],pitch_cena[2]);
   if (ExtPitchforkStyle<5)
     {
      ObjectSet(nameObj,OBJPROP_STYLE,ExtPitchforkStyle);
     }
   else if(ExtPitchforkStyle<11)
     {
      ObjectSet(nameObj,OBJPROP_WIDTH,ExtPitchforkStyle-5);
     }
   ObjectSet(nameObj,OBJPROP_COLOR,ExtLinePitchforkD);
   ObjectSet(nameObj,OBJPROP_BACK,ExtBack);

   if (ExtPivotZoneDinamicColor>0 && ExtPitchforkDinamic<4) PivotZone(pitch_time, pitch_cena, ExtPivotZoneDinamicColor, "PivotZoneD");

   if (ExtFiboFanMedianaDinamicColor>0)
     {
      coordinaty_mediany_AP(pitch_cena[0], pitch_cena[1], pitch_cena[2], pitch_time[0], pitch_time[1], pitch_time[2], tb1, b1);      

      nameObj="FanMedianaDinamic" + ExtComplekt+"_";
      ObjectDelete(nameObj);

      ObjectCreate(nameObj,OBJ_FIBOFAN,0,pitch_time[0],pitch_cena[0],tb1,b1);
      ObjectSet(nameObj,OBJPROP_LEVELSTYLE,STYLE_DASH);
      ObjectSet(nameObj,OBJPROP_LEVELCOLOR,ExtFiboFanMedianaDinamicColor);
      ObjectSet(nameObj,OBJPROP_BACK,ExtBack);

      screenFibo();
     }

   if (ExtISLDinamic)
     {
      n1=iBarShift(Symbol(),Period(),pitch_time[0])-(iBarShift(Symbol(),Period(),pitch_time[1])+iBarShift(Symbol(),Period(),pitch_time[2]))/2.0;
      ta1=pitch_time[1];
      a1=pitch_cena[1];
      tangens=(pitch_cena[0]-(pitch_cena[1]+pitch_cena[2])/2.0)/n1;

      ML_RL400(tangens, pitch_cena, pitch_time, tb1, b1, true);

      tc1=pitch_time[2];
      c1=pitch_cena[2];

      nameObj="ISL_D" + ExtComplekt+"_";

      ObjectDelete(nameObj);

      ObjectCreate(nameObj,OBJ_FIBOCHANNEL,0,ta1,a1,tb1,b1,tc1,c1);
      ObjectSet(nameObj,OBJPROP_LEVELCOLOR,ExtLinePitchforkD);
      ObjectSet(nameObj,OBJPROP_LEVELSTYLE,ExtPitchforkStyle);
      ObjectSet(nameObj,OBJPROP_RAY,false);
      ObjectSet(nameObj,OBJPROP_BACK,ExtBack);
      ObjectSet(nameObj,OBJPROP_COLOR,CLR_NONE);
      ObjectSet(nameObj,OBJPROP_FIBOLEVELS,6);

      if (ExtFiboType)
        {
         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+0,-0.886);
         ObjectSetFiboDescription(nameObj, 0, "   I S L 88.6"); 

         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+1,-0.786);
         ObjectSetFiboDescription(nameObj, 1, "    I S L 78.6"); 

         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+2,-0.618);
         ObjectSetFiboDescription(nameObj, 2, "    I S L 61.8"); 
        }
      else
        {
         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+0,-0.854);
         ObjectSetFiboDescription(nameObj, 0, "   I S L 85.4"); 

         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+1,-0.764);
         ObjectSetFiboDescription(nameObj, 1, "    I S L 76.4"); 

         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+2,-0.618);
         ObjectSetFiboDescription(nameObj, 2, "    I S L 61.8"); 
        }

      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+3,-0.382);
      ObjectSetFiboDescription(nameObj, 3, "    I S L 38.2"); 

      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+4,-0.236);
      ObjectSetFiboDescription(nameObj, 4, "    I S L 23.6"); 

      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+5,-0.146);
      ObjectSetFiboDescription(nameObj, 5, "    I S L 14.6"); 
     }

   if (ExtRLine)
     {
      n=iBarShift(Symbol(),Period(),pitch_time[0])-(iBarShift(Symbol(),Period(),pitch_time[1])+iBarShift(Symbol(),Period(),pitch_time[2]))/2.0;
   
      nbase1=iBarShift(Symbol(),Period(),pitch_time[1]);
      nbase2=iBarShift(Symbol(),Period(),pitch_time[2]);

      if (nbase1+n<=Bars)
        {
         mirror1=1;
         mirror2=0;

         ta1=Time[nbase1+n];
         tb1=Time[nbase2+n];
         tc1=mPitchTime[1];

         a1=(pitch_cena[0]-(mPitchCena[1]+mPitchCena[2])/2)+mPitchCena[1];
         b1=(pitch_cena[0]-(mPitchCena[1]+mPitchCena[2])/2)+mPitchCena[2];
         c1=mPitchCena[1];
        }
      else
        {
         mirror1=-1;
         mirror2=-1;

         ta1=mPitchTime[2];
         tb1=mPitchTime[1];
         tc1=Time[nbase2+n];

         a1=mPitchCena[2];
         b1=mPitchCena[1];
         c1=(pitch_cena[0]-(mPitchCena[1]+mPitchCena[2])/2)+mPitchCena[2];
        }

      nameObj="RLineD" + ExtComplekt+"_";
      ObjectDelete(nameObj);

      ObjectCreate(nameObj,OBJ_FIBOCHANNEL,0,ta1,a1,tb1,b1,tc1,c1);

      ObjectSet(nameObj,OBJPROP_LEVELCOLOR,ExtLinePitchforkD);

      if (ExtRLineBase) 
        {
         ObjectSet(nameObj,OBJPROP_COLOR,CLR_NONE);
        }
      else
        {
         ObjectSet(nameObj,OBJPROP_COLOR,ExtLinePitchforkD);
        }

      fiboRL(nameObj, mirror1, mirror2);
     }
  }
//--------------------------------------------------------
// Âûâîä âèë Ýíäðþñà äèíàìè÷åñêèõ. Êîíåö.
//--------------------------------------------------------

//--------------------------------------------------------
// Ôèáû äëÿ RLine. Êîíåö.
//--------------------------------------------------------
void fiboRL(string nameObj, int mirror1, int mirror2)
  {
      ObjectSet(nameObj,OBJPROP_LEVELSTYLE,STYLE_DOT);
      ObjectSet(nameObj,OBJPROP_RAY,false);
      ObjectSet(nameObj,OBJPROP_BACK,ExtBack);

      if (ExtFiboType)
        {
         ObjectSet(nameObj,OBJPROP_FIBOLEVELS,15);

         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+0,mirror2+mirror1*0.382);
         ObjectSetFiboDescription(nameObj, 0, " RL 38.2"); 

         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+1,mirror2+mirror1*0.5);
         ObjectSetFiboDescription(nameObj, 1, " RL 50.0"); 

         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+2,mirror2+mirror1*0.618);
         ObjectSetFiboDescription(nameObj, 2, " RL 61.8"); 

         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+3,mirror2+mirror1*0.707);
         ObjectSetFiboDescription(nameObj, 3, " RL 70.7"); 

         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+4,mirror2+mirror1*0.786);
         ObjectSetFiboDescription(nameObj, 4, " RL 78.6"); 

         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+5,mirror2+mirror1*0.886);
         ObjectSetFiboDescription(nameObj, 5, " RL 88.6"); 

         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+6,mirror2+mirror1*1.0);
         ObjectSetFiboDescription(nameObj, 6, " RL 100.0"); 

         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+7,mirror2+mirror1*1.128);
         ObjectSetFiboDescription(nameObj, 7, " RL 112.8"); 

         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+8,mirror2+mirror1*1.272);
         ObjectSetFiboDescription(nameObj, 8, " RL 127.2"); 

         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+9,mirror2+mirror1*1.414);
         ObjectSetFiboDescription(nameObj, 9, " RL 141.4"); 

         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+10,mirror2+mirror1*1.618);
         ObjectSetFiboDescription(nameObj, 10, " RL 161.8"); 

         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+11,mirror2+mirror1*2.0);
         ObjectSetFiboDescription(nameObj, 11, " RL 200.0"); 

         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+12,mirror2+mirror1*2.414);
         ObjectSetFiboDescription(nameObj, 12, " RL 241.4"); 

         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+13,mirror2+mirror1*2.618);
         ObjectSetFiboDescription(nameObj, 13, " RL 261.8"); 

         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+14,mirror2+mirror1*4.0);
         ObjectSetFiboDescription(nameObj, 14, " RL 400.0"); 

        }
      else
        {
         ObjectSet(nameObj,OBJPROP_FIBOLEVELS,12);

         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+0,mirror2+mirror1*0.236);
         ObjectSetFiboDescription(nameObj, 0, " RL 23.6"); 

         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+1,mirror2+mirror1*0.382);
         ObjectSetFiboDescription(nameObj, 1, " RL 38.2"); 

         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+2,mirror2+mirror1*0.5);
         ObjectSetFiboDescription(nameObj, 2, " RL 50.0"); 

         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+3,mirror2+mirror1*0.618);
         ObjectSetFiboDescription(nameObj, 3, " RL 61.8"); 

         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+4,mirror2+mirror1*0.764);
         ObjectSetFiboDescription(nameObj, 4, " RL 76.4"); 

         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+5,mirror2+mirror1*0.854);
         ObjectSetFiboDescription(nameObj, 5, " RL 85.4"); 

         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+6,mirror2+mirror1*1.0);
         ObjectSetFiboDescription(nameObj, 6, " RL 100.0"); 

         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+7,mirror2+mirror1*1.236);
         ObjectSetFiboDescription(nameObj, 7, " RL 123.6"); 

         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+8,mirror2+mirror1*1.618);
         ObjectSetFiboDescription(nameObj, 8, " RL 161.8"); 

         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+9,mirror2+mirror1*2.0);
         ObjectSetFiboDescription(nameObj, 9, " RL 200"); 

         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+10,mirror2+mirror1*2.618);
         ObjectSetFiboDescription(nameObj, 10, " RL 261.8"); 

         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+11,mirror2+mirror1*4.0);
         ObjectSetFiboDescription(nameObj, 11, " RL 400.0"); 
        }
  }
//--------------------------------------------------------
// Ôèáû äëÿ RLine. Êîíåö.
//--------------------------------------------------------


//--------------------------------------------------------
// Ïîäïðîãðàììà ðàñ÷åòà êîîðäèíàò 1/2 ìåäèàíû âèë Ýíäðþñà. Íà÷àëî.
//--------------------------------------------------------
// Ïåðåäàâàåìûå ïàðàìåòðû öåíà è âðåìÿ òðåõ òî÷åê âèë Ýíäðþñà
// à òàêæå ññûëêà íà ïåðåìåííûå - 
// tAB2, tBC2 - âðåìÿ áàðîâ, ÷åðåç êîòîðûå ïðîâîäèòñÿ 1/2 ìåäèàíà
// AB2, BC2 - öåíîâîå çíà÷åíèå òî÷åê, ÷åðåç êîòîðûå ïðîâîäèòñÿ 1/2 ìåäèàíà
// 
void coordinaty_1_2_mediany_AP(double A_1, double B_2, double C_3, datetime T_1, datetime T_2, datetime T_3, datetime& tAB2, datetime& tBC2, double& AB2, double& BC2)
  {
   double tangens;
   int    n1, n2, n3, nab2, nbc2;
   
   // íîìåðà áàðîâ, îò êîòîðûõ ñòðîÿòñÿ âèëû Ýíäðþñà
   n1=iBarShift(Symbol(),Period(),T_1);
   n2=iBarShift(Symbol(),Period(),T_2);
   n3=iBarShift(Symbol(),Period(),T_3);
   
   // òàíãåíñ óãëà íàêëîíà 1/2 ìåäèàíû âèë Ýíäðþñà
   tangens=(C_3 - A_1)/(n1 - n3);
   // íîìåðà áàðîâ, ÷åðåç êîòîðûå áóäåò ïîñòðîåíà 1/2 ìåäèàíà
   nab2=MathCeil((n1+n2)/2.0);
   nbc2=MathCeil((n2+n3)/2.0);
   
   // çíà÷åíèÿ öåíû òî÷åê, ÷åðåç êîòîðûå áóäåò ïîñòðîåíà 1/2 ìåäèàíà
   AB2=(A_1 + B_2)/2 - (nab2-(n1+n2)/2.0)*tangens;
   BC2=(B_2 + C_3)/2 - (nbc2-(n2+n3)/2.0)*tangens;
   // âðåìÿ áàðîâ, ÷åðåç êîòîðûå áóäåò ïîñòðîåíà 1/2 ìåäèàíà
   tAB2=Time[nab2];
   tBC2=Time[nbc2];
  }
//--------------------------------------------------------
// Ïîäïðîãðàììà ðàñ÷åòà êîîðäèíàò 1/2 ìåäèàíû âèë Ýíäðþñà. Êîíåö.
//--------------------------------------------------------


//--------------------------------------------------------
// Ïîäïðîãðàììà ðàñ÷åòà êîîðäèíàòû òî÷êè íà ìåäèàíå âèë Ýíäðþñà. Íà÷àëî.
//--------------------------------------------------------
// Ïåðåäàâàåìûå ïàðàìåòðû öåíà è âðåìÿ òðåõ òî÷åê âèë Ýíäðþñà
// à òàêæå ññûëêà íà ïåðåìåííûå - 
// tAB2, tBC2 - âðåìÿ áàðîâ, ÷åðåç êîòîðûå ïðîâîäèòñÿ 1/2 ìåäèàíà
// AB2, BC2 - öåíîâîå çíà÷åíèå òî÷åê, ÷åðåç êîòîðûå ïðîâîäèòñÿ 1/2 ìåäèàíà
// 
void coordinaty_mediany_AP(double A_1, double B_2, double C_3, datetime T_1, datetime T_2, datetime T_3, datetime& tB1, double& B1)
  {
   double tangens;
   int    n1, n2, n3, nbc2;
   
   // íîìåðà áàðîâ, îò êîòîðûõ ñòðîÿòñÿ âèëû Ýíäðþñà
   n1=iBarShift(Symbol(),Period(),T_1);
   n2=iBarShift(Symbol(),Period(),T_2);
   n3=iBarShift(Symbol(),Period(),T_3);
   
   // òàíãåíñ óãëà íàêëîíà ìåäèàíû âèë Ýíäðþñà
   tangens=(A_1-(C_3+B_2)/2)/(n1 - (n3+n2)/2.0);
   // íîìåð áàðà, ÷åðåç êîòîðûé ïðîõîäèò ìåäèàíà
   nbc2=MathCeil((n2+n3)/2.0);

   // çíà÷åíèÿ öåíû òî÷êè, ÷åðåç êîòîðûé ïðîõîäèò ìåäèàíà
   B1=(B_2 + C_3)/2 - ((n2+n3)/2.0-nbc2)*tangens;

   // âðåìÿ áàðà, ÷åðåç êîòîðûé ïðîõîäèò ìåäèàíà
   tB1=Time[nbc2];
  }
//--------------------------------------------------------
// Ïîäïðîãðàììà ðàñ÷åòà êîîðäèíàòû òî÷êè íà ìåäèàíå âèë Ýíäðþñà. Êîíåö.
//--------------------------------------------------------


//--------------------------------------------------------
// Ñðàâíåíèå ãèïîòåíóç. Íà÷àëî.
//-------------------------------------------------------
bool maxGipotenuza(datetime pitch_time1[], double pitch_cena1[])
  {
   double k2,k3;
   datetime k4,k5;
/*
   k2=MathAbs(pitch_cena1[0]-pitch_cena1[1])/Point;
   k3=MathAbs(pitch_cena1[1]-pitch_cena1[2])/Point;
   k4=(mPitchTimeSave-pitch_time1[1])/(GrossPeriod*60);
   k5=(pitch_time1[1]-pitch_time1[2])/(GrossPeriod*60);
*/
   k2=MathAbs(pitch_cena1[0]-pitch_cena1[1])/ASBar;
   k3=MathAbs(pitch_cena1[1]-pitch_cena1[2])/ASBar;
   k4=iBarShift(NULL,GrossPeriod,mPitchTimeSave)-iBarShift(NULL,GrossPeriod,pitch_time1[1]);
   k5=iBarShift(NULL,GrossPeriod,pitch_time1[1])-iBarShift(NULL,GrossPeriod,pitch_time1[2]);

   if (k2*k2+k4*k4>k3*k3+k5*k5) return(true); else return(false);
  }
//--------------------------------------------------------
// Ñðàâíåíèå ãèïîòåíóç. Êîíåö.
//-------------------------------------------------------

//--------------------------------------------------------
// Pivot Zone. Íà÷àëî.
//-------------------------------------------------------
void PivotZone(datetime pitch_time1[], double pitch_cena1[], color PivotZoneColor, string name)
  {
   datetime ta1, tb1;
   double a1, b1, d, n1;
   int m, m1, m2;
  
   ta1=pitch_time1[2];
   a1=pitch_cena1[2];
   m1=iBarShift(Symbol(),Period(),pitch_time1[0])-iBarShift(Symbol(),Period(),pitch_time1[1]);
   m2=iBarShift(Symbol(),Period(),pitch_time1[1])-iBarShift(Symbol(),Period(),pitch_time1[2]);
   m=iBarShift(Symbol(),Period(),pitch_time1[2]);
   n1=iBarShift(Symbol(),Period(),pitch_time1[0])-(iBarShift(Symbol(),Period(),pitch_time1[1])+iBarShift(Symbol(),Period(),pitch_time1[2]))/2.0;
   d=(pitch_cena1[0]-(pitch_cena1[1]+pitch_cena1[2])/2.0)/n1;

   if (m1>m2)
     {
      if (m1>m)
        {
         tb1=Time[0]+(m1-m)*Period()*60;
        }
      else
        {
         tb1=Time[iBarShift(Symbol(),Period(),pitch_time1[2])-m1];
        }
      b1=pitch_cena1[0]-d*(2*m1+m2);
     }
   else
     {
      if (m2>m)
        {
         tb1=Time[0]+(m2-m)*Period()*60;
        }
      else
        {
         tb1=Time[iBarShift(Symbol(),Period(),pitch_time1[2])-m2];
        }
      b1=pitch_cena1[0]-d*(2*m2+m1);
     }

   nameObj=name + ExtComplekt+"_";
   ObjectDelete(nameObj);

   ObjectCreate(nameObj,OBJ_RECTANGLE,0,ta1,a1,tb1,b1);
   ObjectSetText(nameObj,"PZ "+Period_tf+"  "+TimeToStr(tb1,TIME_DATE|TIME_MINUTES));
   ObjectSet(nameObj, OBJPROP_BACK, ExtPivotZoneFramework);
   ObjectSet(nameObj, OBJPROP_COLOR, PivotZoneColor); 
  }
//--------------------------------------------------------
// Pivot Zone. Êîíåö.
//-------------------------------------------------------

//--------------------------------------------------------
// Îïðåäåëåíèå òî÷êè ïåðåñå÷åíèÿ RL400 ìåäèàíû. Íà÷àëî.
//-------------------------------------------------------
// flag=true - ðàññ÷èòûâàåòñÿ ISL
// flag=false - ðàññ÷èòûâàåòñÿ UWL/LWL
void ML_RL400(double Tangens, double pitch_cena1[], datetime pitch_time1[], datetime& tB1, double& B1, bool flag)
  {
   int m, m1, m2;
  
   m1=iBarShift(Symbol(),Period(),pitch_time1[0]);
   m2=MathCeil((iBarShift(Symbol(),Period(),pitch_time1[1])+iBarShift(Symbol(),Period(),pitch_time1[2]))/2.0);
   m=(m1-m2)*4;

   if (m>m2)
     {
      tB1=Time[0]+(m-m2)*Period()*60;
      if (tB1<0) tB1=2133648000;
      if (flag) B1=pitch_cena1[1]-Tangens*(iBarShift(Symbol(),Period(),pitch_time1[1])+(tB1-Time[0])/(60*Period()));
      else  B1=pitch_cena1[0]-Tangens*(iBarShift(Symbol(),Period(),pitch_time1[0])+(tB1-Time[0])/(60*Period()));
     }
   else
     {
      tB1=Time[m2-m];
      if (flag) B1=pitch_cena1[1]-Tangens*(iBarShift(Symbol(),Period(),pitch_time1[1])-iBarShift(Symbol(),Period(),tB1));
      else  B1=pitch_cena1[0]-Tangens*(iBarShift(Symbol(),Period(),pitch_time1[0])-iBarShift(Symbol(),Period(),tB1));
     }
  }
//--------------------------------------------------------
// Îïðåäåëåíèå òî÷êè ïåðåñå÷åíèÿ RL400 ìåäèàíû. Êîíåö.
//-------------------------------------------------------


//--------------------------------------------------------
// Âûâîä ïðîèçâîëüíûõ ôèáîâååðîâ. Íà÷àëî.
//--------------------------------------------------------
void screenFiboFan()
  {
   double a1,b1;  

   a1=afrx[mFan[0]]; b1=afrx[mFan[1]];
  
   nameObj="FiboFan" + ExtComplekt+"_";

   if (mFan[1]>0)
     {
      if (ExtSave)
        {
         nameObj=nameObj + save;
        }
     }

   ObjectDelete(nameObj);

   ObjectCreate(nameObj,OBJ_FIBOFAN,0,afr[mFan[0]],a1,afr[mFan[1]],b1);
   ObjectSet(nameObj,OBJPROP_LEVELSTYLE,STYLE_DASH);
   ObjectSet(nameObj,OBJPROP_LEVELCOLOR,ExtFiboFanColor);
   ObjectSet(nameObj,OBJPROP_BACK,ExtBack);

   screenFibo();
  }
//--------------------------------------------------------
// Âûâîä ïðîèçâîëüíûõ ôèáîâååðîâ. Êîíåö.
//--------------------------------------------------------


//--------------------------------------------------------
// Ñïèñîê ôèá. Íà÷àëî.
//--------------------------------------------------------
void screenFibo()
  {
   ObjectSet(nameObj,OBJPROP_COLOR,ExtObjectColor);
   ObjectSet(nameObj,OBJPROP_STYLE,ExtObjectStyle);
   ObjectSet(nameObj,OBJPROP_WIDTH,ExtObjectWidth);

   if (!ExtFiboType)
     {
//         ObjectSet(nameObj,OBJPROP_FIBOLEVELS,18);
      ObjectSet(nameObj,OBJPROP_FIBOLEVELS,9);

      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+0,0.236);
      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+1,0.382);
      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+2,0.5);
      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+3,0.618);
      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+4,0.764);
      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+5,0.854);
      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+6,1.0);
      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+7,1.618);
//         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+8,2.0);
      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+8,2.618);
/*
         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+9,-0.236);
         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+10,-0.382);
         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+11,-0.5);
         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+12,-0.618);
         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+13,-0.764);
         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+14,-1.0);
         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+15,-1.618);
         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+16,-2.0);
         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+17,-2.618);
*/
//         if (ExtFiboFanHidden)
//           {
         ObjectSetFiboDescription(nameObj, 0, "23.6"); 
         ObjectSetFiboDescription(nameObj, 1, "38.2"); 
         ObjectSetFiboDescription(nameObj, 2, "50.0"); 
         ObjectSetFiboDescription(nameObj, 3, "61.8"); 
         ObjectSetFiboDescription(nameObj, 4, "76.4"); 
         ObjectSetFiboDescription(nameObj, 5, "85.4"); 
         ObjectSetFiboDescription(nameObj, 6, "100.0"); 
         ObjectSetFiboDescription(nameObj, 7, "161.8"); 
//            ObjectSetFiboDescription(nameObj, 8, "200.0"); 
         ObjectSetFiboDescription(nameObj, 8, "261.8"); 
/*
            ObjectSetFiboDescription(nameObj, 9, "-23.6"); 
            ObjectSetFiboDescription(nameObj, 10, "-38.2"); 
            ObjectSetFiboDescription(nameObj, 11, "-50.0"); 
            ObjectSetFiboDescription(nameObj, 12, "-61.8"); 
            ObjectSetFiboDescription(nameObj, 13, "-76.4"); 
            ObjectSetFiboDescription(nameObj, 14, "-100.0"); 
            ObjectSetFiboDescription(nameObj, 15, "-161.8"); 
            ObjectSetFiboDescription(nameObj, 16, "-200.0"); 
            ObjectSetFiboDescription(nameObj, 17, "-261.8"); 
*/
//           }
        }
      else
        {
//         ObjectSet(nameObj,OBJPROP_FIBOLEVELS,24);
         ObjectSet(nameObj,OBJPROP_FIBOLEVELS,12);

         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+0,0.382);
         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+1,0.5);
         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+2,0.618);
         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+3,0.707);
         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+4,0.786);
         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+5,0.886);
         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+6,1.0);
         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+7,1.272);
         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+8,1.414);
         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+9,1.618);
         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+10,2.0);
         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+11,2.618);
/*
         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+12,-0.382);
         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+13,-0.5);
         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+14,-0.618);
         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+15,-0.707);
         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+16,-0.786);
         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+17,-0.886);
         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+18,-1.0);
         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+19,-1.272);
         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+20,-1.414);
         bjectSet(nameObj,OBJPROP_FIRSTLEVEL+21,-1.618);
         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+22,-2.0);
         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+23,-2.618);
*/
//         if (ExtFiboFanHidden)
//           {
         ObjectSetFiboDescription(nameObj, 0, "38.2"); 
         ObjectSetFiboDescription(nameObj, 1, "50.0"); 
         ObjectSetFiboDescription(nameObj, 2, "61.8"); 
         ObjectSetFiboDescription(nameObj, 3, "70.7"); 
         ObjectSetFiboDescription(nameObj, 4, "78.6"); 
         ObjectSetFiboDescription(nameObj, 5, "88.6"); 
         ObjectSetFiboDescription(nameObj, 6, "100.0"); 
         ObjectSetFiboDescription(nameObj, 7, "127.2"); 
         ObjectSetFiboDescription(nameObj, 8, "141.4"); 
         ObjectSetFiboDescription(nameObj, 9, "161.8"); 
         ObjectSetFiboDescription(nameObj, 10, "200.0"); 
         ObjectSetFiboDescription(nameObj, 11, "261.8"); 
/*
            ObjectSetFiboDescription(nameObj, 12, "-38.2"); 
            ObjectSetFiboDescription(nameObj, 13, "-50.0"); 
            ObjectSetFiboDescription(nameObj, 14, "-61.8"); 
            ObjectSetFiboDescription(nameObj, 15, "-70.7"); 
            ObjectSetFiboDescription(nameObj, 16, "-78.6"); 
            ObjectSetFiboDescription(nameObj, 17, "-88.6"); 
            ObjectSetFiboDescription(nameObj, 18, "-100.0"); 
            ObjectSetFiboDescription(nameObj, 19, "-127.2"); 
            ObjectSetFiboDescription(nameObj, 20, "-141.4"); 
            ObjectSetFiboDescription(nameObj, 21, "-161.8"); 
            ObjectSetFiboDescription(nameObj, 22, "-200.0"); 
            ObjectSetFiboDescription(nameObj, 23, "-261.8"); 
*/
//           }
        }
  }
//--------------------------------------------------------
// Ñïèñîê ôèá. Êîíåö.
//--------------------------------------------------------


//--------------------------------------------------------
// Âûâîä ôèá ñòàòè÷åñêèõ. Íà÷àëî.
//--------------------------------------------------------
void screenFiboS()
  {
   double fibo_0, fibo_100, fiboPrice, fiboPrice1;

   nameObj="fiboS" + ExtComplekt+"_";

   if (mFibo[1]>0)
     {
      if (ExtSave)
        {
         nameObj=nameObj + save;
        }
     }

   ObjectDelete(nameObj);

   if (!ExtFiboCorrectionExpansion)
     {
      fibo_0=afrx[mFibo[0]];fibo_100=afrx[mFibo[1]];
      fiboPrice=afrx[mFibo[0]]-afrx[mFibo[1]];fiboPrice1=afrx[mFibo[1]];
     }
   else
     {
      fibo_100=afrx[mFibo[0]];fibo_0=afrx[mFibo[1]];
      fiboPrice=afrx[mFibo[1]]-afrx[mFibo[0]];fiboPrice1=afrx[mFibo[0]];
     }

   if (!ExtFiboCorrectionExpansion)
     {
      ObjectCreate(nameObj,OBJ_FIBO,0,afr[mFibo[0]],fibo_0,afr[mFibo[1]],fibo_100);
     }
   else
     {
      ObjectCreate(nameObj,OBJ_FIBO,0,afr[mFibo[1]],fibo_0,afr[mFibo[0]],fibo_100);
     }
   ObjectSet(nameObj,OBJPROP_LEVELCOLOR,ExtFiboS);

   if (ExtFiboType)
     {
      ObjectSet(nameObj,OBJPROP_FIBOLEVELS,17);
      fibo_patterns(fiboPrice, fiboPrice1,"-"+Period_tf+"                             ");
     }
   else
     {
      ObjectSet(nameObj,OBJPROP_FIBOLEVELS,14);
      fibo_standart (fiboPrice, fiboPrice1,"-"+Period_tf+"                            ");
     }
  }
//--------------------------------------------------------
// Âûâîä ôèá ñòàòè÷åñêèõ. Êîíåö.
//--------------------------------------------------------

//--------------------------------------------------------
// Âûâîä ôèá äèíàìè÷åñêèõ. Íà÷àëî.
//--------------------------------------------------------
void screenFiboD()
  {
   double fibo_0, fibo_100, fiboPrice, fiboPrice1;

   nameObj="fiboD" + ExtComplekt+"_";

   ObjectDelete(nameObj);

   if (!ExtFiboCorrectionExpansion)
     {
      fibo_0=afrx[1];fibo_100=afrx[0];
      fiboPrice=afrx[1]-afrx[0];fiboPrice1=afrx[0];
     }
   else
     {
      fibo_100=afrx[1];fibo_0=afrx[0];
      fiboPrice=afrx[0]-afrx[1];fiboPrice1=afrx[1];
     }

   if (!ExtFiboCorrectionExpansion)
     {
      ObjectCreate(nameObj,OBJ_FIBO,0,afr[1],fibo_0,afr[0],fibo_100);
     }
   else
     {
      ObjectCreate(nameObj,OBJ_FIBO,0,afr[0],fibo_0,afr[1],fibo_100);
     }

   ObjectSet(nameObj,OBJPROP_LEVELCOLOR,ExtFiboD);

   if (ExtFiboType)
     {
      ObjectSet(nameObj,OBJPROP_FIBOLEVELS,17);
      fibo_patterns(fiboPrice, fiboPrice1,"-"+Period_tf);
     }
   else
     {
      ObjectSet(nameObj,OBJPROP_FIBOLEVELS,14);
      fibo_standart (fiboPrice, fiboPrice1,"-"+Period_tf);
     }

  }
//--------------------------------------------------------
// Âûâîä ôèá äèíàìè÷åñêèõ. Êîíåö.
//--------------------------------------------------------


//--------------------------------------------------------
// Ôèáû ñ ïàòòåðíàìè. Íà÷àëî.
//--------------------------------------------------------
void fibo_patterns(double fiboPrice,double fiboPrice1,string fibo)
  {

   ObjectSet(nameObj,OBJPROP_COLOR,ExtObjectColor);
   ObjectSet(nameObj,OBJPROP_STYLE,ExtObjectStyle);
   ObjectSet(nameObj,OBJPROP_WIDTH,ExtObjectWidth);
   ObjectSet(nameObj,OBJPROP_LEVELSTYLE,STYLE_DOT);
   ObjectSet(nameObj,OBJPROP_BACK,ExtBack);

   if (!ExtFiboCorrectionExpansion)
     {   
      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL,0);
      ObjectSetFiboDescription(nameObj, 0, "0 "+DoubleToStr(fiboPrice1, Digits)+fibo); 
     
      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+1,0.382);
      ObjectSetFiboDescription(nameObj, 1, "38.2 "+DoubleToStr(fiboPrice*0.382+fiboPrice1, Digits)+fibo); 
    
      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+2,0.5);
      ObjectSetFiboDescription(nameObj, 2, "50.0 "+DoubleToStr(fiboPrice*0.5+fiboPrice1, Digits)+fibo); 

      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+3,0.618);
      ObjectSetFiboDescription(nameObj, 3, "61.8 "+DoubleToStr(fiboPrice*0.618+fiboPrice1, Digits)+fibo); 

      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+4,0.707);
      ObjectSetFiboDescription(nameObj, 4, "70.7 "+DoubleToStr(fiboPrice*0.707+fiboPrice1, Digits)+fibo); 

      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+5,0.786);
      ObjectSetFiboDescription(nameObj, 5, "78.6 "+DoubleToStr(fiboPrice*0.786+fiboPrice1, Digits)+fibo); 
     
      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+6,0.854);
      ObjectSetFiboDescription(nameObj, 6, "85.4 "+DoubleToStr(fiboPrice*0.854+fiboPrice1, Digits)+fibo); 
 
      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+7,0.886);
      ObjectSetFiboDescription(nameObj, 7, "88.6 "+DoubleToStr(fiboPrice*0.886+fiboPrice1, Digits)+fibo); 

      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+8,1.0);
      ObjectSetFiboDescription(nameObj, 8, "100.0 "+DoubleToStr(fiboPrice+fiboPrice1, Digits)+fibo); 
     
      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+9,1.128);
      ObjectSetFiboDescription(nameObj, 9, "112.8 "+DoubleToStr(fiboPrice*1.128+fiboPrice1, Digits)+fibo); 
     
      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+10,1.272);
      ObjectSetFiboDescription(nameObj, 10, "127.2 "+DoubleToStr(fiboPrice*1.272+fiboPrice1, Digits)+fibo); 

      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+11,1.414);
      ObjectSetFiboDescription(nameObj, 11, "141.4 "+DoubleToStr(fiboPrice*1.414+fiboPrice1, Digits)+fibo); 
     
      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+12,1.618);
      ObjectSetFiboDescription(nameObj, 12, "161.8 "+DoubleToStr(fiboPrice*1.618+fiboPrice1, Digits)+fibo); 
     
      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+13,2.0);
      ObjectSetFiboDescription(nameObj, 13, "200.0 "+DoubleToStr(fiboPrice*2.0+fiboPrice1, Digits)+fibo); 

      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+14,2.414);
      ObjectSetFiboDescription(nameObj, 14, "241.4 "+DoubleToStr(fiboPrice*2.414+fiboPrice1, Digits)+fibo); 

      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+15,2.618);
      ObjectSetFiboDescription(nameObj, 15, "261.8 "+DoubleToStr(fiboPrice*2.618+fiboPrice1, Digits)+fibo); 

      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+16,4.0);
      ObjectSetFiboDescription(nameObj, 16, "400.0 "+DoubleToStr(fiboPrice*4.0+fiboPrice1, Digits)+fibo);
     }
   else
     {
      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL,0);
      ObjectSetFiboDescription(nameObj, 0, "Fe 1 "+DoubleToStr(fiboPrice+fiboPrice1, Digits)+fibo); 

      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL,1);
      ObjectSetFiboDescription(nameObj, 1, "Fe 0 "+DoubleToStr(fiboPrice1, Digits)+fibo); 

      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+2,1.382);
      ObjectSetFiboDescription(nameObj, 2, "Fe 38.2 "+DoubleToStr(fiboPrice*1.382+fiboPrice1, Digits)+fibo); 

      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+3,1.5);
      ObjectSetFiboDescription(nameObj, 3, "Fe 50.0 "+DoubleToStr(fiboPrice*1.5+fiboPrice1, Digits)+fibo); 

      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+4,1.618);
      ObjectSetFiboDescription(nameObj, 4, "Fe 61.8 "+DoubleToStr(fiboPrice*1.618+fiboPrice1, Digits)+fibo); 

      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+5,1.707);
      ObjectSetFiboDescription(nameObj, 5, "Fe 70.7 "+DoubleToStr(fiboPrice*1.707+fiboPrice1, Digits)+fibo); 

      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+6,1.786);
      ObjectSetFiboDescription(nameObj, 6, "Fe 78.6 "+DoubleToStr(fiboPrice*1.786+fiboPrice1, Digits)+fibo); 
     
      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+7,1.854);
      ObjectSetFiboDescription(nameObj, 7, "Fe 85.4 "+DoubleToStr(fiboPrice*1.854+fiboPrice1, Digits)+fibo); 
 
      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+8,1.886);
      ObjectSetFiboDescription(nameObj, 8, "Fe 88.6 "+DoubleToStr(fiboPrice*1.886+fiboPrice1, Digits)+fibo); 

      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+9,2.0);
      ObjectSetFiboDescription(nameObj, 9, "Fe 100.0 "+DoubleToStr(fiboPrice*2+fiboPrice1, Digits)+fibo); 
     
      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+10,2.128);
      ObjectSetFiboDescription(nameObj, 10, "Fe 112.8 "+DoubleToStr(fiboPrice*2.128+fiboPrice1, Digits)+fibo); 
     
      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+11,2.272);
      ObjectSetFiboDescription(nameObj, 11, "Fe 127.2 "+DoubleToStr(fiboPrice*2.272+fiboPrice1, Digits)+fibo); 

      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+12,2.414);
      ObjectSetFiboDescription(nameObj, 12, "Fe 141.4 "+DoubleToStr(fiboPrice*2.414+fiboPrice1, Digits)+fibo); 
     
      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+13,2.618);
      ObjectSetFiboDescription(nameObj, 13, "Fe 161.8 "+DoubleToStr(fiboPrice*2.618+fiboPrice1, Digits)+fibo); 
     
      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+14,3.0);
      ObjectSetFiboDescription(nameObj, 14, "Fe 200.0 "+DoubleToStr(fiboPrice*3.0+fiboPrice1, Digits)+fibo); 

      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+15,3.414);
      ObjectSetFiboDescription(nameObj, 15, "Fe 241.4 "+DoubleToStr(fiboPrice*3.414+fiboPrice1, Digits)+fibo); 

      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+16,3.618);
      ObjectSetFiboDescription(nameObj, 16, "Fe 261.8 "+DoubleToStr(fiboPrice*3.618+fiboPrice1, Digits)+fibo); 
     }
  }
//--------------------------------------------------------
// Ôèáû ñ ïàòòåðíàìè. Êîíåö.
//--------------------------------------------------------


//--------------------------------------------------------
// Ôèáû ñòàíäàðòíûå. Íà÷àëî.
//--------------------------------------------------------
void fibo_standart(double fiboPrice,double fiboPrice1,string fibo)
  {

   ObjectSet(nameObj,OBJPROP_COLOR,ExtObjectColor);
   ObjectSet(nameObj,OBJPROP_STYLE,ExtObjectStyle);
   ObjectSet(nameObj,OBJPROP_WIDTH,ExtObjectWidth);

   if (!ExtFiboCorrectionExpansion)
     {   
      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL,0);
      ObjectSetFiboDescription(nameObj, 0, "0 "+DoubleToStr(fiboPrice1, Digits)+fibo); 
   
      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+1,0.146);
      ObjectSetFiboDescription(nameObj, 1, "14.6 "+DoubleToStr(fiboPrice*0.146+fiboPrice1, Digits)+fibo); 

      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+2,0.236);
      ObjectSetFiboDescription(nameObj, 2, "23.6 "+DoubleToStr(fiboPrice*0.236+fiboPrice1, Digits)+fibo); 

      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+3,0.382);
      ObjectSetFiboDescription(nameObj, 3, "38.2 "+DoubleToStr(fiboPrice*0.382+fiboPrice1, Digits)+fibo); 
   
      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+4,0.5);
      ObjectSetFiboDescription(nameObj, 4, "50.0 "+DoubleToStr(fiboPrice*0.5+fiboPrice1, Digits)+fibo); 

      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+5,0.618);
      ObjectSetFiboDescription(nameObj, 5, "61.8 "+DoubleToStr(fiboPrice*0.618+fiboPrice1, Digits)+fibo); 

      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+6,0.764);
      ObjectSetFiboDescription(nameObj, 6, "76.4 "+DoubleToStr(fiboPrice*0.764+fiboPrice1, Digits)+fibo); 
   
      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+7,0.854);
      ObjectSetFiboDescription(nameObj, 7, "85.4 "+DoubleToStr(fiboPrice*0.854+fiboPrice1, Digits)+fibo); 

      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+8,1.0);
      ObjectSetFiboDescription(nameObj, 8, "100.0 "+DoubleToStr(fiboPrice+fiboPrice1, Digits)+fibo); 
   
      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+9,1.236);
      ObjectSetFiboDescription(nameObj, 9, "1.236 "+DoubleToStr(fiboPrice*1.236+fiboPrice1, Digits)+fibo); 

      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+10,1.618);
      ObjectSetFiboDescription(nameObj, 10, "161.8 "+DoubleToStr(fiboPrice*1.618+fiboPrice1, Digits)+fibo); 
   
      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+11,2.618);
      ObjectSetFiboDescription(nameObj, 11, "261.8 "+DoubleToStr(fiboPrice*2.618+fiboPrice1, Digits)+fibo); 

      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+12,4.236);
      ObjectSetFiboDescription(nameObj, 12, "423.6 "+DoubleToStr(fiboPrice*4.236+fiboPrice1, Digits)+fibo); 

      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+13,6.854);
      ObjectSetFiboDescription(nameObj, 13, "685.4 "+DoubleToStr(fiboPrice*6.854+fiboPrice1, Digits)+fibo); 
     }
   else
     {
      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL,0);
      ObjectSetFiboDescription(nameObj, 0, "Fe 1 "+DoubleToStr(fiboPrice+fiboPrice1, Digits)+fibo); 

      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL,1);
      ObjectSetFiboDescription(nameObj, 1, "Fe 0 "+DoubleToStr(fiboPrice1, Digits)+fibo); 

      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+2,1.236);
      ObjectSetFiboDescription(nameObj, 2, "Fe 23.6 "+DoubleToStr(fiboPrice*1.236+fiboPrice1, Digits)+fibo); 

      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+3,1.382);
      ObjectSetFiboDescription(nameObj, 3, "Fe 38.2 "+DoubleToStr(fiboPrice*1.382+fiboPrice1, Digits)+fibo); 

      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+4,1.5);
      ObjectSetFiboDescription(nameObj, 4, "Fe 50.0 "+DoubleToStr(fiboPrice*1.5+fiboPrice1, Digits)+fibo); 

      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+5,1.618);
      ObjectSetFiboDescription(nameObj, 5, "Fe 61.8 "+DoubleToStr(fiboPrice*1.618+fiboPrice1, Digits)+fibo); 

      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+6,1.764);
      ObjectSetFiboDescription(nameObj, 6, "Fe 76.4 "+DoubleToStr(fiboPrice*1.764+fiboPrice1, Digits)+fibo); 
   
      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+7,1.854);
      ObjectSetFiboDescription(nameObj, 7, "Fe 85.4 "+DoubleToStr(fiboPrice*1.854+fiboPrice1, Digits)+fibo); 

      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+8,2.0);
      ObjectSetFiboDescription(nameObj, 8, "Fe 100.0 "+DoubleToStr(fiboPrice*2+fiboPrice1, Digits)+fibo); 
   
      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+9,2.236);
      ObjectSetFiboDescription(nameObj, 9, "Fe 1.236 "+DoubleToStr(fiboPrice*2.236+fiboPrice1, Digits)+fibo); 

      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+10,2.618);
      ObjectSetFiboDescription(nameObj, 10, "Fe 161.8 "+DoubleToStr(fiboPrice*2.618+fiboPrice1, Digits)+fibo); 
   
      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+11,3.618);
      ObjectSetFiboDescription(nameObj, 11, "Fe 261.8 "+DoubleToStr(fiboPrice*3.618+fiboPrice1, Digits)+fibo); 

      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+12,5.236);
      ObjectSetFiboDescription(nameObj, 12, "Fe 423.6 "+DoubleToStr(fiboPrice*5.236+fiboPrice1, Digits)+fibo); 

      ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+13,7.854);
      ObjectSetFiboDescription(nameObj, 13, "Fe 685.4 "+DoubleToStr(fiboPrice*7.854+fiboPrice1, Digits)+fibo); 
     }
  }
//--------------------------------------------------------
// Ôèáû ñòàíäàðòíûå. Êîíåö.
//--------------------------------------------------------


//--------------------------------------------------------
// Âûâîä ôèáî-äóã ñòàòè÷åñêèõ. Íà÷àëî.
//--------------------------------------------------------
void screenFiboArcS()
  {
   double fibo_0, fibo_100, AutoScale;

   fibo_0=afrx[mArcS[0]];fibo_100=afrx[mArcS[1]];

   if (ExtArcStaticScale>0)
     {
      AutoScale=ExtArcStaticScale;
     }
   else
     {
      AutoScale=(MathAbs(fibo_0-fibo_100)/Point)/MathAbs(iBarShift(Symbol(),Period(),afr[mArcS[1]])-iBarShift(Symbol(),Period(),afr[mArcS[0]]));
     }

   nameObj="FiboArcS" + ExtComplekt+"_";
   if (ExtSave)
     {
      nameObj=nameObj + save;
     }
   ObjectDelete(nameObj);

   ObjectCreate(nameObj,OBJ_FIBOARC,0,afr[mArcS[0]],fibo_0,afr[mArcS[1]],fibo_100);

   fiboArc(nameObj, AutoScale, ExtArcStaticColor);
  }
//--------------------------------------------------------
// Âûâîä ôèáî-äóã ñòàòè÷åñêèõ. Êîíåö.
//--------------------------------------------------------

//--------------------------------------------------------
// Âûâîä ôèáî-äóã äèíàìè÷åñêèõ. Íà÷àëî.
//--------------------------------------------------------
void screenFiboArcD()
  {
   double fibo_0, fibo_100, AutoScale;

   fibo_0=afrx[mArcD[0]];fibo_100=afrx[mArcD[1]];

   if (ExtArcDinamicScale>0)
     {
      AutoScale=ExtArcDinamicScale;
     }
   else
     {
      AutoScale=(MathAbs(fibo_0-fibo_100)/Point)/MathAbs(iBarShift(Symbol(),Period(),afr[mArcD[1]])-iBarShift(Symbol(),Period(),afr[mArcD[0]]));
     }

   nameObj="FiboArcD" + ExtComplekt+"_";
   if (ExtSave)
     {
      nameObj=nameObj + save;
     }
   ObjectDelete(nameObj);

   ObjectCreate(nameObj,OBJ_FIBOARC,0,afr[mArcD[0]],fibo_0,afr[mArcD[1]],fibo_100);

   fiboArc(nameObj, AutoScale, ExtArcDinamicColor);
  }
//--------------------------------------------------------
// Âûâîä ôèáî-äóã äèíàìè÷åñêèõ. Êîíåö.
//--------------------------------------------------------


//--------------------------------------------------------
// Ôèáû äëÿ ôèáî-äóã ñòàòè÷åñêèõ. Íà÷àëî.
//--------------------------------------------------------
void fiboArc(string nameObj, double AutoScale, color ArcColor)
  {
   ObjectSet(nameObj,OBJPROP_SCALE,AutoScale);
   ObjectSet(nameObj,OBJPROP_BACK,ExtBack);
   ObjectSet(nameObj,OBJPROP_COLOR,ExtObjectColor);
   ObjectSet(nameObj,OBJPROP_STYLE,ExtObjectStyle);
   ObjectSet(nameObj,OBJPROP_WIDTH,ExtObjectWidth);
   ObjectSet(nameObj,OBJPROP_ELLIPSE,true);
   ObjectSet(nameObj,OBJPROP_FIBOLEVELS,16);
   ObjectSet(nameObj,OBJPROP_LEVELCOLOR,ArcColor);
//   ObjectSet(nameObj,OBJPROP_LEVELSTYLE,ExtArcStyle);
//   ObjectSet(nameObj,OBJPROP_LEVELWIDTH,ExtArcWidth);

   ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+0,0);
   ObjectSetFiboDescription(nameObj,0,"0");

   ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+1,0.146);
   ObjectSetFiboDescription(nameObj,1,"14.6");

   ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+2,0.236);
   ObjectSetFiboDescription(nameObj,2,"23.6");

   ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+3,0.382);
   ObjectSetFiboDescription(nameObj,3,"38.2");

   ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+4,0.5);
   ObjectSetFiboDescription(nameObj,4,"50.0");

   ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+5,0.618);
   ObjectSetFiboDescription(nameObj,5,"61.8");

   ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+8,1.0);
   ObjectSetFiboDescription(nameObj,8,"100.0");

   ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+10,1.618);
   ObjectSetFiboDescription(nameObj,10,"161.8");

   ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+11,2);
   ObjectSetFiboDescription(nameObj,11,"200.0");

   ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+12,2.618);
   ObjectSetFiboDescription(nameObj,12,"261.8");

   ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+13,3);
   ObjectSetFiboDescription(nameObj,13,"300.0");

   ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+14,4.236);
   ObjectSetFiboDescription(nameObj,14,"423.6");

   ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+15,4.618);
   ObjectSetFiboDescription(nameObj,15,"461.8");

   if (ExtFiboType)
     {
   ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+6,0.786);
   ObjectSetFiboDescription(nameObj,6,"78.6");

   ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+7,0.886);
   ObjectSetFiboDescription(nameObj,7,"88.6");

   ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+9,1.272);
   ObjectSetFiboDescription(nameObj,9,"127.2");
     }
   else
     {
   ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+6,0.764);
   ObjectSetFiboDescription(nameObj,6,"76.4");

   ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+7,0.854);
   ObjectSetFiboDescription(nameObj,7,"85.4");

   ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+9,1.236);
   ObjectSetFiboDescription(nameObj,9,"123.6");
     }
  }
//--------------------------------------------------------
// Ôèáû äëÿ ôèáî-äóã ñòàòè÷åñêèõ. Êîíåö.
//--------------------------------------------------------


//--------------------------------------------------------
// Âûâîä ôèáî-âååðîâ ñòàòè÷åñêèõ. Íà÷àëî.
//--------------------------------------------------------
void screenFiboFanS()
  {
   double fiboPrice1, fiboPrice2;

   nameObj="fiboFanS" + ExtComplekt+"_";
   ObjectDelete(nameObj);

   if (ExtPitchforkCandle)
     {
      if (ExtPitchfork_1_HighLow)
        {
         fiboPrice1=mPitchCena[1];fiboPrice2=mPitchCena[2];
        }
      else 
        {
         fiboPrice1=mPitchCena[1];fiboPrice2=mPitchCena[2];
        }
      ObjectCreate(nameObj,OBJ_FIBOFAN,0,mPitchTime[1],fiboPrice1,mPitchTime[2],fiboPrice2);
     }
   else
     {
      if (afrl[mPitch[1]]>0) 
        {
         fiboPrice1=afrl[mPitch[1]];fiboPrice2=afrh[mPitch[2]];
        }
      else 
        {
         fiboPrice1=afrh[mPitch[1]];fiboPrice2=afrl[mPitch[2]];
        }
      ObjectCreate(nameObj,OBJ_FIBOFAN,0,afr[mPitch[1]],fiboPrice1,afr[mPitch[2]],fiboPrice2);
     }

   ObjectSet(nameObj,OBJPROP_LEVELCOLOR,ExtFiboFanS);

   FiboFanLevel();

  }
//--------------------------------------------------------
// Âûâîä ôèáî-âååðîâ ñòàòè÷åñêèõ. Êîíåö.
//--------------------------------------------------------


//--------------------------------------------------------
// Âûâîä ôèáî-âååðîâ äèíàìè÷åñêèõ. Íà÷àëî.
//--------------------------------------------------------
void screenFiboFanD()
  {
   double fiboPrice1, fiboPrice2;

   nameObj="fiboFanD" + ExtComplekt+"_";

   ObjectDelete(nameObj);

   fiboPrice1=afrx[1];fiboPrice2=afrx[0];

   ObjectCreate(nameObj,OBJ_FIBOFAN,0,afr[1],fiboPrice1,afr[0],fiboPrice2);
   ObjectSet(nameObj,OBJPROP_LEVELCOLOR,ExtFiboFanD);

   FiboFanLevel();
  }
//--------------------------------------------------------
// Âûâîä ôèáî-âååðîâ äèíàìè÷åñêèõ. Êîíåö.
//--------------------------------------------------------

//--------------------------------------------------------
// Óðîâíè ôèáî-âååðîâ. Êîíåö.
//--------------------------------------------------------
void FiboFanLevel()
  {
   if(ExtFiboFanExp) ObjectSet(nameObj,OBJPROP_FIBOLEVELS,6); else ObjectSet(nameObj,OBJPROP_FIBOLEVELS,4);

   ObjectSet(nameObj,OBJPROP_COLOR,ExtObjectColor);
   ObjectSet(nameObj,OBJPROP_STYLE,ExtObjectStyle);
   ObjectSet(nameObj,OBJPROP_WIDTH,ExtObjectWidth);

   ObjectSet(nameObj,OBJPROP_LEVELSTYLE,STYLE_DASH);
   ObjectSet(nameObj,OBJPROP_BACK,ExtBack);
   ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+0,0.236);
   ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+1,0.382);
   ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+2,0.5);
   ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+3,0.618);

   if (ExtFiboFanHidden)
     {
      ObjectSetFiboDescription(nameObj, 0, "23.6"); 
      ObjectSetFiboDescription(nameObj, 1, "38.2"); 
      ObjectSetFiboDescription(nameObj, 2, "50.0"); 
      ObjectSetFiboDescription(nameObj, 3, "61.8"); 
     }
   if(ExtFiboFanExp)
     {
      if (!ExtFiboType)
        {
         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+4,0.764);
         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+5,0.854);

         if (ExtFiboFanHidden)
           {
            ObjectSetFiboDescription(nameObj, 4, "76.4"); 
            ObjectSetFiboDescription(nameObj, 5, "85.4"); 
           }
        }
      else
        {
         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+4,0.786);
         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+5,0.886);

         if (ExtFiboFanHidden)
           {
            ObjectSetFiboDescription(nameObj, 4, "78.6"); 
            ObjectSetFiboDescription(nameObj, 5, "88.6"); 
           }
        }
     }
  }
//--------------------------------------------------------
//  Óðîâíè ôèáî-âååðîâ. Íà÷àëî.
//--------------------------------------------------------


//--------------------------------------------------------
// Âûâîä ðàñøèðåíèé Ôèáîíà÷÷è. Íà÷àëî.
//--------------------------------------------------------
void FiboExpansion()
  {
   string tf="-"+Period_tf;
   if (ExtFiboExpansion>1)
     {
      double znach1,znach2;
      nameObj="fiboExpansion" + ExtComplekt+"_";
      if (mExpansion[2]>0)
        {
         if (ExtSave)
           {
            nameObj=nameObj + save;
           }
        }

      ObjectDelete(nameObj);
      if (afrl[mExpansion[0]]>0)
        {
         ObjectCreate(nameObj,OBJ_EXPANSION,0,afr[mExpansion[0]],afrl[mExpansion[0]],afr[mExpansion[1]],afrh[mExpansion[1]],afr[mExpansion[2]],afrl[mExpansion[2]]);
         znach1=afrh[mExpansion[1]]-afrl[mExpansion[0]];
         znach2=afrl[mExpansion[2]];
        }
      else
        {
         ObjectCreate(nameObj,OBJ_EXPANSION,0,afr[mExpansion[0]],afrh[mExpansion[0]],afr[mExpansion[1]],afrl[mExpansion[1]],afr[mExpansion[2]],afrh[mExpansion[2]]);
         znach1=-(afrh[mExpansion[0]]-afrl[mExpansion[1]]);
         znach2=afrh[mExpansion[2]];
        }

      ObjectSet(nameObj,OBJPROP_COLOR,ExtObjectColor);
      ObjectSet(nameObj,OBJPROP_STYLE,ExtObjectStyle);
      ObjectSet(nameObj,OBJPROP_WIDTH,ExtObjectWidth);
      ObjectSet(nameObj,OBJPROP_LEVELCOLOR,ExtFiboExpansionColor);
      ObjectSet(nameObj,OBJPROP_LEVELSTYLE,STYLE_DOT);
      ObjectSet(nameObj,OBJPROP_BACK,ExtBack);

      if (!ExtFiboType)
        {   
         ObjectSet(nameObj,OBJPROP_FIBOLEVELS,11);

         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+0,0.236);
         ObjectSetFiboDescription(nameObj, 0, "FE 23.6  "+DoubleToStr(znach1*0.236+znach2, Digits)+tf); 

         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+1,0.382);
         ObjectSetFiboDescription(nameObj, 1, "FE 38.2  "+DoubleToStr(znach1*0.382+znach2, Digits)+tf); 

         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+2,0.5);
         ObjectSetFiboDescription(nameObj, 2, "FE 50.0  "+DoubleToStr(znach1*0.5+znach2, Digits)+tf); 

         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+3,0.618);
         ObjectSetFiboDescription(nameObj, 3, "FE 61.8  "+DoubleToStr(znach1*0.618+znach2, Digits)+tf); 

         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+4,0.764);
         ObjectSetFiboDescription(nameObj, 4, "FE 76.4  "+DoubleToStr(znach1*0.764+znach2, Digits)+tf); 

         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+5,0.854);
         ObjectSetFiboDescription(nameObj, 5, "FE 85.4  "+DoubleToStr(znach1*0.854+znach2, Digits)+tf); 

         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+6,1.0);
         ObjectSetFiboDescription(nameObj, 6, "FE 100.0  "+DoubleToStr(znach1+znach2, Digits)+tf); 

         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+7,1.236);
         ObjectSetFiboDescription(nameObj, 7, "FE 1.236  "+DoubleToStr(znach1*1.236+znach2, Digits)+tf); 

         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+8,1.618);
         ObjectSetFiboDescription(nameObj, 8, "FE 161.8  "+DoubleToStr(znach1*1.618+znach2, Digits)+tf); 

         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+9,2.0);
         ObjectSetFiboDescription(nameObj, 9, "FE 200.0  "+DoubleToStr(znach1*2+znach2, Digits)+tf); 

         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+10,2.618);
         ObjectSetFiboDescription(nameObj, 10, "FE 261.8  "+DoubleToStr(znach1*2.618+znach2, Digits)+tf); 
        }
      else
        {
         ObjectSet(nameObj,OBJPROP_FIBOLEVELS,12);

         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+0,0.382);
         ObjectSetFiboDescription(nameObj, 0, "FE 38.2  "+DoubleToStr(znach1*0.382+znach2, Digits)+tf); 

         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+1,0.5);
         ObjectSetFiboDescription(nameObj, 1, "FE 50.0  "+DoubleToStr(znach1*0.5+znach2, Digits)+tf); 

         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+2,0.618);
         ObjectSetFiboDescription(nameObj, 2, "FE 61.8  "+DoubleToStr(znach1*0.618+znach2, Digits)+tf); 

         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+3,0.707);
         ObjectSetFiboDescription(nameObj, 3, "FE 70.7  "+DoubleToStr(znach1*0.707+znach2, Digits)+tf); 

         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+4,0.786);
         ObjectSetFiboDescription(nameObj, 4, "FE 78.6  "+DoubleToStr(znach1*0.786+znach2, Digits)+tf); 
 
         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+5,0.886);
         ObjectSetFiboDescription(nameObj, 5, "FE 88.6  "+DoubleToStr(znach1*0.886+znach2, Digits)+tf); 

         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+6,1.0);
         ObjectSetFiboDescription(nameObj, 6, "FE 100.0  "+DoubleToStr(znach1+znach2, Digits)+tf); 

         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+7,1.272);
         ObjectSetFiboDescription(nameObj, 7, "FE 127.2  "+DoubleToStr(znach1*1.272+znach2, Digits)+tf); 

         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+8,1.414);
         ObjectSetFiboDescription(nameObj, 8, "FE 141.4  "+DoubleToStr(znach1*1.414+znach2, Digits)+tf); 

         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+9,1.618);
         ObjectSetFiboDescription(nameObj, 9, "FE 161.8  "+DoubleToStr(znach1*1.618+znach2, Digits)+tf); 

         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+10,2.0);
         ObjectSetFiboDescription(nameObj, 10, "FE 200.0  "+DoubleToStr(znach1*2+znach2, Digits)+tf); 

         ObjectSet(nameObj,OBJPROP_FIRSTLEVEL+11,2.618);
         ObjectSetFiboDescription(nameObj, 11, "FE 261.8  "+DoubleToStr(znach1*2.618+znach2, Digits)+tf); 
        }
     }
  }
//--------------------------------------------------------
// Âûâîä ðàñøèðåíèé Ôèáîíà÷÷è. Êîíåö.
//--------------------------------------------------------


//--------------------------------------------------------
// Óäàëåíèå îáúåêòîâ. Íà÷àëî.
// Óäàëåíèå ñîåäèíèòåëüíûõ ëèíèé è ÷èñåë.
//--------------------------------------------------------
void delete_objects1()
  {
   int i;
   string txt;

   for (i=ObjectsTotal(); i>=0; i--)
     {
      txt=ObjectName(i);
      if (StringFind(txt,"_" + ExtComplekt + "pl")>-1) ObjectDelete (txt);
      if (StringFind(txt,"_" + ExtComplekt + "ph")>-1) ObjectDelete (txt);
     }
  }
//--------------------------------------------------------
// Óäàëåíèå îáúåêòîâ. Êîíåö.
// Óäàëåíèå ñîåäèíèòåëüíûõ ëèíèé è ÷èñåë.
//--------------------------------------------------------

//--------------------------------------------------------
// Óäàëåíèå îáúåêòîâ. Íà÷àëî.
// Óäàëåíèå ñîåäèíèòåëüíûõ ëèíèé è ÷èñåë.
//--------------------------------------------------------
void delete_objects2(string txt1)
  {
   int i;
   string txt;

   for (i=ObjectsTotal(); i>=0; i--)
     {
      txt=ObjectName(i);
      if (StringFind(txt,txt1)>-1)ObjectDelete (txt);
     }
  }
//--------------------------------------------------------
// Óäàëåíèå îáúåêòîâ. Êîíåö.
// Óäàëåíèå ñîåäèíèòåëüíûõ ëèíèé è ÷èñåë.
//--------------------------------------------------------

//--------------------------------------------------------
// Óäàëåíèå îáúåêòîâ. Íà÷àëî.
// Óäàëåíèå òðåóãîëüãèêîâ è ðàìêè äëÿ òî÷êè D ïàòòåðíà.
//--------------------------------------------------------
void delete_objects3()
  {
   int i;
   string txt;

   for (i=ObjectsTotal(); i>=0; i--)
     {
      txt=ObjectName(i);
      if (StringFind(txt,"_"+ExtComplekt+"Triangle")>-1)ObjectDelete (txt);
     }

   if (RangeForPointD>0)
     {
      FlagForD=true;
      ObjectDelete("_"+ExtComplekt+"PointD");
     }
  }
//--------------------------------------------------------
// Óäàëåíèå îáúåêòîâ. Êîíåö.
// Óäàëåíèå òðåóãîëüãèêîâ è ðàìêè äëÿ òî÷êè D ïàòòåðíà.
//--------------------------------------------------------

//--------------------------------------------------------
// Óäàëåíèå äèíàìè÷åñêèõ îáúåêòîâ. Íà÷àëî.
//--------------------------------------------------------
void delete_objects_dinamic()
  {
   int i;
   
   delete_objects1();
   ObjectDelete("fiboD" + ExtComplekt+"_");
   ObjectDelete("fiboFanD" + ExtComplekt+"_");
   ObjectDelete("RLineD" + ExtComplekt+"_");
   ObjectDelete("pitchforkD" + ExtComplekt+"_");
   ObjectDelete("ISL_D" + ExtComplekt+"_");
   ObjectDelete("pmedianaD" + ExtComplekt+"_");
   ObjectDelete("1-2pmedianaD" + ExtComplekt+"_");
   ObjectDelete("fiboExpansion" + ExtComplekt+"_");
   ObjectDelete("PivotZoneD" + ExtComplekt+"_");
   ObjectDelete("FanMedianaDinamic" + ExtComplekt+"_");
   ObjectDelete("FiboArcD" + ExtComplekt+"_");

   for (i=0; i<7; i++)
     {
      nameObj="VLD"+i+" " + ExtComplekt+"_";
      ObjectDelete(nameObj);
     }
  }
//--------------------------------------------------------
// Óäàëåíèå äèíàìè÷åñêèõ îáúåêòîâ. Êîíåö.
//--------------------------------------------------------



//----------------------------------------------------
//  ZigZag (èç ÌÒ4 íåìíîãî èçìåíåííûé). Íà÷àëî.
//----------------------------------------------------
void ZigZag_()
  {
//  ZigZag èç ÌÒ. Íà÷àëî.
   int    shift, back,lasthighpos,lastlowpos;
   double val,res;
   double curlow,curhigh,lasthigh,lastlow;
   int    vDepth = 0;
   int    Depth;
   bool   endCyklDirection=true;

   if (ExtIndicator==11)
     {
      bool     endCykl=false;
      Depth    = minDepth;
     }
   else
     {
      Depth    = minBars;
      minDepth = minBars;
      maxDepth = minBars;
     }

   if (DirectionOfSearchMaxMin) vDepth = maxDepth; else vDepth = minDepth;

   while (endCyklDirection)
     {

      if (ExtIndicator==11)
        {

         for (shift=Bars-1;shift>=0; shift--) // îáíóëÿåì èíäèêàòîðíûå áóôåðû
           {
            zz[shift]=0; zzL[shift]=0; zzH[shift]=0;
           }
         if (DirectionOfSearchMaxMin)
           {
            if (vDepth < minDepth) {vDepth=minBars; endCykl=true;}
           }
         else
           {
            if (vDepth > maxDepth) {vDepth=minBars; endCykl=true;}
           }

         Depth = vDepth;
         if (DirectionOfSearchMaxMin)
           {
            vDepth--;
           }
         else
           {
            vDepth++;
           }
        }
      else
        {
         endCyklDirection=false;
        }

      minBarsX=Depth;
      
      // ïåðâûé áîëüøîé öèêë
      for(shift=Bars-Depth; shift>=0; shift--)
        {
         val=Low[iLowest(NULL,0,MODE_LOW,Depth,shift)];
         if(val==lastlow) val=0.0;
         else 
           { 
            lastlow=val; 
            if((Low[shift]-val)>(ExtDeviation*Point)) val=0.0;
            else
              {
               for(back=1; back<=ExtBackstep; back++)
                 {
                  res=zzL[shift+back];
                  if((res!=0)&&(res>val)) zzL[shift+back]=0.0; 
                 }
              }
           } 
          if (Low[shift]==val) zzL[shift]=val;

          val=High[iHighest(NULL,0,MODE_HIGH,Depth,shift)];
          if(val==lasthigh) val=0.0;
          else 
            {
             lasthigh=val;
             if((val-High[shift])>(ExtDeviation*Point)) val=0.0;
             else
               {
                for(back=1; back<=ExtBackstep; back++)
                  {
                   res=zzH[shift+back];
                   if((res!=0)&&(res<val)) zzH[shift+back]=0.0; 
                  } 
               }
            }
          if (High[shift]==val) zzH[shift]=val;
        }

      // âòîðîé áîëüøîé öèêë 
      lasthigh=-1; lasthighpos=-1;
      lastlow=-1;  lastlowpos=-1;

      for(shift=Bars-Depth; shift>=0; shift--)
        {
         curlow=zzL[shift];
         curhigh=zzH[shift];
         if((curlow==0)&&(curhigh==0)) continue;

         if(curhigh!=0)
           {
            if(lasthigh>0) 
              {
               if(lasthigh<curhigh) zzH[lasthighpos]=0;
               else zzH[shift]=0;
              }

            if(lasthigh<curhigh || lasthigh<0)
              {
               lasthigh=curhigh;
               lasthighpos=shift;
              }
            lastlow=-1;
           }

         if(curlow!=0)
           {
            if(lastlow>0)
              {
               if(lastlow>curlow) zzL[lastlowpos]=0;
               else zzL[shift]=0;
              }

            if((curlow<lastlow)||(lastlow<0))
              {
               lastlow=curlow;
               lastlowpos=shift;
              } 
            lasthigh=-1;
           }
        }
      // òðåòèé áîëüøîé öèêë
      for(shift=Bars-1; shift>=0; shift--)
        {
         zz[shift]=zzL[shift];
         if(shift>=Bars-Depth) {zzH[shift]=0.0; zzL[shift]=0.0; zz[shift]=0.0;}
         else
           {
            res=zzH[shift];
            if(res!=0.0)
              {
               zz[shift]=res;
              }
           }
        }

      NoGorb(Depth); // óäàëÿåì ãîðáû çèãçàãà

      // ïîèñê ïàòòåðíîâ
      if (ExtIndicator==11)
        {
         if (endCykl)
           {
            return(0);
           }
         _Gartley("ExtIndicator=11_" + Depth+"/"+ExtDeviation+"/"+ExtBackstep);
         if (vPatOnOff==1) return(0);
        }  // ïîèñê ïàòòåðíîâ êîíåö
     }
  }
//--------------------------------------------------------
// ZigZag èç ÌÒ. Êîíåö. 
//--------------------------------------------------------


//--------------------------------------------------------
// Èñïðàâëåíèå âîçíèêàþùèõ ãîðáîâ çèãçàãà. Íà÷àëî.
//--------------------------------------------------------
void NoGorb(int Depth)
  {
   double vel1, vel2, vel3, vel4;
   int bar1, bar2, bar3, bar4;
   int count;
   for(int bar=Bars-Depth; bar>=0; bar--)
     {
      if (zz[bar]!=0)
        {
         count++;
         vel4=vel3;bar4=bar3;
         vel3=vel2;bar3=bar2;
         vel2=vel1;bar2=bar1;
         vel1=zz[bar];bar1=bar;
         if (count<3) continue; 
         if ((vel3<vel2)&&(vel2<vel1)) {zz[bar2]=0;zzL[bar2]=0;zzH[bar2]=0;bar=bar3+1;}
         if ((vel3>vel2)&&(vel2>vel1)) {zz[bar2]=0;zzL[bar2]=0;zzH[bar2]=0;bar=bar3+1;}
         if ((vel2==vel1)&&(vel1!=0 )) {zz[bar1]=0;zzL[bar1]=0;zzH[bar1]=0;bar=bar3+1;}
        }
    } 
  }
//--------------------------------------------------------
// Èñïðàâëåíèå âîçíèêàþùèõ ãîðáîâ çèãçàãà. Êîíåö.
//--------------------------------------------------------

//--------------------------------------------------------
// Ïîèñê ïàòòåðíîâ Gartley. Íà÷àëî.
//--------------------------------------------------------
void _Gartley(string _Depth)
  {
   int  j, k;

   double   min_DeltaGartley = (1 - ExtDeltaGartley);
   double   max_DeltaGartley = (1 + ExtDeltaGartley);
   double   vl0382 = min_DeltaGartley * 0.382;
   double   vh05   = max_DeltaGartley * 0.5;
   double   vl0618 = min_DeltaGartley * 0.618;
   double   vh0618 = max_DeltaGartley * 0.618;
   double   vl0786 = min_DeltaGartley * 0.786;
   double   vh0786 = max_DeltaGartley * 0.786;
   double   vl0886 = min_DeltaGartley * 0.886;
   double   vh0886 = max_DeltaGartley * 0.886;
   double   vl1128 = min_DeltaGartley * 1.128;
   double   vl1272 = min_DeltaGartley * 1.272;
   double   vl1618 = min_DeltaGartley * 1.618;
   double   vh1618 = max_DeltaGartley * 1.618;
   double   vl2236 = min_DeltaGartley * 2.236;
   double   vh2236 = max_DeltaGartley * 2.236;
   double   vh2618 = max_DeltaGartley * 2.618;
   double   vh3618 = max_DeltaGartley * 3.618;

   int      aXABCD[6]; // íîìåðà áàðîâ ñ òî÷êàìè XABCD ïàòòåðíîâ
   double   retXD;
   double   retXB;
   double   retBD;
   double   retAC;
   double   XA, BC;
   
   double   vDelta0 = 0.000001;
   int      vNull   = 0;
   int      X=1,A=2,B=3,C=4,D=5;
   string   nameObj1, nameObj2;
   string   vBull      = "Bullish";
   string   vBear      = "Bearish";
   string   vGartley   = "Gartley";
   string   vBat       = "Bat";
   string   vButterfly = "Butterfly";
   string   vCrab      = "Crab";
   int      aNumBarPeak[];

   vPatOnOff    = 0;
   vBullBear    = "";
   vNamePattern = "";
   maxPeak      = 0;  

   for(shift=Bars-1; shift>=0; shift--)
     {
      if (zz[shift]>0) maxPeak++;
     }

   ArrayResize(aNumBarPeak, maxPeak);

   delete_objects3();

   shift = 0;
   j = 0;
   while ((shift < Bars) && (j < maxPeak))
     {
      if (zz[shift] != 0)
        {
         aNumBarPeak[j] = shift;
         j++;
        }
      shift++;
     }
   if (j<maxPeak) aNumBarPeak[j]=-1; else aNumBarPeak[maxPeak]=-1;

   aXABCD[D] = aNumBarPeak[0];
   k = 0;
   while ((k < j) && (k < maxPeak) && (aNumBarPeak[k] > -1) && (aXABCD[D] < maxBarToD+2))
     {
      aXABCD[X] = aNumBarPeak[k + 4];
      aXABCD[A] = aNumBarPeak[k + 3];
      aXABCD[B] = aNumBarPeak[k + 2];
      aXABCD[C] = aNumBarPeak[k + 1];
      aXABCD[D] = aNumBarPeak[k + 0];

      if ((zz[aXABCD[A]] > zz[aXABCD[C]]) && (zz[aXABCD[C]] > zz[aXABCD[B]]) && (zz[aXABCD[B]] > zz[aXABCD[X]]) && (zz[aXABCD[X]] > zz[aXABCD[D]]) && ((zz[aXABCD[C]] - zzL[aXABCD[D]]) >= (zz[aXABCD[A]] - zz[aXABCD[B]]) * ExtCD))
        {
         vBullBear = vBull;
        }
      else if ((zz[aXABCD[A]] > zz[aXABCD[C]]) && (zz[aXABCD[C]] > zz[aXABCD[B]]) && (zz[aXABCD[B]] > zz[aXABCD[D]]) && (zz[aXABCD[D]] > zz[aXABCD[X]]) && ((zz[aXABCD[C]] - zz[aXABCD[D]]) >= (zz[aXABCD[2]] - zz[aXABCD[B]]) * ExtCD))
        {
         vBullBear = vBull;
        }
      else if ((zz[aXABCD[X]] > zz[aXABCD[D]]) && (zz[aXABCD[D]] > zz[aXABCD[B]]) && (zz[aXABCD[B]] > zz[aXABCD[C]]) && (zz[aXABCD[C]] > zz[aXABCD[A]]) && ((zz[aXABCD[D]] - zz[aXABCD[C]]) >= (zz[aXABCD[B]] - zz[aXABCD[A]]) * ExtCD))
        {
         vBullBear = vBear;
        }
      else if ((zz[aXABCD[D]] > zz[aXABCD[X]]) && (zz[aXABCD[X]] > zz[aXABCD[B]]) && (zz[aXABCD[B]] > zz[aXABCD[C]]) && (zz[aXABCD[C]] > zz[aXABCD[A]]) && ((zz[aXABCD[D]] - zz[aXABCD[C]]) >= (zz[aXABCD[B]] - zz[aXABCD[A]]) * ExtCD))
        {
         vBullBear = vBear;
        }

      if (vBullBear!="")
        {
         if (vBullBear == vBull)
           {
            retXB = (zz[aXABCD[A]] - zz[aXABCD[B]]) / (zz[aXABCD[A]] - zz[aXABCD[X]] + vDelta0);
            retXD = (zz[aXABCD[A]] - zz[aXABCD[D]]) / (zz[aXABCD[A]] - zz[aXABCD[X]] + vDelta0);
            retBD = (zz[aXABCD[C]] - zz[aXABCD[D]]) / (zz[aXABCD[C]] - zz[aXABCD[B]] + vDelta0);
            retAC = (zz[aXABCD[C]] - zz[aXABCD[B]]) / (zz[aXABCD[A]] - zz[aXABCD[B]] + vDelta0);
            if (RangeForPointD>0 && FlagForD)
              {
               XA=zz[aXABCD[A]] - zz[aXABCD[X]];
               BC=zz[aXABCD[C]] - zz[aXABCD[B]];
              }
           }
         else if (vBullBear == vBear)
           {
            retXB = (zz[aXABCD[B]] - zz[aXABCD[A]]) / (zz[aXABCD[X]] - zz[aXABCD[A]] + vDelta0);
            retXD = (zz[aXABCD[D]] - zz[aXABCD[A]]) / (zz[aXABCD[X]] - zz[aXABCD[A]] + vDelta0);
            retBD = (zz[aXABCD[D]] - zz[aXABCD[C]]) / (zz[aXABCD[B]] - zz[aXABCD[C]] + vDelta0);
            retAC = (zz[aXABCD[B]] - zz[aXABCD[C]]) / (zz[aXABCD[B]] - zz[aXABCD[A]] + vDelta0);
            if (RangeForPointD>0 && FlagForD)
              {
               XA=zz[aXABCD[X]] - zz[aXABCD[A]];
               BC=zz[aXABCD[B]] - zz[aXABCD[C]];
              }
           }

         if ((retAC >= vl0382) && (retAC <= vh0886) && (retXD >= vl0618) && (retXD <= vh0786) && (retBD >= vl1128) && (retBD <= vh2236) && (retXB >= vl0382) && (retXB <= vh0618))
           {
            vNamePattern=vGartley; // Gartley
            if (RangeForPointD>0 && FlagForD)
              {
               if (vBullBear == vBull)
                 {
                  LevelForDmin = MathMax(zz[aXABCD[A]]-XA*vh0786,zz[aXABCD[C]]-BC*vh2236);
                  LevelForDmax = MathMin(zz[aXABCD[A]]-XA*vl0618,zz[aXABCD[C]]-BC*vl1128);
                 }
               else if (vBullBear == vBear)
                 {
                  LevelForDmin = MathMax(zz[aXABCD[A]]+XA*vl0618,zz[aXABCD[C]]+BC*vl1128);
                  LevelForDmax = MathMin(zz[aXABCD[A]]+XA*vh0786,zz[aXABCD[C]]+BC*vh2236);
                 }
              }
           }
         else if ((retAC >= vl0382) && (retAC <= vh0886) && (retXD >= vl1272) && (retXD <= vh1618) && (retBD >= vl1272) && (retBD <= vh2618) && (retXB >= vl0618) && (retXB <= vh0886))
           {
            vNamePattern=vButterfly; // Butterfly
            if (RangeForPointD>0 && FlagForD)
              {
               if (vBullBear == vBull)
                 {
                  LevelForDmin = MathMax(zz[aXABCD[A]]-XA*vh1618,zz[aXABCD[C]]-BC*vh2618);
                  LevelForDmax = MathMin(zz[aXABCD[A]]-XA*vl1272,zz[aXABCD[C]]-BC*vl1272);
                 }
               else if (vBullBear == vBear)
                 {
                  LevelForDmin = MathMax(zz[aXABCD[A]]+XA*vl1272,zz[aXABCD[C]]+BC*vl1272);
                  LevelForDmax = MathMin(zz[aXABCD[A]]+XA*vh1618,zz[aXABCD[C]]+BC*vh2618);
                 }
              }
           }
         else if ((retAC >= vl0382) && (retAC <= vh0886) && (retXD >= vl1618) && (retXD <= vh1618) && (retBD >= vl2236) && (retBD <= vh3618) && (retXB >= vl0382) && (retXB <= vh0618))
           {
            vNamePattern=vCrab; // Crab
            if (RangeForPointD>0 && FlagForD)
              {
               if (vBullBear == vBull)
                 {
                  LevelForDmin = MathMax(zz[aXABCD[A]]-XA*vh1618,zz[aXABCD[C]]-BC*vh3618);
                  LevelForDmax = MathMin(zz[aXABCD[A]]-XA*vl1618,zz[aXABCD[C]]-BC*vl2236);
                 }
               else if (vBullBear == vBear)
                 {
                  LevelForDmin = MathMax(zz[aXABCD[A]]+XA*vl1618,zz[aXABCD[C]]+BC*vl2236);
                  LevelForDmax = MathMin(zz[aXABCD[A]]+XA*vh1618,zz[aXABCD[C]]+BC*vh3618);
                 }
              }
           }
         else  if ((retAC >= vl0382) && (retAC <= vh0886) && (retXD >= vl0886) && (retXD <= vh0886) && (retBD >= vl1272) && (retBD <= vh2618) && (retXB >= vl0382) && (retXB <= vh0618))
           {
            vNamePattern=vBat; // Bat
            if (RangeForPointD>0 && FlagForD)
              {
               if (vBullBear == vBull)
                 {
                  LevelForDmin = MathMax(zz[aXABCD[A]]-XA*vh0886,zz[aXABCD[C]]-BC*vh2618);
                  LevelForDmax = MathMin(zz[aXABCD[A]]-XA*vl0886,zz[aXABCD[C]]-BC*vl1272);
                 }
               else if (vBullBear == vBear)
                 {
                  LevelForDmin = MathMax(zz[aXABCD[A]]+XA*vl0886,zz[aXABCD[C]]+BC*vl1272);
                  LevelForDmax = MathMin(zz[aXABCD[A]]+XA*vh0886,zz[aXABCD[C]]+BC*vh2618);
                 }
              }
           }
        }

//      if ((vNamePattern != "") && ((aXABCD[D] < aNumBarPeak[j-1]) && VarDisplay==0) )
//            if ((vNamePattern != "") && ((aXABCD[D] < maxBarToD) && VarDisplay==0) )
      if ((vNamePattern != "") && (aXABCD[D] < maxBarToD+2))
        {
         nameObj1="_"+ExtComplekt+"Triangle1_" + _Depth + "_" + aXABCD[D] + "";
         ObjectDelete(nameObj1);
         nameObj2="_"+ExtComplekt+"Triangle2_" + _Depth + "_" + aXABCD[D] + "";
         ObjectDelete(nameObj2);

         vPatOnOff = 1;

         if (vBullBear == vBull)
           {
            ObjectCreate(nameObj1,OBJ_TRIANGLE,0,Time[aXABCD[X]],zz[aXABCD[X]],Time[aXABCD[B]],zz[aXABCD[B]],Time[aXABCD[A]],zz[aXABCD[A]]);
            ObjectSet(nameObj1,OBJPROP_COLOR,ExtColorPatterns);
            ObjectCreate(nameObj2,OBJ_TRIANGLE,0,Time[aXABCD[B]],zz[aXABCD[B]],Time[aXABCD[D]],zz[aXABCD[D]],Time[aXABCD[C]],zz[aXABCD[C]]);
            ObjectSet(nameObj2,OBJPROP_COLOR,ExtColorPatterns);
           }
         else
           {
            ObjectCreate(nameObj1,OBJ_TRIANGLE,0,Time[aXABCD[X]],zz[aXABCD[X]],Time[aXABCD[B]],zz[aXABCD[B]],Time[aXABCD[A]],zz[aXABCD[A]]);
            ObjectSet(nameObj1,OBJPROP_COLOR,ExtColorPatterns);
            ObjectCreate(nameObj2,OBJ_TRIANGLE,0,Time[aXABCD[B]],zz[aXABCD[B]],Time[aXABCD[D]],zz[aXABCD[D]],Time[aXABCD[C]],zz[aXABCD[C]]);
            ObjectSet(nameObj2,OBJPROP_COLOR,ExtColorPatterns);
           }

         if (RangeForPointD>0) // Âûâîä ïðÿìîóãîëüíèêà äëÿ çîíû òî÷êè D
           {
            if (FlagForD)
              {
//               FlagForD=false;
               for (j=aXABCD[D];j<aXABCD[C]-1;j++)
                 {
                  if (vBullBear == vBull)
                    {
                     if (LevelForDmax>=Low[j]) TimeForDmax  = Time[j];
                    }
                  else if (vBullBear == vBear)
                    {
                     if (LevelForDmin<=High[j]) TimeForDmin  = Time[j];
                    }
                 }

               if (vBullBear == vBull)
                 {
                  TimeForDmin  = TimeForDmax+((LevelForDmax-LevelForDmin)/((zz[aXABCD[C]]-zz[aXABCD[D]])/(aXABCD[C]-aXABCD[D]+1)))*Period()*60;
                 }
               else if (vBullBear == vBear)
                 {
                  TimeForDmax  = TimeForDmin+((LevelForDmax-LevelForDmin)/((zz[aXABCD[D]]-zz[aXABCD[C]])/(aXABCD[C]-aXABCD[D]+1)))*Period()*60;
                 }

               nameObj="_"+ExtComplekt+"PointD";
//               ObjectDelete(nameObj);

               ObjectCreate(nameObj,OBJ_RECTANGLE,0,TimeForDmin,LevelForDmin,TimeForDmax,LevelForDmax);
               ObjectSet(nameObj, OBJPROP_BACK, false);
               ObjectSet(nameObj, OBJPROP_COLOR, ExtColorRangeForPointD); 
              }

           }
         return(0);
        }
      else 
        {
         vBullBear = "";
         vNamePattern = "";
/*
         if (RangeForPointD>0)
           {
            FlagForD=true;
            ObjectDelete("_"+ExtComplekt+"PointD");
           }
*/
        }
      k++;
     }
  }
//--------------------------------------------------------
// Ïîèñê ïàòòåðíîâ Gartley. Êîíåö.
//--------------------------------------------------------


//----------------------------------------------------
//  ZigZag Àëåêñà íåìíîãî èçìåíåííûé. Íà÷àëî.
//----------------------------------------------------
void ang_AZZ_()
 {
   int i,n;

//   cbi=Bars-IndicatorCounted()-1;
//---------------------------------
   for (i=cbi; i>=0; i--) 
     {
//-------------------------------------------------
      // çàïîìèíàåì çíà÷åíèå íàïðàâëåíèÿ òðåíäà fs è ñðåäíåé öåíû si íà ïðåäûäóùåì áàðå
      if (ti!=Time[i]) {fsp=fs; sip=si;} ti=Time[i];
      // Âû÷èñëÿåì çíà÷åíèå öåíîâîãî ôèëüòðà îò ïðîöåíòà îòêëîíåíèÿ
      if (minSize==0 && minPercent!=0) di=minPercent*Close[i]/2/100;
//-------------------------------------------------
      // Êîððåêòèðîâêà ñðåäíåé öåíû
      if (High[i]>=si+di && Low[i]<si-di) // Âíåøíèé áàð ïî îòíîøåíèþ ê öåíîâîìó ôèëüòðó di
        {
         if (High[i]-si>=si-Low[i]) si=High[i]-di;  // Îòêëîíåíèå õàÿ îò ñðåäíåé öåíû áîëüøå îòêëîíåíèÿ ëîâà
         if (High[i]-si<si-Low[i]) si=Low[i]+di;  // ñîîòâåòñòâåííî, ìåíüøå
        } 
      else  // Íå âíåøíèé áàð
        {
         if (High[i]>=si+di) si=High[i]-di;   // 
         if (Low[i]<=si-di) si=Low[i]+di;   // 
        }

      // Âû÷èñëåíèå íà÷àëüíîãî çíà÷åíèÿ ñðåäíåé öåíû
      if (i>Bars-2) {si=(High[i]+Low[i])/2;}

      // Çàïîëíÿåì áóôåðû äëÿ óðîâíåé ïîäòâåðæäåíèÿ
      if (chHL && chHL_PeakDet_or_vts) {ha[i]=si+di; la[i]=si-di;} 

      // Îïðåäåëÿåì íàïðàâëåíèå òðåíäà äëÿ ðàñ÷åòíîãî áàðà
      if (si>sip) fs=1; // Òðåíä âîñõîäÿùèé
      if (si<sip) fs=2; // Òðåíä íèñõîäÿùèé

//-------------------------------------------------

      if (fs==1 && fsp==2) // Òðåäí ñìåíèëñÿ ñ íèñõîäÿùåãî íà âîñõîäÿùèé
        {
         hm=High[i];

         zz[bi]=Low[bi];
         zzL[bi]=Low[bi];
         if (i>0) {if (PeakDet && chHL_PeakDet_or_vts) for (n=bip; n>=bi; n--) {lam[n]=Low[bip];}}
         aip=ai; 
         taip=Time[ai];
         ai=i;
         tai=Time[i];
         fsp=fs;
        }

      if (fs==2 && fsp==1) // Òðåäí ñìåíèëñÿ ñ âîñõîäÿùåãî íà íèñõîäÿùèé
        {
         lm=Low[i]; 

         zz[ai]=High[ai];
         zzH[ai]=High[ai];
         if (i>0) {if (PeakDet && chHL_PeakDet_or_vts) for (n=aip; n>=ai; n--) {ham[n]=High[aip];}}
         bip=bi; 
         tbip=Time[bi];
         bi=i;
         tbi=Time[i];
         fsp=fs;
        }

      // Ïðîäîëæåíèå tðåíäà. Îòñëåæèâàíèå òðåíäà.
      if (fs==1 && High[i]>hm) 
        {hm=High[i]; ai=i; tai=Time[i];}
      if (fs==2 && Low[i]<lm) 
        {lm=Low[i]; bi=i; tbi=Time[i];}

//===================================================================================================
      // Íóëåâîé áàð. Ðàñ÷åò ïåðâîãî ëó÷à ZigZag-a

      if (i==0) 
        {
         ai0=iBarShift(Symbol(),Period(),tai); 
         bi0=iBarShift(Symbol(),Period(),tbi);
         aip0=iBarShift(Symbol(),Period(),taip); 
         bip0=iBarShift(Symbol(),Period(),tbip);

         if (fs==1) {for (n=bi0-1; n>ai0; n--) {zzH[n]=0; zz[n]=0;} zz[ai0]=High[ai0]; zzH[ai0]=High[ai0]; zzL[ai0]=0;}         
         if (fs==2) {for (n=ai0-1; n>bi0; n--) {zzL[n]=0; zz[n]=0;} zz[bi0]=Low[bi0]; zzL[bi0]=Low[bi0]; zzH[bi0]=0;}

         if (PeakDet)
           {
            if (fs==1) 
              {
               for (n=aip0; n>=0; n--) {ham[n]=High[aip0];}
               for (n=bi0; n>=0; n--) {lam[n]=Low[bi0];}
              }
            if (fs==2)
              {
               for (n=bip0; n>=0; n--) {lam[n]=Low[bip0];} 
               for (n=ai0; n>=0; n--) {ham[n]=High[ai0];} 
              } 
           }

        }
//====================================================================================================
     }
//--------------------------------------------
 }

//--------------------------------------------------------
// ZigZag Àëåêñà. Êîíåö. 
//--------------------------------------------------------


//----------------------------------------------------
// Èíäèêàòîð ïîäîáíûé âñòðîåííîìó â Ensign. Íà÷àëî.
//----------------------------------------------------
void Ensign_ZZ()
 {
   int i,n;

//   cbi=Bars-IndicatorCounted()-1;
//---------------------------------
   for (i=cbi; i>=0; i--) 
     {
//-------------------------------------------------
      // Óñòàíàâëèâàåì íà÷àëüíûå çíà÷åíèÿ ìèíèìóìà è ìàêñèìóìà áàðà
      if (lLast==0) {lLast=Low[i];hLast=High[i]; if (ExtIndicator==3) di=hLast-lLast;}

      // Îïðåäåëÿåì íàïðàâëåíèå òðåíäà äî ïåðâîé òî÷êè ñìåíû òðåíäà.
      // Èëè äî òî÷êè íà÷àëà ïåðâîãî ëó÷à çà ëåâûì êðàåì.
      if (fs==0)
        {
         if (lLast<Low[i] && hLast<High[i]) {fs=1; hLast=High[i]; si=High[i]; ai=i; tai=Time[i]; if (ExtIndicator==3) di=High[i]-Low[i];}  // òðåíä âîñõîäÿùèé
         if (lLast>Low[i] && hLast>High[i]) {fs=2; lLast=Low[i]; si=Low[i]; bi=i; tbi=Time[i]; if (ExtIndicator==3) di=High[i]-Low[i];}  // òðåíä íèñõîäÿùèé
        }

      if (ti!=Time[i])
        {
         // çàïîìèíàåì çíà÷åíèå íàïðàâëåíèÿ òðåíäà fs íà ïðåäûäóùåì áàðå
         ti=Time[i];

         ai0=iBarShift(Symbol(),Period(),tai); 
         bi0=iBarShift(Symbol(),Period(),tbi);

         fcount0=false;
         if ((fh || fl) && countBar>0) {countBar--; if (i==0 && countBar==0) fcount0=true;}
         // Îñòàíîâêà. Îïðåäåëåíèå äàëüíåéøåãî íàïðàâëåíèÿ òðåíäà.
         if (fs==1)
           {
            if (hLast>High[i] && !fh) fh=true;

            if (i==0)
              {

               if (Close[i+1]<lLast && fh) {fs=2; countBar=minBars; fh=false;}
               if (countBar==0 && si-di>Low[i+1] && High[i+1]<hLast && ai0>i+1 && fh && !fcount0) {fs=2; countBar=minBars; fh=false;}

               if (fs==2) // Òðåäí ñìåíèëñÿ ñ âîñõîäÿùåãî íà íèñõîäÿùèé íà ïðåäûäóùåì áàðå
                 {
                  zz[ai0]=High[ai0];
                  zzH[ai0]=High[ai0];
                  if (PeakDet && chHL_PeakDet_or_vts) for (n=aip; n>=ai; n--) {ham[n]=High[aip];}
                  lLast=Low[i+1];
                  if (ExtIndicator==3) di=High[i+1]-Low[i+1];
                  si=Low[i+1];
                  bip=bi0; 
                  tbip=Time[bi0];
                  bi=i+1;
                  tbi=Time[i+1];
                  if (chHL && chHL_PeakDet_or_vts) {ha[i+1]=si+di; la[i+1]=si;}
                }

              }
            else
              {
               if (Close[i]<lLast && fh) {fs=2; countBar=minBars; fh=false;}
               if (countBar==0 && si-di>Low[i] && High[i]<hLast && fh) {fs=2; countBar=minBars; fh=false;}

               if (fs==2) // Òðåäí ñìåíèëñÿ ñ âîñõîäÿùåãî íà íèñõîäÿùèé
                 {
                  zz[ai]=High[ai];
                  zzH[ai]=High[ai];
                  if (PeakDet && chHL_PeakDet_or_vts) for (n=aip; n>=ai; n--) {ham[n]=High[aip];}
                  lLast=Low[i];
                  if (ExtIndicator==3) di=High[i]-Low[i];
                  si=Low[i];
                  bip=bi; 
                  tbip=Time[bi];
                  bi=i;
                  tbi=Time[i];
                  if (chHL && chHL_PeakDet_or_vts) {ha[i]=si+di; la[i]=si;}
                 }
              }

           }
         else // fs==2
           {
            if (lLast<Low[i] && !fl) fl=true;

            if (i==0)
              {

               if (Close[i+1]>hLast && fl) {fs=1; countBar=minBars; fl=false;}
               if (countBar==0 && si+di<High[i+1] && Low[i+1]>lLast && bi0>i+1 && fl && !fcount0) {fs=1; countBar=minBars; fl=false;}

               if (fs==1) // Òðåäí ñìåíèëñÿ ñ íèñõîäÿùåãî íà âîñõîäÿùèé íà ïðåäûäóùåì áàðå
                 {
                  zz[bi0]=Low[bi0];
                  zzL[bi0]=Low[bi0];
                  if (PeakDet && chHL_PeakDet_or_vts) for (n=bip; n>=bi; n--) {lam[n]=Low[bip];}
                  hLast=High[i+1];
                  if (ExtIndicator==3) di=High[i+1]-Low[i+1];
                  si=High[i+1];
                  aip=ai0; 
                  taip=Time[ai0];
                  ai=i+1;
                  tai=Time[i+1];
                  if (chHL && chHL_PeakDet_or_vts) {ha[i+1]=si; la[i+1]=si-di;}
                 }

              }
            else
              {
               if (Close[i]>hLast && fl) {fs=1; countBar=minBars; fl=false;}
               if (countBar==0 && si+di<High[i] && Low[i]>lLast && fl) {fs=1; countBar=minBars; fl=false;}

               if (fs==1) // Òðåäí ñìåíèëñÿ ñ íèñõîäÿùåãî íà âîñõîäÿùèé
                 {
                  zz[bi]=Low[bi];
                  zzL[bi]=Low[bi];
                  if (PeakDet && chHL_PeakDet_or_vts) for (n=bip; n>=bi; n--) {lam[n]=Low[bip];}
                  hLast=High[i];
                  if (ExtIndicator==3) di=High[i]-Low[i];
                  si=High[i];
                  aip=ai; 
                  taip=Time[ai];
                  ai=i;
                  tai=Time[i];
                  if (chHL && chHL_PeakDet_or_vts) {ha[i]=si; la[i]=si-di;}
                 }
              }
           }
        } 

      // Ïðîäîëæåíèå òðåíäà
      if (fs==1 && High[i]>si) {ai=i; tai=Time[i]; hLast=High[i]; si=High[i]; countBar=minBars; fh=false; if (ExtIndicator==3) di=High[i]-Low[i];}
      if (fs==2 && Low[i]<si) {bi=i; tbi=Time[i]; lLast=Low[i]; si=Low[i]; countBar=minBars; fl=false; if (ExtIndicator==3) di=High[i]-Low[i];}

      // Çàïîëíÿåì áóôåðû äëÿ óðîâíåé ïîäòâåðæäåíèÿ
      if (chHL && chHL_PeakDet_or_vts)
        {
         if (fs==1) {ha[i]=si; la[i]=si-di;}
         if (fs==2) {ha[i]=si+di; la[i]=si;}
        } 

//===================================================================================================
      // Íóëåâîé áàð. Ðàñ÷åò ïåðâîãî ëó÷à ZigZag-a

      if (i==0) 
        {
         ai0=iBarShift(Symbol(),Period(),tai); 
         bi0=iBarShift(Symbol(),Period(),tbi);
         aip0=iBarShift(Symbol(),Period(),taip); 
         bip0=iBarShift(Symbol(),Period(),tbip);

         if (fs==1) {for (n=bi0-1; n>=0; n--) {zzH[n]=0; zz[n]=0;} zz[ai0]=High[ai0]; zzH[ai0]=High[ai0]; zzL[ai0]=0;}         
         if (fs==2) {for (n=ai0-1; n>=0; n--) {zzL[n]=0; zz[n]=0;} zz[bi0]=Low[bi0]; zzL[bi0]=Low[bi0]; zzH[bi0]=0;}

         if (PeakDet && chHL_PeakDet_or_vts)
           {
            if (fs==1) {for (n=aip0; n>=0; n--) {ham[n]=High[aip0];} for (n=bi0; n>=0; n--) {lam[n]=Low[bi0];} }
            if (fs==2) {for (n=bip0; n>=0; n--) {lam[n]=Low[bip0];} for (n=ai0; n>=0; n--) {ham[n]=High[ai0];} } 
           }
        }

//====================================================================================================
     }
//--------------------------------------------
 }
//--------------------------------------------------------
// Èíäèêàòîð ïîäîáíûé âñòðîåííîìó â Ensign. Êîíåö. 
//--------------------------------------------------------


//----------------------------------------------------
//  ZigZag tauber. Íà÷àëî.
//----------------------------------------------------

void ZigZag_tauber()
  {
//  ZigZag èç ÌÒ. Íà÷àëî.
   int    shift, back,lasthighpos,lastlowpos;
   double val,res;
   double curlow,curhigh,lasthigh,lastlow;
   GetHigh(0,Bars,0.0,0);

   // final cutting 
   lasthigh=-1; lasthighpos=-1;
   lastlow=-1;  lastlowpos=-1;

   for(shift=Bars; shift>=0; shift--)
     {
      curlow=zzL[shift];
      curhigh=zzH[shift];
      if((curlow==0)&&(curhigh==0)) continue;
      //---
      if(curhigh!=0)
        {
        if(lasthigh>0) 
           {
            if(lasthigh<curhigh) zzH[lasthighpos]=0;
            else zzH[shift]=0;
           }
        //---
         if(lasthigh<curhigh || lasthigh<0)
           {
            lasthigh=curhigh;
            lasthighpos=shift;
           }
         lastlow=-1;
        }
      //----
      if(curlow!=0)
        {
         if(lastlow>0)
           {
            if(lastlow>curlow) zzL[lastlowpos]=0;
            else zzL[shift]=0;
          }
         //---
         if((curlow<lastlow)||(lastlow<0))
           {
            lastlow=curlow;
            lastlowpos=shift;
           } 
         lasthigh=-1;
        }
     }
  

   for(shift=Bars-1; shift>=0; shift--)
     {
      zz[shift]=zzL[shift];
      res=zzH[shift];
      if(res!=0.0) zz[shift]=res;
     }

  }

void GetHigh(int start, int end, double price, int step)
  {
   int count=end-start;
   if (count<=0) return;
   int i=iHighest(NULL,0,MODE_HIGH,count+1,start);
   double val=High[i];
   if ((val-price)>(minSize*Point))
     { 
      zzH[i]=val;
      if (i==start) {GetLow(start+step,end-step,val,1-step); if (zzL[start-1]>0) zzL[start]=0; return;}     
      if (i==end) {GetLow(start+step,end-step,val,1-step); if (zzL[end+1]>0) zzL[end]=0; return;} 
      GetLow(start,i-1,val,0);
      GetLow(i+1,end,val,0);
     }
  }

void GetLow(int start, int end, double price, int step)
  {
   int count=end-start;
   if (count<=0) return;
   int i=iLowest(NULL,0,MODE_LOW,count+1,start);
   double val=Low[i];
   if ((price-val)>(minSize*Point))
     {
      zzL[i]=val; 
      if (i==start) {GetHigh(start+step,end-step,val,1-step); if (zzH[start-1]>0) zzH[start]=0; return;}     
      if (i==end) {GetHigh(start+step,end-step,val,1-step); if (zzH[end+1]>0) zzH[end]=0; return;}   
      GetHigh(start,i-1,val,0);
      GetHigh(i+1,end,val,0);
     }
  }
//--------------------------------------------------------
// ZigZag tauber. Êîíåö. 
//--------------------------------------------------------

//----------------------------------------------------
// Ñâèíãè Ãàííà. Íà÷àëî.
//----------------------------------------------------
void GannSwing()
 {
   int i,n,fs_tend=0;
// lLast, hLast - ìèíèìóì è ìàêñèìóì àêòèâíîãî áàðà
// lLast_m, hLast_m - ìèíèìóì è ìàêñèìóì "ïðîìåæóòî÷íûõ" áàðîâ

//   cbi=Bars-IndicatorCounted()-1;
//---------------------------------
   for (i=cbi; i>=0; i--) 
     {
//-------------------------------------------------
      // Óñòàíàâëèâàåì íà÷àëüíûå çíà÷åíèÿ ìèíèìóìà è ìàêñèìóìà áàðà
      if (lLast==0) {lLast=Low[i]; hLast=High[i]; ai=i; bi=i;}
      if (ti!=Time[i])
        {
         ti=Time[i];
         if (lLast_m==0 && hLast_m==0)
           {
            if (lLast>Low[i] && hLast<High[i]) // Âíåøíèé áàð
              {
               lLast=Low[i];hLast=High[i];lLast_m=Low[i];hLast_m=High[i];countBarExt++;
               if (fs==1) {countBarl=countBarExt; ai=i; tai=Time[i];}
               else if (fs==2) {countBarh=countBarExt; bi=i; tbi=Time[i];}
               else {countBarl++;countBarh++;}
              }
            else if (lLast<=Low[i] && hLast<High[i]) // Òåíäåíöèÿ íà òåêóùåì áàðå âîñõîäÿùàÿ
              {
               lLast_m=0;hLast_m=High[i];countBarl=0;countBarExt=0;
               if (fs!=1) countBarh++;
               else {lLast=Low[i]; hLast=High[i]; lLast_m=0; hLast_m=0; ai=i; tai=Time[i];}
              }
            else if (lLast>Low[i] && hLast>=High[i]) // Òåíäåíöèÿ íà òåêóùåì áàðå íèñõîäÿùàÿ
              {
               lLast_m=Low[i];hLast_m=0;countBarh=0;countBarExt=0;
               if (fs!=2) countBarl++;
               else {lLast=Low[i]; hLast=High[i]; lLast_m=0; hLast_m=0; bi=i; tbi=Time[i];}
              }
           }
         else  if (lLast_m>0 && hLast_m>0) // Âíåøíèé áàð (ïðåäûäóùèé)
           {
            if (lLast_m>Low[i] && hLast_m<High[i]) // Âíåøíèé áàð
              {
               lLast=Low[i];hLast=High[i];lLast_m=Low[i];hLast_m=High[i];countBarExt++;
               if (fs==1) {countBarl=countBarExt; ai=i; tai=Time[i];}
               else if (fs==2) {countBarh=countBarExt; bi=i; tbi=Time[i];}
               else {countBarl++;countBarh++;}
              }
            else if (lLast_m<=Low[i] && hLast_m<High[i]) // Òåíäåíöèÿ íà òåêóùåì áàðå âîñõîäÿùàÿ
              {
               lLast_m=0;hLast_m=High[i];countBarl=0;countBarExt=0;
               if (fs!=1) countBarh++;
               else {lLast=Low[i]; hLast=High[i]; lLast_m=0; hLast_m=0; ai=i; tai=Time[i];}
              }
            else if (lLast_m>Low[i] && hLast_m>=High[i]) // Òåíäåíöèÿ íà òåêóùåì áàðå íèñõîäÿùàÿ
              {
               lLast_m=Low[i];hLast_m=0;countBarh=0;countBarExt=0;
               if (fs!=2) countBarl++;
               else {lLast=Low[i]; hLast=High[i]; lLast_m=0; hLast_m=0; bi=i; tbi=Time[i];}
              }
           }
         else  if (lLast_m>0)
           {
            if (lLast_m>Low[i] && hLast<High[i]) // Âíåøíèé áàð
              {
               lLast=Low[i];hLast=High[i];lLast_m=Low[i];hLast_m=High[i];countBarExt++;
               if (fs==1) {countBarl=countBarExt; ai=i; tai=Time[i];}
               else if (fs==2) {countBarh=countBarExt; bi=i; tbi=Time[i];}
               else {countBarl++;countBarh++;}
              }
            else if (lLast_m<=Low[i] && hLast<High[i]) // Òåíäåíöèÿ íà òåêóùåì áàðå âîñõîäÿùàÿ
              {
               lLast_m=0;hLast_m=High[i];countBarl=0;countBarExt=0;
               if (fs!=1) countBarh++;
               else {lLast=Low[i]; hLast=High[i]; lLast_m=0; hLast_m=0; ai=i; tai=Time[i];}
              }
            else if (lLast_m>Low[i] && hLast>=High[i]) // Òåíäåíöèÿ íà òåêóùåì áàðå íèñõîäÿùàÿ
              {
               lLast_m=Low[i];hLast_m=0;countBarh=0;countBarExt=0;
               if (fs!=2) countBarl++;
               else {lLast=Low[i]; hLast=High[i]; lLast_m=0; hLast_m=0; bi=i; tbi=Time[i];}
              }
           }
         else  if (hLast_m>0)
           {
            if (lLast>Low[i] && hLast_m<High[i]) // Âíåøíèé áàð
              {
               lLast=Low[i];hLast=High[i];lLast_m=Low[i];hLast_m=High[i];countBarExt++;
               if (fs==1) {countBarl=countBarExt; ai=i; tai=Time[i];}
               else if (fs==2) {countBarh=countBarExt; bi=i; tbi=Time[i];}
               else {countBarl++;countBarh++;}
              }
            else if (lLast<=Low[i] && hLast_m<High[i]) // Òåíäåíöèÿ íà òåêóùåì áàðå âîñõîäÿùàÿ
              {
               lLast_m=0;hLast_m=High[i];countBarl=0;countBarExt=0;
               if (fs!=1) countBarh++;
               else {lLast=Low[i]; hLast=High[i]; lLast_m=0; hLast_m=0; ai=i; tai=Time[i];}
              }
            else if (lLast>Low[i] && hLast_m>=High[i]) // Òåíäåíöèÿ íà òåêóùåì áàðå íèñõîäÿùàÿ
              {
               lLast_m=Low[i];hLast_m=0;countBarh=0;countBarExt=0;
               if (fs!=2) countBarl++;
               else {lLast=Low[i]; hLast=High[i]; lLast_m=0; hLast_m=0; bi=i; tbi=Time[i];}
              }
           }

         // Îïðåäåëÿåì íàïðàâëåíèå òðåíäà. 
         if (fs==0)
           {
            if (lLast<lLast_m && hLast>hLast_m) // âíóòðåííèé áàð
              {
               lLast=Low[i]; hLast=High[i]; ai=i; bi=i; countBarl=0;countBarh=0;countBarExt=0;
              }
              
            if (countBarh>countBarl && countBarh>countBarExt && countBarh>minBars)
              {
               lLast=Low[i]; hLast=High[i]; lLast_m=0; hLast_m=0;
               fs=1;countBarh=0;countBarl=0;countBarExt=0;
               zz[bi]=Low[bi];
               zzL[bi]=Low[bi];
               zzH[bi]=0;
               ai=i;
               tai=Time[i];
              }
            else if (countBarl>countBarh && countBarl>countBarExt && countBarl>minBars)
              {
               lLast=Low[i]; hLast=High[i]; lLast_m=0; hLast_m=0;
               fs=2;countBarl=0;countBarh=0;countBarExt=0;
               zz[ai]=High[ai];
               zzH[ai]=High[ai];
               zzL[ai]=0;
               bi=i;
               tbi=Time[i];
              }
           }
         else
           {
            if (lLast_m==0 && hLast_m==0)
              {
               countBarl=0;countBarh=0;countBarExt=0;
              }

            // Òåíäåíöèÿ âîñõîäÿùàÿ
            if (fs==1)
              {
                  if (countBarl>countBarh && countBarl>countBarExt && countBarl>minBars) // Îïðåäåëÿåì òî÷êó ñìåíû òåíäåíöèè.
                    {
                     // çàïîìèíàåì çíà÷åíèå íàïðàâëåíèÿ òðåíäà fs íà ïðåäûäóùåì áàðå
                     ai0=iBarShift(Symbol(),Period(),tai); 
                     bi0=iBarShift(Symbol(),Period(),tbi);
                     fs=2;
                     countBarl=0;

                     zz[ai]=High[ai];
                     zzH[ai]=High[ai];
                     zzL[ai]=0;
                     bi=i;
                     tbi=Time[i];

                     lLast=Low[i]; hLast=High[i]; lLast_m=0; hLast_m=0;

                     for (n=0;countBarExt<minBars;n++) 
                       {
                        if (lLast<Low[i+n+1] && hLast>High[i+n+1]) {countBarExt++; countBarh++; lLast=Low[i+n+1]; hLast=High[i+n+1]; hLast_m=High[i];}
                        else break;
                       }

                     lLast=Low[i]; hLast=High[i];

                    }
              }

            // Òåíäåíöèÿ íèñõîäÿùàÿ
            if (fs==2)
              {
                  if (countBarh>countBarl && countBarh>countBarExt && countBarh>minBars) // Îïðåäåëÿåì òî÷êó ñìåíû òåíäåíöèè.
                    {
                     // çàïîìèíàåì çíà÷åíèå íàïðàâëåíèÿ òðåíäà fs íà ïðåäûäóùåì áàðå
                     ai0=iBarShift(Symbol(),Period(),tai); 
                     bi0=iBarShift(Symbol(),Period(),tbi);
                     fs=1;
                     countBarh=0;

                     zz[bi]=Low[bi];
                     zzL[bi]=Low[bi];
                     zzH[bi]=0;
                     ai=i;
                     tai=Time[i];

                     lLast=Low[i]; hLast=High[i]; lLast_m=0; hLast_m=0;

                     for (n=0;countBarExt<minBars;n++) 
                       {
                        if (lLast<Low[i+n+1] && hLast>High[i+n+1]) {countBarExt++; countBarl++; lLast=Low[i+n+1]; hLast=High[i+n+1]; lLast_m=Low[i];}
                        else break;
                       }

                     lLast=Low[i]; hLast=High[i];

                    }
              }
           } 
        } 
       if (i==0)
         {
          if (hLast<High[i] && fs==1) // Òåíäåíöèÿ íà òåêóùåì áàðå âîñõîäÿùàÿ
            {
             ai=i; tai=Time[i]; zz[ai]=High[ai]; zzH[ai]=High[ai]; zzL[ai]=0;
            }
          else if (lLast>Low[i] && fs==2) // Òåíäåíöèÿ íà òåêóùåì áàðå íèñõîäÿùàÿ
            {
             bi=i; tbi=Time[i]; zz[bi]=Low[bi]; zzL[bi]=Low[bi]; zzH[bi]=0;
            }
//===================================================================================================
      // Íóëåâîé áàð. Ðàñ÷åò ïåðâîãî ëó÷à ZigZag-a

          ai0=iBarShift(Symbol(),Period(),tai); 
          bi0=iBarShift(Symbol(),Period(),tbi);

          if (bi0>1) if (fs==1) {for (n=bi0-1; n>=0; n--) {zzH[n]=0.0; zz[n]=0.0;} zz[ai0]=High[ai0]; zzH[ai0]=High[ai0]; zzL[ai0]=0.0;}         
          if (ai0>1) if (fs==2) {for (n=ai0-1; n>=0; n--) {zzL[n]=0.0; zz[n]=0.0;} zz[bi0]=Low[bi0]; zzL[bi0]=Low[bi0]; zzH[bi0]=0.0;}

          if (ti<Time[1]) i=2;

         }
//====================================================================================================

     }
//--------------------------------------------
 }
//--------------------------------------------------------
// Ñâèíãè Ãàííà. Êîíåö. 
//--------------------------------------------------------


//----------------------------------------------------
// nen-ZigZag. Íà÷àëî.
//----------------------------------------------------
void nenZigZag()
 {
  if (cbi>0)
    {
     datetime nen_time=iTime(NULL,GrossPeriod,0);
     int i=0, j=0; // j - íîìåð áàðà ñ ìàêñèìàëüíûì ìàêñèìóìîì (ìèíèìàëüíûì ìèíèìóìîì) â ïîëîñêå nen-ZigZag
     double nen_dt=0, last_j=0, last_nen=0; //last_j - çíà÷åíèå ìàêñèìàëüíîãî ìàêñèìóìà (ìèíèìàëüíîãî ìèíèìóìà) â ïîëîñêå nen_ZigZag
     int limit, big_limit, bigshift=0;

     if (init_zz)
       {
        limit=Bars-1;
        big_limit=iBars(NULL,GrossPeriod)-1;
       }
     else
       {
        limit=iBarShift(NULL,0,afr[2]);
        big_limit=iBarShift(NULL,GrossPeriod,afr[2]);
       }

     while (bigshift<big_limit && i<limit) // íà÷àëüíîå çàïîëíåíèå áóôåðà nen-ZigZag ("ïîëîñêè")
       {
        if (Time[i]>=nen_time)
          {
           if (ExtIndicator==6) nen_ZigZag[i]=iCustom(NULL,GrossPeriod,"ZigZag_new_nen3",minBars,ExtDeviation,ExtBackstep,0,bigshift);
           else  if (ExtIndicator==7) nen_ZigZag[i]=iCustom(NULL,GrossPeriod,"DT_ZZ",minBars,0,bigshift);
           else  if (ExtIndicator==8) nen_ZigZag[i]=iCustom(NULL,GrossPeriod,"CZigZag",minBars,ExtDeviation,0,bigshift);
           else  if (ExtIndicator==10) nen_ZigZag[i]=iCustom(NULL,GrossPeriod,"Swing_ZZ",minBars,0,bigshift);
           i++;
          }
        else {bigshift++;nen_time=iTime(NULL,GrossPeriod,bigshift);}
       }

     if (init_zz) // îáðàáîòêà èñòîðèè
       {
        double i1=0, i2=0;
        init_zz=false;

        for (i=limit;i>0;i--) // îïðåäåëåíèå íàïðàâëåíèÿ ïåðâîãî ëó÷à
          {
           if (nen_ZigZag[i]>0)
             {
              if (i1==0) i1=nen_ZigZag[i];
              else if (i1>0 && i1!=nen_ZigZag[i]) i2=nen_ZigZag[i];
              if (i2>0) 
                {
                 if (i1>i2) hi_nen=true;
                 else hi_nen=false;
                 break;
                }
             }
          }
       }
     else // ðåæèì ðåàëüíîãî âðåìåíè
       {
        if (afrl[2]>0) hi_nen=false; else hi_nen=true;
       }

     for (i=limit;i>=0;i--)
       {
//        if (i<limit) 
        {zz[i]=0; zzH[i]=0; zzL[i]=0;}

        if (nen_ZigZag[i]>0)
          {
           if (nen_dt>0 && nen_dt!=nen_ZigZag[i])
             {
              if (hi_nen) {hi_nen=false;zzH[j]=last_nen;}
              else {hi_nen=true;zzL[j]=last_nen;}
              last_j=0;nen_dt=0;zz[j]=last_nen;
             }

           if (hi_nen)
             {
              nen_dt=nen_ZigZag[i];
              if (last_j<High[i]) {j=i;last_j=High[i];last_nen=nen_ZigZag[i];}
             }
           else
             {
              nen_dt=nen_ZigZag[i];
              if (last_j==0) {j=i;last_j=Low[i];last_nen=nen_ZigZag[i];}
              if (last_j>Low[i]) {j=i;last_j=Low[i];last_nen=nen_ZigZag[i];}
             }

           if (nen_dt>0 && i==0)  // îïðåäåëåíèå ïåðåëîìà íà íóëåâîì áàðå GrossPeriod
             {
              zz[j]=last_nen;
              if (hi_nen) zzH[j]=last_nen; else zzL[j]=last_nen;
             }
          }
        else
          {
           if (last_j>0)
             {
              if (hi_nen) {hi_nen=false;zzH[j]=last_nen;}
              else {hi_nen=true;zzL[j]=last_nen;}
              last_j=0;nen_dt=0;zz[j]=last_nen;
             }
          }
       }
     }
 }
//--------------------------------------------------------
// nen-ZigZag. Êîíåö. 
//--------------------------------------------------------

/*------------------------------------------------------------------+
|  ZigZag_Talex, èùåò òî÷êè ïåðåëîìà íà ãðàôèêå. Êîëè÷åñòâî òî÷åê   |
|  çàäàåòñÿ âíåøíèì ïàðàìåòðîì ExtPoint.                            |
+------------------------------------------------------------------*/
void ZZTalex(int n)
{
/*ïåðåìåííûå*/
   int    i,j,k,zzbarlow,zzbarhigh,curbar,curbar1,curbar2,EP,Mbar[];
   double curpr,Mprice[];
   bool flag,fd;
   
   
   /*íà÷àëî*/
   
   for(i=0;i<=Bars-1;i++)
   {zz[i]=0.0;zzL[i]=0.0;zzH[i]=0.0;}
   
   EP=ExtPoint;
   zzbarlow=iLowest(NULL,0,MODE_LOW,n,0);        
   zzbarhigh=iHighest(NULL,0,MODE_HIGH,n,0);     
   
   if(zzbarlow<zzbarhigh) {curbar=zzbarlow; curpr=Low[zzbarlow];}
   if(zzbarlow>zzbarhigh) {curbar=zzbarhigh; curpr=High[zzbarhigh];}
   if(zzbarlow==zzbarhigh){curbar=zzbarlow;curpr=funk1(zzbarlow, n);}
   
   ArrayResize(Mbar,ExtPoint);
   ArrayResize(Mprice,ExtPoint);
   j=0;
   endpr=curpr;
   endbar=curbar;
   Mbar[j]=curbar;
   Mprice[j]=curpr;
   
   EP--;
   if(curpr==Low[curbar]) flag=true;
   else flag=false;
   fl=flag;
 
   i=curbar+1;
   while(EP>0)
   {
    if(flag)
    {
     while(i<=Bars-1)
     {
     curbar1=iHighest(NULL,0,MODE_HIGH,n,i); 
     curbar2=iHighest(NULL,0,MODE_HIGH,n,curbar1); 
     if(curbar1==curbar2){curbar=curbar1;curpr=High[curbar];flag=false;i=curbar+1;j++;break;}
     else i=curbar2;
     }
     
     Mbar[j]=curbar;
     Mprice[j]=curpr;
     EP--;
     
    }
    
    if(EP==0) break;
    
    if(!flag) 
    {
     while(i<=Bars-1)
     {
     curbar1=iLowest(NULL,0,MODE_LOW,n,i); 
     curbar2=iLowest(NULL,0,MODE_LOW,n,curbar1); 
     if(curbar1==curbar2){curbar=curbar1;curpr=Low[curbar];flag=true;i=curbar+1;j++;break;}
     else i=curbar2;
     }
     
     Mbar[j]=curbar;
     Mprice[j]=curpr;
     EP--;
    }
   }
   /* èñïðàâëåíèå âåðøèí */
   if(Mprice[0]==Low[Mbar[0]])fd=true; else fd=false;
   for(k=0;k<=ExtPoint-1;k++)
   {
    if(k==0)
    {
     if(fd==true)
      {
       Mbar[k]=iLowest(NULL,0,MODE_LOW,Mbar[k+1]-Mbar[k],Mbar[k]);Mprice[k]=Low[Mbar[k]];endbar=minBars;
      }
     if(fd==false)
      {
       Mbar[k]=iHighest(NULL,0,MODE_HIGH,Mbar[k+1]-Mbar[k],Mbar[k]);Mprice[k]=High[Mbar[k]];endbar=minBars;
      }
    }
    if(k<ExtPoint-2)
    {
     if(fd==true)
      {
       Mbar[k+1]=iHighest(NULL,0,MODE_HIGH,Mbar[k+2]-Mbar[k]-1,Mbar[k]+1);Mprice[k+1]=High[Mbar[k+1]];
      }
     if(fd==false)
      {
       Mbar[k+1]=iLowest(NULL,0,MODE_LOW,Mbar[k+2]-Mbar[k]-1,Mbar[k]+1);Mprice[k+1]=Low[Mbar[k+1]];
      }
    }
    if(fd==true)fd=false;else fd=true;
    
    /* ïîñòðîéêà ZigZag'a */
    zz[Mbar[k]]=Mprice[k];
    //Print("zz_"+k,"=",zz[Mbar[k]]);
    if (k==0)
      {
       if (Mprice[k]>Mprice[k+1])
         {
          zzH[Mbar[k]]=Mprice[k];
         }
       else
         {
          zzL[Mbar[k]]=Mprice[k];
         }
      }
    else
      {
       if (Mprice[k]>Mprice[k-1])
         {
          zzH[Mbar[k]]=Mprice[k];
         }
       else
         {
          zzL[Mbar[k]]=Mprice[k];
         }
      
      }
   }
  
 } 
/*-------------------------------------------------------------------+
/  ZigZag_Talex êîíåö                                                |
/-------------------------------------------------------------------*/

/*-------------------------------------------------------------------+
/ Ôóíöèÿ äëÿ ïîèñêà ó ïåðâîãî áàðà (åñëè îí âíåøíèé) êàêîé ýêñòðåìóì |
/ áóäåì èñïîëüçîâàòü â êà÷åñòâå âåðøèíû.                             |
/-------------------------------------------------------------------*/
double funk1(int zzbarlow, int ExtDepth)
{
 double pr;
 int fbarlow,fbarhigh;
 
 fbarlow=iLowest(NULL,0,MODE_LOW,ExtDepth,zzbarlow);  
 fbarhigh=iHighest(NULL,0,MODE_HIGH,ExtDepth,zzbarlow);
 
 if(fbarlow>fbarhigh) pr=High[zzbarlow];
 if(fbarlow<fbarhigh) pr=Low[zzbarlow];
 if(fbarlow==fbarhigh)
 {
  fbarlow=iLowest(NULL,0,MODE_LOW,2*ExtDepth,zzbarlow);  
  fbarhigh=iHighest(NULL,0,MODE_HIGH,2*ExtDepth,zzbarlow);
  if(fbarlow>fbarhigh) pr=High[zzbarlow];
  if(fbarlow<fbarhigh) pr=Low[zzbarlow];
  if(fbarlow==fbarhigh)
  {
   fbarlow=iLowest(NULL,0,MODE_LOW,3*ExtDepth,zzbarlow);  
   fbarhigh=iHighest(NULL,0,MODE_HIGH,3*ExtDepth,zzbarlow);
   if(fbarlow>fbarhigh) pr=High[zzbarlow];
   if(fbarlow<fbarhigh) pr=Low[zzbarlow];
  }
 }
 return(pr);
}
//--------------------------------------------------------
// Êîíåö. 
//--------------------------------------------------------


//--------------------------------------------------------
// Èíäèêàòîð i-vts . Íà÷àëî. 
//--------------------------------------------------------
//+------------------------------------------------------------------+
//|                                                        i-VTS.mq4 |
//|                                                    Òàõèð & KimIV |
//|                                              http://www.kimiv.ru |
//|                                                                  |
//|  06.12.2005  Èíäèêàòîð VTS                                       |
//+------------------------------------------------------------------+
//
// Ýòîò èíäèêàòîð Èãîðü Êèì ïåðåâåë ñ MQL íà MQ4
//
void i_vts() //
  {
   int    LoopBegin, sh;

 	if (NumberOfBars==0) LoopBegin=Bars-1;
   else LoopBegin=NumberOfBars-1;
   LoopBegin=MathMin(Bars-25, LoopBegin);

   for (sh=LoopBegin; sh>=0; sh--)
     {
      GetValueVTS("", 0, NumberOfVTS, sh);
      ha[sh]=ms[0];
      la[sh]=ms[1];
     }
  }

void i_vts1() //
  {
   int    LoopBegin, sh;

 	if (NumberOfBars==0) LoopBegin=Bars-1;
   else LoopBegin=NumberOfBars-1;
   LoopBegin=MathMin(Bars-25, LoopBegin);

   for (sh=LoopBegin; sh>=0; sh--)
     {
      GetValueVTS("", 0, NumberOfVTS1, sh);
      ham[sh]=ms[0];
      lam[sh]=ms[1];
     }
  }
//+------------------------------------------------------------------+
//------- Ïîêëþ÷åíèå âíåøíèõ ìîäóëåé ---------------------------------
//+------------------------------------------------------------------+
//| Ïàðàìåòðû:                                                       |
//|   sym - íàèìåíîâàíèå èíñòðóìåíòà                                 |
//|   tf  - òàéìôðåéì (êîëè÷åñòâî ìèíóò)                             |
//|   ng  - íîìåð ãðóïïû                                             |
//|   nb  - íîìåð áàðà                                               |
//|   ms  - ìàññèâ ñèãíàëîâ                                          |
//+------------------------------------------------------------------+
void GetValueVTS(string sym, int tf, int ng, int nb)
  {
   if (sym=="") sym=Symbol();
   double f1, f2, s1, s2;

   f1=iClose(sym, tf, nb)-3*iATR(sym, tf, 10, nb);
   f2=iClose(sym, tf, nb)+3*iATR(sym, tf, 10, nb);
   for (int i=1; i<=ng; i++)
     {
      s1=iClose(sym, tf, nb+i)-3*iATR(sym, tf, 10, nb+i);
      s2=iClose(sym, tf, nb+i)+3*iATR(sym, tf, 10, nb+i);
      if (f1<s1) f1=s1;
      if (f2>s2) f2=s2;
     }
    ms[0]=f2;   // âåðõíÿÿ ëèíèÿ
    ms[1]=f1;   // íèæíÿÿ ëèíèÿ
  }
//+------------------------------------------------------------------+
//--------------------------------------------------------
// Èíäèêàòîð i-vts . Êîíåö. 
//--------------------------------------------------------

//--------------------------------------------------------
// Ïàðàìåòðû ðàçíûõ òàéìôðåéìîâ. Íà÷àëî. 
//--------------------------------------------------------
void info_TF()
  {
   string info, info1, info2, txt;
   int i,pips;

   openTF[0]=iOpen(NULL,PERIOD_MN1,0);
   closeTF[0]=iClose(NULL,PERIOD_MN1,0);
   lowTF[0]=iLow(NULL,PERIOD_MN1,0);
   highTF[0]=iHigh(NULL,PERIOD_MN1,0);
   
   openTF[1]=iOpen(NULL,PERIOD_W1,0);
   closeTF[1]=iClose(NULL,PERIOD_W1,0);
   lowTF[1]=iLow(NULL,PERIOD_W1,0);
   highTF[1]=iHigh(NULL,PERIOD_W1,0);
   
   openTF[2]=iOpen(NULL,PERIOD_D1,0);
   closeTF[2]=iClose(NULL,PERIOD_D1,0);
   lowTF[2]=iLow(NULL,PERIOD_D1,0);
   highTF[2]=iHigh(NULL,PERIOD_D1,0);
   
   openTF[3]=iOpen(NULL,PERIOD_H4,0);
   closeTF[3]=iClose(NULL,PERIOD_H4,0);
   lowTF[3]=iLow(NULL,PERIOD_H4,0);
   highTF[3]=iHigh(NULL,PERIOD_H4,0);
   
   openTF[4]=iOpen(NULL,PERIOD_H1,0);
   closeTF[4]=iClose(NULL,PERIOD_H1,0);
   lowTF[4]=iLow(NULL,PERIOD_H1,0);
   highTF[4]=iHigh(NULL,PERIOD_H1,0);
   
   info="|  ";

   for (i=0;i<5;i++)
     {
      pips=(highTF[i]-lowTF[i])/Point;
      if (pips>0)
        {
         if (openTF[i]>closeTF[i]) {txt=" < ";}
         else if (openTF[i]==closeTF[i]) {txt=" = ";}
         else if (openTF[i]<closeTF[i]) {txt=" > ";}
         info=info + TF[i] + txt + DoubleToStr(pips,0) + "   " +  DoubleToStr((closeTF[i]-lowTF[i])/(pips*Point),3) + " |  ";
        }
     }

   if (afrl[0]>0)
     {
      info1=info+Period_tf+"  "+DoubleToStr(100*MathAbs(afrh[1]-afrl[0])/afrh[1],2)+" %";
     }
   else
     {
      info1=info+Period_tf+"  "+DoubleToStr(100*MathAbs(afrh[0]-afrl[1])/afrl[1],2)+" %";
     }

   if (RangeForPointD>0 && vPatOnOff == 1) info2="  |  " + DoubleToStr(LevelForDmin,Digits) + " < D < " + DoubleToStr(LevelForDmax,Digits);

   Comment(info1,"\n",vBullBear + " " + vNamePattern + info2);
   close_TF=Close[0];
  }
//--------------------------------------------------------
// Ïàðàìåòðû ðàçíûõ òàéìôðåéìîâ. Êîíåö. 
//--------------------------------------------------------


//--------------------------------------------------------
// Ñîçäàåì ìàññèâû ñ ÷èñëàìè. Íà÷àëî. 
//--------------------------------------------------------
void array_()
  {
   for (int i=0; i<65; i++)
     {
      numberFibo            [i]=0;
      numberPesavento       [i]=0;
      numberGartley         [i]=0;
      numberGilmorQuality   [i]=0;
      numberGilmorGeometric [i]=0;
      numberGilmorHarmonic  [i]=0;
      numberGilmorArithmetic[i]=0;
      numberGilmorGoldenMean[i]=0;
      numberSquare          [i]=0;
      numberCube            [i]=0;
      numberRectangle       [i]=0;
      numberExt             [i]=0;
     }

   number                [0]=0.111;
   numbertxt             [0]=".111";
   numberCube            [0]=1;

   number                [1]=0.125;
   numbertxt             [1]=".125";
   numberMix             [1]=1;
   numberGilmorHarmonic  [1]=1;

   number                [2]=0.146;
   numbertxt             [2]=".146";
   numberFibo            [2]=1;
   numberGilmorGeometric [2]=1;

   number                [3]=0.167;
   numbertxt             [3]=".167";
   numberGilmorArithmetic[3]=1;

   number                [4]=0.177;
   numbertxt             [4]=".177";
   numberGilmorHarmonic  [4]=1;
   numberSquare          [4]=1;

   number                [5]=0.186;
   numbertxt             [5]=".186";
   numberGilmorGeometric [5]=1;

   number                [6]=0.192;
   numbertxt             [6]=".192";
   numberCube            [6]=1;

   number                [7]=0.2;
   numbertxt             [7]=".2";
   numberRectangle       [7]=1;

   number                [8]=0.236;
   numbertxt             [8]=".236";
   numberFibo            [8]=1;
   numberMix             [8]=1;
   numberGilmorGeometric [8]=1;
   numberGilmorGoldenMean[8]=1;

   number                [9]=0.25;
   numbertxt             [9]=".25";
   numberPesavento       [9]=1;
   numberGilmorQuality   [9]=1;
   numberGilmorHarmonic  [9]=1;
   numberSquare          [9]=1;

   number                [10]=0.3;
   numbertxt             [10]=".3";
   numberGilmorGeometric [10]=1;
   numberGilmorGoldenMean[10]=1;

   number                [11]=0.333;
   numbertxt             [11]=".333";
   numberGilmorArithmetic[11]=1;
   numberCube            [11]=1;

   number                [12]=0.354;
   numbertxt             [12]=".354";
   numberGilmorHarmonic  [12]=1;
   numberSquare          [12]=1;

   number                [13]=0.382;
   numbertxt             [13]=".382";
   numberFibo            [13]=1;
   numberPesavento       [13]=1;
   numberGartley         [13]=1;
   numberGilmorQuality   [13]=1;
   numberGilmorGeometric [13]=1;

   number                [14]=0.447;
   numbertxt             [14]=".447";
   numberGartley         [14]=1;
   numberRectangle       [14]=1;

   number                [15]=0.486;
   numbertxt             [15]=".486";
   numberGilmorGeometric [15]=1;
   numberGilmorGoldenMean[15]=1;

   number                [16]=0.5;
   numbertxt             [16]=".5";
   numberFibo            [16]=1;
   numberPesavento       [16]=1;
   numberGartley         [16]=1;
   numberGilmorQuality   [16]=1;
   numberGilmorHarmonic  [16]=1;
   numberSquare          [16]=1;

   number                [17]=0.526;
   numbertxt             [17]=".526";
   numberGilmorGeometric [17]=1;

   number                [18]=0.577;
   numbertxt             [18]=".577";
   numberGilmorArithmetic[18]=1;
   numberCube            [18]=1;

   number                [19]=0.618;
   numbertxt             [19]=".618";
   numberFibo            [19]=1;
   numberPesavento       [19]=1;
   numberGartley         [19]=1;
   numberGilmorQuality   [19]=1;
   numberGilmorGeometric [19]=1;
   numberGilmorGoldenMean[19]=1;

   number                [20]=0.667;
   numbertxt             [20]=".667";
   numberGilmorQuality   [20]=1;
   numberGilmorArithmetic[20]=1;

   number                [21]=0.707;
   numbertxt             [21]=".707";
   numberPesavento       [21]=1;
   numberGartley         [21]=1;
   numberGilmorHarmonic  [21]=1;
   numberSquare          [21]=1;

   number                [22]=0.764;
   numbertxt             [22]=".764";
   numberFibo            [22]=1;

   number                [23]=0.786;
   numbertxt             [23]=".786";
   numberPesavento       [23]=1;
   numberGartley         [23]=1;
   numberGilmorQuality   [23]=1;
   numberGilmorGeometric [23]=1;
   numberGilmorGoldenMean[23]=1;

   number                [24]=0.809;
   numbertxt             [24]=".809";
   numberExt             [24]=1;

   number                [25]=0.841;
   numbertxt             [25]=".841";
   numberPesavento       [25]=1;

   number                [26]=0.854;
   numbertxt             [26]=".854";
   numberFibo            [26]=1;
   numberMix             [26]=1;

   number                [27]=0.874;
   numbertxt             [27]=".874";
   numberExt             [27]=1;

   number                [28]=0.886;
   numbertxt             [28]=".886";
   numberGartley         [28]=1;

   number                [29]=1.0;
   numbertxt             [29]="1.";
   numberFibo            [29]=1;
   numberPesavento       [29]=1;
   numberGartley         [29]=1;
   numberGilmorQuality   [29]=1;
   numberGilmorGeometric [29]=1;

   number                [30]=1.128;
   numbertxt             [30]="1.128";
   numberPesavento       [30]=1;
   numberGartley         [30]=1;

   number                [31]=1.236;
   numbertxt             [31]="1.236";
   numberFibo            [31]=1;

   number                [32]=1.272;
   numbertxt             [32]="1.272";
   numberPesavento       [32]=1;
   numberGartley         [32]=1;
   numberGilmorQuality   [32]=1;
   numberGilmorGeometric [32]=1;
   numberGilmorGoldenMean[32]=1;

   number                [33]=1.309;
   numbertxt             [33]="1.309";
   numberExt             [33]=1;

   number                [34]=1.414;
   numbertxt             [34]="1.414";
   numberPesavento       [34]=1;
   numberGartley         [34]=1;
   numberGilmorHarmonic  [34]=1;
   numberSquare          [34]=1;

   number                [35]=1.5;
   numbertxt             [35]="1.5";
//   numberPesavento       [35]=1;
   numberGilmorArithmetic[35]=1;

   number                [36]=1.618;
   numbertxt             [36]="1.618";
   numberFibo            [36]=1;
   numberPesavento       [36]=1;
   numberGartley         [36]=1;
   numberGilmorQuality   [36]=1;
   numberGilmorGeometric [36]=1;
   numberGilmorGoldenMean[36]=1;

   number                [37]=1.732;
   numbertxt             [37]="1.732";
   numberMix             [37]=1;
   numberGilmorQuality   [37]=1;
   numberGilmorArithmetic[37]=1;
   numberCube            [37]=1;

   number                [38]=1.75;
   numbertxt             [38]="1.75";
   numberGilmorQuality   [38]=1;

   number                [39]=1.902;
   numbertxt             [39]="1.902";
   numberMix             [39]=1;
   numberGilmorGeometric [39]=1;

   number                [40]=2.0;
   numbertxt             [40]="2.";
   numberPesavento       [40]=1;
   numberGartley         [40]=1;
   numberGilmorQuality   [40]=1;
   numberGilmorHarmonic  [40]=1;
   numberSquare          [40]=1;

   number                [41]=2.058;
   numbertxt             [41]="2.058";
   numberGilmorGeometric [41]=1;
   numberGilmorGoldenMean[41]=1;

   number                [42]=2.236;
   numbertxt             [42]="2.236";
   numberGartley         [42]=1;
   numberGilmorQuality   [42]=1;
   numberRectangle       [42]=1;

   number                [43]=2.288;
   numbertxt             [43]="2.288";
   numberExt             [43]=1;

   number                [44]=2.5;
   numbertxt             [44]="2.5";
   numberGilmorQuality   [44]=1;

   number                [45]=2.618;
   numbertxt             [45]="2.618";
   numberPesavento       [45]=1;
   numberGartley         [45]=1;
   numberGilmorQuality   [45]=1;
   numberGilmorGeometric [45]=1;
   numberGilmorGoldenMean[45]=1;

   number                [46]=2.828;
   numbertxt             [46]="2.828";
   numberGilmorHarmonic  [46]=1;
   numberSquare          [46]=1;

   number                [47]=3.0;
   numbertxt             [47]="3.0";
   numberGilmorQuality   [47]=1;
   numberGilmorArithmetic[47]=1;
   numberCube            [47]=1;

   number                [48]=3.142;
   numbertxt             [48]="3.142";
   numberGartley         [48]=1;

   number                [49]=3.236;
   numbertxt             [49]="3.236";
   numberExt             [49]=1;

   number                [50]=3.33;
   numbertxt             [50]="3.33";
   numberGilmorQuality   [50]=1;
   numberGilmorGeometric [50]=1;
   numberGilmorGoldenMean[50]=1;
   numberExt             [50]=1;

   number                [51]=3.464;
   numbertxt             [51]="3.464";
   numberExt             [51]=1;

   number                [52]=3.618;
   numbertxt             [52]="3.618";
   numberGartley         [52]=1;

   number                [53]=4.0;
   numbertxt             [53]="4.";
   numberPesavento       [53]=1;
   numberGilmorHarmonic  [53]=1;
   numberSquare          [53]=1;

   number                [54]=4.236;
   numbertxt             [54]="4.236";
   numberFibo            [54]=1;
   numberGilmorQuality   [54]=1;
   numberGilmorGeometric [54]=1;
   numberExt             [54]=1;

   number                [55]=4.472;
   numbertxt             [55]="4.472";
   numberExt             [55]=1;

   number                [56]=5.0;
   numbertxt             [56]="5.";
   numberRectangle       [56]=1;

   number                [57]=5.2;
   numbertxt             [57]="5.2";
   numberCube            [57]=1;

   number                [58]=5.388;
   numbertxt             [58]="5.388";
   numberGilmorGeometric [58]=1;

   number                [59]=5.657;
   numbertxt             [59]="5.657";
   numberGilmorHarmonic  [59]=1;
   numberSquare          [59]=1;

   number                [60]=6.0;
   numbertxt             [60]="6.";
   numberGilmorArithmetic[60]=1;

   number                [61]=6.854;
   numbertxt             [61]="6.854";
   numberGilmorQuality   [61]=1;
   numberGilmorGeometric [61]=1;

   number                [62]=8.0;
   numbertxt             [62]="8.";
   numberGilmorHarmonic  [62]=1;

   number                [63]=9.0;
   numbertxt             [63]="9.";
   numberCube            [63]=1;
/*
   number                []=;
   numbertxt             []=;

// !ExtFiboType
   numberFibo            []=;
// 0
   numberPesavento       []=;
// 1
   numberGartley         []=;
// 2
   numberMix             []=;
// 3
   numberGilmorQuality   []=;
// 4
   numberGilmorGeometric []=;
// 5
   numberGilmorHarmonic  []=;
// 6
   numberGilmorArithmetic[]=;
// 7
   numberGilmorGoldenMean[]=;
// 8
   numberSquare          []=;
// 9
   numberCube            []=;
// 10
   numberRectangle       []=;
// 11
   numberExt             []=;
*/
  }
//--------------------------------------------------------
// Ñîçäàåì ìàññèâû ñ ÷èñëàìè. Êîíåö. 
//--------------------------------------------------------


//--------------------------------------------------------
// Îïðåäåëåíèå çíà÷åíèé è öâåòà ÷èñåë äëÿ ïàòòåðíîâ Ïåñàâåíòî. Íà÷àëî. 
//--------------------------------------------------------
void Pesavento_patterns()
  {
   if (ExtFiboType)
     {
      switch (ExtFiboChoice)
        {
         case 0  : {search_number(numberPesavento, ExtPesavento)        ;break;}
         case 1  : {search_number(numberGartley, ExtGartley886)         ;break;}
         case 2  : {search_number(numberGartley, ExtGartley886)         ;break;}
         case 3  : {search_number(numberGilmorQuality, ExtPesavento)    ;break;}
         case 4  : {search_number(numberGilmorGeometric, ExtPesavento)  ;break;}
         case 5  : {search_number(numberGilmorHarmonic, ExtPesavento)   ;break;}
         case 6  : {search_number(numberGilmorArithmetic, ExtPesavento) ;break;}
         case 7  : {search_number(numberGilmorGoldenMean, ExtPesavento) ;break;}
         case 8  : {search_number(numberSquare, ExtPesavento)           ;break;}
         case 9  : {search_number(numberCube, ExtPesavento)             ;break;}
         case 10 : {search_number(numberRectangle, ExtPesavento)        ;break;}
         case 11 : {search_number(numberExt, ExtPesavento)              ;break;}
        }
      }
    else
      {
       search_number(numberFibo, ExtPesavento);
      }

  }
//--------------------------------------------------------
// Îïðåäåëåíèå çíà÷åíèé è öâåòà ÷èñåë äëÿ ïàòòåðíîâ Ïåñàâåíòî. Êîíåö. 
//--------------------------------------------------------

//--------------------------------------------------------
// Ïîèñê ÷èñëà äëÿ ïàòòåðíîâ Ïåñàâåíòî. Íà÷àëî. 
//--------------------------------------------------------
void search_number(int arr[], color cPattern)
  {
   int ki;
   colorPPattern=ExtNotFibo;
   if (ExtFiboChoice!=2)
     {
      if (ExtDeltaType==2) for (ki=kiPRZ;ki<=63;ki++)
                             {
                              if (arr[ki]>0)
                                {
                                 if (MathAbs((number[ki]-kj)/number[ki])<=ExtDelta)
                                   {kk=number[ki]; txtkk=numbertxt[ki]; k2=-1; colorPPattern=cPattern; break;}
                                }
                             }

      if (ExtDeltaType==1) for (ki=kiPRZ;ki<=63;ki++)
                             {
                              if (arr[ki]>0)
                                {
                                 if (MathAbs(number[ki]-kj)<=ExtDelta)
                                   {kk=number[ki]; txtkk=numbertxt[ki]; k2=-1; colorPPattern=cPattern; break;}
                                }
                             }
     }
   else
     {
      if (ExtDeltaType==2) for (ki=kiPRZ;ki<=63;ki++)
                             {
                              if (arr[ki]>0)
                                {
                                 if (MathAbs((number[ki]-kj)/number[ki])<=ExtDelta)
                                   {kk=number[ki]; txtkk=numbertxt[ki]; k2=-1; colorPPattern=cPattern; break;}
                                }
                              else if (numberMix[ki]>0)
                                     if (MathAbs((number[ki]-kj)/number[ki])<=ExtDelta)
                                       {kk=number[ki]; txtkk=numbertxt[ki]; k2=-1; colorPPattern=ExtPesavento; break;}
                             }

      if (ExtDeltaType==1) for (ki=kiPRZ;ki<=63;ki++)
                             {
                              if (arr[ki]>0)
                                {
                                 if (MathAbs(number[ki]-kj)<=ExtDelta)
                                   {kk=number[ki]; txtkk=numbertxt[ki]; k2=-1; colorPPattern=cPattern; break;}
                                }
                              else if (numberMix[ki]>0)
                                     if (MathAbs(number[ki]-kj)<=ExtDelta)
                                       {kk=number[ki]; txtkk=numbertxt[ki]; k2=-1; colorPPattern=ExtPesavento; break;}
                             }
     }
  }
//--------------------------------------------------------
// Ïîèñê ÷èñëà äëÿ ïàòòåðíîâ Ïåñàâåíòî. Êîíåö. 
//--------------------------------------------------------

//--------------------------------------------------------
// Îòïðàâêà ñîîáùåíèÿ íà ýëåêòðîííóþ ïî÷òó. Íà÷àëî. 
//--------------------------------------------------------
void _SendMail(string subject, string some_text)
  {
   SendMail(subject, some_text);
  }
//--------------------------------------------------------
// Îòïðàâêà ñîîáùåíèÿ íà ýëåêòðîííóþ ïî÷òó. Êîíåö. 
//--------------------------------------------------------

