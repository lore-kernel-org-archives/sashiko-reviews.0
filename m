Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793153712;
	b=WAauB7l8JBMvRME3249ZvLxhFLdkjqE0rLdIuGDABKz8i7mwMaujYmaRTzQkYen3ZdUD
	 HJGvJ31zqSM2C6Swt3+J2iymyNrkMDx9JSite7UI4LmR5h4F2Ml4OwrCPF0Y65pvc/FXJ
	 DjUWUhDJXFgs4WTnd1W4RhEDttQKakzqpO23oF09cjWm++W3c9hwLS2Jn5Oy9UpoD/uRV
	 tO4LOPMyTCzf1Z7UQtsd+Vow7nvusu0jiInPIur/6hoSMQdpFD6I4A8rklj1IufPaVCur
	 qpsZuUWcbNOF663mPjYhvhBv8mr/iSppKu24m0Eoe0YQAaMn1AQlK6Rn8SJrl559FrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793153712;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=4RXr0eZvl846M4lb9Zzrqm6kbJUwTNifrpHwF24NCYw=;
	b=T2rnMsFEcKRZqj6G4KawSM3XigdzGXyMrHNIW61JOk+v6+tDvO4ZoOUUHO3fy2hIkkLO
	 EXmlpwiZ9gr/wGbrVQv3SkoVR3GhLLFhSOtLYOH0kGod1aeNye62IzCulW28yxBTi4+Os
	 NyPMUSVNGxpjjLNTy3Ms3vx470EOAQpCX3QUWizgtEYTKkvREhV2GIGKrqY4Buq1kSsFi
	 quZFcCaYahlc2TqL8ugEqUKi7Uo7s3nT+Kk4PFmBVIxsjgGtb3qMKyIwQy9EoX6UE0ilJ
	 PrMilJgZmUMM/z6YHreK1GSYoXWsxWc28aBjd+37szs0UMdi2ugh9zE3bFERvTS39Kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lr2ukMTz;
	arc=none smtp.remote-ip=74.125.225.132
