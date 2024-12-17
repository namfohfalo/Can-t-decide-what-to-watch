import clips
import tkinter as tk


class MovieSuggesterApp:
    def __init__(self, env):
        self.env = env
        self.root = tk.Tk()
        self.root.title("Movie Suggester App")
        self.root.geometry("800x600")

        self.result_label = tk.Label(self.root, text="", font=(
            "Arial", 16), fg="blue", wraplength=380)
        self.result_label.pack(pady=20)

        self.question_label = tk.Label(
            self.root, text="", font=("Arial", 14), wraplength=380)
        self.question_label.pack(pady=20)

        self.button_frame = tk.Frame(self.root)
        self.button_frame.pack()


        self.load_data()
        self.update_ui()

    def print_facts(self):
        print("facts")
        for f in self.env.facts():
            print(str(f))
        print("agenda")
        for b in self.env._agenda.activations():
            print(str(b))

    def load_data(self):
        self.env.load("movies.clp")
        self.env.load("rules.clp")
        self.env.reset()
        self.env.run()

    def assert_fact(self, fact):
        self.env.assert_string(f'({str(fact)})')
        self.print_facts()
        for i in self.env._agenda.activations():
            self.env.run()
        self.update_ui()

    def update_ui(self):
        self.clear_ui()

        # Check for "result" facts
        for fact in self.env.facts():
            if "result" in str(fact):
                self.result_label.config(text=f"You should watch {str(fact[0])}")
                return

        # Check for "question" facts
        for fact in self.env.facts():
            if "question" in str(fact):
                self.question_label.config(text=str(fact[0]))

                for i in range(1, len(fact)):
                    button = tk.Button(self.button_frame, text=str(fact[i]), font=("Arial", 12),
                                       command=lambda x=fact[i]: self.assert_fact(x))
                    button.pack(pady=5)
                return

        self.question_label.config(text="No more questions.")

    def clear_ui(self):
        self.question_label.config(text="")
        self.result_label.config(text="")
        for widget in self.button_frame.winfo_children():
            widget.destroy()

    def run(self):
        self.root.mainloop()


if __name__ == "__main__":
    env = clips.Environment()
    app = MovieSuggesterApp(env)
    app.run()
