(declare-fun schools.CDSCode () String)
(declare-fun T0.cds () String)
(assert (= T0.cds schools.CDSCode))
(assert and)
(assert (= T0.cds schools.CDSCode))
(assert and)
(assert (str.in_re T0.cds (re.+ (re.range " " "~"))))
(assert (> (str.len T0.cds) 0))
(assert (distinct (str.substr T0.cds 0 1) " "))
(assert (str.in_re schools.CDSCode (re.+ (re.range " " "~"))))
(assert (> (str.len schools.CDSCode) 0))
(assert (distinct (str.substr schools.CDSCode 0 1) " "))

sat
[ValueAssignment(column='T0.cds', alias='', value='?', data_type='', metadata={}), ValueAssignment(column='schools.CDSCode', alias='', value='?', data_type='', metadata={})]


(declare-fun T0.cds () String)
(declare-fun T1.CDSCode () String)
(assert (or (= T0.cds T1.CDSCode) (= T0.cds "?")))
(assert (and (distinct T0.cds "?")))
(assert (or (= T0.cds T1.CDSCode) (= T0.cds "?")))
(assert (and (distinct T1.CDSCode "?")))
(assert (str.in_re T0.cds (re.+ (re.range " " "~"))))
(assert (> (str.len T0.cds) 0))
(assert (distinct (str.substr T0.cds 0 1) " "))
(assert (str.in_re T1.CDSCode (re.+ (re.range " " "~"))))
(assert (> (str.len T1.CDSCode) 0))
(assert (distinct (str.substr T1.CDSCode 0 1) " "))

sat
[ValueAssignment(column='T0.cds', alias='', value='4', data_type='', metadata={}), ValueAssignment(column='T1.CDSCode', alias='', value='4', data_type='', metadata={})]


(declare-fun T0.cds () String)
(declare-fun T1.CDSCode () String)
(assert (or (= T0.cds T1.CDSCode) (= T0.cds "?") (= T0.cds "4")))
(assert (= T0.cds T1.CDSCode))
(assert (and (distinct T0.cds "?") (distinct T0.cds "4")))
(assert (or (= T0.cds T1.CDSCode) (= T0.cds "?") (= T0.cds "4")))
(assert (and (distinct T1.CDSCode "?") (distinct T1.CDSCode "4")))
(assert (= T0.cds T1.CDSCode))
(assert (str.in_re T0.cds (re.+ (re.range " " "~"))))
(assert (> (str.len T0.cds) 0))
(assert (distinct (str.substr T0.cds 0 1) " "))
(assert (str.in_re T1.CDSCode (re.+ (re.range " " "~"))))
(assert (> (str.len T1.CDSCode) 0))
(assert (distinct (str.substr T1.CDSCode 0 1) " "))

sat
[ValueAssignment(column='T0.cds', alias='', value='O', data_type='', metadata={}), ValueAssignment(column='T1.CDSCode', alias='', value='O', data_type='', metadata={})]


(declare-fun T0.NumTstTakr () Int)
(declare-fun T0.cds () String)
(declare-fun T1.CDSCode () String)
(assert (<= 0 T0.NumTstTakr))
(assert (str.in_re T0.cds (re.+ (re.range " " "~"))))
(assert (> (str.len T0.cds) 0))
(assert (distinct (str.substr T0.cds 0 1) " "))
(assert (str.in_re T1.CDSCode (re.+ (re.range " " "~"))))
(assert (> (str.len T1.CDSCode) 0))
(assert (distinct (str.substr T1.CDSCode 0 1) " "))

sat
[ValueAssignment(column='T0.NumTstTakr', alias='', value=0, data_type='', metadata={})]


(declare-fun T0.cds () String)
(declare-fun T1.CDSCode () String)
(assert (or (= T0.cds T1.CDSCode) (= T0.cds "?") (= T0.cds "4") (= T0.cds "O")))
(assert (and (distinct T0.cds "?") (distinct T0.cds "4") (distinct T0.cds "O")))
(assert (= T0.cds T1.CDSCode))
(assert (or (= T0.cds T1.CDSCode) (= T0.cds "?") (= T0.cds "4") (= T0.cds "O")))
(assert (and (distinct T1.CDSCode "?")
     (distinct T1.CDSCode "4")
     (distinct T1.CDSCode "O")))
(assert (= T0.cds T1.CDSCode))
(assert (str.in_re T0.cds (re.+ (re.range " " "~"))))
(assert (> (str.len T0.cds) 0))
(assert (distinct (str.substr T0.cds 0 1) " "))
(assert (str.in_re T1.CDSCode (re.+ (re.range " " "~"))))
(assert (> (str.len T1.CDSCode) 0))
(assert (distinct (str.substr T1.CDSCode 0 1) " "))

sat
[ValueAssignment(column='T0.cds', alias='', value=')', data_type='', metadata={}), ValueAssignment(column='T1.CDSCode', alias='', value=')', data_type='', metadata={})]


(declare-fun T0.cds () String)
(declare-fun T1.CDSCode () String)
(assert (str.in_re T0.cds (re.+ (re.range " " "~"))))
(assert (> (str.len T0.cds) 0))
(assert (distinct (str.substr T0.cds 0 1) " "))
(assert (str.in_re T1.CDSCode (re.+ (re.range " " "~"))))
(assert (> (str.len T1.CDSCode) 0))
(assert (distinct (str.substr T1.CDSCode 0 1) " "))

sat
[]


(declare-fun T0.NumTstTakr () Int)
(declare-fun T0.cds () String)
(declare-fun T1.CDSCode () String)
(assert (< 0 T0.NumTstTakr))
(assert (str.in_re T0.cds (re.+ (re.range " " "~"))))
(assert (> (str.len T0.cds) 0))
(assert (distinct (str.substr T0.cds 0 1) " "))
(assert (str.in_re T1.CDSCode (re.+ (re.range " " "~"))))
(assert (> (str.len T1.CDSCode) 0))
(assert (distinct (str.substr T1.CDSCode 0 1) " "))

sat
[ValueAssignment(column='T0.NumTstTakr', alias='', value=1, data_type='', metadata={})]


(declare-fun T0.cds () String)
(declare-fun T1.CDSCode () String)
(assert (and (distinct T0.cds "?")
     (distinct T0.cds "4")
     (distinct T0.cds "O")
     (distinct T0.cds ")")))
(assert (= T0.cds T1.CDSCode))
(assert (or (= T0.cds T1.CDSCode)
    (= T0.cds "?")
    (= T0.cds "4")
    (= T0.cds "O")
    (= T0.cds ")")))
(assert (or (= T0.cds T1.CDSCode)
    (= T0.cds "?")
    (= T0.cds "4")
    (= T0.cds "O")
    (= T0.cds ")")))
(assert (= T0.cds T1.CDSCode))
(assert (and (distinct T1.CDSCode "?")
     (distinct T1.CDSCode "4")
     (distinct T1.CDSCode "O")
     (distinct T1.CDSCode ")")))
