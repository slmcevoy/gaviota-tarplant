infile = "acne_pilon_ragtag.renamed.fasta.out"

def readfile(filehandle):
  splitfile = []
  f = open(filehandle, 'r')
  lines = f.read().splitlines()
  return lines

repeats = readfile(infile)

output = File_object = open(r"acne_pilon_ragtag.renamed.fasta.LTRfixR.out", "w")

for r in repeats:
  if 'RLC' in r:
    if 'TORK/TAR' in r:
      r = r.replace("LTR/Copia", "LTR/Copia/TORK/TAR")
    elif 'ALE/RETROFIT' in r:
      r = r.replace("LTR/Copia", "LTR/Copia/ALE/RETROFIT")
    elif 'BIANCA' in r:
      r = r.replace("LTR/Copia", "LTR/Copia/BIANCA")
    elif 'ANGELA' in r:
      r = r.replace("LTR/Copia", "LTR/Copia/ANGELA")
    elif 'ORYCO/IVANA' in r:
      r = r.replace("LTR/Copia", "LTR/Copia/ORYCO/IVANA")
    elif 'SIRE' in r:
      r = r.replace("LTR/Copia", "LTR/Copia/SIRE")
    elif 'IKEROS' in r:
      r = r.replace("LTR/Copia", "LTR/Copia/IKEROS")
  elif 'RLG' in r:
    r = r.replace("Unspecified", "LTR/Gypsy")
  output.write(r + "\n")
output.close()
