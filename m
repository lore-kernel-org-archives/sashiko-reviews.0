Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B7D30D40C
	for <sashiko-reviews@lists.linux.dev>; Sat,  1 Aug 2026 09:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785575559; cv=none; b=aiQtM7cAxWyMgelw6VvG/BaTEOTlsd0lExvxhtH+Mwe3+twvWmRxWZb3gnhlQxzl9/dtq6fw99KpxnMQKw46MkIs5QKpgGvDjcbnazAGdAZRiEEyVU6V4MroxvEcK4S+OD6/N4SxF6EboLgCIFsfweG0jmwY5kmWqzQ5OIYzK5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785575559; c=relaxed/simple;
	bh=WtKwboX1I6TACBp1mPchjcTdLWsllHrSvbiZnJsT49c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aJyTxdera6MSM8m64EjULcBLo9aJlialls983oGdRP6g0CIZR2ezfEezogXmXW1xVSEPn9hD0a7ItvyYeW1kWDAx1bQ5B6XB84803fD/oST6N6MO/+/OQjBpKhVdK2WkpGzAcvNX6jlMCZ9gowYv2f5Y738XGQ9Zb0Wgy7XCQHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=oa9auxww; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="oa9auxww"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso18125975ad.2
        for <sashiko-reviews@lists.linux.dev>; Sat, 01 Aug 2026 02:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1785575558; x=1786180358; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=diW7eq1K5OgM1EddS3mEle0ywoNtUEUmAHB/nUoYXXI=;
        b=oa9auxwwTTWupsDZz/90efEffmKd5GTngd6TFltqoMEBkoxWY+fYszjQYb/fIj9inE
         ZhM1yNZ+rFK1K5SK4Gym1uvPFdbSJs7+nsFCpyj/IGhP2Pp5s+IWHBaUxtJYuJp4SsK/
         4HlHPUClUg/s05Fz8hh8tNpPvo3BkRY+CsHze6lkN6Op74Ff/BJxBMfmbqBwAZK5K3Hb
         jopsSl0P7G09qGhxGbwBL9lu9LwT+OqpJR+mcYLbyky8Etaqcie19PMMNIsQLg+HuHfi
         3ZpJ0wqbiC/3uqEL/WFAow2MVujPNHJ+ThgvtTTi7d6J6ZviyLSDSnxOdJF3OwsKJdcJ
         UcxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785575558; x=1786180358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=diW7eq1K5OgM1EddS3mEle0ywoNtUEUmAHB/nUoYXXI=;
        b=X5I4QORW7it9kua2T8ISdSiMYTlWOdf0+tYcoxmK5lza77TtQ2yvgkDpnPZ0p5VJFX
         +MdFgueYAZWul2HVqSzXCR1YSsLzJaMQ9UBUzbOamOOrUv/t0l9A2K7To6404vC7OEDv
         trySk773ZYCHlV10eKqqnAO6ROUqe18C1uiyh+NIiwsk99L/Zp3Q4tMHOJd66e/aq/W4
         jgBDHAkVb4luI18zDBtk58hHMOHgoyIMF6R3tD0USWCdm77EztVMjVYoBWDdUz21J3nw
         pnD5q7QU1jFFartW8vsS24hoVQLdwURvH4YczaF8Um/mr1CCWzYGmQNtp7exuMl6KLXn
         Hg6Q==
X-Forwarded-Encrypted: i=1; AHgh+Rp3rvmuZJ21ghKm+Avcud0PTBdLBagCKGTOVv6bAoUOldIzvefPxFrU9NwgAmpzk8x0WpdAd8e0D/lNH57p+tg=@lists.linux.dev
X-Gm-Message-State: AOJu0YzwmJS6x7+GrE6Au8S8gBPWRUAxCRsLbVV+cHolqAhflICRPaY/
	T6uBPHnyg8Agco+6DYVh/FmvQ+s1HD+GoSEcXZ9iZHutDIo6CdMJOQc3zmb7Mc2HlZI=