(assert (str.in_re T0.cds (re.+ (re.range " " "~"))))
(assert (> (str.len T0.cds) 0))
(assert (distinct (str.substr T0.cds 0 1) " "))
(assert (str.in_re T1.CDSCode (re.+ (re.range " " "~"))))
(assert (> (str.len T1.CDSCode) 0))
(assert (distinct (str.substr T1.CDSCode 0 1) " "))

sat
[ValueAssignment(column='T0.cds', alias='', value='!', data_type='', metadata={}), ValueAssignment(column='T1.CDSCode', alias='', value='!', data_type='', metadata={})]


(declare-fun T0.cds () String)
(declare-fun T1.CDSCode () String)
(assert (str.in_re T0.cds (re.+ (re.range " " "~"))))
(assert (> (str.len T0.cds) 0))
(assert (distinct (str.substr T0.cds 0 1) " "))
(assert (str.in_re T1.CDSCode (re.+ (re.range " " "~"))))
(assert (> (str.len T1.CDSCode) 0))
(assert (distinct (str.substr T1.CDSCode 0 1) " "))

sat
[]


(declare-fun T0.NumTstTakr () Int)
(declare-fun T0.cds () String)
(declare-fun T1.CDSCode () String)
(assert (< 0 T0.NumTstTakr))
(assert (str.in_re T0.cds (re.+ (re.range " " "~"))))
(assert (> (str.len T0.cds) 0))
(assert (distinct (str.substr T0.cds 0 1) " "))
(assert (str.in_re T1.CDSCode (re.+ (re.range " " "~"))))
(assert (> (str.len T1.CDSCode) 0))
(assert (distinct (str.substr T1.CDSCode 0 1) " "))

sat
[ValueAssignment(column='T0.NumTstTakr', alias='', value=1, data_type='', metadata={})]


(declare-fun T0.cds () String)
(declare-fun T1.CDSCode () String)
(assert (and (distinct T0.cds "?")
     (distinct T0.cds "4")
     (distinct T0.cds "O")
     (distinct T0.cds ")")
     (distinct T0.cds "!")))
(assert (= T0.cds T1.CDSCode))
(assert (or (= T0.cds T1.CDSCode)
    (= T0.cds "?")
    (= T0.cds "4")
    (= T0.cds "O")
    (= T0.cds ")")
    (= T0.cds "!")))
(assert (= T0.cds T1.CDSCode))
(assert (and (distinct T1.CDSCode "?")
     (distinct T1.CDSCode "4")
     (distinct T1.CDSCode "O")
     (distinct T1.CDSCode ")")
     (distinct T1.CDSCode "!")))
(assert (or (= T0.cds T1.CDSCode)
    (= T0.cds "?")
    (= T0.cds "4")
    (= T0.cds "O")
    (= T0.cds ")")
    (= T0.cds "!")))
(assert (str.in_re T0.cds (re.+ (re.range " " "~"))))
(assert (> (str.len T0.cds) 0))
(assert (distinct (str.substr T0.cds 0 1) " "))
(assert (str.in_re T1.CDSCode (re.+ (re.range " " "~"))))
(assert (> (str.len T1.CDSCode) 0))
(assert (distinct (str.substr T1.CDSCode 0 1) " "))

sat
[ValueAssignment(column='T0.cds', alias='', value='(', data_type='', metadata={}), ValueAssignment(column='T1.CDSCode', alias='', value='(', data_type='', metadata={})]


(declare-fun T1.School () String)
(declare-fun T0.cds () String)
(declare-fun T1.CDSCode () String)
(assert (= T1.School "gkh 5sE68h"))
(assert (str.in_re T0.cds (re.+ (re.range " " "~"))))
(assert (> (str.len T0.cds) 0))
(assert (distinct (str.substr T0.cds 0 1) " "))
(assert (str.in_re T1.CDSCode (re.+ (re.range " " "~"))))
(assert (> (str.len T1.CDSCode) 0))
(assert (distinct (str.substr T1.CDSCode 0 1) " "))
(assert (str.in_re T1.School (re.+ (re.range " " "~"))))
(assert (> (str.len T1.School) 0))
(assert (distinct (str.substr T1.School 0 1) " "))

sat
[ValueAssignment(column='T1.School', alias='', value='gkh 5sE68h', data_type='', metadata={})]


(declare-fun T0.NumTstTakr () Int)
(declare-fun T0.cds () String)
(declare-fun T1.CDSCode () String)
(declare-fun T1.School () String)
(assert (< 0 T0.NumTstTakr))
(assert (str.in_re T0.cds (re.+ (re.range " " "~"))))
(assert (> (str.len T0.cds) 0))
(assert (distinct (str.substr T0.cds 0 1) " "))
(assert (str.in_re T1.CDSCode (re.+ (re.range " " "~"))))
(assert (> (str.len T1.CDSCode) 0))
(assert (distinct (str.substr T1.CDSCode 0 1) " "))
(assert (str.in_re T1.School (re.+ (re.range " " "~"))))
(assert (> (str.len T1.School) 0))
(assert (distinct (str.substr T1.School 0 1) " "))

sat
[ValueAssignment(column='T0.NumTstTakr', alias='', value=1, data_type='', metadata={})]


(declare-fun T0.cds () String)
(declare-fun T1.CDSCode () String)
(assert (or (= T0.cds T1.CDSCode)
    (= T0.cds "?")
    (= T0.cds "4")
    (= T0.cds "O")
    (= T0.cds ")")
    (= T0.cds "!")
    (= T0.cds "(")))
(assert (and (distinct T0.cds "?")
     (distinct T0.cds "4")
     (distinct T0.cds "O")
     (distinct T0.cds ")")
     (distinct T0.cds "!")
     (distinct T0.cds "(")))
(assert (= T0.cds T1.CDSCode))
(assert (or (= T0.cds T1.CDSCode)
    (= T0.cds "?")
    (= T0.cds "4")
    (= T0.cds "O")
    (= T0.cds ")")
    (= T0.cds "!")
    (= T0.cds "(")))
(assert (= T0.cds T1.CDSCode))
(assert (and (distinct T1.CDSCode "?")
     (distinct T1.CDSCode "4")
     (distinct T1.CDSCode "O")
     (distinct T1.CDSCode ")")
     (distinct T1.CDSCode "!")
     (distinct T1.CDSCode "(")))
(assert (str.in_re T0.cds (re.+ (re.range " " "~"))))
(assert (> (str.len T0.cds) 0))
(assert (distinct (str.substr T0.cds 0 1) " "))
(assert (str.in_re T1.CDSCode (re.+ (re.range " " "~"))))
(assert (> (str.len T1.CDSCode) 0))
(assert (distinct (str.substr T1.CDSCode 0 1) " "))

sat
[ValueAssignment(column='T0.cds', alias='', value='A', data_type='', metadata={}), ValueAssignment(column='T1.CDSCode', alias='', value='A', data_type='', metadata={})]


