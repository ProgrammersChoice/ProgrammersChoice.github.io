(require 'package)
(setq package-user-dir (expand-file-name "./.packages"))
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))
(package-install 'htmlize)
(require 'ox-publish)
(setq org-html-validation-link nil ;;html마지막에 validate뜨는거 막기
      org-html-head-include-scripts nil ;;use our own scripts
      org-html-head-include-default-style nil ;;use our own styles
      org-html-head "<link rel=\"stylesheet\" href=\"https://cdn.simplecss.org/simple.min.css\" />")
;;define the publishing project
(setq org-publish-project-alist
      (list
       (list "my-org-site"
             :recursive t
             :base-directory "./content"
             :publishing-directory "./publish"
             :publishing-function 'org-html-publish-to-html
	     :with-author nil    ;; don't include author name
	     :with-creator nil     ;; include Emacs and Org versions in folder
	     :with-toc nil         ;; include a table of contents
	     :section-numbers nil ;; Don't include section number
	     :time-stamp-file nil ;; Don't include time stamp in file
	     )))
;; Generate the site output
(org-publish-all t)

(message "Build complete!")
