/* SYNTAX TEST "Packages/Objective-C/Objective-C++.sublime-syntax" */
#ifndef IGUARD_
 /* <- keyword.control.import */
#define IGUARD_
 /* <- keyword.control.import.define */
struct foo* alloc_foo();
/* <- storage.type */
       /* <- - entity.name.type */
            /* <- entity.name.function */
#endif
 /* <- keyword.control.import */


#define MACRO_WITH_CURLY_BRACE {
/* <- keyword.control.import.define */
/*      ^ entity.name.constant */

#define MACRO_WITH_CURLY_BRACE_2 }
/* <- keyword.control.import.define */
/*      ^ entity.name.constant */


#pragma foo(bar, \
"baz", \
1)
/* <- meta.preprocessor */

#if 0
#ifdef moo
/* <- - keyword.control */
#endif
/* <- - keyword.control */
#endif

/////////////////////////////////////////////
// Strings
/////////////////////////////////////////////

char str1[] = "abc";
/*            ^ punctuation.definition.string.begin */
/*             ^ string.quoted.double */
/*                ^ punctuation.definition.string.end */

char str2[] = u8"abc";
/*            ^ storage.type.string */
/*              ^ punctuation.definition.string.begin */
/*               ^ string.quoted.double */

char16_t str3[] = u"abc";
/*                ^ storage.type.string */
/*                 ^ punctuation.definition.string.begin */
/*                  ^ string.quoted.double */

char32_t str4[] = U"abc";
/*                ^ storage.type.string */
/*                 ^ punctuation.definition.string.begin */
/*                  ^ string.quoted.double */

wchar_t str5[] = L"abc";
/*               ^ storage.type.string */
/*                ^ punctuation.definition.string.begin */
/*                 ^ string.quoted.double */

char str6[] = "\a|\b|\e|\f|\n|\r|\t|\v|\'|\"|\?";
/*             ^^ constant.character.escape */
/*                ^^ constant.character.escape */
/*                   ^^ constant.character.escape */
/*                      ^^ constant.character.escape */
/*                         ^^ constant.character.escape */
/*                            ^^ constant.character.escape */
/*                               ^^ constant.character.escape */
/*                                  ^^ constant.character.escape */
/*                                     ^^ constant.character.escape */
/*                                        ^^ constant.character.escape */
/*                                           ^^ constant.character.escape */

char str7[] = "\0|\012";
/*             ^^ constant.character.escape */
/*                ^^^^ constant.character.escape */

char str8[] = "\x0a|\x41|\xA|\x000065";
/*             ^^^^ constant.character.escape */
/*                  ^^^^ constant.character.escape */
/*                       ^^^ constant.character.escape */
/*                           ^^^^^^^^ constant.character.escape */

char16_t str9[] = u"\u0063";
/*                  ^^^^^^ constant.character.escape */

char32_t str10[] = U"\U00000063";
/*                   ^^^^^^^^^^ constant.character.escape */

char str11[] = "\q";
/*              ^^ invalid.illegal.unknown-escape */

char rawStr1[] = R"("This is a raw string")";
/*               ^ storage.type.string */
/*                ^ punctuation.definition.string.begin */
/*                  ^ string.quoted.double */
/*                                        ^ punctuation.definition.string.end */

char rawStr2[] = R"A*!34( )" )A*!34";
/*               ^ storage.type.string */
/*                ^ punctuation.definition.string.begin */
/*                      ^ punctuation.definition.string.begin */
/*                        ^ string.quoted.double */
/*                           ^ punctuation.definition.string.end */
/*                                 ^ punctuation.definition.string.end */


/////////////////////////////////////////////
// Storage Types
/////////////////////////////////////////////

void* ptr;
/* <- storage.type */

bool b;
/* <- storage.type */

char ch;
/* <- storage.type */

char16_t ch16;
/* <- storage.type */

char32_t ch32;
/* <- storage.type */

wchar_t wch;
/* <- storage.type */

unsigned int ui;
/* <- storage.type */
/*       ^ storage.type */

signed long l;
/* <- storage.type */
/*     ^ storage.type */

short s;
/* <- storage.type */

auto a = 2;
/* <- storage.type */