(declare-fun T1.District () String)
(declare-fun T0.cds () String)
(declare-fun T1.CDSCode () String)
(assert (= T1.District "8lvZf6r9M0"))
(assert (str.in_re T0.cds (re.+ (re.range " " "~"))))
(assert (> (str.len T0.cds) 0))
(assert (distinct (str.substr T0.cds 0 1) " "))
(assert (str.in_re T1.CDSCode (re.+ (re.range " " "~"))))
(assert (> (str.len T1.CDSCode) 0))
(assert (distinct (str.substr T1.CDSCode 0 1) " "))
(assert (str.in_re T1.District (re.+ (re.range " " "~"))))
(assert (> (str.len T1.District) 0))
(assert (distinct (str.substr T1.District 0 1) " "))

sat
[ValueAssignment(column='T1.District', alias='', value='8lvZf6r9M0', data_type='', metadata={})]


(declare-fun T0.NumTstTakr () Int)
(declare-fun T0.cds () String)
(declare-fun T1.CDSCode () String)
(declare-fun T1.District () String)
(assert (< 0 T0.NumTstTakr))
(assert (str.in_re T0.cds (re.+ (re.range " " "~"))))
(assert (> (str.len T0.cds) 0))
(assert (distinct (str.substr T0.cds 0 1) " "))
(assert (str.in_re T1.CDSCode (re.+ (re.range " " "~"))))
(assert (> (str.len T1.CDSCode) 0))
(assert (distinct (str.substr T1.CDSCode 0 1) " "))
(assert (str.in_re T1.District (re.+ (re.range " " "~"))))
(assert (> (str.len T1.District) 0))
(assert (distinct (str.substr T1.District 0 1) " "))

sat
[ValueAssignment(column='T0.NumTstTakr', alias='', value=1, data_type='', metadata={})]


(declare-fun T0.cds () String)
(declare-fun T1.CDSCode () String)
(assert (and (distinct T0.cds "?")
     (distinct T0.cds "4")
     (distinct T0.cds "O")
     (distinct T0.cds ")")
     (distinct T0.cds "!")
     (distinct T0.cds "(")
     (distinct T0.cds "A")))
(assert (= T0.cds T1.CDSCode))
(assert (or (= T0.cds T1.CDSCode)
    (= T0.cds "?")
    (= T0.cds "4")
    (= T0.cds "O")
    (= T0.cds ")")
    (= T0.cds "!")
    (= T0.cds "(")
    (= T0.cds "A")))
(assert (and (distinct T1.CDSCode "?")
     (distinct T1.CDSCode "4")
     (distinct T1.CDSCode "O")
     (distinct T1.CDSCode ")")
     (distinct T1.CDSCode "!")
     (distinct T1.CDSCode "(")
     (distinct T1.CDSCode "A")))
(assert (= T0.cds T1.CDSCode))
(assert (or (= T0.cds T1.CDSCode)
    (= T0.cds "?")
    (= T0.cds "4")
    (= T0.cds "O")
    (= T0.cds ")")
    (= T0.cds "!")
    (= T0.cds "(")
    (= T0.cds "A")))
(assert (str.in_re T0.cds (re.+ (re.range " " "~"))))
(assert (> (str.len T0.cds) 0))
(assert (distinct (str.substr T0.cds 0 1) " "))
(assert (str.in_re T1.CDSCode (re.+ (re.range " " "~"))))
(assert (> (str.len T1.CDSCode) 0))
(assert (distinct (str.substr T1.CDSCode 0 1) " "))

sat
[ValueAssignment(column='T0.cds', alias='', value='3', data_type='', metadata={}), ValueAssignment(column='T1.CDSCode', alias='', value='3', data_type='', metadata={})]


(declare-fun T0.cds () String)
(declare-fun T1.CDSCode () String)
(assert (str.in_re T0.cds (re.+ (re.range " " "~"))))
(assert (> (str.len T0.cds) 0))
(assert (distinct (str.substr T0.cds 0 1) " "))
(assert (str.in_re T1.CDSCode (re.+ (re.range " " "~"))))
(assert (> (str.len T1.CDSCode) 0))
(assert (distinct (str.substr T1.CDSCode 0 1) " "))

sat
[]


(declare-fun T0.NumTstTakr () Int)
(declare-fun T0.cds () String)
(declare-fun T1.CDSCode () String)
(assert (< 0 T0.NumTstTakr))
(assert (str.in_re T0.cds (re.+ (re.range " " "~"))))
(assert (> (str.len T0.cds) 0))
(assert (distinct (str.substr T0.cds 0 1) " "))
(assert (str.in_re T1.CDSCode (re.+ (re.range " " "~"))))
(assert (> (str.len T1.CDSCode) 0))
(assert (distinct (str.substr T1.CDSCode 0 1) " "))

sat
[ValueAssignment(column='T0.NumTstTakr', alias='', value=1, data_type='', metadata={})]


(declare-fun schools.CDSCode () String)
(declare-fun T0.cds () String)
(assert and)
(assert (= T0.cds schools.CDSCode))
(assert and)
(assert (= T0.cds schools.CDSCode))
(assert (str.in_re T0.cds (re.+ (re.range " " "~"))))
(assert (> (str.len T0.cds) 0))
(assert (distinct (str.substr T0.cds 0 1) " "))
(assert (str.in_re schools.CDSCode (re.+ (re.range " " "~"))))
(assert (> (str.len schools.CDSCode) 0))
(assert (distinct (str.substr schools.CDSCode 0 1) " "))

sat
[ValueAssignment(column='T0.cds', alias='', value='?', data_type='', metadata={}), ValueAssignment(column='schools.CDSCode', alias='', value='?', data_type='', metadata={})]


(declare-fun T0.cds () String)
(declare-fun T1.CDSCode () String)
(assert (or (= T0.cds T1.CDSCode) (= T0.cds "?")))
(assert (and (distinct T0.cds "?")))
(assert (or (= T0.cds T1.CDSCode) (= T0.cds "?")))
(assert (and (distinct T1.CDSCode "?")))
(assert (str.in_re T0.cds (re.+ (re.range " " "~"))))
(assert (> (str.len T0.cds) 0))
(assert (distinct (str.substr T0.cds 0 1) " "))
(assert (str.in_re T1.CDSCode (re.+ (re.range " " "~"))))
(assert (> (str.len T1.CDSCode) 0))
(assert (distinct (str.substr T1.CDSCode 0 1) " "))

sat
[ValueAssignment(column='T0.cds', alias='', value='4', data_type='', metadata={}), ValueAssignment(column='T1.CDSCode', alias='', value='4', data_type='', metadata={})]


(declare-fun T1.CDSCode () String)
(declare-fun T0.cds () String)
(assert (= T0.cds T1.CDSCode))
(assert (or (= T0.cds T1.CDSCode) (= T0.cds "?") (= T0.cds "4")))
(assert (and (distinct T0.cds "?") (distinct T0.cds "4")))
(assert (= T0.cds T1.CDSCode))
(assert (and (distinct T1.CDSCode "?") (distinct T1.CDSCode "4")))
(assert (or (= T0.cds T1.CDSCode) (= T0.cds "?") (= T0.cds "4")))
(assert (str.in_re T0.cds (re.+ (re.range " " "~"))))
(assert (> (str.len T0.cds) 0))
(assert (distinct (str.substr T0.cds 0 1) " "))
(assert (str.in_re T1.CDSCode (re.+ (re.range " " "~"))))
(assert (> (str.len T1.CDSCode) 0))
(assert (distinct (str.substr T1.CDSCode 0 1) " "))

