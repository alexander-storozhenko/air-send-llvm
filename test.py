value = 1234

print(sum([int(val) for val in str(value)]))

class MyInt:
    def __call__(self, val):
        return int(val)

n = MyInt()
print(n('123'))