decltype(s) dt;
/* <- storage.type */
/*      ^ punctuation.definition.parameters */
/*        ^ punctuation.definition.parameters */

float f;
/* <- storage.type */

double d;
/* <- storage.type */

typedef int my_int;
/* <- storage.type */
/*          ^ entity.name.type */

typedef struct Books {
/*      ^ storage.type */
/*             ^ - entity.name.type */
   char title[50];
   int book_id;
} Book;
/*^ entity.name.type */

typedef struct Books Book;
/*             ^ - entity.name.type.struct */
/*                   ^ entity.name.type.typedef */

template class MyStack<int, 6>;
/* <- storage.type.template */
/*                    ^ punctuation.definition.generic */
/*                     ^ storage.type */
/*                          ^ constant.numeric */
/*                           ^ punctuation.definition.generic */

template<class typeId, int N> class tupleTmpl;
/* <- storage.type.template */
/*^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.template */
/*      ^ punctuation.definition.generic.begin */
/*       ^ storage.type */
/*                      ^ storage.type */
/*                          ^ punctuation.definition.generic.end */

template<typename First, typename... Rest> class tupleVariadic;
/* <- storage.type.template */
/*      ^ punctuation.definition.generic.begin */
/*       ^ storage.type */
/*                     ^ punctuation.separator */
/*                               ^^^ punctuation.definition.variadic */
/*                                       ^ punctuation.definition.generic.end */

template<typename Foo> inline struct Foo* baz()
/*                     ^^^^^^ storage.modifier */
/*                                   ^ - entity.name */
/*                                        ^^^ meta.function entity.name.function */
{}

typedef std::vector<std::vector<int> > Table;
/*                 ^ punctuation.definition.generic.begin */
/*                             ^ punctuation.definition.generic.begin */
/*                                 ^ punctuation.definition.generic.end */
/*                                   ^ punctuation.definition.generic.end */

/////////////////////////////////////////////
// Storage Modifiers
/////////////////////////////////////////////

alignas(16) char array[256];
/* <- storage.modifier */
/*     ^ punctuation.definition.parameters */
/*        ^ punctuation.definition.parameters */

const int XYZ = 2;
/* <- storage.modifier */

constexpr int ABC = 3 + 5;
/* <- storage.modifier */

thread_local int x;
/* <- storage.modifier */


/////////////////////////////////////////////
// Control Keywords
/////////////////////////////////////////////

static_assert(x >= 0);
/* <- keyword.operator */

noexcept(f());
/* <- keyword.operator */

if (x < 5)
/* <- keyword.control */
{}
else
/* <- keyword.control */
{}

switch (x)
/* <- keyword.control */
{
case 1:
/* <- keyword.control */
    break;
    /* <- keyword.control */
default:
/* <- keyword.control */
    break;
    /* <- keyword.control */
}

do
/* <- keyword.control */
{
    if (y == 3)
        continue;
        /* <- keyword.control */
} while (y < x);
/*^ keyword.control */

switch (a) {
    case 1: break;
/*        ^ punctuation.separator */
    case 100 - 10: break;
/*               ^ punctuation.separator */
    default: break;
/*         ^ punctuation.separator */
}

goto label;
/* <- keyword.control */

try
/* <- keyword.control */
{
    throw std::string("xyz");
    /* <- keyword.control */
}
catch (...)
/* <- keyword.control */
{
}

int* ptr = new int(2);
/*         ^ keyword.control */

delete ptr;
/* <- keyword.control */

return 123;
/* <- keyword.control */


/////////////////////////////////////////////
// Operator Keywords
/////////////////////////////////////////////

int x = alignof(char);
/*      ^ keyword.operator.word */
/*             ^ punctuation.definition.parameters */
/*                  ^ punctuation.definition.parameters */

int x = sizeof(char);
/*      ^ keyword.operator.word */
/*            ^ punctuation.definition.parameters */
/*                 ^ punctuation.definition.parameters */


/////////////////////////////////////////////
// Cast Keywords
/////////////////////////////////////////////

const_cast<int>(2.0);
/* <- keyword.operator.word.cast */
/*        ^ punctuation.definition.generic.begin */
/*         ^ storage.type */
/*            ^ punctuation.definition.generic.end */