sat
[ValueAssignment(column='T0.cds', alias='', value='O', data_type='', metadata={}), ValueAssignment(column='T1.CDSCode', alias='', value='O', data_type='', metadata={})]


(declare-fun T0.NumTstTakr () Int)
(declare-fun T0.cds () String)
(declare-fun T1.CDSCode () String)
(assert (<= 0 T0.NumTstTakr))
(assert (str.in_re T0.cds (re.+ (re.range " " "~"))))
(assert (> (str.len T0.cds) 0))
(assert (distinct (str.substr T0.cds 0 1) " "))
(assert (str.in_re T1.CDSCode (re.+ (re.range " " "~"))))
(assert (> (str.len T1.CDSCode) 0))
(assert (distinct (str.substr T1.CDSCode 0 1) " "))

sat
[ValueAssignment(column='T0.NumTstTakr', alias='', value=0, data_type='', metadata={})]


(declare-fun T0.cds () String)
(declare-fun T1.CDSCode () String)
(assert (or (= T0.cds T1.CDSCode) (= T0.cds "?") (= T0.cds "4") (= T0.cds "O")))
(assert (= T0.cds T1.CDSCode))
(assert (and (distinct T0.cds "?") (distinct T0.cds "4") (distinct T0.cds "O")))
(assert (or (= T0.cds T1.CDSCode) (= T0.cds "?") (= T0.cds "4") (= T0.cds "O")))
(assert (= T0.cds T1.CDSCode))
(assert (and (distinct T1.CDSCode "?")
     (distinct T1.CDSCode "4")
     (distinct T1.CDSCode "O")))
(assert (str.in_re T0.cds (re.+ (re.range " " "~"))))
(assert (> (str.len T0.cds) 0))
(assert (distinct (str.substr T0.cds 0 1) " "))
(assert (str.in_re T1.CDSCode (re.+ (re.range " " "~"))))
(assert (> (str.len T1.CDSCode) 0))
(assert (distinct (str.substr T1.CDSCode 0 1) " "))

sat
[ValueAssignment(column='T0.cds', alias='', value=')', data_type='', metadata={}), ValueAssignment(column='T1.CDSCode', alias='', value=')', data_type='', metadata={})]


(declare-fun T0.cds () String)
(declare-fun T1.CDSCode () String)
(assert (str.in_re T0.cds (re.+ (re.range " " "~"))))
(assert (> (str.len T0.cds) 0))
(assert (distinct (str.substr T0.cds 0 1) " "))
(assert (str.in_re T1.CDSCode (re.+ (re.range " " "~"))))
(assert (> (str.len T1.CDSCode) 0))
(assert (distinct (str.substr T1.CDSCode 0 1) " "))

sat
[]


(declare-fun T0.NumTstTakr () Int)
(declare-fun T0.cds () String)
(declare-fun T1.CDSCode () String)
(assert (< 0 T0.NumTstTakr))
(assert (str.in_re T0.cds (re.+ (re.range " " "~"))))
(assert (> (str.len T0.cds) 0))
(assert (distinct (str.substr T0.cds 0 1) " "))
(assert (str.in_re T1.CDSCode (re.+ (re.range " " "~"))))
(assert (> (str.len T1.CDSCode) 0))
(assert (distinct (str.substr T1.CDSCode 0 1) " "))

sat
[ValueAssignment(column='T0.NumTstTakr', alias='', value=1, data_type='', metadata={})]


(declare-fun T0.cds () String)
(declare-fun T1.CDSCode () String)
(assert (or (= T0.cds T1.CDSCode)
    (= T0.cds "?")
    (= T0.cds "4")
    (= T0.cds "O")
    (= T0.cds ")")))
(assert (and (distinct T0.cds "?")
     (distinct T0.cds "4")
     (distinct T0.cds "O")
     (distinct T0.cds ")")))
(assert (= T0.cds T1.CDSCode))
(assert (or (= T0.cds T1.CDSCode)
    (= T0.cds "?")
    (= T0.cds "4")
    (= T0.cds "O")
    (= T0.cds ")")))
(assert (= T0.cds T1.CDSCode))
(assert (and (distinct T1.CDSCode "?")
     (distinct T1.CDSCode "4")
     (distinct T1.CDSCode "O")
     (distinct T1.CDSCode ")")))
(assert (str.in_re T0.cds (re.+ (re.range " " "~"))))
(assert (> (str.len T0.cds) 0))
(assert (distinct (str.substr T0.cds 0 1) " "))
(assert (str.in_re T1.CDSCode (re.+ (re.range " " "~"))))
(assert (> (str.len T1.CDSCode) 0))
(assert (distinct (str.substr T1.CDSCode 0 1) " "))

sat
[ValueAssignment(column='T0.cds', alias='', value='!', data_type='', metadata={}), ValueAssignment(column='T1.CDSCode', alias='', value='!', data_type='', metadata={})]


(declare-fun T0.cds () String)
(declare-fun T1.CDSCode () String)
(assert (str.in_re T0.cds (re.+ (re.range " " "~"))))
(assert (> (str.len T0.cds) 0))
(assert (distinct (str.substr T0.cds 0 1) " "))
(assert (str.in_re T1.CDSCode (re.+ (re.range " " "~"))))
(assert (> (str.len T1.CDSCode) 0))
(assert (distinct (str.substr T1.CDSCode 0 1) " "))

sat
[]


(declare-fun T0.NumTstTakr () Int)
(declare-fun T0.cds () String)
(declare-fun T1.CDSCode () String)
(assert (< 0 T0.NumTstTakr))
(assert (str.in_re T0.cds (re.+ (re.range " " "~"))))
(assert (> (str.len T0.cds) 0))
(assert (distinct (str.substr T0.cds 0 1) " "))
(assert (str.in_re T1.CDSCode (re.+ (re.range " " "~"))))
(assert (> (str.len T1.CDSCode) 0))
(assert (distinct (str.substr T1.CDSCode 0 1) " "))

sat
[ValueAssignment(column='T0.NumTstTakr', alias='', value=1, data_type='', metadata={})]


(declare-fun T1.CDSCode () String)
(declare-fun T0.cds () String)
(assert (= T0.cds T1.CDSCode))
(assert (or (= T0.cds T1.CDSCode)
    (= T0.cds "?")
    (= T0.cds "4")
    (= T0.cds "O")
    (= T0.cds ")")
    (= T0.cds "!")))
(assert (and (distinct T0.cds "?")
     (distinct T0.cds "4")
     (distinct T0.cds "O")
     (distinct T0.cds ")")
     (distinct T0.cds "!")))
