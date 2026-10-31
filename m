Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793485917;
	b=rAiNVLDHGHHnLBX8xZ/juF8H1J3Y0bT0xb5OsrNR2UfULf90ZRkR1AlqL5OFkCDhsf4A
	 MD8Ee93HJlvTd4mqxSFFZg71olikDQK3Z3T81zSmfzCI6R8B4ouKJvTnoLS/AFRj26X7a
	 oWuX2dNZWAII+Jp7U8YYjTYO+epi1vYWa0WM48oEs7qEYMLG6Iz7Sx0RsFbsf+8MQHv22
	 8BHGyUZ+eioV1OTPAHmCeI9QN6srKB93o9WVDPte+qTwjX/i+NSFC8KuA/B4MQF5HoK3y
	 DDOXcX/6BGPtRJqg45YRXdeuepL27OYNl+P6uaSM5onf+0PFmfDMu2fkNwGtC/P4TFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793485917;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:Date:
	 Message-Id:Subject:From:To:In-Reply-To:References:
	 Content-Transfer-Encoding:MIME-Version;
	bh=OEBcjr+1g1r2SdHsW38Cfk4i1ywgvDS8NwTKQTmk5Qo=;
	b=zr9Wm+sTjP1fW2l8qiGkzyEeJGfJMPej9U2OkdyIROm3fBhLHQZiQPQWriTnbXlXRRNr
	 ymU0uew67TFq+k+/46ZY6tb/vl7w0dRatm4mBYmM7t+Zr0GSU+cHEL3e2zWjkhRpOPeOD
	 E2b6JmqoVDbJSGYdSfc+bT+chmHPabXZgOhK7juvQoXk5waEsjr8t7pAC2I67pQltqKz4
	 9biDUE7vJKsjC7w6Pis0r3uaN0B1alzUk2YXevtZ7KlT83rad9XDj02uYqP6phIEggJXM
	 qAnabkpmb4lv7Jsp/eeBvAKRjnG0ueo/Dn2BbeUCdXDgGC0y2bYAk79Vo85ozEeqM4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y0i2npeE;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D78606A31C
	for <sashiko-reviews@lists.linux.dev>; Sat, 31 Oct 2026 22:31:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1D78606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y0i2npeE
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ada8bc2380so818031a91.3
        for <sashiko-reviews@lists.linux.dev>; Sat, 31 Oct 2026 15:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793485916; x=1794090716; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OEBcjr+1g1r2SdHsW38Cfk4i1ywgvDS8NwTKQTmk5Qo=;
        b=y0i2npeEo4mo9WZZ7k5lskcms1Eoa9J21JMP/L1jpVQC667iBup0WbXy6ylMkgN7FR
         XtMTs9KkskcOLuvi1OBwzWPeRvAskSjyN3S7aeVClvSaPC5EK68pTOsNyn1GZk5ckpBj
         47Pve0Y+e3JUEvz/yfupP+OHAv2tSLZs5mL6diD1B9yB0FOnF1JHFAFj5zFisP8op5iG
         J61uIkz6/BNEcew2p8Np8rDrwSt/0iq7QNGUxX/gRBotoWH020Wlk8SmZg0SKwJebOgW
         vZUOlIWtB+b2bq/H6o99IK/ALbzsJNuIBU2wleYOMXUGSSW8e5y78IueMtUWGiJeDfUn
         IP4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793485916; x=1794090716;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OEBcjr+1g1r2SdHsW38Cfk4i1ywgvDS8NwTKQTmk5Qo=;
        b=Ei6LMkS+12xw07/SgD9J9+mjDiYi+cd/vosIFjFfjitkTGgvD4SWkysnKSw0WIKx7k
         CGHO+DIkLWbI0rMXcJGbWprmxBeDQto9lkEfB+PRvJKhHcrfgoiMCJq7fnEDI6Uvh/H2
         RkbkJCUWyqUjwz+GA7Tx6qA4OQmoEY6R+4PshbGbq/cAg7BB076lzC99FWMnQQNQh+4P
         SwPaj2tjfyvfVoqFkQGXFvFH2bDuRgMqB+s6KVSuZony4qK0nAMg9ji0zBLYfNPStSRW
         onUHudL8LFArgdFU312igIAnuG9GhOVyxmOjnTigEA8ejjSwLmx1/M1umrC8VLsQI8Ui
         gO8w==