dynamic_cast<int>(2.0);
/* <- keyword.operator.word.cast */

reinterpret_cast<int>(2.0);
/* <- keyword.operator.word.cast */

static_cast<int>(2.0);
/* <- keyword.operator.word.cast */


/////////////////////////////////////////////
// Language Constants
/////////////////////////////////////////////

bool t = true;
/*       ^ constant.language */

bool f = false;
/*       ^ constant.language */

int* p = nullptr;
/*       ^ constant.language */

char ch[] = __func__;
/*          ^ constant.language */


/////////////////////////////////////////////
// Support Constants
/////////////////////////////////////////////

std::cout << __FILE__ << '\n';
/*           ^ support.constant */
/* ^^ punctuation.accessor */

std::cout << __FUNCTION__ << '\n';
/*           ^ support.constant */

std::cout << __LINE__ << '\n';
/*           ^ support.constant */


/////////////////////////////////////////////
// Numeric Constants
/////////////////////////////////////////////

dec1 = 1234567890;
/*     ^ constant.numeric */
/*              ^ constant.numeric */

dec2 = 1'924'013;
/*     ^ constant.numeric */
/*             ^ constant.numeric */

dec3 = 124ul;
/*     ^ constant.numeric */
/*         ^ constant.numeric */

dec4 = 9'204lu;
/*     ^ constant.numeric */
/*           ^ constant.numeric */

dec5 = 2'354'202'076LL;
/*     ^ constant.numeric */
/*                   ^ constant.numeric */

int oct1 = 01234567;
/*         ^ constant.numeric */
/*                ^ constant.numeric */

int oct2 = 014'70;
/*         ^ constant.numeric */
/*              ^ constant.numeric */

int hex1 = 0x1234567890ABCDEF;
/*         ^ constant.numeric */
/*                          ^ constant.numeric */

int hex2 = 0X1234567890ABCDEF;
/*         ^ constant.numeric */
/*                          ^ constant.numeric */

int hex3 = 0x1234567890abcdef;
/*         ^ constant.numeric */
/*                          ^ constant.numeric */

int hex4 = 0xA7'45'8C'38;
/*         ^ constant.numeric */
/*                     ^ constant.numeric */

int bin1 = 0b010110;
/*         ^ constant.numeric */
/*                ^ constant.numeric */

int bin2 = 0B010010;
/*         ^ constant.numeric */
/*                ^ constant.numeric */

int bin3 = 0b1001'1101'0010'1100;
/*         ^ constant.numeric */
/*                             ^ constant.numeric */

units1 = 134h;
/*       ^ constant.numeric */
/*          ^ constant.numeric */

units2 = 147min;
/*       ^ constant.numeric */
/*            ^ constant.numeric */

units3 = 357s;
/*       ^ constant.numeric */
/*          ^ constant.numeric */

units4 = 234_custom;
/*       ^ constant.numeric */
/*                ^ constant.numeric */

fixed1 = 123.456;
/*       ^ constant.numeric */
/*             ^ constant.numeric */

fixed2 = 12.;
/*       ^ constant.numeric */
/*         ^ constant.numeric */

fixed3 = .35;
/*       ^ constant.numeric */
/*         ^ constant.numeric */

fixed4 = 1'843'290.245'123;
/*       ^ constant.numeric */
/*                       ^ constant.numeric */

fixed5 = 0.3f;
/*       ^ constant.numeric */
/*          ^ constant.numeric */

fixed6 = 0.82L;
/*       ^ constant.numeric */
/*           ^ constant.numeric */

float sci1 = 1.23e10;
/*           ^ constant.numeric */
/*                 ^ constant.numeric */

float sci2 = 13e5;
/*           ^ constant.numeric */
/*              ^ constant.numeric */

float sci3 = 14.23e+14;
/*           ^ constant.numeric */
/*                   ^ constant.numeric */

float sci4 = 14e+14;
/*           ^ constant.numeric */
/*                ^ constant.numeric */

float sci5 = 18.84e-12;
/*           ^ constant.numeric */
/*                   ^ constant.numeric */

float sci6 = 46e-14;
/*           ^ constant.numeric */
/*                ^ constant.numeric */

