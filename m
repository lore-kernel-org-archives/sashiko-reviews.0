Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793630193;
	b=YxZ89bsO95H9VWbIqCwLNGuLZG3+QhIXoEgfHZXJfziosTyL7tHoWoRwd7d7P2Thi9Zh
	 Jf+lQvrRg8ckdQrVFRl7GO/XHgy6gOOqUaoSg4Krn2oV2A2gG/VjZ+4dJfZHwGxi7r64x
	 ZxiLjLlwWiX9DJtPR89h2xCYYH13tRTbc+eMBSQaZWIG5FNtL5p16ycy7Yg9DoPGTS65G
	 MtQC9Q7WPRO3aYsOyDXqI+RDbzyLs2hyvnL7OArzjcWHA6z24IUmVpF1QGKmdfTaKUMNG
	 AY5FPeAJ7KQmHjrnYWBPkgdd0ADFpI6AJpInB0kIebPYFPvIUZmeQpyIXonpyncGDqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793630193;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=O/U/gtv+fmTdKgkNES2DeDqnFxJ1hQs20tgERiKWY4Y=;
	b=EZGYEaU1gvFDUlFWXbrMlDgCR5UUEezKJGJpdpVFus6Xz6+bIuUdCEvlX/x376ofDDQe
	 ycUPauxD933Ao6LNYCLFqPtd2sJJb6dbhmt/WNlbCLR2yaccZZylk8bAxC+tNBVNnU3WX
	 TXYcUGDrLaa981qnw0SkjJ329XihKwcVNikou4qb1bytHp1TvAyghgDb7WZCPGBRnimb/
	 gWiNe7AN0Cu5hsPICRhb7JHBhdNb3i9BbuiWGc5gvLIvGCDLb2OSvU7mZUJmJqXK05A1Z
	 c6NFJ8YpZs4aHyzbayWtDST41weM3E6nJ34IKyJoWpuRxaSZbg5drLhTgpPeylZa0EQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AQ4y2Wdb;
	arc=none smtp.remote-ip=74.125.231.138