Received: from mail-wm2-f4.google.com (mail-wm2-f4.google.com [74.125.225.132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9E4606A323
	for <sashiko-reviews@lists.linux.dev>; Wed, 28 Oct 2026 02:15:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F9E4606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lr2ukMTz
Received: by mail-wm2-f4.google.com with SMTP id 5b1f17b1804b1-4a20fcb3e9aso507245e9.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 27 Oct 2026 19:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793153711; x=1793758511; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4RXr0eZvl846M4lb9Zzrqm6kbJUwTNifrpHwF24NCYw=;
        b=lr2ukMTzv6DOtffcSsJr+FpKRJl6SmHTYd6zOeiMflxuM9i28WugcBj4jDGBn1l22D
         VRczeS+RK5YKJW3MkekRV0JSdwXIEWnGwg4MkyGSobyiEkyiQ+0nvxhrUgamhRoXlWaa
         mK+UYIafPg1NRy4yrx2zO5rkcFYBBBQwK+tJuSNwcmPUSb4wIZckAhkM9u4145mWbtsP
         TEJfYfMLUt1l8hber36DDLrHFk5cHtAoj6dbQEXjXAxXjhsAqym+3y9WGeUihxZF8Kd7
         p8kTGiHh6NzD2KuaMvXsIIQIdLGqwCmGPnWjMek6sw5aC5Ab3cOUgANvrTXqnu42urcP
         maww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793153711; x=1793758511;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4RXr0eZvl846M4lb9Zzrqm6kbJUwTNifrpHwF24NCYw=;
        b=R5E12SIBDVmteeNgPj7ZtwQAD+he5sRQqdJgmKwCqTTFth05bEq0PkhmB1xlC7tmiD
         1gWmrMtzVvgtz3ovBC/ldpcvo/RQQ7uzMz+k7NNzDwesnD25liredSPTte8XmvowA31J
         igUDTD5Y1WVWKvsV/9d7879b2VWFENwYkqKtHGePlISC/7KsxRhT3nHbHbFoRlAjvSkz
         bxVtDbbOPOsOqQpgyQJznesprC3YRkaIkqMd3ioMmXD9DkUq0mryHejWDFHYrsYRXPh8
         VMe1l+gRhEXCs073wX4Hvv9FIv7zlqrwk3SVLeyOf9ygEx9ulCTMR7EY3Z0G0GRFaLyy
         Gq1A==
X-Gm-Message-State: AFq9FYILdtozBQlANw8yYifp78kGCUf+Q8QyxewN8LG94GSnkC/+n8ma
	h6ahRxI0zXLxldn3GCbsLLE1mNJBrhGh5+IGVIgtYhRu91BGTHMyVHLzHf3zfw53
X-Gm-Gg: AYBFou1hIuvL+bnTzhk/zmSWoMYMNjr5C5EZFJTuTfhiCQMjOyf93YPOXUWZL3kMAur
	S7+WY9CG80i/KVsg4U7D1Lfz6MsPLNeSlH7UgaVFVXFOGWwOj6crD2cttOqsfmRl0r7WeMLQ53V
	Ss9dh5vE3h7I+TahKtut+SGAhDtkZNwGGGzNU+2zVyiF+Toa/sllR/kZH3ZX/XYz/N3KAgZkSNJ
	7o5DrDBxrqCmfIwhJ28A7eigx2jqC50T40oGetys8gPilddefuiDVfWPz+ujaPf/6klopdgz+9m
	+ISWe2kIeuBP8SRMtzEol665jA07+tkoMs6yF5fLDHnkbp7GZ3HbDueHm1sPFw8WiTm923tuzjS
	4QW8JOhVDs5waHl6xyxgGVY6IdUiVh/bF1McO5pDsX9WMypWHjTHXvwQdh8UODsKlo/8bQ34seV
	LE1wu5mn681zkoI8x1Tpq4iRx9Psk0TgPual5tAtYlOY7Is6mYqtc0MmKtTgcptJaOglvTgNA7m
	4vYABs4hcD6XUsqjwq/URGu90OMQHd1nis3xXrVOA1N8UP/WALQM5V7hbIufaOyqN69IK7l3Rn0
	fm9yZUgOwI4p83nera5qAgrsQosXeRxXX1lMZ4s/+x+1dcnN3Mn8+3qQ3ygcs8EZ9UdAA0Rl3Q4
	QUbDiMHDDTvjGIDaraSV4wYZLXcfacz5aOELlacGUYo5zOzrDP5Mj64Ihl1UJy7H9V5n78TLHKj
	lFLL3HHxV7nZeB6w==
X-Received: by 2002:a05:600c:34c9:b0:4a2:10f9:37db with SMTP id 5b1f17b1804b1-4a9965cffa6mr7755865e9.7.1793153710887;
        Tue, 27 Oct 2026 19:15:10 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a977edc0fdsm10880365e9.5.2026.10.27.19.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 19:15:10 -0700 (PDT)
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [RFC PATCH bpf-next v1 02/11] bpf, arm64: Let the pad after a helper call have r0
Date: Wed, 28 Oct 2026 03:15:09 +0100
Message-ID: <20261028021509.1203900-2-memxor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <sashiko-outbox-187299@kernel.org>
References: <cover.1793147364.git.memxor@gmail.com> <f86599ab5644a86943345b2650d1d11a0363bb6f.1793147364.git.memxor@gmail.com> <sashiko-outbox-187299@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed Oct 28, 2026 at 2:02 AM CET, sashiko-bot wrote:
> [...]
> [Severity: Medium]
> Can this leak ctx.landing_ex if multi-function JIT compilation fails between
> passes?

Right. ctx.offset leaked the same way before, where x86-64 frees its
addrs; the next version frees both in bpf_jit_free().

> [...]
