Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.201
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795265445;
	b=E5Gcs2WNkknwKX2Pcx3ZebXnRlvLJ5lB5D8JahqwR6vRHYEi9PnK7lSbXwHEUm17yY5y
	 2e5Yt/r/d0Zi9Vy5HeLj0XDmVX8SgRvxbjrLU8ihfgjfSKm/sAgQO0OlIPseZTLDQCZP8
	 bqPdHNZY31zC2W7I6oLhTNY4ixB5Pa23YAOlVWDEGD1ksL/U+PQwGm6aoYxAD/yNQQkuE
	 XyAneVN7UcG8b0oKumSt2SVmmlifzLNy/YsdgenD0R4O/G+7DAAKt34OwdpiEUpz5uNFP
	 iKyGUPQWgU9qoJfqOJUrMnEQTPe6vsSIEH7Wt3ls/VMRfzvjZ+/94IUcSR9zmvEOw4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795265445;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:Date:
	 Message-Id:To:Cc:In-Reply-To:References:X-Mailer;
	bh=205CdX5PCQW2SykzUQ2r0VNC2kEGRl78KXXpxrNibvQ=;
	b=YHy2sOvs3KWRj6bYrG+u263vu5JtzLmxnqdwownCJFHlOMQTS9n7EDG6MlDHSd2R3DkV
	 g+UhQGi34jKiPavxuxxMm+5K5ejRM01MZY5+++KLstDsBlgXyctfCVakeAEiUqobAuW8G
	 mQAEgHW0ww2ELFlSj1RsTrNPm4iBag+jNmRXAkWeFRpdezvgxPfhbXSNc0AUKoorDNsKA
	 ZzDwVL+OYmvL7M0jjWyHrddhkSz4XpUICO3tWzn7cArKbsSBzOfwHAfDdLeiXl3kd8/qb
	 5I4K5TifdBLloP09keNg1QWO6cQI/2Qm760UF3XxdAjEg5CwJfQO2fQmuClGKPJNHlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qTB7qxr+;
	arc=none smtp.remote-ip=74.125.227.201
Received: from mail-pi2-f9.google.com (mail-pi2-f9.google.com [74.125.227.201])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810D8606A32A
	for <sashiko-reviews@lists.linux.dev>; Sat, 21 Nov 2026 12:50:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 810D8606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qTB7qxr+
Received: by mail-pi2-f9.google.com with SMTP id 41be03b00d2f7-cdd8f943737so432988a12.1
        for <sashiko-reviews@lists.linux.dev>; Sat, 21 Nov 2026 04:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795265445; x=1795870245; darn=lists.linux.dev;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=205CdX5PCQW2SykzUQ2r0VNC2kEGRl78KXXpxrNibvQ=;
        b=qTB7qxr+oDJE+FmVagQQJLf+Xy/+6VMJjzRoBr6Yf83sFcxAG6LYGdDRvd4+debcmL
         agRlosMtKS4gV+WbyDUIc4VaHtePZUYvrTL4VglJwk1qOjm2Wh2/EcKYWNmHtFZ/1ZTc
         EHaB1SPFEdRf6PPipzfMCoFHHsw+iTpzBo6hvIicpetYt/EGpqGWBddUHeRmaUZLxCLY
         C2MgZlGNlXXMzyynP7V1H56RpReNbtq1LOnGfSv1xklgsCUD5pBzOUdvd4RknrQmp02a
         WotATe3icQlNF0JJqbM5e2TP31Vlhz9YCRpnm/M8HDm3SQwOTJBAjYw+jCaHxZZvp8Zc
         Zomg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795265445; x=1795870245;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=205CdX5PCQW2SykzUQ2r0VNC2kEGRl78KXXpxrNibvQ=;
        b=mDGc9TnSmcV9bhCsK4rqJcOqbFBM2N29i6yRiPbCNEJbWrHo/ctptjDHFdXoDWxbSN
         QKLuswpd5P6wlYNoZo7gd8geN+VVDhIKXKroG3kjYeOzNCuGInhUt06ZnjloFhpGGXRu
         ion+SOsq0Kr6zTkIAcJ59O2bYeCNmkzsIlwTgUE/VN4f1WCyZocwbkh7fqwUda9BC0/D
         C7ydFhH0hBI+l96eHq2nK06dJc9xBHrinnaMqI+UVHx3byO74dDzTPgbb97Z5ju8HWoY
         xkmVcchC0WrUyVkqbPCqmBpNQ5hfAyHwazeQsFubmmvTa5/jY8R2KzlQk8RcBeWfs2+1
         keXg==