Received: from mail-oo2-f10.google.com (mail-oo2-f10.google.com [74.125.231.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5455F6078250
	for <sashiko-reviews@lists.linux.dev>; Mon,  2 Nov 2026 14:36:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5455F6078250
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AQ4y2Wdb
Received: by mail-oo2-f10.google.com with SMTP id 46e09a7af769-85e1040ca0dso50249a34.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 02 Nov 2026 06:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793630191; x=1794234991; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O/U/gtv+fmTdKgkNES2DeDqnFxJ1hQs20tgERiKWY4Y=;
        b=AQ4y2WdbsJamm0n9p6Qf9rIRbbGxPTyGT5E5+7x0uGnaN+0FqhHLPv+7iVEpFHBV/s
         xWpR7VC78TeC4LYyyGSMtddugFtZeTj2AF0KwB5eDqH+XG6q5uEIHX/zSxc5tg1RqaOU
         t2svt7MiJv1QERTwnNSn4SGMxNq+TkeTX/Jjp8dClOuVuJWBtZ/tG/j1nUPzQWHVtc7z
         P7GJEABng+GYLasyEB+ePCSNb7oHMFHqjQlfewwCfSuYF2djh3RsszMWcrQoJl5ebPq4
         tdg2ew4yb1hfgOBSn5tAevb8qL2neURE9hJwj/mPWkUBrHdhqtKkRfpXYs71bmwdD04P
         WJaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793630191; x=1794234991;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O/U/gtv+fmTdKgkNES2DeDqnFxJ1hQs20tgERiKWY4Y=;
        b=fETs3uGcTL05xIZOJ2bsKx3FWZESIHXIUrgvM+BJVW0O4Lqy21A/lXfMcbRqj/PIDp
         ZgEZlH6pkulk3A1iZf3msxB/v45SOtgEOASW2akGcdJkzYV6/XOUkm97vccJgXYmJfoo
         Z4o1vvtBI7EnjhXWywWczdJxHc47TP98k0EoAJJezVqSRgQ4VbEr6159vgU8YJuCFPK4
         jEwaKIqr3lHfHiFfysyC/5fgy1jjt/CpjMtH/dzBIYZw4WSwxZuRoJtK3L3JNN5mfvVQ
         rHZpoFVubaycz+Oqwzz6gzgAWbYQD58QTcz9ZH0m4C2OkyLxGF9kMGSkgriybllAIRNj
         Jriw==
X-Gm-Message-State: AFq9FYKAeWEdWbNazcF3xnrRxglKoYih5mGYyrfmZZ7M7dreyU8VJb6k
	rIdGrH3TxiQOhHy8lfH5iAH7wFmyWhR5jBauWEKzwPkSUB4S9NZSpYi7BUNRaAwRWjA=
X-Gm-Gg: AYBFou2NbEJOQcBxX6Fw4DWciucq5c6+IaDqy0h7Qi2RchVMSdfgONURkT04mdpmZ68
	jrFtLdEjy2z91D2CAUIpU5NEOyeTA0Zwif9Hh+gOkpdJ7mkyn9tYBmyuF2lNOpYKkyyHvRjYDLx
	PBv+B83/Zx8UdNuyd2Nj08XvhegHo0gsy/2sfzgbCF4rlxMli3l45dWJ0Cko7+zTvWuwXJeOqCC
	oM7t63W2Fv48s7+7WVauILwpNCtXyX/FjwLZcR/Ig5y5M9gdD+mXQ3Cx/W/pUTSJ8HgVR4RwAJ1
	kN8qIX+Wdgd1av6sXZWjEa1aWu0Vuug/ijWkAzv5UkQlq7eYRcL2JaD+vGZiunaH73myedTvgZU
	EUMimP0jf3rYe9oR5HFE5ygK6BLbeVQ9gah0ZHUZfy6ic/HXlRp8xYVb+5SsHTVFUVVjnbHxdFi
	4lOYbgcFr/jxzLf/LifaK+CiRoHzItD7vN+aluwB352/9Gphi8cccaUP+pwjGqDjc4p2DhIWzOi
	6ssJNdWI/Rg0muECZxwq7SJOhTmCcgvBMKlZA4IXwfOPI5FSDUteaXqPyWBCumskuyMSY95EdIe
	Q5Be4RwgKV8yH54+z13gvSKigD4HOmE4+ZU3na1QHDMB
X-Received: by 2002:a05:6830:82f4:b0:81b:ac5b:ea17 with SMTP id 46e09a7af769-85d364871femr7316643a34.16.1793630191638;
        Mon, 02 Nov 2026 06:36:31 -0800 (PST)
Received: from ?IPV6:2600:8804:5716:d800::f01a? ([2600:8804:5716:d800::f01a])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d354985b2sm9189411a34.11.2026.11.02.06.36.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 06:36:31 -0800 (PST)
Message-ID: <eb5b989c-0308-4721-b55e-4f179b8f13eb@gmail.com>
Date: Mon, 2 Nov 2026 08:36:29 -0600
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] rtc: mt6397: provide the 32 kHz output as a clock
To: sashiko-reviews@lists.linux.dev
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org,
 linux-rtc@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, lee@kernel.org
References: <20261101-rbrue-suez-upstreaming-mt6397-rtc-32k-v1-0-9758f38d7053@gmail.com>
 <20261101-rbrue-suez-upstreaming-mt6397-rtc-32k-v1-2-9758f38d7053@gmail.com>
 <sashiko-outbox-192928@kernel.org>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <sashiko-outbox-192928@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/1/26 11:44 PM, sashiko-bot@kernel.org wrote:
> When pdev->dev.of_node is NULL, of_device_get_match_data() returns NULL.
> Previously, mtk_rtc_probe() never dereferenced rtc->data during probe,
> whereas mtk_rtc_register_clkout() now evaluates !rtc->data->con before
> checking dev->of_node or whether rtc->data is NULL.
>
> Should mtk_rtc_register_clkout() check !rtc->data (or check
> of_property_present() first), or should mtk_rtc_probe() handle a NULL
> rtc->data?
>

Yes, good find, my bad. I'll send out a v2 fixing this.

--
Ryan Brue
