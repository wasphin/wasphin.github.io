(package-initialize)
(unless package-archive-contents
  (add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
  (package-refresh-contents))
(dolist (pkg '(htmlize))
  (unless (package-installed-p pkg)
    (package-install pkg)))

(require 'org)
(require 'ox-publish)

(setq org-publish-project-alist
      '(
        ("org-base"
         :base-directory "./org/"
         :base-extension "org"

         ;; Path to your Jekyll project.
         :publishing-directory "./jekyll"
         :recursive nil
         :publishing-function (org-html-publish-to-html)
         :headline-levels 4
         :html-extension "html"
         :body-only t ;; Only export section between <body> </body>
         )
        ("org-posts"
         ;; Path to your org files.
         :base-directory "./org/posts"
         :base-extension "org"

         ;; Path to your Jekyll project.
         :publishing-directory "./jekyll/_posts"
         :recursive t
         :publishing-function (org-html-publish-to-html)
         :headline-levels 4
         :html-extension "html"
         :body-only t ;; Only export section between <body> </body>
         )

        ("org-static"
         :base-directory "./org/"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf\\|php"
         :publishing-directory "./"
         :recursive t
         :publishing-function org-publish-attachment)

        ("wasphin" :components ("org-base" "org-posts" "org-static"))
        )
      )
