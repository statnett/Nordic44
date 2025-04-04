FIXME = ../../ENTSOE-SHACL/Inst4CIM-KG/rdf-improved

XML = $(wildcard */cimxml/*.xml)
# XML_EXCLUDE = $(wildcard NetworkCode/cimxml/*.xml) # We can't do it right now because it uses dcat:Dataset instead of md:FullModel
# XML = $(filter-out $(XML_EXCLUDE), $(XML_INCLUDE))
TRIG = $(subst .xml,.trig, $(subst /cimxml,/trig, $(XML)))

all: $(TRIG)

debug:
	@echo $(TRIG)

Grid/trig/%.trig: Grid/cimxml/%.xml | $(FIXME)/cim-trig.pl $(FIXME)/fix-datatypes-and-model.ru
	perl $(FIXME)/cim-trig.pl -r $^ > temp.trig
	update.bat --update=$(FIXME)/fix-datatypes-and-model.ru --data=temp.trig --dump > $@
	rm temp.trig

Enterprise/trig/%.trig: Enterprise/cimxml/%.xml | $(FIXME)/cim-trig.pl $(FIXME)/fix-datatypes-and-model.ru
	perl $(FIXME)/cim-trig.pl -r $^ > temp.trig
	update.bat --update=$(FIXME)/fix-datatypes-and-model.ru --data=temp.trig --dump > $@
	rm temp.trig

NetworkCode/trig/%.trig: NetworkCode/cimxml/%.xml | $(FIXME)/cim-trig.pl $(FIXME)/fix-datatypes-and-model.ru
	perl $(FIXME)/cim-trig.pl -r $^ > temp.trig
	update.bat --update=$(FIXME)/fix-datatypes-and-model.ru --data=temp.trig --dump > $@
	rm temp.trig
