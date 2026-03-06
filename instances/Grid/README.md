
Check correlation of model URNs:
```
grep "md:FullModel " *
Nordic44-HV_GL.xml:     <md:FullModel rdf:about="urn:uuid:167b4832-27c5-ff4f-bd26-6ce3bff1bdb7">
Nordic44-HV_SSH.xml:    <md:FullModel rdf:about="urn:uuid:1d08772d-c1d0-4c47-810d-b14908cd94f5">
Nordic44-HV_DL.xml:     <md:FullModel rdf:about="urn:uuid:2e11908e-5e1f-8542-854c-54da76d379d1">
Nordic44-HV_SV.xml:     <md:FullModel rdf:about="urn:uuid:5b6a8b13-4c20-4147-8ed6-7249e303e647">
Nordic44-HV_OP.xml:     <md:FullModel rdf:about="urn:uuid:67e97bb0-ec38-481d-9e56-3e9d45e95a33">
Nordic44-HV_TP.xml:     <md:FullModel rdf:about="urn:uuid:7b3f94c0-bd9b-e74e-866b-f473153c3e70">
Nordic44-HV_EQ.xml:     <md:FullModel rdf:about="urn:uuid:e710212f-f6b2-8d4c-9dc0-365398d8b59c">
```
vs Catalog records pointing to those datasets:
```
grep "dcat:Dataset " manifest.xml
<dcat:Dataset rdf:about="urn:uuid:167b4832-27c5-ff4f-bd26-6ce3bff1bdb7">
<dcat:Dataset rdf:about="urn:uuid:1d08772d-c1d0-4c47-810d-b14908cd94f5">
<dcat:Dataset rdf:about="urn:uuid:2e11908e-5e1f-8542-854c-54da76d379d1">
<dcat:Dataset rdf:about="urn:uuid:5b6a8b13-4c20-4147-8ed6-7249e303e647">
<dcat:Dataset rdf:about="urn:uuid:67e97bb0-ec38-481d-9e56-3e9d45e95a33">
<dcat:Dataset rdf:about="urn:uuid:7b3f94c0-bd9b-e74e-866b-f473153c3e70">
<dcat:Dataset rdf:about="urn:uuid:e710212f-f6b2-8d4c-9dc0-365398d8b59c">
```

- Fix Catalog URN to `dd979b66-7e29-4124-ba65-52d18b86330b`
```
Grid/cimxml/manifest.xml
ERROR riot :: [line: 13, col: 74] Not a valid UUID string: urn:uuid:3a14dd8d1-177e-4f4e-b7dc-21413092cdaa
```
