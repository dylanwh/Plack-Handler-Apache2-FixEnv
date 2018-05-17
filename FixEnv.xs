#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "ppport.h"

#ifndef ENVHV
#   define ENVHV GvHV(PL_envgv)
#endif

MODULE = Plack::Handler::Apache2::FixEnv        PACKAGE = Plack::Handler::Apache2::FixEnv

U32
untie_env()
CODE:
    HV *env = ENVHV;
    RETVAL = SvMAGICAL((SV*)env);
    SvMAGICAL_off((SV*)env);
OUTPUT:
    RETVAL


void
tie_env(mg_flags)
U32 mg_flags
CODE:
    HV *env = ENVHV;
    SvFLAGS((SV*)env) |= mg_flags;
