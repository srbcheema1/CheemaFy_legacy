class FrozenClass(object):
    __isfrozen = False
    def __setattr__(self, key, value):
        if self.__isfrozen and not hasattr(self, key):
            raise TypeError( "%r is a frozen class" % self )
        object.__setattr__(self, key, value)

    def _freeze(self):
        self.__isfrozen = True

"""
# Turorial

class Test(FrozenClass):
    def __init__(self):
        self.x = 42#
        self.y = 2**3

        self._freeze() # no new attributes after this point.

a,b = Test(), Test()
a.x = 10
b.z = 10 # fails

"""