X-Gm-Message-State: AFq9FYKaKcUeUJs07pfcPfCkUx47uGFfIj2Ppd/BVdZNYJzBkQa6xSZa
	p8Okm2ioGObTiEmHPG3zVG3LX6Mb4bOlTPGNigZwcXBB60ze74JZEr5Nl1DtWA==
X-Gm-Gg: AYBFou3RTE4iteZHApwtJ0sZGPlSyml9AFGm2648ukyMY3HivppKlzGuQp5a0En5F5i
	PkFOkroe4aVEEYOlYzmvWotE3ZKJ1KsjmSbbUdPpe2pH4zVWKit6jFhaFZkNojvdargARSOIKXP
	/jNIeN+lw0Tpi8PJD5fCzxmrKLZb2VpPCe2BKpyPR3DrcP7bTVDQS/eoWD+EkGRY/DMwPsMcnKh
	ENWzKndmNwEDgKcajKb1iHTOXSn62Z9IDU1uJdVtGeaWJkQzBgxFTf8FsM2441kvAoCZzan9gTm
	HhuTnPpxMftCrsARIz33V+iyKn4JvDT7wbwyNDncLvWiNsE2Whc8xm/MuJP7AqMocoixJEpULNy
	xyH5qH09vMhdGL4NEq2aPByYxatXHmOuBiG5yC2umTY5kPerjyZGb3TQsuCe/Dz04OdrWPUU+Om
	Z1qXcHakXyHUbxm2ibqaLMKzV0U4eh69Ya4NsVY3H+kMDT//Z9+ajF3hjyXvEvHOpmIReV2VheP
	A2SPfUbG12AnJuKfQGYgG290HQWC/rQQcv/RRnlKjCINEOmUzjeCQJsXc07GxuG9iMLhiQzTInI
	7Z2U9v9gMkvzTL5M3b0lvNm8WCLayQ6kwkjR26WXQaxN5VXuqUmDDLLlQttYLiTuQJalh7MLiyj
	v9G1pWOM4DAaG9S6EauEBk0cJVm8Ssj5PHGwpxFqHJ1ODNzvj3ioJXtc=
X-Received: by 2002:a17:90b:3e83:b0:3ab:c370:3684 with SMTP id 98e67ed59e1d1-3ae89767179mr4926537a91.30.1793485916194;
        Sat, 31 Oct 2026 15:31:56 -0700 (PDT)
Received: from localhost ([153.61.198.240])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae84542a13sm8540783a91.5.2026.10.31.15.31.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Oct 2026 15:31:55 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sat, 31 Oct 2026 22:31:55 +0000
Message-Id: <DMJDP38EHFFX.320GKNPIMNH9D@gmail.com>
Subject: Re: [PATCH bpf v2 9/9] selftests/bpf: Test one may_goto time slice
 per prog invocation
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: <sashiko-reviews@lists.linux.dev>, <bpf@vger.kernel.org>
In-Reply-To: <sashiko-outbox-192196@kernel.org>
References: <20261031215543.682284-1-alexei.starovoitov@gmail.com> <20261031215543.682284-10-alexei.starovoitov@gmail.com> <sashiko-outbox-192196@kernel.org>
Content-Transfer-Encoding: 8bit
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

On Sat, Oct 31, 2026 at 03:12 PM sashiko-bot@kernel.org <sashiko-bot@kernel.org> wrote:
> - [Low] selftests/bpf: missing __skip() annotation on dummy_test() in timed_may_goto.c

Not worth a respin.
It's OK vs SKIP in the report on archs where the tests don't run.
