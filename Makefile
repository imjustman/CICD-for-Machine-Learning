install:
    pip install --upgrade pip &&\
    pip install -r requirements.txt

format:
    black *.py      # 터미널에 "make format"을 치면 Black이 내 프로젝트의 모든 파이썬 파일을 읽어서 보기 좋게 코드를 자동으로 다시 써준다.

train:
    python train.py     # 터미널에 "make train"을 치면 python train.py가 실행된다.

# echo는 화면에 출력해! 라는 뜻이지만 뒤에 >나 >>가 붙으면 파일에 기록해! 라는 뜻으로 변신한다.
eval:
    echo "## Model Metrics" > report.md     # >기호는 파일을 새로 생성하거나 덮어쓰기를 의미한다.(report.md라는 새로운 마크다운 파일을 만들고 맨위에 ## Model Metrics라는 제목을 적는다.)
    cat ./Results/metrics.txt >> report.md  # >> 기호는 내용을 추가하라는 의미. (학습 결과가 담긴 metrics.txt를 읽어서 report.md에 덧붙인다.)

    echo '\n## Confusion Matrix Plot' >> report.md
    echo '![Confusion Matrix](./Results/model_results.png)' >> report.md

    cml comment create report.md