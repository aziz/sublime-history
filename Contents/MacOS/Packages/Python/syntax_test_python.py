# SYNTAX TEST "Packages/Python/Python.sublime-syntax"

def my_func(param1, # Multi-line function definition
#                   ^ comment.line.number-sign
    # This is defaulted
#   ^ comment.line.number-sign
    param2='#1'):
#              ^ punctuation.definition.parameters.end
    print('Hi!')


class MyClass():

    def my_func(self, param1, # Multi-line function definition
#                             ^ comment.line.number-sign
        # This is defaulted
#       ^ comment.line.number-sign
        param2='#1'):
#                  ^ punctuation.definition.parameters.end
        print('Hi!')


conn.execute("SELECT * FROM foobar")
#              ^ keyword.other.DML.sql

conn.execute('SELECT * FROM foobar')
#              ^ keyword.other.DML.sql

conn.execute(U"SELECT * FROM foobar")
#              ^ keyword.other.DML.sql

conn.execute(U'SELECT * FROM foobar')
#              ^ keyword.other.DML.sql

# In this example, the Python string is not raw, so \t is a python escape
conn.execute(u"SELECT * FROM foobar WHERE foo = '\t'")
#              ^ keyword.other.DML.sql
#                                                 ^ constant.character.escape.tab.python

conn.execute(u'SELECT * FROM foobar')
#              ^ keyword.other.DML.sql

# In this example, the Python string is raw, so the \b should be a SQL escape
conn.execute(r"SELECT * FROM foobar WHERE baz = '\b")
#              ^ keyword.other.DML.sql
#                                                 ^ constant.character.escape.sql

# This tests to ensure the Python placeholder will be highlighted even in a raw SQL string
conn.execute(r'SELECT * FROM foobar WHERE %s')
#              ^ keyword.other.DML.sql
#                                         ^ constant.other.placeholder.python

conn.execute(r"SELECT * FROM foobar")
#              ^ keyword.other.DML.sql

conn.execute(r'SELECT * FROM foobar')
#              ^ keyword.other.DML.sql

conn.execute(r"""SELECT * FROM foobar WHERE %s and foo = '\t'""")
#                 ^ keyword.other.DML.sql
#                                            ^ constant.other.placeholder.python
#                                                          ^ constant.character.escape.sql

# Capital R prevents all syntax embedding
conn.execute(R'SELECT * FROM foobar')
#              ^ - keyword.other.DML.sql

conn.execute(R"SELECT * FROM foobar")
#              ^ - keyword.other.DML.sql

conn.execute(R"""SELECT * FROM foobar""")
#                ^ - keyword.other.DML.sql

conn.execute(r'''SELECT * FROM foobar''')
#                 ^ keyword.other.DML.sql

conn.execute(u"""SELECT * FROM foobar WHERE %s and foo = '\t'""")
#                 ^ keyword.other.DML.sql
#                                            ^ constant.other.placeholder.python
#                                                          ^ constant.character.escape.tab.python

regex = r'\b ([fobar]*){1}(?:a|b)?'
#         ^ keyword.control.anchor.regexp
#                       ^ keyword.operator.quantifier.regexp

regex = r'''\b ([fobar]*){1}(?:a|b)?'''
#           ^ keyword.control.anchor.regexp
#                         ^ keyword.operator.quantifier.regexp

regex = r"""\b ([fobar]*){1}(?:a|b)?"""
#           ^ keyword.control.anchor.regexp
#                         ^ keyword.operator.quantifier.regexp

# Capital R prevents all syntax embedding
regex = R'\b ([fobar]*){1}(?:a|b)?'
#         ^ - keyword.control.anchor.regexp
#                       ^ - keyword.operator.quantifier.regexp

regex = R"\b ([fobar]*){1}(?:a|b)?"
#         ^ - keyword.control.anchor.regexp
#                       ^ - keyword.operator.quantifier.regexp

bad_string = 'SELECT * FROM users
#                                ^ invalid.illegal.unclosed-string

string = """
#        ^^^ string.quoted.double.block
"""

string = r"""
#         ^^^ string.quoted.double.block
"""

string = '''
#        ^^^ string.quoted.single.block
'''

string = r'''
#         ^^^ string.quoted.single.block
'''

query = \
    """
    SELECT
        (
        SELECT CASE field
            WHEN 1
            THEN -- comment's say that
#                              ^ source.sql comment.line.double-dash
                EXISTS(
                select 1)
            ELSE NULL
        ) as result
    """

query = \
    r"""
    SELECT
        (
        SELECT CASE field
            WHEN 1
            THEN -- comment's say that
#                              ^ source.sql comment.line.double-dash
                EXISTS(
                select 1)
            ELSE NULL
        ) as result
    """

query = \
    '''
    SELECT
        (
        SELECT CASE field
            WHEN 1
            THEN -- comment's say that
#                              ^ source.sql comment.line.double-dash
                EXISTS(
                select 1)
            ELSE NULL
        ) as result
    '''

sql = 'SELECT * FROM foo -- bar baz'
#       ^ source.sql
#                            ^ source.sql comment.line.double-dash
#                                  ^ punctuation.definition.string.end.python - source.sql

