/* Target-dependent code for the RISC-V architecture, for GDB.

   Copyright (C) 1988-2015 Free Software Foundation, Inc.

   Contributed by Alessandro Forin(af@cs.cmu.edu) at CMU
   and by Per Bothner(bothner@cs.wisc.edu) at U.Wisconsin
   and by Todd Snyder <todd@bluespec.com>
   and by Mike Frysinger <vapier@gentoo.org>.

   This file is part of GDB.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

#include "defs.h"
#include "frame.h"
#include "inferior.h"
#include "symtab.h"
#include "value.h"
#include "gdbcmd.h"
#include "language.h"
#include "gdbcore.h"
#include "symfile.h"
#include "objfiles.h"
#include "gdbtypes.h"
#include "target.h"
#include "arch-utils.h"
#include "regcache.h"
#include "osabi.h"
#include "riscv-tdep.h"
#include "block.h"
#include "reggroups.h"
#include "opcode/riscv.h"
#include "elf/riscv.h"
#include "elf-bfd.h"
#include "symcat.h"
#include "sim-regno.h"
#include "gdb/sim-riscv.h"
#include "dis-asm.h"
#include "frame-unwind.h"
#include "frame-base.h"
#include "trad-frame.h"
#include "infcall.h"
#include "floatformat.h"
#include "remote.h"
#include "target-descriptions.h"
#include "dwarf2-frame.h"
#include "user-regs.h"
#include "valprint.h"
#include "opcode/riscv-opc.h"

struct riscv_frame_cache
{
  CORE_ADDR base;
  struct trad_frame_saved_reg *saved_regs;
};

static const char * const riscv_gdb_reg_names[RISCV_NUM_REGS] =
{
  "x0",  "x1",  "x2",  "x3",  "x4",  "x5",  "x6",  "x7",
  "x8",  "x9",  "x10", "x11", "x12", "x13", "x14", "x15",
  "x16", "x17", "x18", "x19", "x20", "x21", "x22", "x23",
  "x24", "x25", "x26", "x27", "x28", "x29", "x30", "x31",
  "pc",
  "f0",  "f1",  "f2",  "f3",  "f4",  "f5",  "f6",  "f7",
  "f8",  "f9",  "f10", "f11", "f12", "f13", "f14", "f15",
  "f16", "f17", "f18", "f19", "f20", "f21", "f22", "f23",
  "f24", "f25", "f26", "f27", "f28", "f29", "f30", "f31",

  // This is ugly, but the simplest way to achieve what I want.
  "csr0", "csr1", "csr2", "csr3", "csr4", "csr5", "csr6", "csr7", "csr8", "csr9",
  "csr10", "csr11", "csr12", "csr13", "csr14", "csr15", "csr16", "csr17",
  "csr18", "csr19", "csr20", "csr21", "csr22", "csr23", "csr24", "csr25",
  "csr26", "csr27", "csr28", "csr29", "csr30", "csr31", "csr32", "csr33",
  "csr34", "csr35", "csr36", "csr37", "csr38", "csr39", "csr40", "csr41",
  "csr42", "csr43", "csr44", "csr45", "csr46", "csr47", "csr48", "csr49",
  "csr50", "csr51", "csr52", "csr53", "csr54", "csr55", "csr56", "csr57",
  "csr58", "csr59", "csr60", "csr61", "csr62", "csr63", "csr64", "csr65",
  "csr66", "csr67", "csr68", "csr69", "csr70", "csr71", "csr72", "csr73",
  "csr74", "csr75", "csr76", "csr77", "csr78", "csr79", "csr80", "csr81",
  "csr82", "csr83", "csr84", "csr85", "csr86", "csr87", "csr88", "csr89",
  "csr90", "csr91", "csr92", "csr93", "csr94", "csr95", "csr96", "csr97",
  "csr98", "csr99", "csr100", "csr101", "csr102", "csr103", "csr104", "csr105",
  "csr106", "csr107", "csr108", "csr109", "csr110", "csr111", "csr112", "csr113",
  "csr114", "csr115", "csr116", "csr117", "csr118", "csr119", "csr120", "csr121",
  "csr122", "csr123", "csr124", "csr125", "csr126", "csr127", "csr128", "csr129",
  "csr130", "csr131", "csr132", "csr133", "csr134", "csr135", "csr136", "csr137",
  "csr138", "csr139", "csr140", "csr141", "csr142", "csr143", "csr144", "csr145",
  "csr146", "csr147", "csr148", "csr149", "csr150", "csr151", "csr152", "csr153",
  "csr154", "csr155", "csr156", "csr157", "csr158", "csr159", "csr160", "csr161",
  "csr162", "csr163", "csr164", "csr165", "csr166", "csr167", "csr168", "csr169",
  "csr170", "csr171", "csr172", "csr173", "csr174", "csr175", "csr176", "csr177",
  "csr178", "csr179", "csr180", "csr181", "csr182", "csr183", "csr184", "csr185",
  "csr186", "csr187", "csr188", "csr189", "csr190", "csr191", "csr192", "csr193",
  "csr194", "csr195", "csr196", "csr197", "csr198", "csr199", "csr200", "csr201",
  "csr202", "csr203", "csr204", "csr205", "csr206", "csr207", "csr208", "csr209",
  "csr210", "csr211", "csr212", "csr213", "csr214", "csr215", "csr216", "csr217",
  "csr218", "csr219", "csr220", "csr221", "csr222", "csr223", "csr224", "csr225",
  "csr226", "csr227", "csr228", "csr229", "csr230", "csr231", "csr232", "csr233",
  "csr234", "csr235", "csr236", "csr237", "csr238", "csr239", "csr240", "csr241",
  "csr242", "csr243", "csr244", "csr245", "csr246", "csr247", "csr248", "csr249",
  "csr250", "csr251", "csr252", "csr253", "csr254", "csr255", "csr256", "csr257",
  "csr258", "csr259", "csr260", "csr261", "csr262", "csr263", "csr264", "csr265",
  "csr266", "csr267", "csr268", "csr269", "csr270", "csr271", "csr272", "csr273",
  "csr274", "csr275", "csr276", "csr277", "csr278", "csr279", "csr280", "csr281",
  "csr282", "csr283", "csr284", "csr285", "csr286", "csr287", "csr288", "csr289",
  "csr290", "csr291", "csr292", "csr293", "csr294", "csr295", "csr296", "csr297",
  "csr298", "csr299", "csr300", "csr301", "csr302", "csr303", "csr304", "csr305",
  "csr306", "csr307", "csr308", "csr309", "csr310", "csr311", "csr312", "csr313",
  "csr314", "csr315", "csr316", "csr317", "csr318", "csr319", "csr320", "csr321",
  "csr322", "csr323", "csr324", "csr325", "csr326", "csr327", "csr328", "csr329",
  "csr330", "csr331", "csr332", "csr333", "csr334", "csr335", "csr336", "csr337",
  "csr338", "csr339", "csr340", "csr341", "csr342", "csr343", "csr344", "csr345",
  "csr346", "csr347", "csr348", "csr349", "csr350", "csr351", "csr352", "csr353",
  "csr354", "csr355", "csr356", "csr357", "csr358", "csr359", "csr360", "csr361",
  "csr362", "csr363", "csr364", "csr365", "csr366", "csr367", "csr368", "csr369",
  "csr370", "csr371", "csr372", "csr373", "csr374", "csr375", "csr376", "csr377",
  "csr378", "csr379", "csr380", "csr381", "csr382", "csr383", "csr384", "csr385",
  "csr386", "csr387", "csr388", "csr389", "csr390", "csr391", "csr392", "csr393",
  "csr394", "csr395", "csr396", "csr397", "csr398", "csr399", "csr400", "csr401",
  "csr402", "csr403", "csr404", "csr405", "csr406", "csr407", "csr408", "csr409",
  "csr410", "csr411", "csr412", "csr413", "csr414", "csr415", "csr416", "csr417",
  "csr418", "csr419", "csr420", "csr421", "csr422", "csr423", "csr424", "csr425",
  "csr426", "csr427", "csr428", "csr429", "csr430", "csr431", "csr432", "csr433",
  "csr434", "csr435", "csr436", "csr437", "csr438", "csr439", "csr440", "csr441",
  "csr442", "csr443", "csr444", "csr445", "csr446", "csr447", "csr448", "csr449",
  "csr450", "csr451", "csr452", "csr453", "csr454", "csr455", "csr456", "csr457",
  "csr458", "csr459", "csr460", "csr461", "csr462", "csr463", "csr464", "csr465",
  "csr466", "csr467", "csr468", "csr469", "csr470", "csr471", "csr472", "csr473",
  "csr474", "csr475", "csr476", "csr477", "csr478", "csr479", "csr480", "csr481",
  "csr482", "csr483", "csr484", "csr485", "csr486", "csr487", "csr488", "csr489",
  "csr490", "csr491", "csr492", "csr493", "csr494", "csr495", "csr496", "csr497",
  "csr498", "csr499", "csr500", "csr501", "csr502", "csr503", "csr504", "csr505",
  "csr506", "csr507", "csr508", "csr509", "csr510", "csr511", "csr512", "csr513",
  "csr514", "csr515", "csr516", "csr517", "csr518", "csr519", "csr520", "csr521",
  "csr522", "csr523", "csr524", "csr525", "csr526", "csr527", "csr528", "csr529",
  "csr530", "csr531", "csr532", "csr533", "csr534", "csr535", "csr536", "csr537",
  "csr538", "csr539", "csr540", "csr541", "csr542", "csr543", "csr544", "csr545",
  "csr546", "csr547", "csr548", "csr549", "csr550", "csr551", "csr552", "csr553",
  "csr554", "csr555", "csr556", "csr557", "csr558", "csr559", "csr560", "csr561",
  "csr562", "csr563", "csr564", "csr565", "csr566", "csr567", "csr568", "csr569",
  "csr570", "csr571", "csr572", "csr573", "csr574", "csr575", "csr576", "csr577",
  "csr578", "csr579", "csr580", "csr581", "csr582", "csr583", "csr584", "csr585",
  "csr586", "csr587", "csr588", "csr589", "csr590", "csr591", "csr592", "csr593",
  "csr594", "csr595", "csr596", "csr597", "csr598", "csr599", "csr600", "csr601",
  "csr602", "csr603", "csr604", "csr605", "csr606", "csr607", "csr608", "csr609",
  "csr610", "csr611", "csr612", "csr613", "csr614", "csr615", "csr616", "csr617",
  "csr618", "csr619", "csr620", "csr621", "csr622", "csr623", "csr624", "csr625",
  "csr626", "csr627", "csr628", "csr629", "csr630", "csr631", "csr632", "csr633",
  "csr634", "csr635", "csr636", "csr637", "csr638", "csr639", "csr640", "csr641",
  "csr642", "csr643", "csr644", "csr645", "csr646", "csr647", "csr648", "csr649",
  "csr650", "csr651", "csr652", "csr653", "csr654", "csr655", "csr656", "csr657",
  "csr658", "csr659", "csr660", "csr661", "csr662", "csr663", "csr664", "csr665",
  "csr666", "csr667", "csr668", "csr669", "csr670", "csr671", "csr672", "csr673",
  "csr674", "csr675", "csr676", "csr677", "csr678", "csr679", "csr680", "csr681",
  "csr682", "csr683", "csr684", "csr685", "csr686", "csr687", "csr688", "csr689",
  "csr690", "csr691", "csr692", "csr693", "csr694", "csr695", "csr696", "csr697",
  "csr698", "csr699", "csr700", "csr701", "csr702", "csr703", "csr704", "csr705",
  "csr706", "csr707", "csr708", "csr709", "csr710", "csr711", "csr712", "csr713",
  "csr714", "csr715", "csr716", "csr717", "csr718", "csr719", "csr720", "csr721",
  "csr722", "csr723", "csr724", "csr725", "csr726", "csr727", "csr728", "csr729",
  "csr730", "csr731", "csr732", "csr733", "csr734", "csr735", "csr736", "csr737",
  "csr738", "csr739", "csr740", "csr741", "csr742", "csr743", "csr744", "csr745",
  "csr746", "csr747", "csr748", "csr749", "csr750", "csr751", "csr752", "csr753",
  "csr754", "csr755", "csr756", "csr757", "csr758", "csr759", "csr760", "csr761",
  "csr762", "csr763", "csr764", "csr765", "csr766", "csr767", "csr768", "csr769",
  "csr770", "csr771", "csr772", "csr773", "csr774", "csr775", "csr776", "csr777",
  "csr778", "csr779", "csr780", "csr781", "csr782", "csr783", "csr784", "csr785",
  "csr786", "csr787", "csr788", "csr789", "csr790", "csr791", "csr792", "csr793",
  "csr794", "csr795", "csr796", "csr797", "csr798", "csr799", "csr800", "csr801",
  "csr802", "csr803", "csr804", "csr805", "csr806", "csr807", "csr808", "csr809",
  "csr810", "csr811", "csr812", "csr813", "csr814", "csr815", "csr816", "csr817",
  "csr818", "csr819", "csr820", "csr821", "csr822", "csr823", "csr824", "csr825",
  "csr826", "csr827", "csr828", "csr829", "csr830", "csr831", "csr832", "csr833",
  "csr834", "csr835", "csr836", "csr837", "csr838", "csr839", "csr840", "csr841",
  "csr842", "csr843", "csr844", "csr845", "csr846", "csr847", "csr848", "csr849",
  "csr850", "csr851", "csr852", "csr853", "csr854", "csr855", "csr856", "csr857",
  "csr858", "csr859", "csr860", "csr861", "csr862", "csr863", "csr864", "csr865",
  "csr866", "csr867", "csr868", "csr869", "csr870", "csr871", "csr872", "csr873",
  "csr874", "csr875", "csr876", "csr877", "csr878", "csr879", "csr880", "csr881",
  "csr882", "csr883", "csr884", "csr885", "csr886", "csr887", "csr888", "csr889",
  "csr890", "csr891", "csr892", "csr893", "csr894", "csr895", "csr896", "csr897",
  "csr898", "csr899", "csr900", "csr901", "csr902", "csr903", "csr904", "csr905",
  "csr906", "csr907", "csr908", "csr909", "csr910", "csr911", "csr912", "csr913",
  "csr914", "csr915", "csr916", "csr917", "csr918", "csr919", "csr920", "csr921",
  "csr922", "csr923", "csr924", "csr925", "csr926", "csr927", "csr928", "csr929",
  "csr930", "csr931", "csr932", "csr933", "csr934", "csr935", "csr936", "csr937",
  "csr938", "csr939", "csr940", "csr941", "csr942", "csr943", "csr944", "csr945",
  "csr946", "csr947", "csr948", "csr949", "csr950", "csr951", "csr952", "csr953",
  "csr954", "csr955", "csr956", "csr957", "csr958", "csr959", "csr960", "csr961",
  "csr962", "csr963", "csr964", "csr965", "csr966", "csr967", "csr968", "csr969",
  "csr970", "csr971", "csr972", "csr973", "csr974", "csr975", "csr976", "csr977",
  "csr978", "csr979", "csr980", "csr981", "csr982", "csr983", "csr984", "csr985",
  "csr986", "csr987", "csr988", "csr989", "csr990", "csr991", "csr992", "csr993",
  "csr994", "csr995", "csr996", "csr997", "csr998", "csr999", "csr1000",
  "csr1001", "csr1002", "csr1003", "csr1004", "csr1005", "csr1006", "csr1007",
  "csr1008", "csr1009", "csr1010", "csr1011", "csr1012", "csr1013", "csr1014",
  "csr1015", "csr1016", "csr1017", "csr1018", "csr1019", "csr1020", "csr1021",
  "csr1022", "csr1023", "csr1024", "csr1025", "csr1026", "csr1027", "csr1028",
  "csr1029", "csr1030", "csr1031", "csr1032", "csr1033", "csr1034", "csr1035",
  "csr1036", "csr1037", "csr1038", "csr1039", "csr1040", "csr1041", "csr1042",
  "csr1043", "csr1044", "csr1045", "csr1046", "csr1047", "csr1048", "csr1049",
  "csr1050", "csr1051", "csr1052", "csr1053", "csr1054", "csr1055", "csr1056",
  "csr1057", "csr1058", "csr1059", "csr1060", "csr1061", "csr1062", "csr1063",
  "csr1064", "csr1065", "csr1066", "csr1067", "csr1068", "csr1069", "csr1070",
  "csr1071", "csr1072", "csr1073", "csr1074", "csr1075", "csr1076", "csr1077",
  "csr1078", "csr1079", "csr1080", "csr1081", "csr1082", "csr1083", "csr1084",
  "csr1085", "csr1086", "csr1087", "csr1088", "csr1089", "csr1090", "csr1091",
  "csr1092", "csr1093", "csr1094", "csr1095", "csr1096", "csr1097", "csr1098",
  "csr1099", "csr1100", "csr1101", "csr1102", "csr1103", "csr1104", "csr1105",
  "csr1106", "csr1107", "csr1108", "csr1109", "csr1110", "csr1111", "csr1112",
  "csr1113", "csr1114", "csr1115", "csr1116", "csr1117", "csr1118", "csr1119",
  "csr1120", "csr1121", "csr1122", "csr1123", "csr1124", "csr1125", "csr1126",
  "csr1127", "csr1128", "csr1129", "csr1130", "csr1131", "csr1132", "csr1133",
  "csr1134", "csr1135", "csr1136", "csr1137", "csr1138", "csr1139", "csr1140",
  "csr1141", "csr1142", "csr1143", "csr1144", "csr1145", "csr1146", "csr1147",
  "csr1148", "csr1149", "csr1150", "csr1151", "csr1152", "csr1153", "csr1154",
  "csr1155", "csr1156", "csr1157", "csr1158", "csr1159", "csr1160", "csr1161",
  "csr1162", "csr1163", "csr1164", "csr1165", "csr1166", "csr1167", "csr1168",
  "csr1169", "csr1170", "csr1171", "csr1172", "csr1173", "csr1174", "csr1175",
  "csr1176", "csr1177", "csr1178", "csr1179", "csr1180", "csr1181", "csr1182",
  "csr1183", "csr1184", "csr1185", "csr1186", "csr1187", "csr1188", "csr1189",
  "csr1190", "csr1191", "csr1192", "csr1193", "csr1194", "csr1195", "csr1196",
  "csr1197", "csr1198", "csr1199", "csr1200", "csr1201", "csr1202", "csr1203",
  "csr1204", "csr1205", "csr1206", "csr1207", "csr1208", "csr1209", "csr1210",
  "csr1211", "csr1212", "csr1213", "csr1214", "csr1215", "csr1216", "csr1217",
  "csr1218", "csr1219", "csr1220", "csr1221", "csr1222", "csr1223", "csr1224",
  "csr1225", "csr1226", "csr1227", "csr1228", "csr1229", "csr1230", "csr1231",
  "csr1232", "csr1233", "csr1234", "csr1235", "csr1236", "csr1237", "csr1238",
  "csr1239", "csr1240", "csr1241", "csr1242", "csr1243", "csr1244", "csr1245",
  "csr1246", "csr1247", "csr1248", "csr1249", "csr1250", "csr1251", "csr1252",
  "csr1253", "csr1254", "csr1255", "csr1256", "csr1257", "csr1258", "csr1259",
  "csr1260", "csr1261", "csr1262", "csr1263", "csr1264", "csr1265", "csr1266",
  "csr1267", "csr1268", "csr1269", "csr1270", "csr1271", "csr1272", "csr1273",
  "csr1274", "csr1275", "csr1276", "csr1277", "csr1278", "csr1279", "csr1280",
  "csr1281", "csr1282", "csr1283", "csr1284", "csr1285", "csr1286", "csr1287",
  "csr1288", "csr1289", "csr1290", "csr1291", "csr1292", "csr1293", "csr1294",
  "csr1295", "csr1296", "csr1297", "csr1298", "csr1299", "csr1300", "csr1301",
  "csr1302", "csr1303", "csr1304", "csr1305", "csr1306", "csr1307", "csr1308",
  "csr1309", "csr1310", "csr1311", "csr1312", "csr1313", "csr1314", "csr1315",
  "csr1316", "csr1317", "csr1318", "csr1319", "csr1320", "csr1321", "csr1322",
  "csr1323", "csr1324", "csr1325", "csr1326", "csr1327", "csr1328", "csr1329",
  "csr1330", "csr1331", "csr1332", "csr1333", "csr1334", "csr1335", "csr1336",
  "csr1337", "csr1338", "csr1339", "csr1340", "csr1341", "csr1342", "csr1343",
  "csr1344", "csr1345", "csr1346", "csr1347", "csr1348", "csr1349", "csr1350",
  "csr1351", "csr1352", "csr1353", "csr1354", "csr1355", "csr1356", "csr1357",
  "csr1358", "csr1359", "csr1360", "csr1361", "csr1362", "csr1363", "csr1364",
  "csr1365", "csr1366", "csr1367", "csr1368", "csr1369", "csr1370", "csr1371",
  "csr1372", "csr1373", "csr1374", "csr1375", "csr1376", "csr1377", "csr1378",
  "csr1379", "csr1380", "csr1381", "csr1382", "csr1383", "csr1384", "csr1385",
  "csr1386", "csr1387", "csr1388", "csr1389", "csr1390", "csr1391", "csr1392",
  "csr1393", "csr1394", "csr1395", "csr1396", "csr1397", "csr1398", "csr1399",
  "csr1400", "csr1401", "csr1402", "csr1403", "csr1404", "csr1405", "csr1406",
  "csr1407", "csr1408", "csr1409", "csr1410", "csr1411", "csr1412", "csr1413",
  "csr1414", "csr1415", "csr1416", "csr1417", "csr1418", "csr1419", "csr1420",
  "csr1421", "csr1422", "csr1423", "csr1424", "csr1425", "csr1426", "csr1427",
  "csr1428", "csr1429", "csr1430", "csr1431", "csr1432", "csr1433", "csr1434",
  "csr1435", "csr1436", "csr1437", "csr1438", "csr1439", "csr1440", "csr1441",
  "csr1442", "csr1443", "csr1444", "csr1445", "csr1446", "csr1447", "csr1448",
  "csr1449", "csr1450", "csr1451", "csr1452", "csr1453", "csr1454", "csr1455",
  "csr1456", "csr1457", "csr1458", "csr1459", "csr1460", "csr1461", "csr1462",
  "csr1463", "csr1464", "csr1465", "csr1466", "csr1467", "csr1468", "csr1469",
  "csr1470", "csr1471", "csr1472", "csr1473", "csr1474", "csr1475", "csr1476",
  "csr1477", "csr1478", "csr1479", "csr1480", "csr1481", "csr1482", "csr1483",
  "csr1484", "csr1485", "csr1486", "csr1487", "csr1488", "csr1489", "csr1490",
  "csr1491", "csr1492", "csr1493", "csr1494", "csr1495", "csr1496", "csr1497",
  "csr1498", "csr1499", "csr1500", "csr1501", "csr1502", "csr1503", "csr1504",
  "csr1505", "csr1506", "csr1507", "csr1508", "csr1509", "csr1510", "csr1511",
  "csr1512", "csr1513", "csr1514", "csr1515", "csr1516", "csr1517", "csr1518",
  "csr1519", "csr1520", "csr1521", "csr1522", "csr1523", "csr1524", "csr1525",
  "csr1526", "csr1527", "csr1528", "csr1529", "csr1530", "csr1531", "csr1532",
  "csr1533", "csr1534", "csr1535", "csr1536", "csr1537", "csr1538", "csr1539",
  "csr1540", "csr1541", "csr1542", "csr1543", "csr1544", "csr1545", "csr1546",
  "csr1547", "csr1548", "csr1549", "csr1550", "csr1551", "csr1552", "csr1553",
  "csr1554", "csr1555", "csr1556", "csr1557", "csr1558", "csr1559", "csr1560",
  "csr1561", "csr1562", "csr1563", "csr1564", "csr1565", "csr1566", "csr1567",
  "csr1568", "csr1569", "csr1570", "csr1571", "csr1572", "csr1573", "csr1574",
  "csr1575", "csr1576", "csr1577", "csr1578", "csr1579", "csr1580", "csr1581",
  "csr1582", "csr1583", "csr1584", "csr1585", "csr1586", "csr1587", "csr1588",
  "csr1589", "csr1590", "csr1591", "csr1592", "csr1593", "csr1594", "csr1595",
  "csr1596", "csr1597", "csr1598", "csr1599", "csr1600", "csr1601", "csr1602",
  "csr1603", "csr1604", "csr1605", "csr1606", "csr1607", "csr1608", "csr1609",
  "csr1610", "csr1611", "csr1612", "csr1613", "csr1614", "csr1615", "csr1616",
  "csr1617", "csr1618", "csr1619", "csr1620", "csr1621", "csr1622", "csr1623",
  "csr1624", "csr1625", "csr1626", "csr1627", "csr1628", "csr1629", "csr1630",
  "csr1631", "csr1632", "csr1633", "csr1634", "csr1635", "csr1636", "csr1637",
  "csr1638", "csr1639", "csr1640", "csr1641", "csr1642", "csr1643", "csr1644",
  "csr1645", "csr1646", "csr1647", "csr1648", "csr1649", "csr1650", "csr1651",
  "csr1652", "csr1653", "csr1654", "csr1655", "csr1656", "csr1657", "csr1658",
  "csr1659", "csr1660", "csr1661", "csr1662", "csr1663", "csr1664", "csr1665",
  "csr1666", "csr1667", "csr1668", "csr1669", "csr1670", "csr1671", "csr1672",
  "csr1673", "csr1674", "csr1675", "csr1676", "csr1677", "csr1678", "csr1679",
  "csr1680", "csr1681", "csr1682", "csr1683", "csr1684", "csr1685", "csr1686",
  "csr1687", "csr1688", "csr1689", "csr1690", "csr1691", "csr1692", "csr1693",
  "csr1694", "csr1695", "csr1696", "csr1697", "csr1698", "csr1699", "csr1700",
  "csr1701", "csr1702", "csr1703", "csr1704", "csr1705", "csr1706", "csr1707",
  "csr1708", "csr1709", "csr1710", "csr1711", "csr1712", "csr1713", "csr1714",
  "csr1715", "csr1716", "csr1717", "csr1718", "csr1719", "csr1720", "csr1721",
  "csr1722", "csr1723", "csr1724", "csr1725", "csr1726", "csr1727", "csr1728",
  "csr1729", "csr1730", "csr1731", "csr1732", "csr1733", "csr1734", "csr1735",
  "csr1736", "csr1737", "csr1738", "csr1739", "csr1740", "csr1741", "csr1742",
  "csr1743", "csr1744", "csr1745", "csr1746", "csr1747", "csr1748", "csr1749",
  "csr1750", "csr1751", "csr1752", "csr1753", "csr1754", "csr1755", "csr1756",
  "csr1757", "csr1758", "csr1759", "csr1760", "csr1761", "csr1762", "csr1763",
  "csr1764", "csr1765", "csr1766", "csr1767", "csr1768", "csr1769", "csr1770",
  "csr1771", "csr1772", "csr1773", "csr1774", "csr1775", "csr1776", "csr1777",
  "csr1778", "csr1779", "csr1780", "csr1781", "csr1782", "csr1783", "csr1784",
  "csr1785", "csr1786", "csr1787", "csr1788", "csr1789", "csr1790", "csr1791",
  "csr1792", "csr1793", "csr1794", "csr1795", "csr1796", "csr1797", "csr1798",
  "csr1799", "csr1800", "csr1801", "csr1802", "csr1803", "csr1804", "csr1805",
  "csr1806", "csr1807", "csr1808", "csr1809", "csr1810", "csr1811", "csr1812",
  "csr1813", "csr1814", "csr1815", "csr1816", "csr1817", "csr1818", "csr1819",
  "csr1820", "csr1821", "csr1822", "csr1823", "csr1824", "csr1825", "csr1826",
  "csr1827", "csr1828", "csr1829", "csr1830", "csr1831", "csr1832", "csr1833",
  "csr1834", "csr1835", "csr1836", "csr1837", "csr1838", "csr1839", "csr1840",
  "csr1841", "csr1842", "csr1843", "csr1844", "csr1845", "csr1846", "csr1847",
  "csr1848", "csr1849", "csr1850", "csr1851", "csr1852", "csr1853", "csr1854",
  "csr1855", "csr1856", "csr1857", "csr1858", "csr1859", "csr1860", "csr1861",
  "csr1862", "csr1863", "csr1864", "csr1865", "csr1866", "csr1867", "csr1868",
  "csr1869", "csr1870", "csr1871", "csr1872", "csr1873", "csr1874", "csr1875",
  "csr1876", "csr1877", "csr1878", "csr1879", "csr1880", "csr1881", "csr1882",
  "csr1883", "csr1884", "csr1885", "csr1886", "csr1887", "csr1888", "csr1889",
  "csr1890", "csr1891", "csr1892", "csr1893", "csr1894", "csr1895", "csr1896",
  "csr1897", "csr1898", "csr1899", "csr1900", "csr1901", "csr1902", "csr1903",
  "csr1904", "csr1905", "csr1906", "csr1907", "csr1908", "csr1909", "csr1910",
  "csr1911", "csr1912", "csr1913", "csr1914", "csr1915", "csr1916", "csr1917",
  "csr1918", "csr1919", "csr1920", "csr1921", "csr1922", "csr1923", "csr1924",
  "csr1925", "csr1926", "csr1927", "csr1928", "csr1929", "csr1930", "csr1931",
  "csr1932", "csr1933", "csr1934", "csr1935", "csr1936", "csr1937", "csr1938",
  "csr1939", "csr1940", "csr1941", "csr1942", "csr1943", "csr1944", "csr1945",
  "csr1946", "csr1947", "csr1948", "csr1949", "csr1950", "csr1951", "csr1952",
  "csr1953", "csr1954", "csr1955", "csr1956", "csr1957", "csr1958", "csr1959",
  "csr1960", "csr1961", "csr1962", "csr1963", "csr1964", "csr1965", "csr1966",
  "csr1967", "csr1968", "csr1969", "csr1970", "csr1971", "csr1972", "csr1973",
  "csr1974", "csr1975", "csr1976", "csr1977", "csr1978", "csr1979", "csr1980",
  "csr1981", "csr1982", "csr1983", "csr1984", "csr1985", "csr1986", "csr1987",
  "csr1988", "csr1989", "csr1990", "csr1991", "csr1992", "csr1993", "csr1994",
  "csr1995", "csr1996", "csr1997", "csr1998", "csr1999", "csr2000", "csr2001",
  "csr2002", "csr2003", "csr2004", "csr2005", "csr2006", "csr2007", "csr2008",
  "csr2009", "csr2010", "csr2011", "csr2012", "csr2013", "csr2014", "csr2015",
  "csr2016", "csr2017", "csr2018", "csr2019", "csr2020", "csr2021", "csr2022",
  "csr2023", "csr2024", "csr2025", "csr2026", "csr2027", "csr2028", "csr2029",
  "csr2030", "csr2031", "csr2032", "csr2033", "csr2034", "csr2035", "csr2036",
  "csr2037", "csr2038", "csr2039", "csr2040", "csr2041", "csr2042", "csr2043",
  "csr2044", "csr2045", "csr2046", "csr2047", "csr2048", "csr2049", "csr2050",
  "csr2051", "csr2052", "csr2053", "csr2054", "csr2055", "csr2056", "csr2057",
  "csr2058", "csr2059", "csr2060", "csr2061", "csr2062", "csr2063", "csr2064",
  "csr2065", "csr2066", "csr2067", "csr2068", "csr2069", "csr2070", "csr2071",
  "csr2072", "csr2073", "csr2074", "csr2075", "csr2076", "csr2077", "csr2078",
  "csr2079", "csr2080", "csr2081", "csr2082", "csr2083", "csr2084", "csr2085",
  "csr2086", "csr2087", "csr2088", "csr2089", "csr2090", "csr2091", "csr2092",
  "csr2093", "csr2094", "csr2095", "csr2096", "csr2097", "csr2098", "csr2099",
  "csr2100", "csr2101", "csr2102", "csr2103", "csr2104", "csr2105", "csr2106",
  "csr2107", "csr2108", "csr2109", "csr2110", "csr2111", "csr2112", "csr2113",
  "csr2114", "csr2115", "csr2116", "csr2117", "csr2118", "csr2119", "csr2120",
  "csr2121", "csr2122", "csr2123", "csr2124", "csr2125", "csr2126", "csr2127",
  "csr2128", "csr2129", "csr2130", "csr2131", "csr2132", "csr2133", "csr2134",
  "csr2135", "csr2136", "csr2137", "csr2138", "csr2139", "csr2140", "csr2141",
  "csr2142", "csr2143", "csr2144", "csr2145", "csr2146", "csr2147", "csr2148",
  "csr2149", "csr2150", "csr2151", "csr2152", "csr2153", "csr2154", "csr2155",
  "csr2156", "csr2157", "csr2158", "csr2159", "csr2160", "csr2161", "csr2162",
  "csr2163", "csr2164", "csr2165", "csr2166", "csr2167", "csr2168", "csr2169",
  "csr2170", "csr2171", "csr2172", "csr2173", "csr2174", "csr2175", "csr2176",
  "csr2177", "csr2178", "csr2179", "csr2180", "csr2181", "csr2182", "csr2183",
  "csr2184", "csr2185", "csr2186", "csr2187", "csr2188", "csr2189", "csr2190",
  "csr2191", "csr2192", "csr2193", "csr2194", "csr2195", "csr2196", "csr2197",
  "csr2198", "csr2199", "csr2200", "csr2201", "csr2202", "csr2203", "csr2204",
  "csr2205", "csr2206", "csr2207", "csr2208", "csr2209", "csr2210", "csr2211",
  "csr2212", "csr2213", "csr2214", "csr2215", "csr2216", "csr2217", "csr2218",
  "csr2219", "csr2220", "csr2221", "csr2222", "csr2223", "csr2224", "csr2225",
  "csr2226", "csr2227", "csr2228", "csr2229", "csr2230", "csr2231", "csr2232",
  "csr2233", "csr2234", "csr2235", "csr2236", "csr2237", "csr2238", "csr2239",
  "csr2240", "csr2241", "csr2242", "csr2243", "csr2244", "csr2245", "csr2246",
  "csr2247", "csr2248", "csr2249", "csr2250", "csr2251", "csr2252", "csr2253",
  "csr2254", "csr2255", "csr2256", "csr2257", "csr2258", "csr2259", "csr2260",
  "csr2261", "csr2262", "csr2263", "csr2264", "csr2265", "csr2266", "csr2267",
  "csr2268", "csr2269", "csr2270", "csr2271", "csr2272", "csr2273", "csr2274",
  "csr2275", "csr2276", "csr2277", "csr2278", "csr2279", "csr2280", "csr2281",
  "csr2282", "csr2283", "csr2284", "csr2285", "csr2286", "csr2287", "csr2288",
  "csr2289", "csr2290", "csr2291", "csr2292", "csr2293", "csr2294", "csr2295",
  "csr2296", "csr2297", "csr2298", "csr2299", "csr2300", "csr2301", "csr2302",
  "csr2303", "csr2304", "csr2305", "csr2306", "csr2307", "csr2308", "csr2309",
  "csr2310", "csr2311", "csr2312", "csr2313", "csr2314", "csr2315", "csr2316",
  "csr2317", "csr2318", "csr2319", "csr2320", "csr2321", "csr2322", "csr2323",
  "csr2324", "csr2325", "csr2326", "csr2327", "csr2328", "csr2329", "csr2330",
  "csr2331", "csr2332", "csr2333", "csr2334", "csr2335", "csr2336", "csr2337",
  "csr2338", "csr2339", "csr2340", "csr2341", "csr2342", "csr2343", "csr2344",
  "csr2345", "csr2346", "csr2347", "csr2348", "csr2349", "csr2350", "csr2351",
  "csr2352", "csr2353", "csr2354", "csr2355", "csr2356", "csr2357", "csr2358",
  "csr2359", "csr2360", "csr2361", "csr2362", "csr2363", "csr2364", "csr2365",
  "csr2366", "csr2367", "csr2368", "csr2369", "csr2370", "csr2371", "csr2372",
  "csr2373", "csr2374", "csr2375", "csr2376", "csr2377", "csr2378", "csr2379",
  "csr2380", "csr2381", "csr2382", "csr2383", "csr2384", "csr2385", "csr2386",
  "csr2387", "csr2388", "csr2389", "csr2390", "csr2391", "csr2392", "csr2393",
  "csr2394", "csr2395", "csr2396", "csr2397", "csr2398", "csr2399", "csr2400",
  "csr2401", "csr2402", "csr2403", "csr2404", "csr2405", "csr2406", "csr2407",
  "csr2408", "csr2409", "csr2410", "csr2411", "csr2412", "csr2413", "csr2414",
  "csr2415", "csr2416", "csr2417", "csr2418", "csr2419", "csr2420", "csr2421",
  "csr2422", "csr2423", "csr2424", "csr2425", "csr2426", "csr2427", "csr2428",
  "csr2429", "csr2430", "csr2431", "csr2432", "csr2433", "csr2434", "csr2435",
  "csr2436", "csr2437", "csr2438", "csr2439", "csr2440", "csr2441", "csr2442",
  "csr2443", "csr2444", "csr2445", "csr2446", "csr2447", "csr2448", "csr2449",
  "csr2450", "csr2451", "csr2452", "csr2453", "csr2454", "csr2455", "csr2456",
  "csr2457", "csr2458", "csr2459", "csr2460", "csr2461", "csr2462", "csr2463",
  "csr2464", "csr2465", "csr2466", "csr2467", "csr2468", "csr2469", "csr2470",
  "csr2471", "csr2472", "csr2473", "csr2474", "csr2475", "csr2476", "csr2477",
  "csr2478", "csr2479", "csr2480", "csr2481", "csr2482", "csr2483", "csr2484",
  "csr2485", "csr2486", "csr2487", "csr2488", "csr2489", "csr2490", "csr2491",
  "csr2492", "csr2493", "csr2494", "csr2495", "csr2496", "csr2497", "csr2498",
  "csr2499", "csr2500", "csr2501", "csr2502", "csr2503", "csr2504", "csr2505",
  "csr2506", "csr2507", "csr2508", "csr2509", "csr2510", "csr2511", "csr2512",
  "csr2513", "csr2514", "csr2515", "csr2516", "csr2517", "csr2518", "csr2519",
  "csr2520", "csr2521", "csr2522", "csr2523", "csr2524", "csr2525", "csr2526",
  "csr2527", "csr2528", "csr2529", "csr2530", "csr2531", "csr2532", "csr2533",
  "csr2534", "csr2535", "csr2536", "csr2537", "csr2538", "csr2539", "csr2540",
  "csr2541", "csr2542", "csr2543", "csr2544", "csr2545", "csr2546", "csr2547",
  "csr2548", "csr2549", "csr2550", "csr2551", "csr2552", "csr2553", "csr2554",
  "csr2555", "csr2556", "csr2557", "csr2558", "csr2559", "csr2560", "csr2561",
  "csr2562", "csr2563", "csr2564", "csr2565", "csr2566", "csr2567", "csr2568",
  "csr2569", "csr2570", "csr2571", "csr2572", "csr2573", "csr2574", "csr2575",
  "csr2576", "csr2577", "csr2578", "csr2579", "csr2580", "csr2581", "csr2582",
  "csr2583", "csr2584", "csr2585", "csr2586", "csr2587", "csr2588", "csr2589",
  "csr2590", "csr2591", "csr2592", "csr2593", "csr2594", "csr2595", "csr2596",
  "csr2597", "csr2598", "csr2599", "csr2600", "csr2601", "csr2602", "csr2603",
  "csr2604", "csr2605", "csr2606", "csr2607", "csr2608", "csr2609", "csr2610",
  "csr2611", "csr2612", "csr2613", "csr2614", "csr2615", "csr2616", "csr2617",
  "csr2618", "csr2619", "csr2620", "csr2621", "csr2622", "csr2623", "csr2624",
  "csr2625", "csr2626", "csr2627", "csr2628", "csr2629", "csr2630", "csr2631",
  "csr2632", "csr2633", "csr2634", "csr2635", "csr2636", "csr2637", "csr2638",
  "csr2639", "csr2640", "csr2641", "csr2642", "csr2643", "csr2644", "csr2645",
  "csr2646", "csr2647", "csr2648", "csr2649", "csr2650", "csr2651", "csr2652",
  "csr2653", "csr2654", "csr2655", "csr2656", "csr2657", "csr2658", "csr2659",
  "csr2660", "csr2661", "csr2662", "csr2663", "csr2664", "csr2665", "csr2666",
  "csr2667", "csr2668", "csr2669", "csr2670", "csr2671", "csr2672", "csr2673",
  "csr2674", "csr2675", "csr2676", "csr2677", "csr2678", "csr2679", "csr2680",
  "csr2681", "csr2682", "csr2683", "csr2684", "csr2685", "csr2686", "csr2687",
  "csr2688", "csr2689", "csr2690", "csr2691", "csr2692", "csr2693", "csr2694",
  "csr2695", "csr2696", "csr2697", "csr2698", "csr2699", "csr2700", "csr2701",
  "csr2702", "csr2703", "csr2704", "csr2705", "csr2706", "csr2707", "csr2708",
  "csr2709", "csr2710", "csr2711", "csr2712", "csr2713", "csr2714", "csr2715",
  "csr2716", "csr2717", "csr2718", "csr2719", "csr2720", "csr2721", "csr2722",
  "csr2723", "csr2724", "csr2725", "csr2726", "csr2727", "csr2728", "csr2729",
  "csr2730", "csr2731", "csr2732", "csr2733", "csr2734", "csr2735", "csr2736",
  "csr2737", "csr2738", "csr2739", "csr2740", "csr2741", "csr2742", "csr2743",
  "csr2744", "csr2745", "csr2746", "csr2747", "csr2748", "csr2749", "csr2750",
  "csr2751", "csr2752", "csr2753", "csr2754", "csr2755", "csr2756", "csr2757",
  "csr2758", "csr2759", "csr2760", "csr2761", "csr2762", "csr2763", "csr2764",
  "csr2765", "csr2766", "csr2767", "csr2768", "csr2769", "csr2770", "csr2771",
  "csr2772", "csr2773", "csr2774", "csr2775", "csr2776", "csr2777", "csr2778",
  "csr2779", "csr2780", "csr2781", "csr2782", "csr2783", "csr2784", "csr2785",
  "csr2786", "csr2787", "csr2788", "csr2789", "csr2790", "csr2791", "csr2792",
  "csr2793", "csr2794", "csr2795", "csr2796", "csr2797", "csr2798", "csr2799",
  "csr2800", "csr2801", "csr2802", "csr2803", "csr2804", "csr2805", "csr2806",
  "csr2807", "csr2808", "csr2809", "csr2810", "csr2811", "csr2812", "csr2813",
  "csr2814", "csr2815", "csr2816", "csr2817", "csr2818", "csr2819", "csr2820",
  "csr2821", "csr2822", "csr2823", "csr2824", "csr2825", "csr2826", "csr2827",
  "csr2828", "csr2829", "csr2830", "csr2831", "csr2832", "csr2833", "csr2834",
  "csr2835", "csr2836", "csr2837", "csr2838", "csr2839", "csr2840", "csr2841",
  "csr2842", "csr2843", "csr2844", "csr2845", "csr2846", "csr2847", "csr2848",
  "csr2849", "csr2850", "csr2851", "csr2852", "csr2853", "csr2854", "csr2855",
  "csr2856", "csr2857", "csr2858", "csr2859", "csr2860", "csr2861", "csr2862",
  "csr2863", "csr2864", "csr2865", "csr2866", "csr2867", "csr2868", "csr2869",
  "csr2870", "csr2871", "csr2872", "csr2873", "csr2874", "csr2875", "csr2876",
  "csr2877", "csr2878", "csr2879", "csr2880", "csr2881", "csr2882", "csr2883",
  "csr2884", "csr2885", "csr2886", "csr2887", "csr2888", "csr2889", "csr2890",
  "csr2891", "csr2892", "csr2893", "csr2894", "csr2895", "csr2896", "csr2897",
  "csr2898", "csr2899", "csr2900", "csr2901", "csr2902", "csr2903", "csr2904",
  "csr2905", "csr2906", "csr2907", "csr2908", "csr2909", "csr2910", "csr2911",
  "csr2912", "csr2913", "csr2914", "csr2915", "csr2916", "csr2917", "csr2918",
  "csr2919", "csr2920", "csr2921", "csr2922", "csr2923", "csr2924", "csr2925",
  "csr2926", "csr2927", "csr2928", "csr2929", "csr2930", "csr2931", "csr2932",
  "csr2933", "csr2934", "csr2935", "csr2936", "csr2937", "csr2938", "csr2939",
  "csr2940", "csr2941", "csr2942", "csr2943", "csr2944", "csr2945", "csr2946",
  "csr2947", "csr2948", "csr2949", "csr2950", "csr2951", "csr2952", "csr2953",
  "csr2954", "csr2955", "csr2956", "csr2957", "csr2958", "csr2959", "csr2960",
  "csr2961", "csr2962", "csr2963", "csr2964", "csr2965", "csr2966", "csr2967",
  "csr2968", "csr2969", "csr2970", "csr2971", "csr2972", "csr2973", "csr2974",
  "csr2975", "csr2976", "csr2977", "csr2978", "csr2979", "csr2980", "csr2981",
  "csr2982", "csr2983", "csr2984", "csr2985", "csr2986", "csr2987", "csr2988",
  "csr2989", "csr2990", "csr2991", "csr2992", "csr2993", "csr2994", "csr2995",
  "csr2996", "csr2997", "csr2998", "csr2999", "csr3000", "csr3001", "csr3002",
  "csr3003", "csr3004", "csr3005", "csr3006", "csr3007", "csr3008", "csr3009",
  "csr3010", "csr3011", "csr3012", "csr3013", "csr3014", "csr3015", "csr3016",
  "csr3017", "csr3018", "csr3019", "csr3020", "csr3021", "csr3022", "csr3023",
  "csr3024", "csr3025", "csr3026", "csr3027", "csr3028", "csr3029", "csr3030",
  "csr3031", "csr3032", "csr3033", "csr3034", "csr3035", "csr3036", "csr3037",
  "csr3038", "csr3039", "csr3040", "csr3041", "csr3042", "csr3043", "csr3044",
  "csr3045", "csr3046", "csr3047", "csr3048", "csr3049", "csr3050", "csr3051",
  "csr3052", "csr3053", "csr3054", "csr3055", "csr3056", "csr3057", "csr3058",
  "csr3059", "csr3060", "csr3061", "csr3062", "csr3063", "csr3064", "csr3065",
  "csr3066", "csr3067", "csr3068", "csr3069", "csr3070", "csr3071", "csr3072",
  "csr3073", "csr3074", "csr3075", "csr3076", "csr3077", "csr3078", "csr3079",
  "csr3080", "csr3081", "csr3082", "csr3083", "csr3084", "csr3085", "csr3086",
  "csr3087", "csr3088", "csr3089", "csr3090", "csr3091", "csr3092", "csr3093",
  "csr3094", "csr3095", "csr3096", "csr3097", "csr3098", "csr3099", "csr3100",
  "csr3101", "csr3102", "csr3103", "csr3104", "csr3105", "csr3106", "csr3107",
  "csr3108", "csr3109", "csr3110", "csr3111", "csr3112", "csr3113", "csr3114",
  "csr3115", "csr3116", "csr3117", "csr3118", "csr3119", "csr3120", "csr3121",
  "csr3122", "csr3123", "csr3124", "csr3125", "csr3126", "csr3127", "csr3128",
  "csr3129", "csr3130", "csr3131", "csr3132", "csr3133", "csr3134", "csr3135",
  "csr3136", "csr3137", "csr3138", "csr3139", "csr3140", "csr3141", "csr3142",
  "csr3143", "csr3144", "csr3145", "csr3146", "csr3147", "csr3148", "csr3149",
  "csr3150", "csr3151", "csr3152", "csr3153", "csr3154", "csr3155", "csr3156",
  "csr3157", "csr3158", "csr3159", "csr3160", "csr3161", "csr3162", "csr3163",
  "csr3164", "csr3165", "csr3166", "csr3167", "csr3168", "csr3169", "csr3170",
  "csr3171", "csr3172", "csr3173", "csr3174", "csr3175", "csr3176", "csr3177",
  "csr3178", "csr3179", "csr3180", "csr3181", "csr3182", "csr3183", "csr3184",
  "csr3185", "csr3186", "csr3187", "csr3188", "csr3189", "csr3190", "csr3191",
  "csr3192", "csr3193", "csr3194", "csr3195", "csr3196", "csr3197", "csr3198",
  "csr3199", "csr3200", "csr3201", "csr3202", "csr3203", "csr3204", "csr3205",
  "csr3206", "csr3207", "csr3208", "csr3209", "csr3210", "csr3211", "csr3212",
  "csr3213", "csr3214", "csr3215", "csr3216", "csr3217", "csr3218", "csr3219",
  "csr3220", "csr3221", "csr3222", "csr3223", "csr3224", "csr3225", "csr3226",
  "csr3227", "csr3228", "csr3229", "csr3230", "csr3231", "csr3232", "csr3233",
  "csr3234", "csr3235", "csr3236", "csr3237", "csr3238", "csr3239", "csr3240",
  "csr3241", "csr3242", "csr3243", "csr3244", "csr3245", "csr3246", "csr3247",
  "csr3248", "csr3249", "csr3250", "csr3251", "csr3252", "csr3253", "csr3254",
  "csr3255", "csr3256", "csr3257", "csr3258", "csr3259", "csr3260", "csr3261",
  "csr3262", "csr3263", "csr3264", "csr3265", "csr3266", "csr3267", "csr3268",
  "csr3269", "csr3270", "csr3271", "csr3272", "csr3273", "csr3274", "csr3275",
  "csr3276", "csr3277", "csr3278", "csr3279", "csr3280", "csr3281", "csr3282",
  "csr3283", "csr3284", "csr3285", "csr3286", "csr3287", "csr3288", "csr3289",
  "csr3290", "csr3291", "csr3292", "csr3293", "csr3294", "csr3295", "csr3296",
  "csr3297", "csr3298", "csr3299", "csr3300", "csr3301", "csr3302", "csr3303",
  "csr3304", "csr3305", "csr3306", "csr3307", "csr3308", "csr3309", "csr3310",
  "csr3311", "csr3312", "csr3313", "csr3314", "csr3315", "csr3316", "csr3317",
  "csr3318", "csr3319", "csr3320", "csr3321", "csr3322", "csr3323", "csr3324",
  "csr3325", "csr3326", "csr3327", "csr3328", "csr3329", "csr3330", "csr3331",
  "csr3332", "csr3333", "csr3334", "csr3335", "csr3336", "csr3337", "csr3338",
  "csr3339", "csr3340", "csr3341", "csr3342", "csr3343", "csr3344", "csr3345",
  "csr3346", "csr3347", "csr3348", "csr3349", "csr3350", "csr3351", "csr3352",
  "csr3353", "csr3354", "csr3355", "csr3356", "csr3357", "csr3358", "csr3359",
  "csr3360", "csr3361", "csr3362", "csr3363", "csr3364", "csr3365", "csr3366",
  "csr3367", "csr3368", "csr3369", "csr3370", "csr3371", "csr3372", "csr3373",
  "csr3374", "csr3375", "csr3376", "csr3377", "csr3378", "csr3379", "csr3380",
  "csr3381", "csr3382", "csr3383", "csr3384", "csr3385", "csr3386", "csr3387",
  "csr3388", "csr3389", "csr3390", "csr3391", "csr3392", "csr3393", "csr3394",
  "csr3395", "csr3396", "csr3397", "csr3398", "csr3399", "csr3400", "csr3401",
  "csr3402", "csr3403", "csr3404", "csr3405", "csr3406", "csr3407", "csr3408",
  "csr3409", "csr3410", "csr3411", "csr3412", "csr3413", "csr3414", "csr3415",
  "csr3416", "csr3417", "csr3418", "csr3419", "csr3420", "csr3421", "csr3422",
  "csr3423", "csr3424", "csr3425", "csr3426", "csr3427", "csr3428", "csr3429",
  "csr3430", "csr3431", "csr3432", "csr3433", "csr3434", "csr3435", "csr3436",
  "csr3437", "csr3438", "csr3439", "csr3440", "csr3441", "csr3442", "csr3443",
  "csr3444", "csr3445", "csr3446", "csr3447", "csr3448", "csr3449", "csr3450",
  "csr3451", "csr3452", "csr3453", "csr3454", "csr3455", "csr3456", "csr3457",
  "csr3458", "csr3459", "csr3460", "csr3461", "csr3462", "csr3463", "csr3464",
  "csr3465", "csr3466", "csr3467", "csr3468", "csr3469", "csr3470", "csr3471",
  "csr3472", "csr3473", "csr3474", "csr3475", "csr3476", "csr3477", "csr3478",
  "csr3479", "csr3480", "csr3481", "csr3482", "csr3483", "csr3484", "csr3485",
  "csr3486", "csr3487", "csr3488", "csr3489", "csr3490", "csr3491", "csr3492",
  "csr3493", "csr3494", "csr3495", "csr3496", "csr3497", "csr3498", "csr3499",
  "csr3500", "csr3501", "csr3502", "csr3503", "csr3504", "csr3505", "csr3506",
  "csr3507", "csr3508", "csr3509", "csr3510", "csr3511", "csr3512", "csr3513",
  "csr3514", "csr3515", "csr3516", "csr3517", "csr3518", "csr3519", "csr3520",
  "csr3521", "csr3522", "csr3523", "csr3524", "csr3525", "csr3526", "csr3527",
  "csr3528", "csr3529", "csr3530", "csr3531", "csr3532", "csr3533", "csr3534",
  "csr3535", "csr3536", "csr3537", "csr3538", "csr3539", "csr3540", "csr3541",
  "csr3542", "csr3543", "csr3544", "csr3545", "csr3546", "csr3547", "csr3548",
  "csr3549", "csr3550", "csr3551", "csr3552", "csr3553", "csr3554", "csr3555",
  "csr3556", "csr3557", "csr3558", "csr3559", "csr3560", "csr3561", "csr3562",
  "csr3563", "csr3564", "csr3565", "csr3566", "csr3567", "csr3568", "csr3569",
  "csr3570", "csr3571", "csr3572", "csr3573", "csr3574", "csr3575", "csr3576",
  "csr3577", "csr3578", "csr3579", "csr3580", "csr3581", "csr3582", "csr3583",
  "csr3584", "csr3585", "csr3586", "csr3587", "csr3588", "csr3589", "csr3590",
  "csr3591", "csr3592", "csr3593", "csr3594", "csr3595", "csr3596", "csr3597",
  "csr3598", "csr3599", "csr3600", "csr3601", "csr3602", "csr3603", "csr3604",
  "csr3605", "csr3606", "csr3607", "csr3608", "csr3609", "csr3610", "csr3611",
  "csr3612", "csr3613", "csr3614", "csr3615", "csr3616", "csr3617", "csr3618",
  "csr3619", "csr3620", "csr3621", "csr3622", "csr3623", "csr3624", "csr3625",
  "csr3626", "csr3627", "csr3628", "csr3629", "csr3630", "csr3631", "csr3632",
  "csr3633", "csr3634", "csr3635", "csr3636", "csr3637", "csr3638", "csr3639",
  "csr3640", "csr3641", "csr3642", "csr3643", "csr3644", "csr3645", "csr3646",
  "csr3647", "csr3648", "csr3649", "csr3650", "csr3651", "csr3652", "csr3653",
  "csr3654", "csr3655", "csr3656", "csr3657", "csr3658", "csr3659", "csr3660",
  "csr3661", "csr3662", "csr3663", "csr3664", "csr3665", "csr3666", "csr3667",
  "csr3668", "csr3669", "csr3670", "csr3671", "csr3672", "csr3673", "csr3674",
  "csr3675", "csr3676", "csr3677", "csr3678", "csr3679", "csr3680", "csr3681",
  "csr3682", "csr3683", "csr3684", "csr3685", "csr3686", "csr3687", "csr3688",
  "csr3689", "csr3690", "csr3691", "csr3692", "csr3693", "csr3694", "csr3695",
  "csr3696", "csr3697", "csr3698", "csr3699", "csr3700", "csr3701", "csr3702",
  "csr3703", "csr3704", "csr3705", "csr3706", "csr3707", "csr3708", "csr3709",
  "csr3710", "csr3711", "csr3712", "csr3713", "csr3714", "csr3715", "csr3716",
  "csr3717", "csr3718", "csr3719", "csr3720", "csr3721", "csr3722", "csr3723",
  "csr3724", "csr3725", "csr3726", "csr3727", "csr3728", "csr3729", "csr3730",
  "csr3731", "csr3732", "csr3733", "csr3734", "csr3735", "csr3736", "csr3737",
  "csr3738", "csr3739", "csr3740", "csr3741", "csr3742", "csr3743", "csr3744",
  "csr3745", "csr3746", "csr3747", "csr3748", "csr3749", "csr3750", "csr3751",
  "csr3752", "csr3753", "csr3754", "csr3755", "csr3756", "csr3757", "csr3758",
  "csr3759", "csr3760", "csr3761", "csr3762", "csr3763", "csr3764", "csr3765",
  "csr3766", "csr3767", "csr3768", "csr3769", "csr3770", "csr3771", "csr3772",
  "csr3773", "csr3774", "csr3775", "csr3776", "csr3777", "csr3778", "csr3779",
  "csr3780", "csr3781", "csr3782", "csr3783", "csr3784", "csr3785", "csr3786",
  "csr3787", "csr3788", "csr3789", "csr3790", "csr3791", "csr3792", "csr3793",
  "csr3794", "csr3795", "csr3796", "csr3797", "csr3798", "csr3799", "csr3800",
  "csr3801", "csr3802", "csr3803", "csr3804", "csr3805", "csr3806", "csr3807",
  "csr3808", "csr3809", "csr3810", "csr3811", "csr3812", "csr3813", "csr3814",
  "csr3815", "csr3816", "csr3817", "csr3818", "csr3819", "csr3820", "csr3821",
  "csr3822", "csr3823", "csr3824", "csr3825", "csr3826", "csr3827", "csr3828",
  "csr3829", "csr3830", "csr3831", "csr3832", "csr3833", "csr3834", "csr3835",
  "csr3836", "csr3837", "csr3838", "csr3839", "csr3840", "csr3841", "csr3842",
  "csr3843", "csr3844", "csr3845", "csr3846", "csr3847", "csr3848", "csr3849",
  "csr3850", "csr3851", "csr3852", "csr3853", "csr3854", "csr3855", "csr3856",
  "csr3857", "csr3858", "csr3859", "csr3860", "csr3861", "csr3862", "csr3863",
  "csr3864", "csr3865", "csr3866", "csr3867", "csr3868", "csr3869", "csr3870",
  "csr3871", "csr3872", "csr3873", "csr3874", "csr3875", "csr3876", "csr3877",
  "csr3878", "csr3879", "csr3880", "csr3881", "csr3882", "csr3883", "csr3884",
  "csr3885", "csr3886", "csr3887", "csr3888", "csr3889", "csr3890", "csr3891",
  "csr3892", "csr3893", "csr3894", "csr3895", "csr3896", "csr3897", "csr3898",
  "csr3899", "csr3900", "csr3901", "csr3902", "csr3903", "csr3904", "csr3905",
  "csr3906", "csr3907", "csr3908", "csr3909", "csr3910", "csr3911", "csr3912",
  "csr3913", "csr3914", "csr3915", "csr3916", "csr3917", "csr3918", "csr3919",
  "csr3920", "csr3921", "csr3922", "csr3923", "csr3924", "csr3925", "csr3926",
  "csr3927", "csr3928", "csr3929", "csr3930", "csr3931", "csr3932", "csr3933",
  "csr3934", "csr3935", "csr3936", "csr3937", "csr3938", "csr3939", "csr3940",
  "csr3941", "csr3942", "csr3943", "csr3944", "csr3945", "csr3946", "csr3947",
  "csr3948", "csr3949", "csr3950", "csr3951", "csr3952", "csr3953", "csr3954",
  "csr3955", "csr3956", "csr3957", "csr3958", "csr3959", "csr3960", "csr3961",
  "csr3962", "csr3963", "csr3964", "csr3965", "csr3966", "csr3967", "csr3968",
  "csr3969", "csr3970", "csr3971", "csr3972", "csr3973", "csr3974", "csr3975",
  "csr3976", "csr3977", "csr3978", "csr3979", "csr3980", "csr3981", "csr3982",
  "csr3983", "csr3984", "csr3985", "csr3986", "csr3987", "csr3988", "csr3989",
  "csr3990", "csr3991", "csr3992", "csr3993", "csr3994", "csr3995", "csr3996",
  "csr3997", "csr3998", "csr3999", "csr4000", "csr4001", "csr4002", "csr4003",
  "csr4004", "csr4005", "csr4006", "csr4007", "csr4008", "csr4009", "csr4010",
  "csr4011", "csr4012", "csr4013", "csr4014", "csr4015", "csr4016", "csr4017",
  "csr4018", "csr4019", "csr4020", "csr4021", "csr4022", "csr4023", "csr4024",
  "csr4025", "csr4026", "csr4027", "csr4028", "csr4029", "csr4030", "csr4031",
  "csr4032", "csr4033", "csr4034", "csr4035", "csr4036", "csr4037", "csr4038",
  "csr4039", "csr4040", "csr4041", "csr4042", "csr4043", "csr4044", "csr4045",
  "csr4046", "csr4047", "csr4048", "csr4049", "csr4050", "csr4051", "csr4052",
  "csr4053", "csr4054", "csr4055", "csr4056", "csr4057", "csr4058", "csr4059",
  "csr4060", "csr4061", "csr4062", "csr4063", "csr4064", "csr4065", "csr4066",
  "csr4067", "csr4068", "csr4069", "csr4070", "csr4071", "csr4072", "csr4073",
  "csr4074", "csr4075", "csr4076", "csr4077", "csr4078", "csr4079", "csr4080",
  "csr4081", "csr4082", "csr4083", "csr4084", "csr4085", "csr4086", "csr4087",
  "csr4088", "csr4089", "csr4090", "csr4091", "csr4092", "csr4093", "csr4094",
  "csr4095", 
};

struct register_alias
{
  const char *name;
  int regnum;
};

static const struct register_alias riscv_register_aliases[] =
{
  { "zero", 0 },
  { "ra", 1 },
  { "sp", 2 },
  { "gp", 3 },
  { "tp", 4 },
  { "t0", 5 },
  { "t1", 6 },
  { "t2", 7 },
  { "fp", 8 },
  { "s0", 8 },
  { "s1", 9 },
  { "a0", 10 },
  { "a1", 11 },
  { "a2", 12 },
  { "a3", 13 },
  { "a4", 14 },
  { "a5", 15 },
  { "a6", 16 },
  { "a7", 17 },
  { "s2", 18 },
  { "s3", 19 },
  { "s4", 20 },
  { "s5", 21 },
  { "s6", 22 },
  { "s7", 23 },
  { "s8", 24 },
  { "s9", 25 },
  { "s10", 26 },
  { "s11", 27 },
  { "t3", 28 },
  { "t4", 29 },
  { "t5", 30 },
  { "t6", 31 },
  /* pc is 32.  */
  { "ft0", 33 },
  { "ft1", 34 },
  { "ft2", 35 },
  { "ft3", 36 },
  { "ft4", 37 },
  { "ft5", 38 },
  { "ft6", 39 },
  { "ft7", 40 },
  { "fs0", 41 },
  { "fs1", 42 },
  { "fa0", 43 },
  { "fa1", 44 },
  { "fa2", 45 },
  { "fa3", 46 },
  { "fa4", 47 },
  { "fa5", 48 },
  { "fa6", 49 },
  { "fa7", 50 },
  { "fs2", 51 },
  { "fs3", 52 },
  { "fs4", 53 },
  { "fs5", 54 },
  { "fs6", 55 },
  { "fs7", 56 },
  { "fs8", 57 },
  { "fs9", 58 },
  { "fs10", 59 },
  { "fs11", 60 },
  { "ft8", 61 },
  { "ft9", 62 },
  { "ft10", 63 },
  { "ft11", 64 },
