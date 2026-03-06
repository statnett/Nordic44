
Fix errors:
- Fix wrong namespace `http://iec.ch/TC57/CIM/CIM100#` (extraneous `CIM/`) in all files:
```
perl -i -pe "s{http://iec.ch/TC57/CIM/CIM100#}{http://iec.ch/TC57/CIM100#}g" *.xml
```
- Delete `<?iec61970-552 version="2.0"?>` in all files:
```
WARN  riot :: [line: 2, col: 31] XML Processing instruction - ignored
```
- Fix wrong UUID in 3 files to `ade44b65-0bfa-41e0-95c5-2ccb345a6fed`:
```
N44-ENT-Schneider_AC.xml
ERROR riot :: [line: 9, col: 74] Not a valid UUID string: urn:uuid:d869a44b5-7ab5-4bcf-9d58-1c9e750a6f20
N44-ENT-Statnett_AS.xml
ERROR riot :: [line: 18, col: 91] Not a valid UUID string: urn:uuid:d869a44b5-7ab5-4bcf-9d58-1c9e750a6f20
manifest.xml
ERROR riot :: [line: 15, col: 82] Not a valid UUID string: urn:uuid:d869a44b5-7ab5-4bcf-9d58-1c9e750a6f20
```
- Fix another wrong UUID in two files to `d3158561-2716-4978-9b61-dd7cc47f1f91` (that model reference is BROKEN anyway?)
```
grep -R 1cbcbc2c-1cf1-48f0-b3fd-2c28444c21b *
Enterprise/cimxml/N44-ENT-Statnett_AS.xml:    <md:Model.DependentOn rdf:resource="urn:uuid:1cbcbc2c-1cf1-48f0-b3fd-2c28444c21b" />
Enterprise/manifest.xml:    <dcterms:requires rdf:resource="urn:uuid:1cbcbc2c-1cf1-48f0-b3fd-2c28444c21b"/>
```

Enrich `fix-datatypes` SPARQL Update:
- Extract props used in AS, AC profiles:
```
perl -ne 'print "$1\n" if m{^\s+<([^/ ]+?)>}' *|sort|uniq>asset-props.txt
```
- Make copy of SPARQL Update:
```
cp ../../../../ENTSOE-SHACL/Inst4CIM-KG/rdf-improved/fix-datatypes-old.ru fix-datatypes-old.ru
```
- Extract unique asset props that are not yet in that SPARQL Update
```
perl -ne 'print "$1\n" if m{    \((.+?) }' fix-datatypes-old.ru | comm -13 - asset-props.txt > asset-props-uniq.txt
```
- Edit SPARQL values clause (see bottom) and save as `fix-datatypes-with-assets.ru`.
  Omit `xsd:string` properties
- Put the SPARQL update in the right folder
```
mv fix-datatypes-with-assets.ru ../../
```
