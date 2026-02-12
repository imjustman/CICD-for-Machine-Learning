install:
	pip install --upgrade pip &&\
	pip install -r requirements.txt

format:
	black *.py

train:
	python train.py

eval:
	echo "## Model Metrics" > report.md
	cat ./Results/metrics.txt >> report.md
	echo '\n## Confusion Matrix Plot' >> report.md
	echo '![Confusion Matrix](./Results/model_results.png)' >> report.md
	cml comment create report.md

update-branch:  # 학습 결과로 인해 변경된 파일들을 깃허브 저장소에 다시 기록하고, 이를 새로운 브랜치에 강제로 반영하라 라는 자동화 명령어 세트.(보통 모델 학습이 끝나면 metrics.txt같은 새로운 결과파일이 생긴다. 이를 내 컴퓨터가 아닌 GitHub Actions서버가 직접 내 저장소에 커밋할 때 사용한다.)
	git config --global user.name $(USER_NAME)
	git config --global user.email $(USER_EMAIL)
	git commit -am "Update with new results"
	git push --force origin HEAD:update
# main 브랜치에는 우리가 짠 순수 소스 코드만 깔끔하게 보관하고, update 브랜치에는 **AI가 만들어낸 결과물(로그, 그래프, 모델 파일)**만 따로 모아서 관리하는 것이 협업할 때 훨씬 보기 좋습니다.