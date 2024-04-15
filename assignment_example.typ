#import "template.typ": *
#let title = "标题名"
#let author = "作者名"
#let course_id = "课程名"
#let instructor = "教师名"
#let semester = "学期"
#let due_time = "DDL"
#let id = "123456789"

#show: assignment_class.with(title, author, course_id, instructor, semester, due_time, id)

#set enum(numbering: "1.") // 设置编号格式，可以改成 a.
// ----------------正文----------------

= 一级标题

默认字体：IBM Plex Serif, 思源宋体

代码块字体：`SF Mono`

== 二级标题

这个模板可以用来当作作业的模板，也可以用来写笔记。

加入了中文的段前缩进，以及代码块的字体设置。

=== 三级标题

可以使用 `#p[]`、`#prob[][]`、`#pt[][]` 来创建问题框。

= 示例

#prob[这是一个问题的内容。][

使用 `#prob[问题内容][回答内容]` 命令来创建一个带*编号*的问题区域。

]

#pt[如果需要问题框][

使用 `#pt[][]` 命令来创建一个不带编号、可自定义文本的问题框。

比如，本框使用的命令是 `#pt[如果需要问题框][...]`。
]



而如果你想只想要一个问题框：

#p[

使用 `#p` 命令来创建一个空白的问题框。

]

#prob[当然][
  #pt[也可以通过嵌套的形式][
    套娃。
    #p[
      套娃。
      #p[
        套娃。
        #p[
          套娃。
          #p[
            套娃。
            #p[
              套娃。
            ]
          ]
        ]
      ]
    ]
  ]
]

// #问题[
// 1. because
// $ 
// diff f(bold(x)) =  {bold(v) in RR^n : f(bold(y))>= f(bold(x))+ bold(v)^T (bold(y)-bold(x)),forall bold(y) in RR^n}
// $
// if $g(bold(x)) = theta f(bold(x))$, 
// $ 
// diff g(bold(x)) =  {bold(v) in RR^n : g(bold(y))>= g(bold(x))+ bold(v)^T (bold(y)-bold(x)),forall bold(y) in RR^n} $
// $ diff g(bold(x))={bold(v) in RR^n : theta f(bold(y))>= theta f(bold(x))+ bold(v)^T (bold(y)-bold(x)),forall bold(y) in RR^n}
// $
// $ diff g(bold(x))={bold(v) in RR^n : f(bold(y))>= f(bold(x))+ bold(v)^T/theta (bold(y)-bold(x)),forall bold(y) in RR^n}
// $
// $ diff g(bold(x))=theta {bold(v) in RR^n : f(bold(y))>= f(bold(x))+ bold(v)^T (bold(y)-bold(x)),forall bold(y) in RR^n} = theta diff f(bold(x))
// $

// 2. 
// $ 
// diff h(bold(x)) =  {bold(v) in RR^n : f(bold(y))+g(bold(y))>= f(bold(x))+g(bold(x))+ bold(v)^T (bold(y)-bold(x)),forall bold(y) in RR^n} $
// all of the elements that satisfy $ f(bold(y))>= f(bold(x))+ bold(v)^T (bold(y)-bold(x)),forall bold(y) in RR^n $ and $ g(bold(y))>= g(bold(x))+ bold(v)^T (bold(y)-bold(x)),forall bold(y) in RR^n $  are in the set $ diff h(bold(x)) $ hence $ diff f(bold(x)) + diff g(bold(x)) subset.eq diff h(bold(x)) $ 

// 3. we know that $ diff norm(x)_1 =  cases(1 "when " x>0, [-1,1] "when" x=0, -1 "when" x<0)  $. 
// hence $op("sgn")(x) in diff norm(x)_1$.
// ]

// #问题[

// 2. Not differentiable at $bold(x)=bold(0)$, and $h$ is convex.

// 3. $ nabla [1/2 norm(bold(x)-bold(y))_2^2 + gamma lambda norm(x)_1 ] =  cases(x-y + gamma lambda "when " x>0, [x-y - gamma lambda,x-y +gamma lambda] "when" x=0, x-y - gamma lambda "when" x<0)  $. 
// let it be $0$,  we have
// $ prox_(gamma g(y)) = x^* = cases(y-gamma lambda "when " y>lambda ,
// [y-gamma lambda,y+gamma lambda] "when" y in [-gamma lambda,gamma lambda],
//  y + gamma lambda "when" y < -gamma lambda) . $

// ```matlab 
// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// %% load the variables of the optimization problem
// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

// load('dataset.mat');

// [p, n] = size(A);

// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// %% set up the function and its gradient
// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

// evaluate_f = @(x) (1/n)*sum(log(1+exp(-b.*(A'*x))));
// evaluate_gradf = @(x) (1/n)*A*(-b.*exp(-b.*(A'*x))./(1+exp(-b.*(A'*x))));

// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// %% parameters of the gradient method
// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

// xInit = zeros(p, 1); % zero initialization
// stepSize = 1; % step-size of the gradient method
// maxIter = 1000; % maximum number of iterations

// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// %% optimize
// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

// % initialize
// x = xInit;

// % keep track of cost function values
// objVals = zeros(maxIter, 1);

// % iterate
// for iter = 1:maxIter
    
//     % update
//     xNext = x - stepSize*evaluate_gradf(x);
    
//     % evaluate the objective
//     funcNext = evaluate_f(xNext);
    
//     % store the objective and the classification error
//     objVals(iter) = funcNext;
    
//     fprintf('[%d/%d] [step: %.1e] [objective: %.1e]\n',...
//         iter, maxIter, stepSize, objVals(iter));
    
//     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
//     % begin visualize data
//     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
//     % plot the evolution
//     figure(1);
//     set(gcf, 'Color', 'w');
//     semilogy(1:iter, objVals(1:iter), 'b-',...
//         iter, objVals(iter), 'b*', 'LineWidth', 2);
//     grid on;
//     axis tight;
//     xlabel('iteration');
//     ylabel('objective');
//     title(sprintf('GM (f = %.2e)', objVals(iter)));
//     xlim([1 maxIter]);
//     set(gca, 'FontSize', 16);
//     drawnow;
    
//     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
//     % end visualize data
//     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
//     % update w
//     x = xNext;
// end
// ```
// ]