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

    \DeclareOption{caps}
    {
        \renewcommand{\cvsectionsize}[1]{\normalsize{\MakeUppercase{#1}}}
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

    \DeclareOption{russian}
    {
        \newcommand{\textEducation}{Образование}
        \newcommand{\textExperience}{Профессиональный опыт}
        \newcommand{\textLeadership}{Лидерский опыт}
        \newcommand{\textProjects}{Личные проекты}
        \newcommand{\textSkills}{Навыки}
        \newcommand{\textAwards}{Награды и почести}
        \newcommand{\textPublications}{Научные публикации}

        \newcommand{\textThesis}{Дипломная работа}
        \newcommand{\textSupervisor}{Дипломный руководитель}
        \newcommand{\textCourses}{Курсы}
    }

    \DeclareOption{german}
    {
        \newcommand{\textEducation}{Ausbildung}
        \newcommand{\textExperience}{Erfahrung}
        \newcommand{\textLeadership}{Führung}
        \newcommand{\textProjects}{Projekte}
        \newcommand{\textSkills}{Fähigkeiten}
        \newcommand{\textAwards}{Auszeichnungen und Ehrungen}
        \newcommand{\textPublications}{Wissenschaftliche Veröffentlichungen}

        \newcommand{\textThesis}{Thesis}
        \newcommand{\textSupervisor}{Supervisor}
        \newcommand{\textCourses}{Courses}
    }

    \DeclareOption{french}
    {
        \newcommand{\textEducation}{Education}
        \newcommand{\textExperience}{Experience}
        \newcommand{\textLeadership}{Leadership}
        \newcommand{\textProjects}{Projects}
        \newcommand{\textSkills}{Skills}
        \newcommand{\textAwards}{Awards \& Honors}
        \newcommand{\textPublications}{Publications}

        \newcommand{\textThesis}{Thesis}
        \newcommand{\textSupervisor}{Supervisor}
        \newcommand{\textCourses}{Courses}
    }

% Default Options
    \DeclareOption{defaultoptions}
    {
        \newcommand{\cvsectionsize}[1]{\large{#1}}
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
    \RequirePackage[german,french,main=english]{babel}
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
            \begin{minipage}[t]{0.75\textwidth}
                \centering
                \huge{
                    \textbf{\@name}\par
                }
    
                \small{           
                    \ifdefined\@address\vspace*{0.05cm}\faIcon{map-marker-alt}~\@address\par\fi
                    \ifdefined\@extrainfo\vspace*{0.05cm}\@extrainfo\par\fi
                    
                    \vspace*{0.05cm}   
                    \faIcon{envelope}~\href{mailto:\@email}{\@email}
                    \ifdefined\@phone\separator\faIcon{mobile}~\@phone\fi
                    \ifdefined\@homepage\separator\href{\@homepage}{\faIcon{globe}~\@homepage}\fi
                    \ifdefined\@linkedin\separator\href{http://www.linkedin.com/in/\@linkedin}{\faIcon{linkedin}~\@linkedin}\fi
                    \ifdefined\@github\separator\href{http://www.github.com/\@github}{\faIcon{github-square}~\@github}\fi 
                    \ifdefined\@gitlab\separator\href{http://www.gitlab.com/\@gitlab}{\faIcon{gitlab}~\@gitlab}\fi
                    \ifdefined\@dockerhub\separator\href{https://hub.docker.com/u/\@dockerhub}{\faIcon{docker}~\@dockerhub}\fi
                    \ifdefined\@researchgate\separator\href{https://www.researchgate.net/profile/\@researchgate}{\faIcon{researchgate}~\@researchgate}\fi
                    \ifdefined\@orcid\separator\href{http://www.orcid.org/\@orcid}{\faIcon{orcid}~\@orcid}\fi
                    \ifdefined\@kaggle\separator\href{http://www.kaggle.com/\@kaggle}{\faIcon{kaggle}~\@kaggle}\fi
                    \ifdefined\@facebook\separator\href{http://www.facebook.com/\@facebook}{\faIcon{facebook}~\@facebook}\fi
                    \ifdefined\@vk\separator\href{http://www.vk.com/\@vk}{\faIcon{vk}~\@vk}\fi
                    \ifdefined\@telegram\separator\href{http://www.t.me/\@telegram}{\faIcon{telegram}~\@telegram}\fi
                }
            \end{minipage}
        \end{center}

    }

% Section formatting
    \newcommand{\cvsection}[1]{\vspace*{-0.2cm}\section*{\cvsectionsize{#1}}\sectionline}

    \newcommand{\education}{\cvsection{\textEducation}}
    \newcommand{\experience}{\cvsection{\textExperience}}
    \newcommand{\leadership}{\cvsection{\textLeadership}}
    \newcommand{\projects}{\cvsection{\textProjects}}
    \newcommand{\skills}{\cvsection{\textSkills}}
    \newcommand{\awards}{\cvsection{\textAwards}}
    \newcommand{\publications}{\cvsection{\textPublications}}

    \newcommand{\cvbullet}[1]{\quad\textbullet\ \ \parbox[t]{0.957\textwidth}{#1}\par}
    \newcommand{\cvsubbullet}[1]{\quad\quad\textopenbullet\ \ \parbox[t]{0.914\textwidth}{#1}\par}

    \newcommand{\thesis}[2]{\cvbullet{\textThesis: \emph{#1}, \textSupervisor: #2}}
    \newcommand{\courses}[1]{\cvbullet{\textCourses: \emph{#1}}}

    \newcommand{\cvblock}[8]
    {
        \noindent\begin{minipage}[t]{\textwidth}
            \par\vspace*{0.05cm}
            \textbf{#3\ifstrempty{#4}{}{, #4}}\hfill\textbf{#2}\par
            \noindent\emph{#5\ifstrempty{#6}{}{, #6}}\ifstrempty{#7}{}{, #7}\hfill{#1}\ifstrempty{#8}{}{\par #8} 
            \par\vspace*{0.05cm}
        \end{minipage}
        \par\vspace*{0.1cm}
    }

    \newcommand{\project}[6]{\cvblock{#1}{#2}{#3\ifstrempty{#6}{}{\separator\href{#6}{\faIcon{code}}}}{}{#4}{}{}{#5}}
    
    \newcommand{\skillgroup}[2]{\noindent\begin{minipage}[t]{\textwidth}%
                                \textbf{#1}: #2%
                                \end{minipage}\par\vspace*{0.05cm}}
    \newcommand{\award}[3]{\noindent\begin{minipage}[t]{\textwidth}%
                           \textbf{#1}\ifstrempty{#2}{}{: \emph{#2}}\hfill#3%
                           \end{minipage}\par\vspace*{0.05cm}}
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
\hypersetup{
    colorlinks=true,
    urlcolor=black,
}