#define DECLARE_CSR(name, num) { #name, (num)+65 },
#include "opcode/riscv-opc.h"
#undef DECLARE_CSR
};

static const gdb_byte *
riscv_breakpoint_from_pc (struct gdbarch *gdbarch,
			  CORE_ADDR      *bp_addr,
			  int            *bp_size)
{
  /* TODO: Support C.EBREAK for compressed (16-bit) insns.  */
  /* TODO: Support NOPs for >=6 byte insns.  */
  static const gdb_byte sbreak_insn[] = { 0x73, 0x00, 0x10, 0x00, };

  *bp_size = 4;

  return sbreak_insn;
}

static void
riscv_remote_breakpoint_from_pc (struct gdbarch *gdbarch, CORE_ADDR *pcptr, int *kindptr)
{
  struct gdbarch_tdep *tdep = gdbarch_tdep (gdbarch);

  riscv_breakpoint_from_pc (gdbarch, pcptr, kindptr);
}

static struct value *
value_of_riscv_user_reg (struct frame_info *frame, const void *baton)
{
  const int *reg_p = baton;

  return value_of_register (*reg_p, frame);
}

static const char *
riscv_register_name (struct gdbarch *gdbarch,
		     int             regnum)
{
  int i;

  if (tdesc_has_registers (gdbarch_target_desc (gdbarch)))
    return tdesc_register_name (gdbarch, regnum);
  else if (regnum >= 0 && regnum < RISCV_LAST_REGNUM)
    {
      for (i = 0; i < ARRAY_SIZE (riscv_register_aliases); ++i)
	if (regnum == riscv_register_aliases[i].regnum)
	  return riscv_register_aliases[i].name;
      return riscv_gdb_reg_names[regnum];
    }
  else
    return NULL;
}

