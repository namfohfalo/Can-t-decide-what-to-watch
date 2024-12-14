import clips
import tkinter as tk

env = clips.Environment()
agenda = clips.agenda.Agenda(env)
env.load("movies.clp")
env.load("rules.clp")


def assert_fact(fact):
    env.assert_string(f'({str(fact)})')
    env.run()
    print_facts()
    new_tk()


def print_facts():
    for f in env.facts():
        print(str(f))
    print("--")
    for b in env._agenda.activations():
        print(str(b))
    print("--++--")



def new_tk():
    root = tk.Tk()
    


    root.title("App")

    root.geometry("200x200")

    for f in env.facts():
        if "result" in str(f):
            result_label = tk.Label(root, text=f"You should watch {str(f[0])}", font=40)
            result_label.pack()
            root.mainloop()

    for f in env.facts():

        if "question" in str(f):
            question_label = tk.Label(root, text=str(f[0]), font=30)
            question_label.pack()

            for i in range(1, len(f)):
                ans_button = tk.Button(root, text=str(
                    f[i]), font=20, command= lambda x=f[i]: assert_fact(x))
                ans_button.pack()

    root.mainloop()


env.reset()

for f in env.facts():
    print(str(f))
print("--st--")
env.run()
new_tk()
