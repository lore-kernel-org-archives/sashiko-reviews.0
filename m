Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795272839;
	b=hDNN3tlG22PkdHapgnQGttCGkfcFvKz0aDnKnMhgDsubeNDbMJdlyBnWwtkDZYWM9bEl
	 DvpeWt6gx1tPDJ1sD4ucGADSGUZVu7amCT5lIvSyPxA6Ot+gZnqZ6vP4UdYRt9aiHNbRl
	 2DLYSX5gwOV6KqEzjTsxcIqTTQn4tGjBRNTQ8k+hpQgX5Of8uOxKmkVobS4bvrRxqf2cA
	 du9CDmopBXd6EsIjKwAeXABTr2NNzmOvJbxP31C65WBLpXcI9YU+T+9NV48qVw/rX/lxt
	 T/jXKoYzmPUno6pPguAGgl2OK49ehZadTDe7a/HvjkdmOdkNP+1xwwC4+siuoAiQsGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795272839;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8xQen7jffo9TOqmP57pSPAWaS55BmCTfx9maqH6h4dU=;
	b=nXYBb+WcFwtY92zbeZVOtvtYyrjWalfFcViZm4e0wjhpua9Arj5niOW7fibetFiKWlJC
	 ikWOTRIE0VWr5daIXwAhfVsF9hvkoF3OipbY3tWUUUF/rLtpzLPA11CqwDkdGwtoFwFwp
	 jpyM0ReAC7xURl8TBQpLYaETNIwqmgS/yAG70PH8lHlBQk/Lh16peRZ55n/tq6mAxtJEu
	 XoUGUlHXlLcpFbvZnrZ/P/1SCyX8xsVBrDWy2N6KMsCSyrBj8gC0NTwBObfHFKkC5Rslf
	 ajStm9YwkdmLdWIV3VB+4jra5a8qeybvl45ut+F2JGLN6gdb30rArTTV+aX5dOvZIhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bmmIpNHj;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6086E606A320
	for <sashiko-reviews@lists.linux.dev>; Sat, 21 Nov 2026 14:53:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6086E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bmmIpNHj
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so18382525e9.0
        for <sashiko-reviews@lists.linux.dev>; Sat, 21 Nov 2026 06:53:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795272838; x=1795877638; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8xQen7jffo9TOqmP57pSPAWaS55BmCTfx9maqH6h4dU=;
        b=bmmIpNHj1jhhoxja8RXdPTgvuFLI8dzlO85HhXpkgMmV2mrlZrmU//3DSKv2htFcob
         JP7FvMUGrAgLXbm1mycBrkKZcXsvUmRB1vHXUvuFa1j0s28l5TnGi+8LHexy1H7/oi8x
         nfq5XpSy3+zI3HsllyyoP4Pk4QOcxxCW9FZk71YCb7/oDH60iFP2GRdODb6dyuPo0Yb8
         hgRmiUYnYr/f50hwLuLmzen1/njUMd/QkxgZusg47b6IB9bk0L8URDt8pGTOT4TH582A
         n6m8PyHECSNlB4/TsfC1d+AfsACZQykhSofvUcj4C5oZn+pKZ7eYCB77l7D8xEXxJFnk
         fJXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795272838; x=1795877638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8xQen7jffo9TOqmP57pSPAWaS55BmCTfx9maqH6h4dU=;
        b=oK4sRv7IiZ2/mzCNM3E0UhOJq7Iv8Cj+Tx4RIMqLPeRVxA2czOkXet2GSQfLjZCqjk
         IDQGyCM1/3Pa5uyj0lra4YApisF76rozul8waacPxhzWc8aX+3NP3hC6sbEYBsKMi6op
         4us9sOskYk9h25wv7gRThPWT6uvlJA3tF27hX4bSl0SVf11S6+YMXy2oUsAMFUmWq28O
         uUvSKVGQl7j6eADluwziTpzF1EuMubWBGHPvwsbElS3lV5/MTjeBigH/HjZ9/kfrxSoe
         N4YrfNre2EHHpEHxRhRbX71d63+taCAqpiMZGwoTh28ErutlfQUWU4N6JPM8H2TvudNG
         njuA==
