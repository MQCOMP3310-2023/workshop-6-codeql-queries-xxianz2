/**
 * @name Comp3310 workshop 6 query
 * @kind problem
 * @problem.severity warning
 * @id java/example/empty-block
 */

import java

from LoopStmt loop, MethodAccess call, Method method
where
    loop.getAChild*() = call.getEnclosingStmt() and
    call.getMethod() = method and 
    method.hasName("println") and
    method.getDeclaringType().hasQualifiedName("java.io", "PrintStream") and
    not exists(MethodAccess nextlineCall, Method nextlineMethod | 
    loop.getAChild*() = nextlineCall.getEnclosingStmt() and
    nextlineCall.getMethod() = nextlineMethod and
    nextlineMethod.hasName("nextLine") and 
    nextlineMethod.getDeclaringType().hasQualifiedName("java.util", "Scanner"))
select call, "Call to println inside of a loop but not contain nextLine"