float sci7 = 2'837e1'000;
/*           ^ constant.numeric */
/*                     ^ constant.numeric */

float sci8 = 23e-1'000;
/*           ^ constant.numeric */
/*                   ^ constant.numeric */

double sci_hex = 0xc1.01AbFp-1;
/*               ^^^^^^^^^^^^^ constant.numeric */

/////////////////////////////////////////////
// Functions
/////////////////////////////////////////////

// function prototype
void abcdWXYZ1234();
/*   ^ entity.name.function */

// function definition
void abcdWXYZ1234()
/*   ^ entity.name.function */
{
}

long func
/*   ^ entity.name.function */
(int x, void *MYMACRO(y) ) {
/*            ^ -entity.name.function */
/*                       ^ -meta.parens */
    // Ensure < and > aren't parsed as a generic
    if (foo < bar && baz > bar ) {
/*          ^ keyword.operator.comparison */
/*                       ^ keyword.operator.comparison */

    label:
/*  ^ entity.name.label */
/*       ^ punctuation.separator */
        do {
            break;
        } while(true);

    }
}

MACRO1 void * MACRO2 myfuncname () {
/*     ^ storage.type */
/*          ^ keyword.operator */
/*                   ^ entity.name.function */

}

static const uint32_t * const MACRO funcname();
/* ^ storage.modifier */
/*     ^ storage.modifier */
/*           ^ support.type */
/*                    ^ keyword.operator */
/*                      ^ storage.modifier */
/*                                  ^ entity.name.function */

void FooBar::baz(int a)
/*   ^^^^^^^^^^^ entity.name.function */
{

}

FooBar::FooBar(int a)
/*^^^^^^^^^^^^ entity.name.function */
/*            ^ punctuation.definition.parameters */
/*             ^^^ storage.type */
/*                  ^ punctuation.definition.parameters */
{
}

FooBar::~FooBar
/*^^^^^^^^^^^^^ entity.name.function */
() { }

bool FooBar::operator==() {}
/*   ^^^^^^^^^^^^^^^^^^ entity.name.function */

myns::FooBar::~FooBar() { }
/*^^^^^^^^^^^^^^^^^^^ entity.name.function */

    extern "C" void test_in_extern_c_block()
/*                  ^ entity.name.function */
{
}

#ifdef __cplusplus
extern "C" {
#endif

void test_in_extern_c_block()
/*   ^ entity.name.function */
{
}

#ifdef __cplusplus
}
#endif

gener<int> func_returning_generic(int a);
/*         ^ entity.name.function */

std::vector<std::uint8_t> func_returning_path_generic(int a);
/*         ^ punctuation.definition.generic */
/*                        ^ entity.name.function */

/////////////////////////////////////////////
// Namespace
/////////////////////////////////////////////

namespace myNameSpace {}
/* <- keyword.control */

namespace new_name = current_name;
/* <- keyword.control */

using namespace NAME __attribute__((visibility ("hidden")));
/* <- keyword.control */
/*    ^ keyword.control */
/*                   ^ storage.modifier */
/*                                               ^ string */

using namespace myNameSpace;
/* <- keyword.control */
/*    ^ keyword.control */

namespace abc /* Neither this comment... */
/*            ^ comment.block */
// ...nor this comment is highlighted
/* <- comment.line */
{}

/////////////////////////////////////////////
// Classes, structs, unions and enums
/////////////////////////////////////////////

class BaseClass;
/*^^^^^^^^^^^^^ meta.class */
/*    ^^^^^^^^^ entity.name.class.forward-decl */

class BaseClass // comment
/* <- storage.type */
/*    ^ entity.name.class */
{
public :
/* <- storage.modifier */
    tupleTmpl<int,2> max(tupleGen<int,2> a, tupleGen<int,2> b);
/*           ^ punctuation.definition.generic.begin */
/*            ^ storage.type */
/*                 ^ punctuation.definition.generic.end */
/*                               ^ punctuation.definition.generic.begin */
/*                                ^ storage.type */
/*                                     ^ punctuation.definition.generic.end */
protected:
/* <- storage.modifier */
private:
/* <- storage.modifier */

    static int x;
    /* <- storage.modifier */

    virtual void doSomething() const = 0;
    /* <- storage.modifier */
    /*           ^ entity.name.function */
    /*                         ^ storage.modifier */
    /*                                 ^ constant.numeric */

    template<typename A>
    void func(){}
/*       ^^^^ entity.name.function */

    template<typename A>
    BaseClass(){}
/*  ^^^^^^^^^ entity.name.function */

    ~BaseClass() {}
/*  ^^^^^^^^^^ entity.name.function */

    BaseClass operator [] ()
/*            ^^^^^^^^^^^ entity.name.function */
    {}

    BaseClass operator=
/*            ^^^^^^^^^ entity.name.function */
    () {}
};

