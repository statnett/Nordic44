FIXME = ../../ENTSOE-SHACL/Inst4CIM-KG/rdf-improved

XML = $(wildcard Grid/cimxml/*.xml) $(wildcard Enterprise/cimxml/*.xml)
# XML_EXCLUDE = $(wildcard NetworkCode/cimxml/*.xml) # We can't do it right now because it uses dcat:Dataset instead of md:FullModel
# XML = $(filter-out $(XML_EXCLUDE), $(XML_INCLUDE))
TTL = $(subst .xml,.trig, $(subst /cimxml,/trig, $(XML)))

all: $(TTL)

fix-datatypes-and-model.ru: fix-datatypes-with-assets.ru $(FIXME)/fix-model.ru
	cat $^ > $@

Grid/trig/%.trig: Grid/cimxml/%.xml | $(FIXME)/cim-trig.pl fix-datatypes-and-model.ru
	perl $(FIXME)/cim-trig.pl -r $^ > temp.trig
	update.bat --update=fix-datatypes-and-model.ru --data=temp.trig --dump > $@
	rm temp.trig

Enterprise/trig/%.trig: Enterprise/cimxml/%.xml | $(FIXME)/cim-trig.pl fix-datatypes-and-model.ru
	perl $(FIXME)/cim-trig.pl -r $^ > temp.trig
	update.bat --update=fix-datatypes-and-model.ru --data=temp.trig --dump > $@
	rm temp.trig