static void
riscv_extract_return_value (struct type *type,
			    struct regcache *regs,
			    gdb_byte *dst,
			    int regnum)
{
  struct gdbarch *gdbarch = get_regcache_arch (regs);
  enum bfd_endian byte_order = gdbarch_byte_order (gdbarch);
  int regsize = riscv_isa_regsize (gdbarch);
  bfd_byte *valbuf = dst;
  int len = TYPE_LENGTH (type);
  ULONGEST tmp;

  gdb_assert (len <= 2 * regsize);

  while (len > 0)
    {
      regcache_cooked_read_unsigned (regs, regnum++, &tmp);
      store_unsigned_integer (valbuf, min (regsize, len), byte_order, tmp);
      len -= regsize;
      valbuf += regsize;
    }
}

/* Write into appropriate registers a function return value of type
   TYPE, given in virtual format.  */

static void
riscv_store_return_value (struct type *type,
			  struct regcache *regs,
			  const gdb_byte *src,
			  int regnum)
{
  struct gdbarch *gdbarch = get_regcache_arch (regs);
  int regsize = riscv_isa_regsize (gdbarch);
  const bfd_byte *valbuf = src;

  /* Integral values greater than one word are stored in consecutive
     registers starting with R0.  This will always be a multiple of
     the register size.  */

  int len = TYPE_LENGTH (type);

  gdb_assert (len <= 2 * regsize);

  while (len > 0)
    {
      regcache_cooked_write (regs, regnum++, valbuf);
      len -= regsize;
      valbuf += regsize;
    }
}