X-Gm-Gg: AR+sD101bI2K6mCzo3XZ49ruk6AwurUOfIyl2hmCFrEn4USQmc69oIQGr4ZPCsj+RCo
	4sidqQQm4zSYDcyD3jnCxm7Zp0Bg/hJWIEIzIrvyZC9Di9yKSiu97jIXIDnYg8tKIcUE4Bxv4y3
	u/e/ywyhImb4FHg+3QK19QlAgFnR8AbDXI1VNXoyBJF9aevR4kJ/1c796SDE+naMIFXeBtJLuvL
	2icRqEGT9FZyPh5kCGaNdcKah3kSgjuOwAn/uj/xjzZsVuNK4T+nEDsxABsyvHqUozG7SNZPgNN
	PwlEaPbn7NPW395MfXC6aY8wAeGxEKetdUtt6jQQHPZAS4nemlN6tsCHte2Hr5ElOJdL5Bw6nf+
	YTLbK7JdFnWYWGIXQB6DcFw1whGzxKtqBzQ7pSkXz52gtutmVS4j1Z5q/ipD97GAS4tjmgTKmsD
	agM9z0Qa/1llUQEUyqeJT+6UbZnplbKpkf4R1SHb4vYk51HacbKK/9fnLyZDv8VtqJtz9fK3SgJ
	CWGYRkA0sk=
X-Received: by 2002:a17:902:ebc2:b0:2cf:bf32:b754 with SMTP id d9443c01a7336-2d05219f1cfmr29858925ad.8.1785575557981;
        Sat, 01 Aug 2026 02:12:37 -0700 (PDT)
Received: from localhost.localdomain ([2406:5900:1044:110c:c329:7b28:fe02:5dc8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04ae60139sm16175285ad.29.2026.08.01.02.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 02:12:37 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: alibuda@linux.alibaba.com,
	dust.li@linux.alibaba.com,
	sidraya@linux.ibm.com,
	wenjia@linux.ibm.com,
	kuba@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com
Cc: Yehyeong Lee <yhlee@isslab.korea.ac.kr>,
	sashiko-reviews@lists.linux.dev,
	horms@kernel.org,
	mjambigi@linux.ibm.com,
	tonylu@linux.alibaba.com,
	guwen@linux.alibaba.com,
	guangguan.wang@linux.alibaba.com,
	kees@kernel.org,
	gustavoars@kernel.org,
	gor@linux.ibm.com,
	hca@linux.ibm.com,
	agordeev@linux.ibm.com,
	netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linux-s390@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v4 2/3] net/smc: bound the peer rkey counts in SMC-Rv2 LLC messages
Date: Sat,  1 Aug 2026 18:10:47 +0900
Message-ID: <20260801091109.1933145-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260801070548.365231F00AC4@smtp.kernel.org>
References: <20260731070509.1818665-1-yhlee@isslab.korea.ac.kr> <20260731070509.1818665-3-yhlee@isslab.korea.ac.kr> <20260801070548.365231F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sashiko-bot@kernel.org wrote:
> Does this early return cause a permanent protocol failure for devices
> with a single receive SGE?

The buffer part is right, but smc_llc_save_add_link_rkeys() does not
read that buffer.  Without a shared v2 rxbuf its llc_msg argument is
&qentry->msg.add_link, and smc_llc_enqueue() copies only
sizeof(union smc_llc_msg) into the qentry -- 44 bytes, which is where
the extension starts.  Same for the delete side.

I logged what smc_llc_fill_ext_v2() writes on the sender against what
smc_rtoken_set() gets on the receiver, over rxe with max_recv_sge
forced to 1.  Unpatched, the sender wrote four distinct rkeys and the
receiver called smc_rtoken_set() 427 times, not once with one of them.
With 1/3 and 2/3 the path is not entered; with 3/3 as well it registers
six values, all the sender's.

So nothing is lost -- what mainline registers there is heap past a
72-byte kmalloc, which is the out-of-bounds 2/3 fixes.

The changelog is wrong to say "nothing beyond the 44 inline bytes was
received": it is received, it just never reaches the queue entry.  I
will fix the wording in a v5.

Best regards,
Yehyeong Lee
