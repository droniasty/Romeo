all:
	alex -g LexRomeo.x
	happy -igca ParRomeo.y
	ghc --make TestRomeo.hs -o TestRomeo
	ghc --make main.hs  -o Interpreter


clean:
	-rm -f *.log *.aux *.hi *.o *.dvi

distclean: clean
	-rm -f DocRomeo.* LexRomeo.* ParRomeo.* LayoutRomeo.* SkelRomeo.* PrintRomeo.* TestRomeo.* AbsRomeo.* TestRomeo ErrM.* SharedString.* ComposOp.* romeo.dtd XMLRomeo.* Makefile*
	

