import argparse

parser = argparse.ArgumentParser()

# Add an argument
parser.add_argument('--d', type=int, required=True)

args = parser.parse_args()

print('{0:5b}'.format(args.d))