class DerivedClass : public ::BaseClass // Comment
/*                          ^ entity.other.inherited-class */
/*                                      ^ comment.line */
{
    ~DerivedClass() override;
    /* <- meta.method */
    /*              ^ storage.modifier */
    virtual void doSomething() const override final;
    /*                         ^ storage.modifier */
    /*                               ^ storage.modifier */
    /*                                        ^ storage.modifier */
 protected:
/*^^^^^^^^ storage.modifier */
  DerivedClass() override
/*                ^ storage.modifier */
      : a(a),
/*     ^ meta.class.constructor.initializer-list */
        base_id_(BaseClass::None().ToInt()),
/*      ^ variable.other.readwrite.member */
/*                        ^ punctuation.accessor */
/*               ^^^^^^^^^^^^^^^^^ meta.function-call */
/*                          ^^^^ variable.function */
/*                                ^^^^^^ meta.method-call */
/*                                 ^^^^^ variable.function */
        bounds_(NULL),
        bit_field_(0) {
            char * a = "sprintf";
            char * b = sprintf("Testing %s", a);
/*                     ^^^^^^^^^ meta.function-call */
/*                     ^^^^^^^ support.function.C99 */

            base_id_->foobar(1, "foo");
/*                  ^^^^^^^^^^ meta.method-call */
/*                    ^^^^^^ variable.function */

            base_id_->~BaseClass();
/*                  ^^^^^^^^^^^^^^ meta.method-call */
/*                    ^^^^^^^^^^ variable.function */
        }

/* <- - meta.class.constructor.initializer-list */

    typedef std::vector<int> qux;
/*                           ^^^ entity.name.type.typedef */
};


template<typename A>
class class1<A> : class2<A>
/*    ^^^^^^ entity.name.class */
/*          ^ punctuation.definition.generic */
/*            ^ punctuation.definition.generic */
/*                ^^^^^^ entity.other.inherited-class */
/*                      ^ punctuation.definition.generic */
/*                        ^ punctuation.definition.generic */
{}

class FooBar {
/*           ^ meta.class meta.block punctuation.definition.block */
    explicit FooBar(int a);
/*           ^^^^^^^^^^^^^ meta.method */
/*  ^^^^^^^^ storage.modifier */
/*           ^^^^^^ entity.name.function */
    FooBar() =default;
/*  ^^^^^^ entity.name.function */
/*           ^ keyword.operator.assignment */
/*            ^^^^^^^ storage.modifier */

    // If a constructor name is on a line without the opening (, it is not
    // highlighted as a method/constructor. This prevents a bunch of false
    // positives, including data types as they are being typed into a struct.
    FooBar
/*  ^ - entity.name.function */
    ();

    virtual ~FooBar();
/*          ^^^^^^^ entity.name.function */

#ifndef DEBUG
    ~FooBar();
/*  ^^^^^^^ entity.name.function */
#endif

    void insert () {}
/*       ^^^^^^ entity.name.function */

    explicit operator bool
/*                    ^^^^ entity.name.function */
    () {}

    FooBar::~FooBar();
/*  ^^^^^^^^^^^^^^^ entity.name.function */

    auto f(int a) -> decltype(a.begin()) override final;
/*                ^^ punctuation.separator */
/*                             ^ punctuation.accessor */
/*                              ^^^^^ variable.function */
/*                                       ^ storage.modifier */
/*                                                ^ storage.modifier */

