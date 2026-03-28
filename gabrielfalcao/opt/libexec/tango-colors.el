(with-c-message-open
 (erase-c-messages)
 (c-message "%s"
            (string-join
             (mapcar (lambda (subexp)
                       (format "\\x3c%d\\x3e\\%d\\x3c\\x2f%d\\x3e" subexp subexp subexp)
                       )
                     (number-sequence 0 9))
             "\\n"
             )
            )
 )
