infile = "DEINVI_genome.fasta.out"

def readfile(filehandle):
  splitfile = []
  f = open(filehandle, 'r')
  lines = f.read().splitlines()
  return lines

repeats = readfile(infile)

output = File_object = open(r"DEINVI_genome.fasta.LTRfix.out", "w")

for r in repeats:
  if 'RLC' in r:
    r = r.replace("Unspecified", "LTR/Copia")
  elif 'RLG' in r:
    r = r.replace("Unspecified", "LTR/Gypsy")
  output.write(r + "\n")
output.close()