static enum return_value_convention
riscv_return_value (struct gdbarch  *gdbarch,
		    struct value *function,
		    struct type     *type,
		    struct regcache *regcache,
		    gdb_byte        *readbuf,
		    const gdb_byte  *writebuf)
{
  enum type_code rv_type = TYPE_CODE (type);
  unsigned int rv_size = TYPE_LENGTH (type);
  int fp, regnum;
  ULONGEST tmp;

  /* Paragraph on return values taken from RISC-V specification (post v2.0):

     Values are returned from functions in integer registers a0 and a1 and
     floating-point registers fa0 and fa1.  Floating-point values are returned
     in floating-point registers only if they are primitives or members of a
     struct consisting of only one or two floating-point values.  Other return
     values that fit into two pointer-words are returned in a0 and a1.  Larger
     return values are passed entirely in memory; the caller allocates this
     memory region and passes a pointer to it as an implicit first parameter to
     the callee.  */

  /* Deal with struct/unions first that are passed via memory.  */
  if (rv_size > 2 * riscv_isa_regsize (gdbarch))
    {
      if (readbuf || writebuf)
	regcache_cooked_read_unsigned (regcache, RISCV_A0_REGNUM, &tmp);
      if (readbuf)
	read_memory (tmp, readbuf, rv_size);
      if (writebuf)
	write_memory (tmp, writebuf, rv_size);
      return RETURN_VALUE_ABI_RETURNS_ADDRESS;
    }

  /* Are we dealing with a floating point value?  */
  fp = 0;
  if (rv_type == TYPE_CODE_FLT)
    fp = 1;
  else if (rv_type == TYPE_CODE_STRUCT || rv_type == TYPE_CODE_UNION)
    {
      unsigned int rv_fields = TYPE_NFIELDS (type);

      if (rv_fields == 1)
	{
	  struct type *fieldtype = TYPE_FIELD_TYPE (type, 0);
	  if (TYPE_CODE (check_typedef (fieldtype)) == TYPE_CODE_FLT)
	    fp = 1;
	}
      else if (rv_fields == 2)
	{
	  struct type *fieldtype0 = TYPE_FIELD_TYPE (type, 0);
	  struct type *fieldtype1 = TYPE_FIELD_TYPE (type, 1);

	  if (TYPE_CODE (check_typedef (fieldtype0)) == TYPE_CODE_FLT
	      && TYPE_CODE (check_typedef (fieldtype1)) == TYPE_CODE_FLT)
	    fp = 1;
	}
    }

  /* Handle return value in a register.  */
  regnum = fp ? RISCV_FA0_REGNUM : RISCV_A0_REGNUM;

  if (readbuf)
    riscv_extract_return_value (type, regcache, readbuf, regnum);

  if (writebuf)
    riscv_store_return_value (type, regcache, writebuf, regnum);

  return RETURN_VALUE_REGISTER_CONVENTION;
}

