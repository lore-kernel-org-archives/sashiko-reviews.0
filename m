Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD3717B425
	for <sashiko-reviews@lists.linux.dev>; Sun,  9 Aug 2026 00:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786234758; cv=none; b=jhYi1Zv0Mj+9s0ipM801NlTSpvZHmlvd687NIbl8s8TstnsgtILDOLQKxtSoihQ/63KTeQ2Is0m5reHeNpgWJVMTcHzjwkIYEHHGj4c4+4kpO/sG9voUxKd/Zwq9j4wN2URbjGZuUir1no++9wu1zIyxrmIaszFAuVV1bPJFp3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786234758; c=relaxed/simple;
	bh=8PdyJ75uaEoJjnlDEUwhzvGAJ4aYxluIJtaxbTgwfH0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t+DmEH46xWTtaCVqAxWeH6RAZrObB91Clpee+pbMfHNLTeWVjF2NCG3nmX+IMkZOLJXKyJziUh5MxDoQx9tIgIZI+EgCEovHpeNikF6IYg+AJi0oBiSxmTiQ1NFoImIj3LC6xQ750SAxD9WdFBZHAdFWk4TLe2BIbvA8Dpd3Ufk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gnY/+qIT; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gnY/+qIT"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cbb85186d43so303342a12.3
        for <sashiko-reviews@lists.linux.dev>; Sat, 08 Aug 2026 17:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786234756; x=1786839556; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OttadXUOUup+RmOgM/UCimIxUHaryVwx6yXSVALWpjs=;
        b=gnY/+qITBKBedAtcwZl7DLQ/prJrkLx64Ugbyky66nKgrPv940yAu5WvFOcd0t/bNn
         mkWIjEHro7qTH2WYs12arMFEY3t18e1hXwxWEH1tRW0CRoWDGdP3S9IrI/ojSFuMqP4Y
         Zw0cju/iJ9o6JFMefHvtwY1CySuZLy3r1n9lUpM1hoC2C4sMkVq9PBfuwV8zjfJGZutV
         u+cmBbrL5KCeJhTxLLN+90tXopyvJ/GaWt6Oy0sojIRWGJYGiuXYKDgduy8U2A4ymcrN
         06goHjpEWPjs3v2BiViez3Aqt3J+BzDs5CZUcccjxfydURhyGj9NTQWRYOZXAWRZMie7
         4tEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786234756; x=1786839556;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OttadXUOUup+RmOgM/UCimIxUHaryVwx6yXSVALWpjs=;
        b=h5nLGtCUqEx2vL+FCiDh4gnGfH8t09HNjCFJXbmrYQ8c9ZC/KKHQPTG9wH1+Obrk6M
         p7NGho5AnAZK9uBoFHo1OFEqc7atjg7oS2Fr8VjgiR88od0SpMYg90J45Nc23ZYMjnJf
         bjihB1kePJezmv+CWEQpjxPfQAtd9SWfOf7XC23y/gfJx2nsh3xKE6HbRZP1O/Veb8mL
         IQTItXH3fKPrxTDZ7bv6zsfEfEl3yif73CMTKM5VmBGlXH+rfsGFoeeUTQFXjXAS9y9+
         JEgzBFChSDXpnCdkuFJ3OsA3tvGLS46R8xxAbfMa3B8ejc0LOxTGwY70NU8bTFdXLXy1
         z5Mw==
X-Forwarded-Encrypted: i=1; AHgh+RoTaExGOa/17goVm0m83S6+FO1x9yy3R2C/cEJXb0IThjn1a/peYHqDLe1KzwrTvv+umEir68UwvXgEdIhR9us=@lists.linux.dev
X-Gm-Message-State: AOJu0YzuEote1u/I8iDjEG7GD42xMF8hgFVtiUEGN+B9x4onOJ2/iI6G
	GwMoTm5XAzEvyTI5D6WpCXbVOuUWRdjU7NaZcNQ507MKNADeKBKZ1fWKXXyciw==
X-Gm-Gg: AR+sD11Xh205aqNmJ3Q+iO3etli7CsEAwvFWSwUyv6LRIhUE8Xrav97r5Y2xRJGT3B4
	oP/MfIc08abKVnCPaYIsYC0sO+++hhvi1eWtKwZXwlCf6qjv5FNcXPwqkYeThEQrOGzx6VKiKAf
	48eFi5dGZ65+9UKjMjaMNSdnWxSlDqhkv3lnOxz1j3pysjLOfqpP1VkAdqwb2XZxBa6W9QKpkqr
	Yh3SMJcQITvZxhpb+NXvcwn4YH1V4KCd1VNyApse/K3L5KojETlDbmD1WZD4INOaUuddxrEG3Z1
	nLvFlIEAqP50IG8ghRrQIi0LeY0gxE02SW6LCx1ancSovaIgehpuQZ+T5ecIITzYvZGWF6IAZ1/
	ySfJQ4uyqw49aDXFF7CvVjBET609TkM6KUhak5pHXJqepZN2/batvdTdr+CNooz6OeMBlQhHP0J
	I7XpY8gqBuVfsu8EpzjMbBTPCzVGXrwUuxsuG2FT9PIvjc3m7s2YRhWLqbiAC/6ZU/ATSTRkHmr
	mbZET2cKsGRsfvQPp747TBqY0YtTjTMTKvWCg==
X-Received: by 2002:a17:90b:1807:b0:38e:6dd:a9ad with SMTP id 98e67ed59e1d1-39281b1b0c8mr9031774a91.0.1786234755884;
        Sat, 08 Aug 2026 17:19:15 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3925fd957cesm7517799a91.6.2026.08.08.17.19.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Aug 2026 17:19:15 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <72935574-9d53-4d0b-827c-5615aba60783@roeck-us.net>
Date: Sat, 8 Aug 2026 17:19:14 -0700
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (max6621) fix negative temperature offset and crit
 readings
To: =?UTF-8?B?Tmd1eeG7hW4gQ8O0bmc=?= <congnt264@gmail.com>,
 sashiko-reviews@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org
References: <20260808083718.2612205-1-congnt264@gmail.com>
 <20260808085811.ACB651F000E9@smtp.kernel.org>
 <CAJpJ=GuiQy0XtcER6=Va7VmfuGF__3BGSrjKiYRriEEUbUaEPA@mail.gmail.com>
 <CAJpJ=GvwdHj4J=1tTz4tzJQH-HVKC4zWprVRYU-de__ypaB9kg@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CAJpJ=GvwdHj4J=1tTz4tzJQH-HVKC4zWprVRYU-de__ypaB9kg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/8/26 02:38, Nguyễn Công wrote:

> The 1/64 C precision point stands as a separate enhancement.
> 

Maybe I am missing something, but I don't see any support for 1/64C precision
in the datasheet.

Guenter