X-Forwarded-Encrypted: i=1; AL+hErH48YQe0XfrOVS1wt1hzDu3kQ6R7ghDiKgIpuHa5H7J0xdf1mgRl6mbV1RuexK1hPFO8BCmBeGs970/Jwh4KXs=@lists.linux.dev
X-Gm-Message-State: APuU4Z8Bj5knjl2dmVA6bqSna7n81SFbDiNIqomZBqgRwQWUBiODsrFf
	gEpa1DNaPpAjAQcZH2TY3lUHGR1NaUEuM6kuPIuXMkCGPcPu2SkKmfED
X-Gm-Gg: AZFdTZfqF/KGqCCSeeWj/rfvKk6/OdPO8F4SPa+o2tpL7Su4MC7FwU1y8Bufo//D0tR
	vqV2Sm3w04fTfXtfBt//cpGw1CEcNsKgXHYZatSEL1bx9BQ3WHKEvxRUkT7ok4Z3r0CPlkOXRld
	CdhL9jZ6g4u8yGJIWn2jEPF9ImEifQ8cSvKlETiMlYjEXZ5nKpaC3gRTpq2CoV9s+V0SGZtI2eC
	7Gyg+J2TdPkG3tWWsjw/bbcb6XFjJkUiPf0s8Tk2Z3wHxMQs0t57q9iUWRxIt0Mg8RY6TTmfHCJ
	tuHXB1zg97/Ng4ED3DRjGoptfk7XG+BzX0F2uuNkL2S5OMTHJSnvfuxRFKPObJ3ydYOxZ/ndwub
	/1RkElg/L7j3chVM9vEIujI2fempYpfzW0CXoam6RYG+CbAsapL/krna4ARw5X9yGs8V2ypD3kB
	9O7sSrbqYWzCBUcxc1Bp5rYA/E7VzzPZt+lIRF8PujxE4lPgkiaYuXm+2jaF/YWiun0WakRNahL
	Xc4fXSd6NyZNUyLHPyS+SAPGkdy3UsBCO2flyf8L9aJmvyaBBZAst8+iDRpQnNvYJ1xX15RV3Sk
	+l18ANnM5ImPAC+IIiOqnG88kfw320N5qT+nMP2qiI9DhwtUFAt68ofZ1O36iHKWdkbnRADca4k
	BJ+5R59o8PxxiJiQNdTAo8VkOyT1hg4m3nYT4FOj60D2AIdhoYbSip9mxLgYiCNaM7UkUoCpspD
	lCtoe9DefrHfOynhjbxZXbVBELuEFCNDgZ
X-Received: by 2002:a05:600c:3ba5:b0:4b0:a307:46f8 with SMTP id 5b1f17b1804b1-4bb8880f29bmr157832755e9.10.1795272837521;
        Sat, 21 Nov 2026 06:53:57 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-aeb0-6801-ad74-bca0-dc5f-7242.310.pool.telefonica.de. [2a02:3100:aeb0:6801:ad74:bca0:dc5f:7242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm89121285e9.2.2026.11.21.06.53.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 21 Nov 2026 06:53:57 -0800 (PST)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: "Xu Xin (vivo)" <xu.xin@linux.dev>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Donet Tom <donettom@linux.ibm.com>,
	linux-mm@kvack.org,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH v2 2/3] selftests/mm: fix false-positive KSM fork test by dropping init_global_file_handles()
Date: Sat, 21 Nov 2026 15:53:44 +0100
Message-Id: <20261121145344.73908-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <sashiko-outbox-226795@kernel.org>
References: <20261120074230.40269-1-xu.xin@linux.dev> <20261120074445.41446-1-xu.xin@linux.dev> <sashiko-outbox-226795@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Can ksmd race with the child process across fork() and cause a false
> test failure?

Yes. 

The check in patch 3 failed once with the whole series applied, while ksmd ran
with pages_to_scan=2000 and sleep_millisecs=0. test_prctl_fork_exec() sets
these values and does not restore them on its error paths. 

With the default settings it passed 20 of 20 runs. Writing 0 to
/sys/kernel/mm/ksm/run before fork() avoided the race in my own test.

Thanks,
Karl