static enum register_status
riscv_pseudo_register_read (struct gdbarch  *gdbarch,
			    struct regcache *regcache,
			    int              regnum,
			    gdb_byte        *buf)
{
  return regcache_raw_read (regcache, regnum, buf);
}

static void
riscv_pseudo_register_write (struct gdbarch  *gdbarch,
			     struct regcache *regcache,
			     int              cookednum,
			     const gdb_byte  *buf)
{
  regcache_raw_write (regcache, cookednum, buf);
}

static struct type *
riscv_register_type (struct gdbarch  *gdbarch,
		     int              regnum)
{
  int regsize = riscv_isa_regsize (gdbarch);

  if (regnum < RISCV_FIRST_FP_REGNUM)
    {
 int_regsizes:
      switch (regsize)
	{
	case 4:
	  return builtin_type (gdbarch)->builtin_int32;
	case 8:
	  return builtin_type (gdbarch)->builtin_int64;
	case 16:
	  return builtin_type (gdbarch)->builtin_int128;
	default:
	  internal_error (__FILE__, __LINE__,
			  _("unknown isa regsize %i"), regsize);
	}
    }
  else if (regnum <= RISCV_LAST_FP_REGNUM)
    {
      switch (regsize)
	{
	case 4:
	  return builtin_type (gdbarch)->builtin_float;
	case 8:
	case 16:
	  return builtin_type (gdbarch)->builtin_double;
	default:
	  internal_error (__FILE__, __LINE__,
			  _("unknown isa regsize %i"), regsize);
	}
    }
  else
    {
      if (regnum == RISCV_CSR_FFLAGS_REGNUM
	  || regnum == RISCV_CSR_FRM_REGNUM
	  || regnum == RISCV_CSR_FCSR_REGNUM)
	return builtin_type (gdbarch)->builtin_int32;

      goto int_regsizes;
    }
}

