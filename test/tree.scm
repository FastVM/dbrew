
(define (item-check tree)
    (let ((n1 (car tree))
        (n2 (cdr tree)))
        (if (pair? n2)
            (+ n1 (- (item-check (car n2)) (item-check (cdr n2))))
            n1)))

(define (new-tree item depth)
    (if (= depth 0)
        (cons item 0)
        (let ((i (+ item item)))
            (let ((left (new-tree (- i 1) (- depth 1)))
                (right (new-tree i (- depth 1))))
                (cons item (cons left right))))))

(define (loop-times check iters maxiter depth)
    (if (> maxiter iters)
        (let ((tree1 (new-tree 1 depth)) (tree2 (new-tree (- 0 1) depth)))
            (loop-times
                (+ (item-check tree1) (item-check tree2) check)
                (+ iters 1)
                maxiter
                depth))
        check))

(define (loop-depth mindepth depth maxdepth)
    (if (> (+ maxdepth 1) depth)
        (begin
            (display (loop-times 0 0 (expt 2 (+ mindepth (- maxdepth depth))) depth))
            (display #\newline) 
            (loop-depth mindepth (+ depth 2) maxdepth))
        0))

(define (main max)
    (let ((tree (new-tree 0 (+ max 1))))
        (display (item-check tree))
        (display #\newline)
        (let ((old-tree (new-tree 0 max)))
            (loop-depth 4 4 max)
            (display (item-check old-tree))
            (display #\newline))))

(main 16)
