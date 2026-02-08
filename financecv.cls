\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{financecv}[2026-02-08 v1.0 financial curriculum vitae document class]

\LoadClass{article}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%         Class Packages         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{iftex}

\ifPDFTeX
  \RequirePackage{cmap}
  \RequirePackage[utf8]{inputenc}
  \RequirePackage[T1]{fontenc}
  \RequirePackage{tgtermes}
\else
  \RequirePackage{fontspec}
  \providecommand{\FinanceCVMainFont}{Times New Roman}

  \setmainfont{\FinanceCVMainFont}[Ligatures=TeX,Cyrillic]
\fi

\RequirePackage{titlesec}

\RequirePackage{etoolbox}
\RequirePackage{fontawesome5}
\RequirePackage{ragged2e}
\PassOptionsToPackage{hyphens}{url}

\RequirePackage{hyperref}
\hypersetup{colorlinks=true, urlcolor=black}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%         Class  Options         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\DeclareOption{a4paper}{%
  \setlength\paperheight{297mm}%
  \setlength\paperwidth{210mm}%
}
\DeclareOption{letterpaper}{%
  \setlength\paperheight{11in}%
  \setlength\paperwidth{8.5in}%
}
\DeclareOption{noline}{\renewcommand{\sectionline}{}}
\DeclareOption{resume}{\renewcommand{\cvinclude}[1]{}}
\DeclareOption{caps}{%
  \renewcommand{\cvsectioncaps}[1]{\MakeUppercase{#1}}%
  \renewcommand{\cvsectionsize}[1]{{\normalsize #1}}%
}
\DeclareOption{english}{%
  \newcommand{\textEducation}{Education}%
  \newcommand{\textExperience}{Professional Experience}%
  \newcommand{\textLeadership}{Leadership}%
  \newcommand{\textProjects}{Projects}%
  \newcommand{\textSkills}{Skills}%
  \newcommand{\textAwards}{Awards \& Honours}%
  \newcommand{\textPublications}{Publications}%
  \newcommand{\textThesis}{Thesis}%
  \newcommand{\textSupervisor}{Supervisor}%
  \newcommand{\textCourses}{Courses}%
  \newcommand{\textSince}{Since}%
}
\DeclareOption{russian}{%
  \renewcommand{\textEducation}{Образование}%
  \renewcommand{\textExperience}{Профессиональный опыт}%
  \renewcommand{\textLeadership}{Лидерский опыт}%
  \renewcommand{\textProjects}{Личные проекты}%
  \renewcommand{\textSkills}{Навыки}%
  \renewcommand{\textAwards}{Награды и почести}%
  \renewcommand{\textPublications}{Научные публикации}%
  \renewcommand{\textThesis}{Дипломная работа}%
  \renewcommand{\textSupervisor}{Дипломный руководитель}%
  \renewcommand{\textCourses}{Курсы}%
  \renewcommand{\textSince}{С}%
}
\DeclareOption{defaultoptions}{%
  \newcommand{\cvsectionsize}[1]{{\large #1}}%
  \newcommand{\cvsectioncaps}[1]{{#1}}%
  \newcommand{\cvinclude}[1]{{#1}}%
  \newcommand{\sectionline}{\par\vspace{-0.5mm}\hrule\par\vspace{-0.5mm}}%
  \titlespacing*{\section}{0pt}{-0.1cm}{0pt}%
}
\ExecuteOptions{a4paper,defaultoptions,english}
\ProcessOptions\relax

\RequirePackage{geometry}
\geometry{
  paperwidth=\paperwidth,
  paperheight=\paperheight,
  left=0.3in,right=0.3in,
  top=0.3in,bottom=0.3in,
  centering
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      Personal Information      %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\providecommand{\@name}{}
\providecommand{\@email}{}
\DeclareRobustCommand\name[1]{\gdef\@name{#1}}
\DeclareRobustCommand\email[1]{\gdef\@email{#1}}
\DeclareRobustCommand\phone[1]{\gdef\@phone{#1}}
\DeclareRobustCommand\extphone[1]{\gdef\@extphone{#1}}
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       Class Cmds Definition      %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\setlength{\parindent}{0pt}
\setlength{\parskip}{0pt}

\renewcommand{\maketitle}{%
  \begingroup
  \begin{center}
    \begin{minipage}[t]{0.75\textwidth}
      \centering
      \huge{\textbf{\@name}\par}
      \small
      {%
        \ifdefined\@address\vspace*{0.05cm}\faIcon{map-marker-alt}~\@address\par\fi
        \ifdefined\@extrainfo\vspace*{0.05cm}\@extrainfo\par\fi
        \vspace*{0.05cm}%
        \ifx\@email\@empty\relax\else \faIcon{envelope}~\href{mailto:\@email}{\@email}\fi
        \ifdefined\@phone\separator\faIcon{mobile}~\@phone\fi
        \ifdefined\@extphone\separator\faIcon{phone}~ext.:~\@extphone\fi
        \ifdefined\@homepage\separator\href{\@homepage}{\faIcon{globe}~\@homepage}\fi
        \ifdefined\@linkedin\separator\href{https://www.linkedin.com/in/\@linkedin}{\faIcon{linkedin}~\@linkedin}\fi
        \ifdefined\@github\separator\href{https://www.github.com/\@github}{\faIcon{github-square}~\@github}\fi
        \ifdefined\@gitlab\separator\href{https://www.gitlab.com/\@gitlab}{\faIcon{gitlab-square}~\@gitlab}\fi
        \ifdefined\@dockerhub\separator\href{https://hub.docker.com/u/\@dockerhub}{\faIcon{docker}~\@dockerhub}\fi
        \ifdefined\@researchgate\separator\href{https://www.researchgate.net/profile/\@researchgate}{\faIcon{researchgate}~\@researchgate}\fi
        \ifdefined\@orcid\separator\href{https://www.orcid.org/\@orcid}{\faIcon{orcid}~\@orcid}\fi
        \ifdefined\@kaggle\separator\href{https://www.kaggle.com/\@kaggle}{\faIcon{kaggle}~\@kaggle}\fi
        \ifdefined\@facebook\separator\href{https://www.facebook.com/\@facebook}{\faIcon{facebook}~\@facebook}\fi
        \ifdefined\@vk\separator\href{https://www.vk.com/\@vk}{\faIcon{vk}~\@vk}\fi
        \ifdefined\@telegram\separator\href{https://www.t.me/\@telegram}{\faIcon{telegram}~\@telegram}\fi
      }%
    \end{minipage}
  \end{center}
  \endgroup
}

\newcommand{\cvsection}[1]{%
\section*{\cvsectionsize{\cvsectioncaps{#1}}}%
  \addcontentsline{toc}{section}{#1}%
  \sectionline{}\vspace*{0.2cm}\par
}
\newcommand{\education}{\cvsection{\textEducation}}
\newcommand{\experience}{\cvsection{\textExperience}}
\newcommand{\leadership}{\cvsection{\textLeadership}}
\newcommand{\projects}{\cvsection{\textProjects}}
\newcommand{\skills}{\cvsection{\textSkills}}
\newcommand{\awards}{\cvsection{\textAwards}}
\newcommand{\publications}{\cvsection{\textPublications}}

\newcommand{\cvbullet}[1]{{\noindent\textbullet\quad{}#1\par}}
\newcommand{\cvrole}[3]{%
  \noindent\emph{#3} \hfill
  \ifstrempty{#2}{\textSince{} }{}#1\ifstrempty{#2}{}{ -- #2}\par
}
\newcommand{\cvjob}[4]{%
  {\noindent\textbf{#2}\hfill\textbf{#1}\par
  \nopagebreak #3\par
  \nopagebreak #4\par\vspace*{0.3em}\filbreak}\vspace{0.1cm}
}

\newcommand{\link}[2]{\href{#1}{\faIcon{link}\! #2}}

\newcommand{\cvblock}[8]{\PackageWarning{financecv}{The '\noexpand\cvblock' command was deprecated. Please use a combination of `\noexpand\cvjob' and `\noexpand\cvrole'.}%
  \cvjob{\textbf{#2}}{\textbf{#3\ifstrempty{#4}{}{, #4}}}{%
    \noindent\emph{#5\ifstrempty{#6}{}{, #6}}\ifstrempty{#7}{}{, #7}\hfill{#1}%
  }{#8}%
}
\newcommand{\project}[6]{%
  \cvblock{#1}{#2}{#3\ifstrempty{#6}{}{\separator\href{#6}{\faIcon{code}}}}{}{#4}{}{}{#5}%
}
\newcommand{\skillgroup}[2]{%
  {\noindent\begin{minipage}[t]{\textwidth}\textbf{#1}: #2\end{minipage}\par\vspace*{0.1cm}}%
}
\newcommand{\award}[3]{%
  {\noindent\begin{minipage}[t]{\textwidth}\textbf{#1}\ifstrempty{#2}{}{: \emph{#2}}\hfill#3\end{minipage}\par\vspace*{0.1cm}}%
}

\newsavebox\separatorbox
\sbox\separatorbox{|}
\newcommand{\separator}{%
  {\unskip\hskip 2mm plus 1mm minus 1mm
  \cleaders\copy\separatorbox\hskip\wd\separatorbox
  \hskip 2mm plus 1mm minus 1mm\ignorespaces}%
}

\AtBeginDocument{%
  \ifx\@name\@empty\ClassWarning{financecv}{\string\name{} is not set}\fi
  \ifx\@email\@empty\ClassWarning{financecv}{\string\email{} is not set}\fi
  \hypersetup{
    pdftitle={\@name's Resume (financecv LaTeX package)},
    pdfauthor={\@name{}},
    pdfkeywords={resume}
  }
  \maketitle
  \justifying
}
