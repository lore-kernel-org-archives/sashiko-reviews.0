Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C763543B489
	for <sashiko-reviews@lists.linux.dev>; Thu,  6 Aug 2026 15:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786031068; cv=none; b=bKEcp6qz06MfdrROFpmaQIu6sNVv4bVQsSU2w677hUJp1sKj+yiK2q6Ff7WYZ/372HBQTwTW+URu6ERj+/Kp1+yjCQQ4xNwTSnc1ked60FyQcj7b18RqCKRA0j6FKB6z8lb0yrd9Dld/OdDspdWp9kj982llu53hfHvSrkiBlyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786031068; c=relaxed/simple;
	bh=O7rkwtXnbLwt2keDlpi9elKWxaB0PjsiSkkruUjKVaE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pyfQbJ3l8uOVWj+uGGyAsGTtpdf6PAjeQGM0rfH0tSA3RFTffR+0cOLKGsE54TA1jiWY2qYInh7BwujuQ1CvrA/pP7GWifqn6JlrRO1og68inwFJyedu7ctluLEGJw3ajYz8ed0ws6lc9zSrdxGcZ8fUSFJZWVwqg8XSpPOLhZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bFLiwAy6; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bFLiwAy6"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso25678715ad.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 06 Aug 2026 08:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786031066; x=1786635866; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O7rkwtXnbLwt2keDlpi9elKWxaB0PjsiSkkruUjKVaE=;
        b=bFLiwAy6dpOd+q2YY6lvWD5WXrZd3GLmlXZY/n4nSl2AxK680AczvuqQg1NLWOFPwc
         28kb0ydRlVAlFbJUI1CPIzTJXj+3iLWk9IPqe8d2SmN9Mmn9f2IdV3XTYoiO4v7Q0wBf
         AyZRoMCX7gxLg/IwPTuV8Yyv26baXe4RtVhwn2iDW7CzqSA3EqogA74XEe+CSV+kMQmt
         A8OHOkfth88+8lYP8IX9FE/qk+hFQD1LNyITpV6IGbgsLNsGBwsy/HX5tt2mXZWXvHQP
         CPJLrXe5CVkN8hnlT4GCnN9PuAjnLnzfBJQPDGstXsgL+pwbzGMgHsGIpSshSOqO45J1
         pt8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786031066; x=1786635866;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=O7rkwtXnbLwt2keDlpi9elKWxaB0PjsiSkkruUjKVaE=;
        b=funnfxC2IW0WpcVqzyqA2yFZb161FEF8C8+2pWNDc2FOztL+7Zfm1wUga6lTix5by+
         uH8M1nS5rGcAUgJJrQpUvUi/0Wgug3IFOpeg/gkguCEsQdADpsTh5/nyYJOztWsnVKZV
         bWMKxnmVm7ySNfiW+lH8VfcBhgBVNmQ/n5qd9k5B8e4LjYF5de/gXcQefxgo1tYY97Y3
         /IQHMRcBH9RxOz4T+aqkCpLeFPA1Wd7SaPM+Fkq5OpOBSWAi03RIedZrhHG9TWzDIOf9
         ubtMKZz+wYkQSc4zM9r4BQrq3HIwDcVtzDbjO5YqJlpjQQcLAWX0pnHIyIu/dcsexnYV
         zXyg==
X-Gm-Message-State: AOJu0YzqMLQZ7lF7vRT7Rv3IUuyNppKshKWsLXjHvTVDykkN4eEZAZFU
	Yo5fJJz3gzx67IMZlu91PFukLnlEKbpD3c2SotVE1N44LXLZ+FN5p1l+5ZejHw==
X-Gm-Gg: AR+sD11WrKLiW7Fcxa5XnXbhpQmSz7gfSUNoeBY2FKLeJY/mQEYUb3T0wNW5/FZlQ88
	CDflD2vPtMKeEcCN39E+2NZE61efZbScQt3WinoGIYwollDaXLKf+x0Q5n7H+psMiXPU3FTZSwd
	m4xeEW4UJDtVWkBlRaGv4He4cmHhwuf7pbgypppQsmPReK6kmFl8IJhYk9LnteYlJP63NPxPtTa
	VNhjStbVgks2/6xTiyLPUDxxMsoe8yER915JmKinFCkuFBZSnIDhS4ezUhIifAiHwMXpR3kJ3br
	6A01X7ypRPAWMTVA8OzEAVtQTi8voX75O+8A/KSHhnFMR0+F9TxAGHHk8pTcXSuCNEgVfA5AxW+
	n30wWcjVtycNUs5Zz0Fxx25WGM44bdAgF5TXM55YMOLs3P32VMufyNeQsfZR5k2Slvfqd7EwE6i
	ZUuFPguL28iHrc9mV4zDJbr9Pa5+eDS/gwPvetmVMJ+wQ/ox1UHzS3/+4iAs+yAueeQCEGZbgJQ
	VWE//uCd9AU8vWjvKu2vyGRRrsBgcVIhzzjWQ==
X-Received: by 2002:a05:6a21:109:b0:39f:a8fb:3354 with SMTP id adf61e73a8af0-3cbadc1497emr3658629637.17.1786031065993;
        Thu, 06 Aug 2026 08:44:25 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fca92ada6sm25851294c88.15.2026.08.06.08.44.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 08:44:25 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f96884d5-7bb2-4646-9175-1b385789690b@roeck-us.net>
Date: Thu, 6 Aug 2026 08:44:24 -0700
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (yogafan) Add support for new Lenovo models
To: sashiko-reviews@lists.linux.dev, Sergio Melas <sergiomelas@gmail.com>
Cc: linux-hwmon@vger.kernel.org
References: <20260806131103.19104-1-sergiomelas@gmail.com>
 <20260806132452.80AD21F000E9@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260806132452.80AD21F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Sergio,

On 8/6/26 06:24, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Specific Lenovo model DMI quirks incorrectly use `DMI_PRODUCT_FAMILY` for exact model string matching, causing all specific quirks to fail and fall back to incorrect generic profiles.
> --

Please confirm that this is a non-issue.

Thanks,
Guenter

