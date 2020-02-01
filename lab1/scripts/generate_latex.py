for i in range(7,22):
	print("\\begin{figure}[!ht]")
	print("    \\begin{center}")
	print("        \includegraphics[scale=0.48]{c" + str(i) + ".png}")
	print("    \end{center}{}")
	print("    \caption{Cracking the ciphertext with Crack Substitution Tool}")
	print("    \label{fig:c" + str(i) + "}")
	print("\end{figure}")
	print()