(assert (= T0.cds T1.CDSCode))
(assert (and (distinct T1.CDSCode "?")
     (distinct T1.CDSCode "4")
     (distinct T1.CDSCode "O")
     (distinct T1.CDSCode ")")
     (distinct T1.CDSCode "!")))
(assert (or (= T0.cds T1.CDSCode)
    (= T0.cds "?")
    (= T0.cds "4")
    (= T0.cds "O")
    (= T0.cds ")")
    (= T0.cds "!")))
(assert (str.in_re T0.cds (re.+ (re.range " " "~"))))
(assert (> (str.len T0.cds) 0))
(assert (distinct (str.substr T0.cds 0 1) " "))
(assert (str.in_re T1.CDSCode (re.+ (re.range " " "~"))))
(assert (> (str.len T1.CDSCode) 0))
(assert (distinct (str.substr T1.CDSCode 0 1) " "))

sat
[ValueAssignment(column='T0.cds', alias='', value='A', data_type='', metadata={}), ValueAssignment(column='T1.CDSCode', alias='', value='A', data_type='', metadata={})]


(declare-fun T1.School () String)
(declare-fun T0.cds () String)
(declare-fun T1.CDSCode () String)
(assert (= T1.School "IcQMameOBm"))
(assert (str.in_re T0.cds (re.+ (re.range " " "~"))))
(assert (> (str.len T0.cds) 0))
(assert (distinct (str.substr T0.cds 0 1) " "))
(assert (str.in_re T1.CDSCode (re.+ (re.range " " "~"))))
(assert (> (str.len T1.CDSCode) 0))
(assert (distinct (str.substr T1.CDSCode 0 1) " "))
(assert (str.in_re T1.School (re.+ (re.range " " "~"))))
(assert (> (str.len T1.School) 0))
(assert (distinct (str.substr T1.School 0 1) " "))

sat
[ValueAssignment(column='T1.School', alias='', value='IcQMameOBm', data_type='', metadata={})]


(declare-fun T0.NumTstTakr () Int)
(declare-fun T0.cds () String)
(declare-fun T1.CDSCode () String)
(declare-fun T1.School () String)
(assert (< 0 T0.NumTstTakr))
(assert (str.in_re T0.cds (re.+ (re.range " " "~"))))
(assert (> (str.len T0.cds) 0))
(assert (distinct (str.substr T0.cds 0 1) " "))
(assert (str.in_re T1.CDSCode (re.+ (re.range " " "~"))))
(assert (> (str.len T1.CDSCode) 0))
(assert (distinct (str.substr T1.CDSCode 0 1) " "))
(assert (str.in_re T1.School (re.+ (re.range " " "~"))))
(assert (> (str.len T1.School) 0))
(assert (distinct (str.substr T1.School 0 1) " "))

sat
[ValueAssignment(column='T0.NumTstTakr', alias='', value=1, data_type='', metadata={})]


(declare-fun T1.CDSCode () String)
(declare-fun T0.cds () String)
(assert (= T0.cds T1.CDSCode))
(assert (and (distinct T0.cds "?")
     (distinct T0.cds "4")
     (distinct T0.cds "O")
     (distinct T0.cds ")")
     (distinct T0.cds "!")
     (distinct T0.cds "A")))
(assert (or (= T0.cds T1.CDSCode)
    (= T0.cds "?")
    (= T0.cds "4")
    (= T0.cds "O")
    (= T0.cds ")")
    (= T0.cds "!")
    (= T0.cds "A")))
(assert (= T0.cds T1.CDSCode))
(assert (and (distinct T1.CDSCode "?")
     (distinct T1.CDSCode "4")
     (distinct T1.CDSCode "O")
     (distinct T1.CDSCode ")")
     (distinct T1.CDSCode "!")
     (distinct T1.CDSCode "A")))
(assert (or (= T0.cds T1.CDSCode)
    (= T0.cds "?")
    (= T0.cds "4")
    (= T0.cds "O")
    (= T0.cds ")")
    (= T0.cds "!")
    (= T0.cds "A")))
(assert (str.in_re T0.cds (re.+ (re.range " " "~"))))
(assert (> (str.len T0.cds) 0))
(assert (distinct (str.substr T0.cds 0 1) " "))
(assert (str.in_re T1.CDSCode (re.+ (re.range " " "~"))))
(assert (> (str.len T1.CDSCode) 0))
(assert (distinct (str.substr T1.CDSCode 0 1) " "))

sat
[ValueAssignment(column='T0.cds', alias='', value='"', data_type='', metadata={}), ValueAssignment(column='T1.CDSCode', alias='', value='"', data_type='', metadata={})]


(declare-fun T1.County () String)
(declare-fun T0.cds () String)
(declare-fun T1.CDSCode () String)
(assert (= T1.County "9NKr6fzwVF"))
(assert (str.in_re T0.cds (re.+ (re.range " " "~"))))
(assert (> (str.len T0.cds) 0))
(assert (distinct (str.substr T0.cds 0 1) " "))
(assert (str.in_re T1.CDSCode (re.+ (re.range " " "~"))))
(assert (> (str.len T1.CDSCode) 0))
(assert (distinct (str.substr T1.CDSCode 0 1) " "))
(assert (str.in_re T1.County (re.+ (re.range " " "~"))))
(assert (> (str.len T1.County) 0))
(assert (distinct (str.substr T1.County 0 1) " "))

sat
[ValueAssignment(column='T1.County', alias='', value='9NKr6fzwVF', data_type='', metadata={})]


(declare-fun T0.NumTstTakr () Int)
(declare-fun T0.cds () String)
(declare-fun T1.CDSCode () String)
(declare-fun T1.County () String)
(assert (< 0 T0.NumTstTakr))
(assert (str.in_re T0.cds (re.+ (re.range " " "~"))))
(assert (> (str.len T0.cds) 0))
(assert (distinct (str.substr T0.cds 0 1) " "))
(assert (str.in_re T1.CDSCode (re.+ (re.range " " "~"))))
(assert (> (str.len T1.CDSCode) 0))
(assert (distinct (str.substr T1.CDSCode 0 1) " "))
(assert (str.in_re T1.County (re.+ (re.range " " "~"))))
(assert (> (str.len T1.County) 0))
(assert (distinct (str.substr T1.County 0 1) " "))

sat
[ValueAssignment(column='T0.NumTstTakr', alias='', value=1, data_type='', metadata={})]


