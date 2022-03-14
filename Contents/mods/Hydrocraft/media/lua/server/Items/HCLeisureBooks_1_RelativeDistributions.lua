---------------------------------------------------------
--- All Leisure Books with there relative distributions -
---------------------------------------------------------
function office(m)
        retVal =
        {
                "Hydrocraft.HCBookAlmanac",           m*1,
                "Hydrocraft.HCBookCommunications",    m*0.5,
                "Hydrocraft.HCBookDictionary",        m*2,
                "Hydrocraft.HCBookEncyclopedia",      m*1,
                "Hydrocraft.HCBookLaw",               m*1,
                "Hydrocraft.HCBookWorldAtlas",        m*0.5,
                "Hydrocraft.HCBookWorldHistory",      m*0.5,
        };
        return retVal
end

 
function school(m)
        retVal =
        {
-- science 
                "Hydrocraft.HCBookAlgebra",           m*1,
                "Hydrocraft.HCBookBiology",           m*1,
                "Hydrocraft.HCBookCalculus",          m*1,
                "Hydrocraft.HCBookGeometry",          m*1,
                "Hydrocraft.HCBookMath",              m*1,
                "Hydrocraft.HCBookPhysics",           m*1,
                "Hydrocraft.HCBookTrigonometry",      m*1,

-- arts
                "Hydrocraft.HCBookAmericanHistory",   m*1,
                "Hydrocraft.HCBookEnglish",           m*1,
                "Hydrocraft.HCBookThesaurus",         m*1,
                "Hydrocraft.HCBookPoliticalScience",  m*1,
                "Hydrocraft.HCBookPoetry",            m*1,
                "Hydrocraft.HCBookSociology",         m*1,
-- from office
                "Hydrocraft.HCBookDictionary",        m*1,
        };
        return retVal
end

function animal(m)
        retVal =
        {

                "Hydrocraft.HCBookAmphibianGuide",    m*1,
                "Hydrocraft.HCBookReptileGuide",      m*1,
        };
        return retVal
end

function other(m)
        retVal =
        {
--  history
                "Hydrocraft.HCBookanthropology",      m*1,
                "Hydrocraft.HCBookarcheology",        m*1,
                "Hydrocraft.HCBookgenealogy",         m*2,
                "Hydrocraft.HCBookpaleontology",      m*0.5,

--  literature
                "Hydrocraft.HCBookcalligraphy",       m*0.5,
                "Hydrocraft.HCBookliterature",        m*2,
                "Hydrocraft.HCBookphilosophy",        m*1,

--  myth
                "Hydrocraft.HCBookgreekmyths",          m*1,
                "Hydrocraft.HCBooknorsemyths",          m*0.5,
                "Hydrocraft.HCBookastrology",           m*2,

--  other
                "Hydrocraft.HCBookecology",             m*1,
                "Hydrocraft.HCBookhealth",              m*1,

--  technology
                "Hydrocraft.HCBooksailing",             m*1,
                "Hydrocraft.HCBookscrap",               m*0.5,
        }; 
        return retVal
end

function electronics(m)
        retVal =
        {
                "Hydrocraft.HCBookRadio",               m*1,
                "Hydrocraft.HCBookRobotics",            m*0.5,
        }; 
        return retVal
end
 
function language(m)
        retVal =
        {
-- asian
                "Hydrocraft.HCBookChinese",           m*2,
                "Hydrocraft.HCBookJapanese",          m*1,
                "Hydrocraft.HCBookKorean",            m*0.5,
                "Hydrocraft.HCBookHindi",             m*1,

-- african
                "Hydrocraft.HCBookArabic",            m*1,
                "Hydrocraft.HCBookEgyptian",          m*1,
                "Hydrocraft.HCBookZulu",              m*0.5,
                "Hydrocraft.HCBookHebrew",            m*1,

-- europe1
                "Hydrocraft.HCBookCzech",             m*0.5,
                "Hydrocraft.HCBookPolish",            m*2,
                "Hydrocraft.HCBookRussian",           m*1,

-- europe2
                "Hydrocraft.HCBookDutch",             m*1,
                "Hydrocraft.HCBookFinnish",           m*0.5,
                "Hydrocraft.HCBookGerman",            m*2,
                "Hydrocraft.HCBookGreek",             m*0.5,

-- europe3 
                "Hydrocraft.HCBookFrench",            m*1,
                "Hydrocraft.HCBookItalian",           m*2,
                "Hydrocraft.HCBookPortuguese",        m*0.5,
                "Hydrocraft.HCBookSpanish",           m*2,
        }; 
        return retVal
end

function religious(m)
        retVal =
        {

                "Hydrocraft.HCBookBible",             m*2,
                "Hydrocraft.HCBookKoran",             m*1,
                "Hydrocraft.HCBookTorah",              m*1,
        }; 
        return retVal
end
 
function children(m)
        retVal = 
        { 
                "Hydrocraft.HCBookBedtime",           m*0.1,
                "Hydrocraft.HCBookFairytale",         m*0.1,
        }; 
        return retVal
end
 
function adult(m)
        retVal = 
        { 
                "Hydrocraft.HCAdultmagazine",         m*0.1,
                "Hydrocraft.HCAdultmagazine2",        m*0.1,
                "Hydrocraft.HCAdultmagazine3",        m*0.1,
                "Hydrocraft.HCAdultmagazine4",        m*0.1,
                "Hydrocraft.HCAdultmagazine5",        m*0.1,
                "Hydrocraft.HCAdultmagazine6",        m*0.1,
        }; 
        return retVal
end
 
function sport(m)
        retVal = 
        { 
                "Hydrocraft.HCSportsmagazine",        m*0.1,
                "Hydrocraft.HCSportsmagazine2",       m*0.1,
        }; 
        return retVal
end
 
function comics(m)
        retVal = 
        { 
                "Hydrocraft.HCComic1",                m*0.1,
                "Hydrocraft.HCComic2",                m*0.1,
                "Hydrocraft.HCComic3",                m*0.1,
                "Hydrocraft.HCComic4",                m*0.1,
                "Hydrocraft.HCComic5",                m*0.1,
                "Hydrocraft.HCComic6",                m*0.1,
                "Hydrocraft.HCComic7",                m*0.1,
                "Hydrocraft.HCComic8",                m*0.1,
                "Hydrocraft.HCComic9",                m*0.1,
        };
        return retVal
end
  
