all: deploy clean

package:
	cd /Users/mehulkumar/.local/share/virtualenvs/crypto_paper_trading_bot-9ing1t53/lib/python3.8/site-packages && zip -r9 ${PWD}/function.zip .
	zip -g function.zip lambda_function.py errors.py trade.py
	

deploy: package
	aws lambda update-function-code --function-name paper-crypto-trading-bot --zip-file fileb://function.zip

clean:
	rm -rf function.zip