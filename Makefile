DATABASE_EXCEL=A_C_M_Finalized.xlsx
DATABASE_CSV=constitution.csv

default: $(DATABASE_CSV)

$(DATABASE_CSV): $(DATABASE_EXCEL)
	ssconvert $< $@

clean:
	rm $(DATABASE_CSV)