    auto g() -> std::vector<int> override final {
/*           ^^ punctuation.separator */
/*                 ^^ punctuation.accessor */
/*                          ^ storage.type */
/*                               ^ storage.modifier */
/*                                        ^ storage.modifier */
        this->g(1);
/*      ^ variable.language */
    }

private:
/*^^^^^ storage.modifier */
    enum
/*  ^^^^ meta.enum storage.type */
    {
/*  ^ meta.enum punctuation.definition.block */
        A = 1,
        B = 20 / 5
    }
/*  ^ meta.enum punctuation.definition.block */
/*   ^ - meta.enum punctuation.definition.block */

    #if 0
    /*  ^ constant.numeric */
    int disabled_func() {
    /*  ^ comment.block */
    }
    #endif

    #if 1
    /*  ^ constant.numeric */
    int enabled_func() {}
    /*  ^ entity.name.function */
    #else
    int disabled_func() {
    /*  ^ comment.block */
    }
    #endif
}
/* <- meta.class meta.block punctuation.definition.block */
 /* <- - meta.class meta.block punctuation.definition.block */

struct bar {
/*^^^^^^^^^^ meta.struct */
/*^^^^ storage.type */
/*     ^^^ entity.name.struct */
/*         ^ meta.block punctuation.definition.block */
    bar()
/*  ^^^^^ meta.method */
/*  ^^^ entity.name.function */
    {}
}
/* <- meta.struct meta.block punctuation.definition.block */
 /* <- - meta.struct meta.block punctuation.definition.block */

enum baz {
/*^^^^^^^^ meta.enum */
/* <- meta.enum storage.type */
/*   ^^^ entity.name.enum */
/*       ^ meta.block punctuation.definition.block */
    FOO = 1,
/*      ^ keyword.operator.assignment */
/*        ^ constant.numeric */
    BAR = 2,
    BAZ = 3
}
/* <- meta.enum meta.block punctuation.definition.block */
 /* <- - meta.enum meta.block punctuation.definition.block */

enum class qux : std::uint8_t
/*^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.enum */
/*^^^^^^^^ storage.type */
/*         ^^^ entity.name.enum */
/*             ^ punctuation.separator */
/*               ^^^^^^^^^^^^ entity.other.inherited-class */
{
/* <- meta.block punctuation.definition.block */
    FOO = 1,
    BAR = 2,
/*      ^ keyword.operator.assignment */
/*        ^ constant.numeric */
    BAZ = 3
}
/* <- meta.enum meta.block punctuation.definition.block */
 /* <- - meta.enum meta.block punctuation.definition.block */

union foobaz {
/* <- meta.union storage.type */
/*    ^^^^^^ entity.name.union */
/*           ^ meta.block punctuation.definition.block */
}
/* <- meta.union meta.block punctuation.definition.block */
 /* <- - meta.union meta.block punctuation.definition.block */

// Class using macro to handle __declspec() on Windows
class SK_API SkBitmap {}
/*           ^ entity.name.class */
class __declspec(property(get=foo)) SkBitmap {}
/*               ^ storage.modifier */
/*                        ^ variable.parameter */
/*                                  ^ entity.name.class */
class __declspec(align(8)) SkBitmap {}
/*               ^ storage.modifier */
/*                     ^ constant.numeric */
/*                         ^ entity.name.class */
class __declspec(dllimport) SkBitmap {}
/*               ^ constant.other */
/*                          ^ entity.name.class */

/////////////////////////////////////////////
// Test preprocessor branching and C blocks
/////////////////////////////////////////////