/* TODO: Replace all this with tdesc XML files.  */
static void
riscv_read_fp_register_single (struct frame_info *frame, int regno,
			       gdb_byte *rare_buffer)
{
  struct gdbarch *gdbarch = get_frame_arch (frame);
  int raw_size = register_size (gdbarch, regno);
  gdb_byte *raw_buffer = alloca (raw_size);

  if (!deprecated_frame_register_read (frame, regno, raw_buffer))
    error (_("can't read register %d (%s)"), regno,
	   gdbarch_register_name (gdbarch, regno));

  if (raw_size == 8)
    {
      int offset;

      if (gdbarch_byte_order (gdbarch) == BFD_ENDIAN_BIG)
	offset = 4;
      else
	offset = 0;

      memcpy (rare_buffer, raw_buffer + offset, 4);
    }
  else
    memcpy (rare_buffer, raw_buffer, 4);
}

static void
riscv_read_fp_register_double (struct frame_info *frame, int regno,
			       gdb_byte *rare_buffer)
{
  struct gdbarch *gdbarch = get_frame_arch (frame);
  int raw_size = register_size (gdbarch, regno);

  if (raw_size == 8)
    {
      if (!deprecated_frame_register_read (frame, regno, rare_buffer))
	error (_("can't read register %d (%s)"), regno,
	       gdbarch_register_name (gdbarch, regno));
    }
  else
    internal_error (__FILE__, __LINE__,
		    _("%s: size says 32-bits, read is 64-bits."), __func__);
}

static void
riscv_print_fp_register (struct ui_file *file, struct frame_info *frame,
			 int regnum)
{
  struct gdbarch *gdbarch = get_frame_arch (frame);
  gdb_byte *raw_buffer;
  struct value_print_options opts;
  double val;
  int inv;
  const char *regname;

  raw_buffer = alloca (2 * register_size (gdbarch, RISCV_FIRST_FP_REGNUM));

  fprintf_filtered (file, "%-15s", gdbarch_register_name (gdbarch, regnum));

  if (register_size (gdbarch, regnum) == 4)
    {
      riscv_read_fp_register_single (frame, regnum, raw_buffer);
      val = unpack_double (builtin_type (gdbarch)->builtin_float, raw_buffer,
			   &inv);

      get_formatted_print_options (&opts, 'x');
      print_scalar_formatted (raw_buffer,
			      builtin_type (gdbarch)->builtin_float,
			      &opts, 'w', file);

      if (!inv)
	fprintf_filtered (file, "\t%-17.9g", val);
    }
  else
    {
      riscv_read_fp_register_double (frame, regnum, raw_buffer);
      val = unpack_double (builtin_type (gdbarch)->builtin_double, raw_buffer,
			   &inv);

      get_formatted_print_options (&opts, 'x');
      print_scalar_formatted (raw_buffer,
			      builtin_type (gdbarch)->builtin_double,
			      &opts, 'g', file);

      if (!inv)
	fprintf_filtered (file, "\t%-24.17g", val);
    }

  if (inv)
    fprintf_filtered (file, "\t<invalid>");
}

