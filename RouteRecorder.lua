import tkinter as tk
import threading
import time

# ===== CONVERSÃO =====
def numero_por_extenso(n):
    unidades = ["zero","um","dois","três","quatro","cinco","seis","sete","oito","nove"]
    especiais = {
        10:"dez", 11:"onze", 12:"doze", 13:"treze", 14:"quatorze",
        15:"quinze", 16:"dezesseis", 17:"dezessete", 18:"dezoito", 19:"dezenove"
    }
    dezenas = ["", "", "vinte", "trinta", "quarenta", "cinquenta",
               "sessenta", "setenta", "oitenta", "noventa"]

    if n < 10:
        return unidades[n]
    elif n < 20:
        return especiais[n]
    else:
        d = n // 10
        u = n % 10
        if u == 0:
            return dezenas[d]
        return dezenas[d] + " e " + unidades[u]


def transformar(n):
    return " ".join(list(numero_por_extenso(n).upper())) + " !"


# ===== VARIÁVEIS DE CONTROLE =====
rodando = False


def iniciar():
    global rodando
    rodando = True

    inicio = int(entry_inicio.get())
    fim = int(entry_fim.get())

    def loop():
        global rodando
        for i in range(inicio, fim + 1):
            if not rodando:
                break

            resultado = f"{i}. {transformar(i)}"
            texto.insert(tk.END, resultado + "\n")
            texto.see(tk.END)

            time.sleep(0.2)

    threading.Thread(target=loop).start()


def parar():
    global rodando
    rodando = False


# ===== INTERFACE =====
janela = tk.Tk()
janela.title("Gerador U M !")
janela.geometry("500x400")

# Marca d’água
marca = tk.Label(janela, text="fbtrembala", fg="red", font=("Arial", 8))
marca.pack()

# Inputs
frame = tk.Frame(janela)
frame.pack(pady=10)

tk.Label(frame, text="Número inicial").grid(row=0, column=0)
entry_inicio = tk.Entry(frame)
entry_inicio.grid(row=0, column=1)

tk.Label(frame, text="Até").grid(row=1, column=0)
entry_fim = tk.Entry(frame)
entry_fim.grid(row=1, column=1)

# Botões
botoes = tk.Frame(janela)
botoes.pack(pady=5)

tk.Button(botoes, text="Iniciar", command=iniciar).grid(row=0, column=0, padx=5)
tk.Button(botoes, text="Parar", command=parar).grid(row=0, column=1, padx=5)

# Área de saída
texto = tk.Text(janela)
texto.pack(expand=True, fill="both")

janela.mainloop()