X-Forwarded-Encrypted: i=1; AL+hErGTI+iqPs6TZEjuxFr8cTqPpLaMluWODVVbOhUn71cGN+5ckfrEbjmMpt5BsJbf/ecnZF3vTof5PLHVub9Lb6A=@lists.linux.dev
X-Gm-Message-State: APuU4Z/e9gysJUbuRJ2bTi/gcxiFReiZ6QUXHFoScPZzweRjnHtF8/f6
	Pguo2E5nSTN5imMhi0OuOTsTxaJbKR/dIOvLn7j8CI2ILmerKVehqewf
X-Gm-Gg: AZFdTZeFN8ct9nY47Uqy1zdLbHdSR+9S9miplTV/xzzZh4pSBOkId+HXeNRVnanbWUp
	aXY//u9Bo/7e96xwuYBnXn2chBC8ArixsfsrPXjPCB0jSiqrfr3LEfyYzONiBJeRUM2kUMUHLX5
	hMweq+DjxS6/BGBhREwowT0P5VEOAzevmlQh0eQTAeuQIrgv9gIneHsaQ1y0scWSZAigZjuUIhh
	sDZS7XJcKyl3NlYQ+2kP6miUEXVWwf4flJNQ6IV8s6VLeADxvWRaUtZHLmWVuz7ZAkKr04+bC4y
	CFDFT8gw/Lm0iAOcQIqiq5ClJGyGikMf9gDfMIE5wRRMjwwaMcKcS7Z7GWMdRbo7eEZyUU9NUqx
	ZflU7Y0eRH8MQjwA6fKv/+EUtB8j75BcNu6FxMsGyJ/S7S6BXOE3hZMz6y+lX4Hv9aIn1yFyQki
	ZONz4vJnR8e/HnZK9elaMQqn2ZbLxvuof4cBzWhrepeaLYPUt54Pipw+gqL7UrTjuhowzYAoac1
	YZscbM6WjU0hQAS98RYrDvzEruJ+I1X9ZRvTTbo6tcBMRVY9fI2WBcsI1bvv2va6wA31scEipVH
	hTln3qLNO7g2bHwMR4UHiYyuJ5SxgSjn6tp5eYcrPYwYnUsvu9VuieKSpk//TwyZFPwvGv6IKVt
	ojOOKOeJlktDMjiUieN6coKXRekCLgPbAHw==
X-Received: by 2002:a05:6a00:4c8f:b0:8a0:70ff:ab27 with SMTP id d2e1a72fcca58-8c87c09e5bdmr5660349b3a.28.1795265444677;
        Sat, 21 Nov 2026 04:50:44 -0800 (PST)
Received: from localhost ([50.7.253.42])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285c272sm2888869b3a.19.2026.11.21.04.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 04:50:44 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [RFC PATCH 2/4] mm/damon/reclaim: set memory PSI 0.05% as
 default quota goal
From: Aveline Noir <jm5905938@gmail.com>
Date: Sat, 21 Nov 2026 23:39:16 +1100
Message-Id: <179526475633.4.14859465649138957731.b4-reply@b4>
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, arijit.desaii@crusoe.ai, 
 Jonathan Corbet <corbet@lwn.net>, damon@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-mm@kvack.org, 
 Randy Dunlap <rdunlap@infradead.org>, sashiko-bot@kernel.org, 
 sashiko-reviews@lists.linux.dev, Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261120060741.92121-3-sj@kernel.org>
References: <20261120060741.92121-1-sj@kernel.org>
 <20261120060741.92121-3-sj@kernel.org>
X-Mailer: b4 0.16.0

Hi SJ,

On Thu, 19 Nov 2026 22:07:36 -0800 SJ Park wrote:

> Set 0.5 milliseconds per second
> (0.5%) as the default auto-tuning target memory pressure ratio.

0.5 ms per second comes out to 0.05%.

> +static unsigned long quota_mem_pressure_us __read_mostly = 500;

With a fixed 500 us target, maybe a longer aggregation interval also
lengthen the PSI measurement window. For example, if the quota ends up
being reset every 2 s, should 1000 us of stalls still be compared 
against 500 us? If so, the tuner would drop the effective quota
to 1 byte, skipping pageout for the next quota window.

Thanks,
Aveline Noir