static void
riscv_print_register_formatted (struct ui_file *file, struct frame_info *frame,
				int regnum)
{
  struct gdbarch *gdbarch = get_frame_arch (frame);
  gdb_byte raw_buffer[MAX_REGISTER_SIZE];
  struct value_print_options opts;

  if (regnum >= RISCV_FIRST_FP_REGNUM && regnum <= RISCV_LAST_FP_REGNUM)
    riscv_print_fp_register (file, frame, regnum);
  else
    {
      /* Integer type.  */
      int offset, size;
      long long d;

      if (!deprecated_frame_register_read (frame, regnum, raw_buffer))
	{
	  fprintf_filtered (file, "%-15s[Invalid]\n",
			    riscv_register_name (gdbarch, regnum));
	  return;
	}

      fprintf_filtered (file, "%-15s", riscv_register_name (gdbarch, regnum));
      if (gdbarch_byte_order (gdbarch) == BFD_ENDIAN_BIG)
	offset = register_size (gdbarch, regnum) - register_size (gdbarch, regnum);
      else
	offset = 0;

      size = register_size (gdbarch, regnum);
      get_formatted_print_options (&opts, 'x');
      print_scalar_formatted (raw_buffer + offset,
			      register_type (gdbarch, regnum), &opts,
			      size == 8 ? 'g' : 'w', file);
      fprintf_filtered (file, "\t");
      if (size == 4 && riscv_isa_regsize (gdbarch) == 8)
	fprintf_filtered (file, "\t");

      if (regnum == RISCV_CSR_MSTATUS_REGNUM)
	{
	  d = unpack_long (builtin_type (gdbarch)->builtin_int32, raw_buffer);
	  fprintf_filtered (file, "IP:%02X IM:%02X EA:%d VM:%d S64:%d U64:%d EF:%d PEI:%d EI:%d PS:%d S:%d",
			    (int)((d >> 24) & 0xFF),
			    (int)((d >> 16) & 0xFF),
			    (int)((d >> 8) & 0x1),
			    (int)((d >> 7) & 0x1),
			    (int)((d >> 6) & 0x1),
			    (int)((d >> 5) & 0x1),
			    (int)((d >> 4) & 0x1),
			    (int)((d >> 3) & 0x1),
			    (int)((d >> 2) & 0x1),
			    (int)((d >> 1) & 0x1),
			    (int)((d >> 0) & 0x1));
	}
      else if (regnum == RISCV_CSR_FCSR_REGNUM
	       || regnum == RISCV_CSR_FFLAGS_REGNUM
	       || regnum == RISCV_CSR_FRM_REGNUM)
	{
	  d = unpack_long (builtin_type (gdbarch)->builtin_int32, raw_buffer);

	  if (regnum != RISCV_CSR_FRM_REGNUM)
	    fprintf_filtered (file, "RD:%01X NV:%d DZ:%d OF:%d UF:%d NX:%d   ",
			      (int)((d >> 5) & 0x7),
			      (int)((d >> 4) & 0x1),
			      (int)((d >> 3) & 0x1),
			      (int)((d >> 2) & 0x1),
			      (int)((d >> 1) & 0x1),
			      (int)((d >> 0) & 0x1));

	  if (regnum != RISCV_CSR_FFLAGS_REGNUM)
	    {
	      static const char * const sfrm[] = {
		"RNE (round to nearest; ties to even)",
		"RTZ (Round towards zero)",
		"RDN (Round down towards -∞)",
		"RUP (Round up towards +∞)",
		"RMM (Round to nearest; tiest to max magnitude)",
		"INVALID[5]",
		"INVALID[6]",
		"dynamic rounding mode",
	      };
	      int frm = ((regnum == RISCV_CSR_FCSR_REGNUM) ? (d >> 5) : d) & 0x3;

	      fprintf_filtered (file, "FRM:%i [%s]", frm, sfrm[frm]);
	    }
	}
      else
	{
	  get_formatted_print_options (&opts, 'd');
	  print_scalar_formatted (raw_buffer + offset,
				  register_type (gdbarch, regnum),
				  &opts, 0, file);
	}
    }
  fprintf_filtered (file, "\n");
}

static int
riscv_register_reggroup_p (struct gdbarch  *gdbarch,
			   int              regnum,
			   struct reggroup *reggroup)
{
  int float_p;
  int raw_p;
  unsigned int i;

  /* Used by 'info registers' and 'info registers <groupname>'. */

  if (gdbarch_register_name (gdbarch, regnum) == NULL
      || gdbarch_register_name (gdbarch, regnum)[0] == '\0')
    return 0;

  if (reggroup == all_reggroup) {
    if (regnum < RISCV_FIRST_CSR_REGNUM)
      return 1;
    /* Only include CSRs that have aliases. */
    for (i = 0; i < ARRAY_SIZE (riscv_register_aliases); ++i) {
	if (regnum == riscv_register_aliases[i].regnum)
          return 1;
    }
    return 0;
  } else if (reggroup == float_reggroup)
    return (regnum >= RISCV_FIRST_FP_REGNUM && regnum <= RISCV_LAST_FP_REGNUM)
	    || (regnum == RISCV_CSR_FCSR_REGNUM
	        || regnum == RISCV_CSR_FFLAGS_REGNUM
	        || regnum == RISCV_CSR_FRM_REGNUM);
  else if (reggroup == general_reggroup)
    return regnum < RISCV_FIRST_FP_REGNUM;
  else if (reggroup == restore_reggroup || reggroup == save_reggroup)
    return regnum <= RISCV_LAST_FP_REGNUM;
  else if (reggroup == system_reggroup) {
    /* Only include CSRs that have aliases. */
    if (regnum < RISCV_FIRST_CSR_REGNUM || regnum > RISCV_LAST_CSR_REGNUM)
      return 0;
    for (i = 0; i < ARRAY_SIZE (riscv_register_aliases); ++i) {
	if (regnum == riscv_register_aliases[i].regnum)
          return 1;
    }
    return 0;
  } else if (reggroup == vector_reggroup)
    return 0;
  else
    internal_error (__FILE__, __LINE__, _("unhandled reggroup"));
}

static void
riscv_print_registers_info (struct gdbarch    *gdbarch,
			    struct ui_file    *file,
			    struct frame_info *frame,
			    int                regnum,
			    int                all)
{
  /* Use by 'info all-registers'. */
  struct reggroup *reggroup;

  if (regnum != -1)
    {
      /* Print one specified register.  */
      gdb_assert (regnum < RISCV_LAST_REGNUM);
      if (NULL == riscv_register_name (gdbarch, regnum))
        error (_("Not a valid register for the current processor type"));
      riscv_print_register_formatted (file, frame, regnum);
      return;
    }

  if (all)
    reggroup = all_reggroup;
  else
    reggroup = general_reggroup;
  for (regnum = 0; regnum <= RISCV_LAST_REGNUM; ++regnum)
    {
      /* Zero never changes, so might as well hide by default.  */
      if (regnum == RISCV_ZERO_REGNUM && !all)
        continue;
      if (riscv_register_reggroup_p(gdbarch, regnum, reggroup))
        riscv_print_register_formatted (file, frame, regnum);
    }
}

static ULONGEST
riscv_fetch_instruction (struct gdbarch *gdbarch, CORE_ADDR addr)
{
  enum bfd_endian byte_order = gdbarch_byte_order (gdbarch);
  gdb_byte buf[8];
  int instlen, status;

  /* All insns are at least 16 bits.  */
  status = target_read_memory (addr, buf, 2);
  if (status)
    memory_error (status, addr);

  /* If we need more, grab it now.  */
  instlen = riscv_insn_length (buf[0]);
  if (instlen > sizeof (buf))
    internal_error (__FILE__, __LINE__, _("%s: riscv_insn_length returned %i"),
		    __func__, instlen);
  else if (instlen > 2)
    {
      status = target_read_memory (addr + 2, buf + 2, instlen - 2);
      if (status)
	memory_error (status, addr + 2);
    }

  return extract_unsigned_integer (buf, instlen, byte_order);
}

static void
set_reg_offset (struct gdbarch *gdbarch, struct riscv_frame_cache *this_cache,
		int regnum, CORE_ADDR offset)
{
  if (this_cache != NULL && this_cache->saved_regs[regnum].addr == -1)
    this_cache->saved_regs[regnum].addr = offset;
}

static void
reset_saved_regs (struct gdbarch *gdbarch, struct riscv_frame_cache *this_cache)
{
  const int num_regs = gdbarch_num_regs (gdbarch);
  int i;

  if (this_cache == NULL || this_cache->saved_regs == NULL)
    return;

  for (i = 0; i < num_regs; ++i)
    this_cache->saved_regs[i].addr = -1;
}

static CORE_ADDR
riscv_scan_prologue (struct gdbarch *gdbarch,
		     CORE_ADDR start_pc, CORE_ADDR limit_pc,
		     struct frame_info *this_frame,
		     struct riscv_frame_cache *this_cache)
{
  CORE_ADDR cur_pc;
  CORE_ADDR frame_addr = 0;
  CORE_ADDR sp;
  long frame_offset;
  int frame_reg = RISCV_SP_REGNUM;

  CORE_ADDR end_prologue_addr = 0;
  int seen_sp_adjust = 0;
  int load_immediate_bytes = 0;

  /* Can be called when there's no process, and hence when there's no THIS_FRAME. */
  if (this_frame != NULL)
    sp = get_frame_register_signed (this_frame, RISCV_SP_REGNUM);
  else
    sp = 0;

  if (limit_pc > start_pc + 200)
    limit_pc = start_pc + 200;

 restart:

  frame_offset = 0;
  /* TODO: Handle compressed extensions.  */
  for (cur_pc = start_pc; cur_pc < limit_pc; cur_pc += 4)
    {
      unsigned long inst, opcode;
      int reg, rs1, imm12, rs2, offset12, funct3;

      /* Fetch the instruction.  */
      inst = (unsigned long) riscv_fetch_instruction (gdbarch, cur_pc);
      opcode = inst & 0x7F;
      reg = (inst >> 7) & 0x1F;
      rs1 = (inst >> 15) & 0x1F;
      imm12 = (inst >> 20) & 0xFFF;
      rs2 = (inst >> 20) & 0x1F;
      offset12 = (((inst >> 25) & 0x7F) << 5) + ((inst >> 7) & 0x1F);
      funct3 = (inst >> 12) & 0x7;

      /* Look for common stack adjustment insns.  */
      if ((opcode == 0x13 || opcode == 0x1B) && reg == RISCV_SP_REGNUM
	  && rs1 == RISCV_SP_REGNUM)
	{
	  /* addi sp, sp, -i */
	  /* addiw sp, sp, -i */
	  if (imm12 & 0x800)
	    frame_offset += 0x1000 - imm12;
	  else
	    break;
	  seen_sp_adjust = 1;
	}
      else if (opcode == 0x23 && funct3 == 0x2 && rs1 == RISCV_SP_REGNUM)
	{
	  /* sw reg, offset(sp) */
	  set_reg_offset (gdbarch, this_cache, rs1, sp + offset12);
	}
      else if (opcode == 0x23 && funct3 == 0x3 && rs1 == RISCV_SP_REGNUM)
	{
	  /* sd reg, offset(sp) */
	  set_reg_offset (gdbarch, this_cache, rs1, sp + offset12);
	}
      else if (opcode == 0x13 && reg == RISCV_FP_REGNUM && rs1 == RISCV_SP_REGNUM)
	{
	  /* addi s0, sp, size */
	  if ((long)imm12 != frame_offset)
	    frame_addr = sp + imm12;
	}
      else if (this_frame && frame_reg == RISCV_SP_REGNUM)
	{
	  unsigned alloca_adjust;

	  frame_reg = RISCV_FP_REGNUM;
	  frame_addr = get_frame_register_signed (this_frame, RISCV_FP_REGNUM);

	  alloca_adjust = (unsigned)(frame_addr - (sp - imm12));
	  if (alloca_adjust > 0)
	    {
	      sp += alloca_adjust;
	      reset_saved_regs (gdbarch, this_cache);
	      goto restart;
	    }
	}
      else if ((opcode == 0x33 || opcode == 0x3B) && reg == RISCV_FP_REGNUM
	       && rs1 == RISCV_SP_REGNUM && rs2 == RISCV_ZERO_REGNUM)
	{
	  /* add s0, sp, 0 */
	  /* addw s0, sp, 0 */
	  if (this_frame && frame_reg == RISCV_SP_REGNUM)
	    {
	      unsigned alloca_adjust;
	      frame_reg = RISCV_FP_REGNUM;
	      frame_addr = get_frame_register_signed (this_frame,
						      RISCV_FP_REGNUM);

	      alloca_adjust = (unsigned)(frame_addr - sp);
	      if (alloca_adjust > 0)
		{
		  sp = frame_addr;
		  reset_saved_regs (gdbarch, this_cache);
		  goto restart;
		}
	    }
	}
      else if (opcode == 0x23 && funct3 == 0x2 && rs1 == RISCV_FP_REGNUM)
	{
	  /* sw reg, offset(s0) */
	  set_reg_offset (gdbarch, this_cache, rs1, frame_addr + offset12);
	}
      else if (reg == RISCV_GP_REGNUM
	       && (opcode == 0x17 || opcode == 0x37
		   || (opcode == 0x13 && rs1 == RISCV_GP_REGNUM)
		   || (opcode == 0x33 && (rs1 == RISCV_GP_REGNUM
					  || rs2 == RISCV_GP_REGNUM))))
	{
	  /* auipc gp, n */
	  /* addi gp, gp, n */
	  /* add gp, gp, reg */
	  /* add gp, reg, gp */
	  /* lui gp, n */
	  /* These instructions are part of the prologue, but we don't need to
	     do anything special to handle them.  */
	}
      else
	{
	  if (end_prologue_addr == 0)
	    end_prologue_addr = cur_pc;
	}
    }

  if (this_cache != NULL)
    {
      this_cache->base = get_frame_register_signed (this_frame, frame_reg)
	+ frame_offset;
      this_cache->saved_regs[RISCV_PC_REGNUM] =
	this_cache->saved_regs[RISCV_RA_REGNUM];
    }

  if (end_prologue_addr == 0)
    end_prologue_addr = cur_pc;

  if (load_immediate_bytes && !seen_sp_adjust)
    end_prologue_addr -= load_immediate_bytes;

  return end_prologue_addr;
}

