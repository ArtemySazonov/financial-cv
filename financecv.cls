\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{financecv}[2023-09-01 v1.0.0 financial curriculum vitae document class]

\LoadClass{article}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%         Class  Options         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Layout options
    \DeclareOption{a4paper}
    {
        \setlength\paperheight{297mm}
        \setlength\paperwidth{210mm}
    }

    \DeclareOption{letterpaper}
    {
        \setlength\paperheight{11in}
        \setlength\paperwidth{8.5in}
    }

    \DeclareOption{lowerline}
    {
        \renewcommand{\sectionline}{\vspace*{-0.35cm}\hrule\vspace*{0.15cm}}
    }

    \DeclareOption{upperline}
    {
        \renewcommand{\sectionline}{\vspace*{-1cm}\hrule\vspace*{0.8cm}}
    }

    \DeclareOption{noline}
    {
        \renewcommand{\sectionline}{}
    }

% Language-dependent options
    \DeclareOption{english}
    {
        \newcommand{\cvsectionsize}[1]{\large{#1}}
        \newcommand{\textEducation}{Education}
        \newcommand{\textExperience}{Professional Experience}
        \newcommand{\textLeadership}{Leadership}
        \newcommand{\textProjects}{Projects}
        \newcommand{\textSkills}{Skills}
        \newcommand{\textAwards}{Awards \& Honours}
        \newcommand{\textPublications}{Publications}

        \newcommand{\textThesis}{Thesis}
        \newcommand{\textSupervisor}{Supervisor}
        \newcommand{\textCourses}{Courses}
    }

    \DeclareOption{englishcaps}
    {
        \renewcommand{\cvsectionsize}[1]{\normalsize{#1}}
        \renewcommand{\textEducation}{EDUCATION}
        \renewcommand{\textExperience}{PROFESSIONAL EXPERIENCE}
        \renewcommand{\textLeadership}{LEADERSHIP}
        \renewcommand{\textProjects}{PROJECTS}
        \renewcommand{\textSkills}{SKILLS}
        \renewcommand{\textAwards}{AWARDS \& HONOURS}
        \renewcommand{\textPublications}{PUBLICATIONS}

        \renewcommand{\textThesis}{Thesis}
        \renewcommand{\textSupervisor}{Supervisor}
        \renewcommand{\textCourses}{Courses}
    }

    \DeclareOption{russian}
    {
        \renewcommand{\textEducation}{Образование}
        \renewcommand{\textExperience}{Профессиональный опыт}
        \renewcommand{\textLeadership}{Лидерский опыт}
        \renewcommand{\textProjects}{Личные проекты}
        \renewcommand{\textSkills}{Навыки}
        \renewcommand{\textAwards}{Награды и почести}
        \renewcommand{\textPublications}{Научные публикации}

        \renewcommand{\textThesis}{Дипломная работа}
        \renewcommand{\textSupervisor}{Дипломный руководитель}
        \renewcommand{\textCourses}{Курсы}
    }

    \DeclareOption{german}
    {
        \renewcommand{\textEducation}{Ausbildung}
        \renewcommand{\textExperience}{Erfahrung}
        \renewcommand{\textLeadership}{Führung}
        \renewcommand{\textProjects}{Projekte}
        \renewcommand{\textSkills}{Fähigkeiten}
        \renewcommand{\textAwards}{Auszeichnungen und Ehrungen}
        \renewcommand{\textPublications}{Wissenschaftliche Veröffentlichungen}

        \renewcommand{\textThesis}{Thesis}
        \renewcommand{\textSupervisor}{Supervisor}
        \renewcommand{\textCourses}{Courses}
    }

    \DeclareOption{french}
    {
        \renewcommand{\textEducation}{Education}
        \renewcommand{\textExperience}{Experience}
        \renewcommand{\textLeadership}{Leadership}
        \renewcommand{\textProjects}{Projects}
        \renewcommand{\textSkills}{Skills}
        \renewcommand{\textAwards}{Awards \& Honors}
        \renewcommand{\textPublications}{Publications}

        \renewcommand{\textThesis}{Thesis}
        \renewcommand{\textSupervisor}{Supervisor}
        \renewcommand{\textCourses}{Courses}
    }

% Default Options
    \DeclareOption{defaultoptions}
    {
        \newcommand{\cvsectionsize}[1]{\large{#1}}
        \newcommand{\textEducation}{Education}
        \newcommand{\textExperience}{Professional Experience}
        \newcommand{\textLeadership}{Leadership}
        \newcommand{\textProjects}{Projects}
        \newcommand{\textSkills}{Skills}
        \newcommand{\textAwards}{Awards \& Honors}
        \newcommand{\textPublications}{Publications}

        \newcommand{\textThesis}{Thesis}
        \newcommand{\textSupervisor}{Supervisor}
        \newcommand{\textCourses}{Courses}

        \newcommand{\sectionline}{\vspace*{-0.35cm}\hrule\vspace*{0.15cm}}
    }
    \ExecuteOptions{a4paper,defaultoptions}
    \ProcessOptions

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%         Class Packages         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fonts and Layout
    \RequirePackage{cmap}
    \RequirePackage[utf8]{inputenc}
    \RequirePackage[T1]{fontenc}
    \RequirePackage{tgtermes}
    \RequirePackage[margin=0.65in]{geometry}
    \RequirePackage{titlesec}
    \RequirePackage{etoolbox}

% Graphics
    \RequirePackage{graphicx}
    \RequirePackage{xcolor}
    \RequirePackage{enumitem}
    \RequirePackage{tabularx}
    \RequirePackage{fontawesome5}

% Misc
    \RequirePackage{hyperref}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      Personal Information      %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\DeclareRobustCommand\name[1]{\gdef\@name{#1}}
\DeclareRobustCommand\email[1]{\gdef\@email{#1}}
\DeclareRobustCommand\phone[1]{\gdef\@phone{#1}}
\DeclareRobustCommand\homepage[1]{\gdef\@homepage{#1}}
\DeclareRobustCommand\address[1]{\gdef\@address{#1}}
\DeclareRobustCommand\extrainfo[1]{\gdef\@extrainfo{#1}}

\DeclareRobustCommand\linkedin[1]{\gdef\@linkedin{#1}}
\DeclareRobustCommand\github[1]{\gdef\@github{#1}}
\DeclareRobustCommand\gitlab[1]{\gdef\@gitlab{#1}}
\DeclareRobustCommand\dockerhub[1]{\gdef\@dockerhub{#1}}
\DeclareRobustCommand\kaggle[1]{\gdef\@kaggle{#1}}

\DeclareRobustCommand\researchgate[1]{\gdef\@researchgate{#1}}
\DeclareRobustCommand\orcid[1]{\gdef\@orcid{#1}}

\DeclareRobustCommand\facebook[1]{\gdef\@facebook{#1}}
\DeclareRobustCommand\vk[1]{\gdef\@vk{#1}}
\DeclareRobustCommand\telegram[1]{\gdef\@telegram{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      Class Configuration       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Header of the CV
    \renewcommand{\maketitle}
    {
        \begin{center}
            \huge{
                \textbf{\@name}
            }

            \small{           
                \ifdefined\@address\vspace*{0.15cm}\faIcon{map-marker-alt}~\@address\fi

                \ifdefined\@extrainfo\vspace*{0.1cm}\@extrainfo\fi
                
                \vspace*{0.1cm}   
                \color{gray}
                \faIcon{envelope}~\href{mailto:\@email}{\@email}
                \ifdefined\@phone\separator\faIcon{phone}~\@phone\fi
                \ifdefined\@homepage\separator\href{\@homepage}{\faIcon{globe}~\@homepage}\fi
                \ifdefined\@linkedin\separator\href{http://www.linkedin.com/in/\@linkedin}{\faIcon{linkedin}~\@linkedin}\fi
                \ifdefined\@github\separator\href{http://www.github.com/\@github}{\faIcon{github}~\@github}\fi 
                \ifdefined\@gitlab\separator\href{http://www.gitlab.com/\@gitlab}{\faIcon{gitlab}~\@gitlab}\fi
                \ifdefined\@dockerhub\separator\href{https://hub.docker.com/u/\@dockerhub}{\faIcon{docker}~\@dockerhub}\fi
                \ifdefined\@researchgate\separator\href{https://www.researchgate.net/profile/\@researchgate}{\faIcon{researchgate}~\@researchgate}\fi
                \ifdefined\@orcid\separator\href{http://www.orcid.org/\@orcid}{\faIcon{orcid}~\@orcid}\fi
                \ifdefined\@kaggle\separator\href{http://www.kaggle.com/\@kaggle}{\faIcon{kaggle}~\@kaggle}\fi
                \ifdefined\@facebook\separator\href{http://www.facebook.com/\@facebook}{\faIcon{facebook}~\@facebook}\fi
                \ifdefined\@vk\separator\href{http://www.vk.com/\@vk}{\faIcon{vk}~\@vk}\fi
                \ifdefined\@telegram\separator\href{http://www.t.me/\@telegram}{\faIcon{telegram}~\@telegram}\fi
            }
        \end{center}
    }

% Section formatting
    \newcommand{\cvsection}[1]{\section*{\cvsectionsize{#1}}\sectionline}
    \newcommand{\cvsubsection}[1]{\subsection*{#1}}

    \newcommand{\education}{\cvsection{\textEducation}}
    \newcommand{\experience}{\cvsection{\textExperience}}
    \newcommand{\leadership}{\cvsection{\textLeadership}}
    \newcommand{\projects}{\cvsection{\textProjects}}
    \newcommand{\skills}{\cvsection{\textSkills}}
    \newcommand{\awards}{\cvsection{\textAwards}}
    \newcommand{\publications}{\cvsection{\textPublications}}

    \newcommand{\cvbullet}[1]{\indent \textbullet\ #1\par}
    \newcommand{\cvsubbullet}[1]{\indent \indent \textopenbullet\ #1\par}

    \newcommand{\thesis}[2]{\cvbullet{\textThesis: \emph{#1}, \textSupervisor: #2}}
    \newcommand{\courses}[1]{\cvbullet{\textCourses: \emph{#1}}}

    \newcommand{\cvblock}[8]
    {
        \noindent\textbf{#3\ifstrempty{#4}{}{, #4}} \hfill \textbf{#2} \newline
        \noindent\emph{#5\ifstrempty{#6}{}{, #6}}\ifstrempty{#7}{}{, #7} \hfill {#1}
        \ifstrempty{#8}{}{\newline #8} 
        \vskip 0.2cm
    }

    \newcommand{\project}[6]{\cvblock{#1}{#2}{`#3'\ifstrempty{#6}{}\separator\href{#6}{\faIcon{github}}}{}{#4}{}{}{#5}}
    \newcommand{\skillgroup}[2]{\noindent\textbf{#1}: #2 \par{}}
    \newcommand{\award}[3]{\noindent\textbf{#1}\ifstrempty{#2}{}{: \emph{#2}} \hfill {#3}\par{}}
% Misc
    \newcommand{\separator}
    {
        \unskip
        \hskip 2mm plus 1mm minus 1mm
        \cleaders\copy\separatorbox\hskip\wd\separatorbox
        \hskip 2mm plus 1mm minus 1mm
        \ignorespaces
    }
    \newsavebox\separatorbox
    \sbox\separatorbox{|}
    \newcommand{\link}[2]{\faIcon{link}\href{#1}{#2}}




\AtBeginDocument{
    \maketitle
}

\pagestyle{empty}

