{:repl
 {:plugins [[cider/cider-nrepl "0.22.3"]
            [com.billpiel/sayid "0.0.17"]
            ;; [refactor-nrepl "2.5.0-SNAPSHOT"]
            ]
  :dependencies [[nrepl "0.6.0"]]
  ;; :repl-options
  ;; {:nrepl-middleware [cider.nrepl/cider-middleware
  ;;                     refactor-nrepl.middleware/wrap-refactor ;; clj-refactor
  ;;             ;;        com.billpiel.sayid.nrepl-middleware/wrap-sayid ;; sayid
  ;;                     ]}
  }
 :user
 {;;:dependencies [[com.bhauman/rebel-readline "0.1.4" :exclusions [com.google.protobuf/protobuf-java]]]
 {:plugins  [#_[refactor-nrepl "2.5.0-SNAPSHOT"]
             [cider/cider-nrepl "0.22.3"]
             [nrepl/lein-nrepl "0.3.2"]
             ;;[com.billpiel/sayid "0.0.17"]
             [lein-kibit "0.1.6"]
             [lein-cljfmt "0.6.4"]
             [lein-ancient "0.6.15"]]}}
