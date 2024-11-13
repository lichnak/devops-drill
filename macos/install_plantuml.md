# Install PlantUML environment on Mac

PlantUML is a tool to draw UML. It is a tool that you can write a text description to draw your UML diagram.

If you want to use it on your local mac desktop, you can use Homebrew to install that. Before installing PlantUML, make sure that you have installed Java and Graphviz.

1. Make sure that you have installed Java:

    ```bash
    java -version
    ```

2. Install Graphviz

    ```bash
    brew install graphviz
    ```

3. nstall PlantUML:

    ```bash
    brew install plantuml
    ```

4. Let's try a sample.

    ```bash
    wget https://gist.githubusercontent.com/QuantumGhost/0955a45383a0b6c0bc24f9654b3cb561/raw/08e6eb965a5604a8ba89a586707708a9a9b98c1a/example.puml
    plantuml example.puml
    plantuml -gui example.puml 
    ```

As a side note, you can integrate it with Visual Studio code or sublime editor. If you are using Visual Studio code, I would recommend PlantUML extension which is able to show a live preview.

[A sample for planting sequence diagram]<http://plantuml.com/sequence-diagram>