int foo(int val)
{
    myClass *result;
    result->kk = func(val);
/*        ^^ punctuation.accessor */
    if (result == 0) {
        return 0;
#if CROSS_SCOPE_MACRO
 /* <- keyword.control.import */
    } else if (result > 0) {
        return 1;
#endif
 /* <- keyword.control.import */
    }
/*  ^ meta.block meta.block punctuation.definition.block */
/*   ^ - meta.block meta.block */

#ifndef DEBUG
    if (check_debug()) {
        val /= 2;
#endif
        val += 1;
#ifndef DEBUG
    }
/*  ^ meta.function meta.block meta.block punctuation.definition.block */
/*   ^ - meta.block meta.block */
#endif

#ifdef FOO
 /* <- keyword.control.import */
    int foobar
/*      ^^^^^^ - entity.name.function */
    ;

    if (val == -1) {
/*                 ^ meta.block meta.block punctuation.definition.block */
#else
 /* <- keyword.control.import */
    if (val == -2) {
/*                 ^ meta.block meta.block punctuation.definition.block */
#endif
 /* <- keyword.control.import */
        val += 1;
    }
/*  ^ meta.block punctuation.definition.block */
/*   ^ - meta.block meta.block */

    return -1;
}
/* <- meta.function punctuation.definition.block */
 /* <- - meta.function */

#if 0
/*  ^ constant.numeric */
int disabled_func() {
/*  ^ comment.block */
}
#endif

#if 1
/*  ^ constant.numeric */
int enabled_func() {}
/*  ^ entity.name.function */
#else
int disabled_func() {
/*  ^ comment.block */
}
#endif

/////////////////////////////////////////////
// Matching various function definitions
/////////////////////////////////////////////

const int foo = 1;
/*        ^ - entity.name.function */
int a;
/*  ^ - entity.name.function */

int /* comment */ * myfunc
/* <- storage.type */
/*  ^ comment.block */
/*                ^ keyword.operator */
/*                  ^^^^^^ entity.name.function */
(int * a)
/* <- punctuation.definition.parameters */
/*   ^ keyword.operator */
/*      ^ punctuation.definition.parameters */
{

}

MACRO1 void * MACRO2 myfuncname () {
/*     ^ storage.type */
/*          ^ keyword.operator */
/*                   ^ entity.name.function */

    label:
/*  ^ entity.name.label */
/*       ^ punctuation.separator */
        do {
            break;
        } while(true);

    switch (a) {
        case 1: break;
/*            ^ punctuation.separator */
        case 100 - 10: break;
/*                   ^ punctuation.separator */
        default: break;
/*             ^ punctuation.separator */
    }

}

static const uint32_t * const MACRO funcname();
/* ^ storage.modifier */
/*     ^ storage.modifier */
/*           ^ support.type */
/*                    ^ keyword.operator */
/*                      ^ storage.modifier */
/*                                  ^ entity.name.function */

MACRO int
/*    ^ storage.type */
funcname2
/* ^ entity.name.function */
()
{

}

MACRO_CALL(int) macro_prefixed_func(){}
/* ^ meta.function-call */
/*        ^ punctuation.definition.parameters */
/*            ^ punctuation.definition.parameters */
/*              ^ entity.name.function */

int* return_type_pointer_no_space(){}
/*   ^ entity.name.function */

int& return_type_ref_no_space(){}
/*   ^ entity.name.function */

// Make sure there isn't an incorrect match here since this is not a valid
// function definition
int32
/* <- - entity.name.function */
() {}

func_call(foo
/* <- meta.function-call */
);

/////////////////////////////////////////////
// Paths/identifiers
/////////////////////////////////////////////

if (::std::foo()) {}
/*  ^^^^^^^^^^ variable.function */
/*  ^^ punctuation.accessor */
/*       ^^ punctuation.accessor */

void sayHi()
{
    std::cout << "Hi!\n";
/*     ^ punctuation.accessor */
}

/////////////////////////////////////////////
// Objective-C Interface
/////////////////////////////////////////////

@interface Person : NSObject
/* <- storage.type punctuation.definition.storage.type */
/*^ storage.type */
@property (readonly) NSString *firstName;
/* <- keyword.other punctuation.definition.keyword */
/*^ keyword.other */
@property (readonly) NSString *lastName;
@end
/* <- storage.type punctuation.definition.storage.type */
/*^ storage.type */

NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K like %@",
/*^ support.class */
/*          ^ keyword.operator */
/*                       ^ meta.bracketed punctuation.section.scope.begin */
/*                                    ^ support.function.any-method */
/*                                                        ^^ string.quoted.double punctuation.definition.string.begin */
        attributeName, attributeValue];
/*                                   ^ meta.bracketed punctuation.section.scope.end */

@implementation Person
- (void)debugOutput:(NSString *)format, ... NS_FORMAT_FUNCTION(1,2)
/*                                    ^ punctuation.separator */
/*                                      ^^^ punctuation.definition.variadic */
/*                                          ^ variable.function */
{}
@end