(declare-fun T0.cds () String)
(declare-fun T1.CDSCode () String)
(assert (and (distinct T0.cds "?")
     (distinct T0.cds "4")
     (distinct T0.cds "O")
     (distinct T0.cds ")")
     (distinct T0.cds "!")
     (distinct T0.cds "A")
     (distinct T0.cds """")))
(assert (or (= T0.cds T1.CDSCode)
    (= T0.cds "?")
    (= T0.cds "4")
    (= T0.cds "O")
    (= T0.cds ")")
    (= T0.cds "!")
    (= T0.cds "A")
    (= T0.cds """")))
(assert (= T0.cds T1.CDSCode))
(assert (and (distinct T1.CDSCode "?")
     (distinct T1.CDSCode "4")
     (distinct T1.CDSCode "O")
     (distinct T1.CDSCode ")")
     (distinct T1.CDSCode "!")
     (distinct T1.CDSCode "A")
     (distinct T1.CDSCode """")))
(assert (or (= T0.cds T1.CDSCode)
    (= T0.cds "?")
    (= T0.cds "4")
    (= T0.cds "O")
    (= T0.cds ")")
    (= T0.cds "!")
    (= T0.cds "A")
    (= T0.cds """")))
(assert (= T0.cds T1.CDSCode))
(assert (str.in_re T0.cds (re.+ (re.range " " "~"))))
(assert (> (str.len T0.cds) 0))
(assert (distinct (str.substr T0.cds 0 1) " "))
(assert (str.in_re T1.CDSCode (re.+ (re.range " " "~"))))
(assert (> (str.len T1.CDSCode) 0))
(assert (distinct (str.substr T1.CDSCode 0 1) " "))

sat
[ValueAssignment(column='T0.cds', alias='', value='_', data_type='', metadata={}), ValueAssignment(column='T1.CDSCode', alias='', value='_', data_type='', metadata={})]


(declare-fun T0.cds () String)
(declare-fun T1.CDSCode () String)
(assert (str.in_re T0.cds (re.+ (re.range " " "~"))))
(assert (> (str.len T0.cds) 0))
(assert (distinct (str.substr T0.cds 0 1) " "))
(assert (str.in_re T1.CDSCode (re.+ (re.range " " "~"))))
(assert (> (str.len T1.CDSCode) 0))
(assert (distinct (str.substr T1.CDSCode 0 1) " "))

sat
[]


(declare-fun T0.NumTstTakr () Int)
(declare-fun T0.cds () String)
(declare-fun T1.CDSCode () String)
(assert (< 0 T0.NumTstTakr))
(assert (str.in_re T0.cds (re.+ (re.range " " "~"))))
(assert (> (str.len T0.cds) 0))
(assert (distinct (str.substr T0.cds 0 1) " "))
(assert (str.in_re T1.CDSCode (re.+ (re.range " " "~"))))
(assert (> (str.len T1.CDSCode) 0))
(assert (distinct (str.substr T1.CDSCode 0 1) " "))

sat
[ValueAssignment(column='T0.NumTstTakr', alias='', value=1, data_type='', metadata={})]


(declare-fun schools.CDSCode () String)
(declare-fun T0.cds () String)
(assert and)
(assert (= T0.cds schools.CDSCode))
(assert and)
(assert (= T0.cds schools.CDSCode))
(assert (str.in_re schools.CDSCode (re.+ (re.range " " "~"))))
(assert (> (str.len schools.CDSCode) 0))
(assert (distinct (str.substr schools.CDSCode 0 1) " "))
(assert (str.in_re T0.cds (re.+ (re.range " " "~"))))
(assert (> (str.len T0.cds) 0))
(assert (distinct (str.substr T0.cds 0 1) " "))

sat
[ValueAssignment(column='schools.CDSCode', alias='', value='?', data_type='', metadata={}), ValueAssignment(column='T0.cds', alias='', value='?', data_type='', metadata={})]


(declare-fun T0.cds () String)
(declare-fun T1.CDSCode () String)
(assert (or (= T0.cds T1.CDSCode) (= T0.cds "?")))
(assert (and (distinct T0.cds "?")))
(assert (or (= T0.cds T1.CDSCode) (= T0.cds "?")))
(assert (and (distinct T1.CDSCode "?")))
(assert (str.in_re T0.cds (re.+ (re.range " " "~"))))
(assert (> (str.len T0.cds) 0))
(assert (distinct (str.substr T0.cds 0 1) " "))
(assert (str.in_re T1.CDSCode (re.+ (re.range " " "~"))))
(assert (> (str.len T1.CDSCode) 0))
(assert (distinct (str.substr T1.CDSCode 0 1) " "))

sat
[ValueAssignment(column='T0.cds', alias='', value='4', data_type='', metadata={}), ValueAssignment(column='T1.CDSCode', alias='', value='4', data_type='', metadata={})]


(declare-fun T1.CDSCode () String)
(declare-fun T0.cds () String)
(assert (= T0.cds T1.CDSCode))
(assert (or (= T0.cds T1.CDSCode) (= T0.cds "?") (= T0.cds "4")))
(assert (and (distinct T0.cds "?") (distinct T0.cds "4")))
(assert (and (distinct T1.CDSCode "?") (distinct T1.CDSCode "4")))
(assert (or (= T0.cds T1.CDSCode) (= T0.cds "?") (= T0.cds "4")))
(assert (= T0.cds T1.CDSCode))
(assert (str.in_re T0.cds (re.+ (re.range " " "~"))))
(assert (> (str.len T0.cds) 0))
(assert (distinct (str.substr T0.cds 0 1) " "))
(assert (str.in_re T1.CDSCode (re.+ (re.range " " "~"))))
(assert (> (str.len T1.CDSCode) 0))
(assert (distinct (str.substr T1.CDSCode 0 1) " "))

sat
[ValueAssignment(column='T0.cds', alias='', value='O', data_type='', metadata={}), ValueAssignment(column='T1.CDSCode', alias='', value='O', data_type='', metadata={})]


(declare-fun T0.NumTstTakr () Int)
(declare-fun T0.cds () String)
(declare-fun T1.CDSCode () String)
(assert (<= 0 T0.NumTstTakr))
(assert (str.in_re T0.cds (re.+ (re.range " " "~"))))
(assert (> (str.len T0.cds) 0))
(assert (distinct (str.substr T0.cds 0 1) " "))
(assert (str.in_re T1.CDSCode (re.+ (re.range " " "~"))))
(assert (> (str.len T1.CDSCode) 0))
(assert (distinct (str.substr T1.CDSCode 0 1) " "))

sat
[ValueAssignment(column='T0.NumTstTakr', alias='', value=0, data_type='', metadata={})]


(declare-fun T1.CDSCode () String)
(declare-fun T0.cds () String)
(assert (= T0.cds T1.CDSCode))
(assert (or (= T0.cds T1.CDSCode) (= T0.cds "?") (= T0.cds "4") (= T0.cds "O")))
(assert (and (distinct T0.cds "?") (distinct T0.cds "4") (distinct T0.cds "O")))
(assert (= T0.cds T1.CDSCode))
(assert (and (distinct T1.CDSCode "?")
     (distinct T1.CDSCode "4")
     (distinct T1.CDSCode "O")))
(assert (or (= T0.cds T1.CDSCode) (= T0.cds "?") (= T0.cds "4") (= T0.cds "O")))
(assert (str.in_re T0.cds (re.+ (re.range " " "~"))))
(assert (> (str.len T0.cds) 0))
(assert (distinct (str.substr T0.cds 0 1) " "))
(assert (str.in_re T1.CDSCode (re.+ (re.range " " "~"))))
(assert (> (str.len T1.CDSCode) 0))
(assert (distinct (str.substr T1.CDSCode 0 1) " "))

sat
[ValueAssignment(column='T0.cds', alias='', value=')', data_type='', metadata={}), ValueAssignment(column='T1.CDSCode', alias='', value=')', data_type='', metadata={})]


(declare-fun T0.cds () String)
(declare-fun T1.CDSCode () String)
(assert (str.in_re T0.cds (re.+ (re.range " " "~"))))
(assert (> (str.len T0.cds) 0))
(assert (distinct (str.substr T0.cds 0 1) " "))
(assert (str.in_re T1.CDSCode (re.+ (re.range " " "~"))))
(assert (> (str.len T1.CDSCode) 0))
(assert (distinct (str.substr T1.CDSCode 0 1) " "))

sat
[]


(declare-fun T0.NumTstTakr () Int)
(declare-fun T0.cds () String)
(declare-fun T1.CDSCode () String)
(assert (< 0 T0.NumTstTakr))
(assert (str.in_re T0.cds (re.+ (re.range " " "~"))))
(assert (> (str.len T0.cds) 0))
(assert (distinct (str.substr T0.cds 0 1) " "))
(assert (str.in_re T1.CDSCode (re.+ (re.range " " "~"))))
(assert (> (str.len T1.CDSCode) 0))
(assert (distinct (str.substr T1.CDSCode 0 1) " "))

sat
[ValueAssignment(column='T0.NumTstTakr', alias='', value=1, data_type='', metadata={})]


(declare-fun T1.CDSCode () String)
(declare-fun T0.cds () String)
(assert (= T0.cds T1.CDSCode))
(assert (and (distinct T0.cds "?")
     (distinct T0.cds "4")
     (distinct T0.cds "O")
     (distinct T0.cds ")")))
(assert (or (= T0.cds T1.CDSCode)
    (= T0.cds "?")
    (= T0.cds "4")
    (= T0.cds "O")
    (= T0.cds ")")))
(assert (= T0.cds T1.CDSCode))
(assert (or (= T0.cds T1.CDSCode)
    (= T0.cds "?")
    (= T0.cds "4")
    (= T0.cds "O")
    (= T0.cds ")")))
(assert (and (distinct T1.CDSCode "?")
     (distinct T1.CDSCode "4")
     (distinct T1.CDSCode "O")
     (distinct T1.CDSCode ")")))
(assert (str.in_re T0.cds (re.+ (re.range " " "~"))))
(assert (> (str.len T0.cds) 0))
(assert (distinct (str.substr T0.cds 0 1) " "))
(assert (str.in_re T1.CDSCode (re.+ (re.range " " "~"))))
(assert (> (str.len T1.CDSCode) 0))
(assert (distinct (str.substr T1.CDSCode 0 1) " "))

sat
[ValueAssignment(column='T0.cds', alias='', value='!', data_type='', metadata={}), ValueAssignment(column='T1.CDSCode', alias='', value='!', data_type='', metadata={})]


(declare-fun T0.cds () String)
(declare-fun T1.CDSCode () String)
(assert (str.in_re T0.cds (re.+ (re.range " " "~"))))
(assert (> (str.len T0.cds) 0))
(assert (distinct (str.substr T0.cds 0 1) " "))
(assert (str.in_re T1.CDSCode (re.+ (re.range " " "~"))))
(assert (> (str.len T1.CDSCode) 0))
(assert (distinct (str.substr T1.CDSCode 0 1) " "))

sat
[]


(declare-fun T0.NumTstTakr () Int)
(declare-fun T0.cds () String)
(declare-fun T1.CDSCode () String)
(assert (< 0 T0.NumTstTakr))
(assert (str.in_re T0.cds (re.+ (re.range " " "~"))))
(assert (> (str.len T0.cds) 0))
(assert (distinct (str.substr T0.cds 0 1) " "))
(assert (str.in_re T1.CDSCode (re.+ (re.range " " "~"))))
(assert (> (str.len T1.CDSCode) 0))
(assert (distinct (str.substr T1.CDSCode 0 1) " "))

sat
[ValueAssignment(column='T0.NumTstTakr', alias='', value=1, data_type='', metadata={})]


(declare-fun T1.CDSCode () String)
(declare-fun T0.cds () String)
(assert (= T0.cds T1.CDSCode))
(assert (and (distinct T0.cds "?")
     (distinct T0.cds "4")
     (distinct T0.cds "O")
     (distinct T0.cds ")")
     (distinct T0.cds "!")))
(assert (or (= T0.cds T1.CDSCode)
    (= T0.cds "?")
    (= T0.cds "4")
    (= T0.cds "O")
    (= T0.cds ")")
    (= T0.cds "!")))
(assert (= T0.cds T1.CDSCode))
(assert (or (= T0.cds T1.CDSCode)
    (= T0.cds "?")
    (= T0.cds "4")
    (= T0.cds "O")
    (= T0.cds ")")
    (= T0.cds "!")))
(assert (and (distinct T1.CDSCode "?")
     (distinct T1.CDSCode "4")
     (distinct T1.CDSCode "O")
     (distinct T1.CDSCode ")")
     (distinct T1.CDSCode "!")))
(assert (str.in_re T0.cds (re.+ (re.range " " "~"))))
(assert (> (str.len T0.cds) 0))
(assert (distinct (str.substr T0.cds 0 1) " "))
(assert (str.in_re T1.CDSCode (re.+ (re.range " " "~"))))
(assert (> (str.len T1.CDSCode) 0))
(assert (distinct (str.substr T1.CDSCode 0 1) " "))

sat
[ValueAssignment(column='T0.cds', alias='', value='A', data_type='', metadata={}), ValueAssignment(column='T1.CDSCode', alias='', value='A', data_type='', metadata={})]


(declare-fun T1.School () String)
(declare-fun T0.cds () String)
(declare-fun T1.CDSCode () String)
(assert (= T1.School "6eGbWfu8 m"))
(assert (str.in_re T0.cds (re.+ (re.range " " "~"))))
(assert (> (str.len T0.cds) 0))
(assert (distinct (str.substr T0.cds 0 1) " "))
(assert (str.in_re T1.CDSCode (re.+ (re.range " " "~"))))
(assert (> (str.len T1.CDSCode) 0))
(assert (distinct (str.substr T1.CDSCode 0 1) " "))
(assert (str.in_re T1.School (re.+ (re.range " " "~"))))
(assert (> (str.len T1.School) 0))
(assert (distinct (str.substr T1.School 0 1) " "))

sat
[ValueAssignment(column='T1.School', alias='', value='6eGbWfu8 m', data_type='', metadata={})]


(declare-fun T0.NumTstTakr () Int)
(declare-fun T0.cds () String)
(declare-fun T1.CDSCode () String)
(declare-fun T1.School () String)
(assert (< 0 T0.NumTstTakr))
(assert (str.in_re T0.cds (re.+ (re.range " " "~"))))
(assert (> (str.len T0.cds) 0))
(assert (distinct (str.substr T0.cds 0 1) " "))
(assert (str.in_re T1.CDSCode (re.+ (re.range " " "~"))))
(assert (> (str.len T1.CDSCode) 0))
(assert (distinct (str.substr T1.CDSCode 0 1) " "))
(assert (str.in_re T1.School (re.+ (re.range " " "~"))))
(assert (> (str.len T1.School) 0))
(assert (distinct (str.substr T1.School 0 1) " "))

sat
[ValueAssignment(column='T0.NumTstTakr', alias='', value=1, data_type='', metadata={})]


(declare-fun T1.CDSCode () String)
(declare-fun T0.cds () String)
(assert (= T0.cds T1.CDSCode))
(assert (and (distinct T0.cds "?")
     (distinct T0.cds "4")
     (distinct T0.cds "O")
     (distinct T0.cds ")")
     (distinct T0.cds "!")
     (distinct T0.cds "A")))
(assert (or (= T0.cds T1.CDSCode)
    (= T0.cds "?")
    (= T0.cds "4")
    (= T0.cds "O")
    (= T0.cds ")")
    (= T0.cds "!")
    (= T0.cds "A")))
(assert (or (= T0.cds T1.CDSCode)
    (= T0.cds "?")
    (= T0.cds "4")
    (= T0.cds "O")
    (= T0.cds ")")
    (= T0.cds "!")
    (= T0.cds "A")))
(assert (and (distinct T1.CDSCode "?")
     (distinct T1.CDSCode "4")
     (distinct T1.CDSCode "O")
     (distinct T1.CDSCode ")")
     (distinct T1.CDSCode "!")
     (distinct T1.CDSCode "A")))
(assert (= T0.cds T1.CDSCode))
(assert (str.in_re T0.cds (re.+ (re.range " " "~"))))
(assert (> (str.len T0.cds) 0))
(assert (distinct (str.substr T0.cds 0 1) " "))
(assert (str.in_re T1.CDSCode (re.+ (re.range " " "~"))))
(assert (> (str.len T1.CDSCode) 0))
(assert (distinct (str.substr T1.CDSCode 0 1) " "))

sat
[ValueAssignment(column='T0.cds', alias='', value='@', data_type='', metadata={}), ValueAssignment(column='T1.CDSCode', alias='', value='@', data_type='', metadata={})]


(declare-fun T1.District () String)
(declare-fun T0.cds () String)
(declare-fun T1.CDSCode () String)
(assert (= T1.District "QkpbJtu5n3"))
(assert (str.in_re T0.cds (re.+ (re.range " " "~"))))
(assert (> (str.len T0.cds) 0))
(assert (distinct (str.substr T0.cds 0 1) " "))
(assert (str.in_re T1.CDSCode (re.+ (re.range " " "~"))))
(assert (> (str.len T1.CDSCode) 0))
(assert (distinct (str.substr T1.CDSCode 0 1) " "))
(assert (str.in_re T1.District (re.+ (re.range " " "~"))))
(assert (> (str.len T1.District) 0))
(assert (distinct (str.substr T1.District 0 1) " "))

sat
[ValueAssignment(column='T1.District', alias='', value='QkpbJtu5n3', data_type='', metadata={})]


(declare-fun T0.NumTstTakr () Int)
(declare-fun T0.cds () String)
(declare-fun T1.CDSCode () String)
(declare-fun T1.District () String)
(assert (< 0 T0.NumTstTakr))
(assert (str.in_re T0.cds (re.+ (re.range " " "~"))))
(assert (> (str.len T0.cds) 0))
(assert (distinct (str.substr T0.cds 0 1) " "))
(assert (str.in_re T1.CDSCode (re.+ (re.range " " "~"))))
(assert (> (str.len T1.CDSCode) 0))
(assert (distinct (str.substr T1.CDSCode 0 1) " "))
(assert (str.in_re T1.District (re.+ (re.range " " "~"))))
(assert (> (str.len T1.District) 0))
(assert (distinct (str.substr T1.District 0 1) " "))

sat
[ValueAssignment(column='T0.NumTstTakr', alias='', value=1, data_type='', metadata={})]


(declare-fun T1.CDSCode () String)
(declare-fun T0.cds () String)
(assert (= T0.cds T1.CDSCode))
(assert (and (distinct T0.cds "?")
     (distinct T0.cds "4")
     (distinct T0.cds "O")
     (distinct T0.cds ")")
     (distinct T0.cds "!")
     (distinct T0.cds "A")
     (distinct T0.cds "@")))
(assert (or (= T0.cds T1.CDSCode)
    (= T0.cds "?")
    (= T0.cds "4")
    (= T0.cds "O")
    (= T0.cds ")")
    (= T0.cds "!")
    (= T0.cds "A")
    (= T0.cds "@")))
(assert (= T0.cds T1.CDSCode))
(assert (and (distinct T1.CDSCode "?")
     (distinct T1.CDSCode "4")
     (distinct T1.CDSCode "O")
     (distinct T1.CDSCode ")")
     (distinct T1.CDSCode "!")
     (distinct T1.CDSCode "A")
     (distinct T1.CDSCode "@")))
(assert (or (= T0.cds T1.CDSCode)
    (= T0.cds "?")
    (= T0.cds "4")
    (= T0.cds "O")
    (= T0.cds ")")
    (= T0.cds "!")
    (= T0.cds "A")
    (= T0.cds "@")))
(assert (str.in_re T0.cds (re.+ (re.range " " "~"))))
(assert (> (str.len T0.cds) 0))
(assert (distinct (str.substr T0.cds 0 1) " "))
(assert (str.in_re T1.CDSCode (re.+ (re.range " " "~"))))
(assert (> (str.len T1.CDSCode) 0))
(assert (distinct (str.substr T1.CDSCode 0 1) " "))

sat
[ValueAssignment(column='T0.cds', alias='', value='"', data_type='', metadata={}), ValueAssignment(column='T1.CDSCode', alias='', value='"', data_type='', metadata={})]


(declare-fun T0.cds () String)
(declare-fun T1.CDSCode () String)
(assert (str.in_re T0.cds (re.+ (re.range " " "~"))))
(assert (> (str.len T0.cds) 0))
(assert (distinct (str.substr T0.cds 0 1) " "))
(assert (str.in_re T1.CDSCode (re.+ (re.range " " "~"))))
(assert (> (str.len T1.CDSCode) 0))
(assert (distinct (str.substr T1.CDSCode 0 1) " "))

sat
[]


(declare-fun T0.NumTstTakr () Int)
(declare-fun T0.cds () String)
(declare-fun T1.CDSCode () String)
(assert (< 0 T0.NumTstTakr))
(assert (str.in_re T0.cds (re.+ (re.range " " "~"))))
(assert (> (str.len T0.cds) 0))
(assert (distinct (str.substr T0.cds 0 1) " "))
(assert (str.in_re T1.CDSCode (re.+ (re.range " " "~"))))
(assert (> (str.len T1.CDSCode) 0))
(assert (distinct (str.substr T1.CDSCode 0 1) " "))

sat
[ValueAssignment(column='T0.NumTstTakr', alias='', value=1, data_type='', metadata={})]


