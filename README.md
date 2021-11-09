compare.sh: da lanciare per avere un'idea delle differenze, inaffidabile ovunque compaia il nome del database nella definizione dell'oggetto (foreign key, viste)

export.sh [database-name] [table-name]

import.sh -d [database-name] -f [path-to-dump-file]

create_objects.sh [object-1] [object-2] ...
    mostra l'SQL di creazione per tabelle e viste