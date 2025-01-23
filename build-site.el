(require 'ox-publish)
(require 'package)
(setq package-user-dir (expand-file-name "./.packages"))
(setq packages-archives '(("melpa" . "https://melpa.org/packages/")
                          ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(package-install 'htmlize)

;; Customize the html output
(setq org-html-validation-link nil ;; Dont show validation link
      org-html-head-include-scripts nil ;; Use our own scripts
      org-html-head-include-scripts nil
      org-html-head "<link rel=\"stylesheet\"
    href=\"https://cdn.simplecss.org/simple.min.css\" />")

;; Define the publishing project
(setq org-publish-project-alist
      (list
       (list "my-org-site"
             :recursive t
             :base-directory "./content"
             :publishing-directory "./docs"
             :publishing-function 'org-html-publish-to-html
             :with-author t 
             :with-creator t
             :with-toc t
             :section-numbers nil
             :time-stamp-file nil)))
             
;; Generate the site output
(org-publish-all t)
       
(message "Build complete!")