static CORE_ADDR
riscv_skip_prologue (struct gdbarch *gdbarch,
		     CORE_ADDR       pc)
{
  CORE_ADDR limit_pc;
  CORE_ADDR func_addr;

  /* See if we can determine the end of the prologue via the symbol table.
     If so, then return either PC, or the PC after the prologue, whichever
     is greater.  */
  if (find_pc_partial_function (pc, NULL, &func_addr, NULL))
    {
      CORE_ADDR post_prologue_pc = skip_prologue_using_sal (gdbarch, func_addr);
      if (post_prologue_pc != 0)
	return max (pc, post_prologue_pc);
    }

  /* Can't determine prologue from the symbol table, need to examine
     instructions.  */

  /* Find an upper limit on the function prologue using the debug information.
     If the debug information could not be used to provide that bound, then use
     an arbitrary large number as the upper bound.  */
  limit_pc = skip_prologue_using_sal (gdbarch, pc);
  if (limit_pc == 0)
    limit_pc = pc + 100;   /* MAGIC! */

  return riscv_scan_prologue (gdbarch, pc, limit_pc, NULL, NULL);
}

static CORE_ADDR
riscv_push_dummy_code (struct gdbarch *gdbarch, CORE_ADDR sp, CORE_ADDR funaddr,
		       struct value **args, int nargs, struct type *value_type,
		       CORE_ADDR *real_pc, CORE_ADDR *bp_addr,
		       struct regcache *regcache)
{
  *bp_addr = sp;
  *real_pc = funaddr;

  /* Keep the stack aligned.  */
  return sp - 16;
}

static CORE_ADDR
riscv_push_dummy_call (struct gdbarch *gdbarch,
		       struct value *function,
		       struct regcache *regcache,
		       CORE_ADDR bp_addr,
		       int nargs,
		       struct value **args,
		       CORE_ADDR sp,
		       int struct_return,
		       CORE_ADDR struct_addr)
{
  enum bfd_endian byte_order = gdbarch_byte_order (gdbarch);
  struct gdbarch_tdep *tdep = gdbarch_tdep (gdbarch);
  gdb_byte buf[4];
  int i;
  CORE_ADDR func_addr = find_function_addr (function, NULL);

  /* Push excess arguments in reverse order.  */

  for (i = nargs; i >= 8; --i)
    {
      struct type *value_type = value_enclosing_type (args[i]);
      int container_len = align_up (TYPE_LENGTH (value_type), 3);

      sp -= container_len;
      write_memory (sp, value_contents_writeable (args[i]), container_len);
    }

  /* Initialize argument registers.  */

  for (i = 0; i < nargs && i < 8; ++i)
    {
      struct type *value_type = value_enclosing_type (args[i]);
      const gdb_byte *arg_bits = value_contents_all (args[i]);
      int regnum = TYPE_CODE (value_type) == TYPE_CODE_FLT ?
	RISCV_FA0_REGNUM : RISCV_A0_REGNUM;

      regcache_cooked_write_unsigned
	(regcache, regnum + i,
	 extract_unsigned_integer (arg_bits, tdep->register_size, byte_order));
    }

  /* Store struct value address.  */

  if (struct_return)
    regcache_cooked_write_unsigned (regcache, RISCV_A0_REGNUM, struct_addr);

  /* Set the dummy return value to bp_addr.
     A dummy breakpoint will be setup to execute the call.  */

  regcache_cooked_write_unsigned (regcache, RISCV_RA_REGNUM, bp_addr);

  /* Finally, update the stack pointer.  */

  regcache_cooked_write_unsigned (regcache, RISCV_SP_REGNUM, sp);

  return sp;
}

static CORE_ADDR
riscv_frame_align (struct gdbarch *gdbarch, CORE_ADDR addr)
{
  return align_down (addr, 16);
}

static CORE_ADDR
riscv_unwind_pc (struct gdbarch *gdbarch, struct frame_info *next_frame)
{
  return frame_unwind_register_signed (next_frame, RISCV_PC_REGNUM);
}

static CORE_ADDR
riscv_unwind_sp (struct gdbarch *gdbarch, struct frame_info *next_frame)
{
  return frame_unwind_register_signed (next_frame, RISCV_SP_REGNUM);
}

static struct frame_id
riscv_dummy_id (struct gdbarch *gdbarch, struct frame_info *this_frame)
{
  return frame_id_build (get_frame_register_signed (this_frame, RISCV_SP_REGNUM),
			 get_frame_pc (this_frame));
}

static struct trad_frame_cache *
riscv_frame_cache (struct frame_info *this_frame, void **this_cache)
{
  CORE_ADDR pc;
  CORE_ADDR start_addr;
  CORE_ADDR stack_addr;
  struct trad_frame_cache *this_trad_cache;
  struct gdbarch *gdbarch = get_frame_arch (this_frame);

  if ((*this_cache) != NULL)
    return (*this_cache);
  this_trad_cache = trad_frame_cache_zalloc (this_frame);
  (*this_cache) = this_trad_cache;

  trad_frame_set_reg_realreg (this_trad_cache, gdbarch_pc_regnum (gdbarch),
			      RISCV_RA_REGNUM);

  pc = get_frame_pc (this_frame);
  find_pc_partial_function (pc, NULL, &start_addr, NULL);
  stack_addr = get_frame_register_signed (this_frame, RISCV_SP_REGNUM);
  trad_frame_set_id (this_trad_cache, frame_id_build (stack_addr, start_addr));

  trad_frame_set_this_base (this_trad_cache, stack_addr);

  return this_trad_cache;
}

static void
riscv_frame_this_id (struct frame_info *this_frame,
		     void              **prologue_cache,
		     struct frame_id   *this_id)
{
  struct trad_frame_cache *info = riscv_frame_cache (this_frame, prologue_cache);
  trad_frame_get_id (info, this_id);
}

static struct value *
riscv_frame_prev_register (struct frame_info *this_frame,
			   void              **prologue_cache,
			   int                regnum)
{
  struct trad_frame_cache *info = riscv_frame_cache (this_frame, prologue_cache);
  return trad_frame_get_register (info, this_frame, regnum);
}

static const struct frame_unwind riscv_frame_unwind =
{
  .type          = NORMAL_FRAME,
  .stop_reason   = default_frame_unwind_stop_reason,
  .this_id       = riscv_frame_this_id,
  .prev_register = riscv_frame_prev_register,
  .unwind_data   = NULL,
  .sniffer       = default_frame_sniffer,
  .dealloc_cache = NULL,
  .prev_arch     = NULL,
};

static struct gdbarch *
riscv_gdbarch_init (struct gdbarch_info  info,
		    struct gdbarch_list *arches)
{
  struct gdbarch *gdbarch;
  struct gdbarch_tdep *tdep;
  const struct bfd_arch_info *binfo;

  int abi, i;

  /* For now, base the abi on the elf class.  */
  abi = RISCV_ABI_FLAG_RV32I;
  if (info.abfd && bfd_get_flavour (info.abfd) == bfd_target_elf_flavour)
    {
      unsigned char eclass = elf_elfheader (info.abfd)->e_ident[EI_CLASS];

      if (eclass == ELFCLASS32)
	abi = RISCV_ABI_FLAG_RV32I;
      else if (eclass == ELFCLASS64)
	abi = RISCV_ABI_FLAG_RV64I;
    }

  /* Find a candidate among the list of pre-declared architectures.  */
  for (arches = gdbarch_list_lookup_by_info (arches, &info);
       arches != NULL;
       arches = gdbarch_list_lookup_by_info (arches->next, &info))
    if (gdbarch_tdep (arches->gdbarch)->riscv_abi == abi)
      return arches->gdbarch;

  /* None found, so create a new architecture from the information provided.
     Can't initialize all the target dependencies until we actually know which
     target we are talking to, but put in some defaults for now.  */

  binfo = info.bfd_arch_info;
  tdep = xmalloc (sizeof *tdep);
  gdbarch = gdbarch_alloc (&info, tdep);

  tdep->riscv_abi = abi;
  tdep->register_size = 4;
  switch (abi)
    {
    case RISCV_ABI_FLAG_RV128I:
      tdep->register_size <<= 1;
    case RISCV_ABI_FLAG_RV64I:
      tdep->register_size <<= 1;
    case RISCV_ABI_FLAG_RV32I:
    case RISCV_ABI_FLAG_RV32E:
      break;
    default:
      internal_error (__FILE__, __LINE__, _("unknown abi %i"), abi);
      break;
    }

  /* Target data types.  */
  set_gdbarch_short_bit (gdbarch, 16);
  set_gdbarch_int_bit (gdbarch, 32);
  set_gdbarch_long_bit (gdbarch, tdep->register_size * 8);
  set_gdbarch_float_bit (gdbarch, 32);
  set_gdbarch_double_bit (gdbarch, 64);
  set_gdbarch_long_double_bit (gdbarch, 128);
  set_gdbarch_ptr_bit (gdbarch, tdep->register_size * 8);
  set_gdbarch_char_signed (gdbarch, 1);

  /* Information about the target architecture.  */
  set_gdbarch_return_value (gdbarch, riscv_return_value);
  set_gdbarch_breakpoint_from_pc (gdbarch, riscv_breakpoint_from_pc);
  set_gdbarch_decr_pc_after_break (gdbarch, 4);
  set_gdbarch_remote_breakpoint_from_pc (gdbarch, riscv_remote_breakpoint_from_pc);
  set_gdbarch_print_insn (gdbarch, print_insn_riscv);

  /* Register architecture.  */
  set_gdbarch_pseudo_register_read (gdbarch, riscv_pseudo_register_read);
  set_gdbarch_pseudo_register_write (gdbarch, riscv_pseudo_register_write);
  set_gdbarch_num_regs (gdbarch, RISCV_NUM_REGS);
  set_gdbarch_num_pseudo_regs (gdbarch, RISCV_NUM_REGS);
  set_gdbarch_sp_regnum (gdbarch, RISCV_SP_REGNUM);
  set_gdbarch_pc_regnum (gdbarch, RISCV_PC_REGNUM);
  set_gdbarch_ps_regnum (gdbarch, RISCV_FP_REGNUM);
  set_gdbarch_deprecated_fp_regnum (gdbarch, RISCV_FIRST_FP_REGNUM);

  /* Functions to supply register information.  */
  set_gdbarch_register_name (gdbarch, riscv_register_name);
  set_gdbarch_register_type (gdbarch, riscv_register_type);
  set_gdbarch_print_registers_info (gdbarch, riscv_print_registers_info);
  set_gdbarch_register_reggroup_p (gdbarch, riscv_register_reggroup_p);

  /* Functions to analyze frames.  */
  set_gdbarch_skip_prologue (gdbarch, riscv_skip_prologue);
  set_gdbarch_inner_than (gdbarch, core_addr_lessthan);
  set_gdbarch_frame_align (gdbarch, riscv_frame_align);

  /* Functions to access frame data.  */
  set_gdbarch_unwind_pc (gdbarch, riscv_unwind_pc);
  set_gdbarch_unwind_sp (gdbarch, riscv_unwind_sp);

  /* Functions handling dummy frames.  */
  set_gdbarch_call_dummy_location (gdbarch, ON_STACK);
  set_gdbarch_push_dummy_code (gdbarch, riscv_push_dummy_code);
  set_gdbarch_push_dummy_call (gdbarch, riscv_push_dummy_call);
  set_gdbarch_dummy_id (gdbarch, riscv_dummy_id);

  /* Frame unwinders.  Use DWARF debug info if available, otherwise use our own
     unwinder.  */
  dwarf2_append_unwinders (gdbarch);
  frame_unwind_append_unwinder (gdbarch, &riscv_frame_unwind);

  /* Check any target description for validity.  */
  if (tdesc_has_registers (info.target_desc))
    {
      const struct tdesc_feature *feature;
      struct tdesc_arch_data *tdesc_data;
      int valid_p;

      feature = tdesc_find_feature (info.target_desc, "org.gnu.gdb.riscv.cpu");
      if (feature == NULL)
	goto no_tdata;

      tdesc_data = tdesc_data_alloc ();

      valid_p = 1;
      for (i = RISCV_ZERO_REGNUM; i < RISCV_LAST_REGNUM; ++i)
	valid_p &= tdesc_numbered_register (feature, tdesc_data, i, riscv_gdb_reg_names[i]);

      if (!valid_p)
	tdesc_data_cleanup (tdesc_data);
      else
	tdesc_use_registers (gdbarch, info.target_desc, tdesc_data);
    }
 no_tdata:

  for (i = 0; i < ARRAY_SIZE (riscv_register_aliases); ++i)
    user_reg_add (gdbarch, riscv_register_aliases[i].name,
		  value_of_riscv_user_reg, &riscv_register_aliases[i].regnum);

  return gdbarch;
}

extern initialize_file_ftype _initialize_riscv_tdep; /* -Wmissing-prototypes */

void
_initialize_riscv_tdep (void)
{
  gdbarch_register (bfd_arch_riscv, riscv_gdbarch_init, NULL);
}
