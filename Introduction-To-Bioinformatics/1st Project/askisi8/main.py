from suffix_trees import STree 

bat = """mfvflvllpl vssqcvnltt rtqlppaytn sstrgvyypd kvfrssvlhl tqdlflpffs
nvtwfhaihv sgtngikrfd npvlpfndgv yfasteksni irgwifgttl dsktqslliv
nnatnvvikv cefqfcndpf lgvyyhknnk swmesefrvy ssannctfey vsqpflmdle
gkqgnfknlr efvfknidgy fkiyskhtpi nlvrdlppgf saleplvdlp iginitrfqt
llalhrsylt pgdsssgwta gaaayyvgyl qprtfllkyn engtitdavd caldplsetk
ctlksftvek giyqtsnfrv qptdsivrfp nitnlcpfge vfnattfasv yawnrkrisn
cvadysvlyn stsfstfkcy gvsptklndl cftnvyadsf vitgdevrqi apgqtgkiad
ynyklpddft gcviawnskh idakeggnfn ylyrlfrkan lkpferdist eiyqagskpc
ngqtglncyy plyrygfypt dgvghqpyrv vvlsfellna patvcgpkks tnlvknkcvn
fnfngltgtg vltesnkkfl pfqqfgrdia dttdavrdpq tleilditpc sfggvsvitp
gtnasnqvav lyqdvnctev pvaihadqlt ptwrvystgs nvfqtragcl igaehvnnsy
ecdipigagi casyqtqtns rsvasqsiia ytmslgaens vaysnnsiai ptnftisvtt
eilpvsmtkt svdctmyicg dstecsnlll qygsfctqln raltgiaveq dkntqevfaq
vkqiyktppi kdfggfnfsq ilpdpskpsk rsfiedllfn kvtladagfi kqygdclgdi
aardlicaqk fngltvlppl ltdemiaqyt sallagtits gwtfgagaal qipfamqmay
rfngigvtqn vlyenqklia nqfnsaigki qdslsstasa lgklqdvvnq naqalntlvk
qlssnfgais svlndilsrl dppeaevqid rlitgrlqsl qtyvtqqlir aaeirasanl
aatkmsecvl gqskrvdfcg kgyhlmsfpq saphgvvflh vtyvpaqekn fttapaichd
gkahfpregv fvsngthwfv tqrnfyepqi ittdntfvsg scdvvigivn ntvydplqpe
ldsfkeeldk yfknhtspdv dlgdisgina svvniqkeid rlnevaknln eslidlqelg
kyeqyikwpl evlfqgpggg sgggsgyipe aprdgqayvr kdgewvllst flghhhhhhw
shpqfek"""

bat = bat.replace(" ", "")
bat = bat.replace("\n", "")


spike = """MFVFLVLLPLVSSQCVNLTTRTQLPPAYTNSFTRGVYYPDKVFR
                     SSVLHSTQDLFLPFFSNVTWFHAIHVSGTNGTKRFDNPVLPFNDGVYFASTEKSNIIR
                     GWIFGTTLDSKTQSLLIVNNATNVVIKVCEFQFCNDPFLGVYYHKNNKSWMESEFRVY
                     SSANNCTFEYVSQPFLMDLEGKQGNFKNLREFVFKNIDGYFKIYSKHTPINLVRDLPQ
                     GFSALEPLVDLPIGINITRFQTLLALHRSYLTPGDSSSGWTAGAAAYYVGYLQPRTFL
                     LKYNENGTITDAVDCALDPLSETKCTLKSFTVEKGIYQTSNFRVQPTESIVRFPNITN
                     LCPFGEVFNATRFASVYAWNRKRISNCVADYSVLYNSASFSTFKCYGVSPTKLNDLCF
                     TNVYADSFVIRGDEVRQIAPGQTGKIADYNYKLPDDFTGCVIAWNSNNLDSKVGGNYN
                     YLYRLFRKSNLKPFERDISTEIYQAGSTPCNGVEGFNCYFPLQSYGFQPTNGVGYQPY
                     RVVVLSFELLHAPATVCGPKKSTNLVKNKCVNFNFNGLTGTGVLTESNKKFLPFQQFG
                     RDIADTTDAVRDPQTLEILDITPCSFGGVSVITPGTNTSNQVAVLYQDVNCTEVPVAI
                     HADQLTPTWRVYSTGSNVFQTRAGCLIGAEHVNNSYECDIPIGAGICASYQTQTNSPR
                     RARSVASQSIIAYTMSLGAENSVAYSNNSIAIPTNFTISVTTEILPVSMTKTSVDCTM
                     YICGDSTECSNLLLQYGSFCTQLNRALTGIAVEQDKNTQEVFAQVKQIYKTPPIKDFG
                     GFNFSQILPDPSKPSKRSFIEDLLFNKVTLADAGFIKQYGDCLGDIAARDLICAQKFN
                     GLTVLPPLLTDEMIAQYTSALLAGTITSGWTFGAGAALQIPFAMQMAYRFNGIGVTQN
                     VLYENQKLIANQFNSAIGKIQDSLSSTASALGKLQDVVNQNAQALNTLVKQLSSNFGA
                     ISSVLNDILSRLDKVEAEVQIDRLITGRLQSLQTYVTQQLIRAAEIRASANLAATKMS
                     ECVLGQSKRVDFCGKGYHLMSFPQSAPHGVVFLHVTYVPAQEKNFTTAPAICHDGKAH
                     FPREGVFVSNGTHWFVTQRNFYEPQIITTDNTFVSGNCDVVIGIVNNTVYDPLQPELD
                     SFKEELDKYFKNHTSPDVDLGDISGINASVVNIQKEIDRLNEVAKNLNESLIDLQELG
                     KYEQYIKWPWYIWLGFIAGLIAIVMVTIMLCCMTSCCSCLKGCCSCGSCCKFDEDDSE
                     PVLKGVKLHYT"""

spike = spike.replace(" ", "")
spike = spike.replace("\n", "")

a = [spike, bat]

st = STree(a)

print(st.lcs()) 




