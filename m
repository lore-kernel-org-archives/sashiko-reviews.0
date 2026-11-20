Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.215.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795170551;
	b=cGQq8dYAHX+bJM51WAy6JhWXVEAdwkhO91xnviLW0oKVMpUthtJkmXvVppZyU9p+HGPP
	 dESueupEBNZ1vqwgg7R8M8CDhN6uhc59hKyE9IPvR9xYm1Qai+6vbGTeGIbfzw9DvO8FJ
	 PaszsOyj8rRKPSkqfUTqnnUJAx8yTDWwU1p4EeDQi2Fyi63Gz0nYbOPgpgbFIf9kYAEwn
	 PfiHDyA+kAyN9S973hvnJxoFX+strPdiNo7PLi9efuY1y4M3ecISmuilWsynwYNiWm91r
	 34oiCtElhqbQTUX5bTRRUwS0d0hBzsdUYTwZuF0Dd7x1uCm+84ENOATpbYfbvFyUCCw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795170551;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=uVsgtw9AnWofNH90qnHhiYcpUjxrPNJEDFOgQ0n6Gqw=;
	b=AvhKQXtbGlA/864C7jNhol+KsaQZs4UK+L4KddoizZL0NCtuF2a+uqIt9fPyzbowRvvo
	 UcuIGAHBXThERtsixA6wrWFg2iIFCP80PhUqPWx4w12airzUTy8p55GBQ06BxqjOKzGVW
	 9p2cTvcw7lf7TslDQmLpYMILeBD5mvUGLNnQG2trLhmWNCN43MWcxln6J4iYirIpukc+i
	 QurwE63cpgaMzE+ZUXBTcEpdWbcwTZD9YCNO25nwTxJKFq8zy/Q/elPhOcFDvL4Mpi8Mn
	 GyymwRtpWX61Vt70Kihdm7Uhi5tc/eUsj9snSxn32VppZ0zUFehTiH+a8gIa8UvBwLg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="J1Gpe/vb";
	arc=fail smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D38606A326
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 10:29:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41D38606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J1Gpe/vb
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cd6acc50b8dso399332a12.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 02:29:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795170550; cv=none;
        d=google.com; s=arc-20260327;
        b=rColZkrXs14Jhf/670VSCWAeK1bWgV75pig2lPtilSCVx2+hacNXKgIzEASpJXsGOy
         /YOo0ksx0OEz4bW+4PDWN6PLGT1oJ+fKjD6FeNkmwnvrv1oNM65+UyMasOXEg1GFCbjZ
         3IWIpnVmoXOChX5nvNq7GBhMlCIw3rvZXpAvLpLxj1+JqmnqyquzCLqh02MCCJ985J5S
         EslylESFIu2Z8TgdAJmEieAADXFHDQT0mEk6xjdYp2dyUCq+wEAs378fRm0rzg2REUoB
         rhxfC0Jdi9kG1bM3pVEXQOoE6cd0LBn/zZ908XJ5Ed9R2gVg2/n3Kia6OnmMVtXEB863
         VH8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uVsgtw9AnWofNH90qnHhiYcpUjxrPNJEDFOgQ0n6Gqw=;
        fh=j7qE0RlvzNR5Qm6xA4ehUDBqPqcz09gsE3Wa6zaxdUU=;
        b=WUF6dKWV3MOcJAAMmuWxMuywm2TdTX4QPUPkRBEddnNER36f5vCGmKHjFOymF+atBL
         /O/AGWrSLij1W4bbfaAecJJ52+4726R9uQUHKIL/KVbAp4l66E5bYL+cKe6Q4zE3qV0/
         eaX5u8Fs1iHnYYpBj13aLoHlSFi1yzcbQDE2ZZ/vsUXV8VoXnTBO1FwmWCruH2J3s2oD
         G9cMiHHRMDMgEsiLDLI7w5q2mCcRVEFY1Qg3NG6hMAJ9r5J01yWa91eLfEUGt9E9pJxQ
         MNf7cZ/YEVXqXwZXzac7ecLP3mIPpR0wmyOzVufU5SLKAXI1aJKIAWyhoicABV0g6Z5x
         jkuw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795170550; x=1795775350; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uVsgtw9AnWofNH90qnHhiYcpUjxrPNJEDFOgQ0n6Gqw=;
        b=J1Gpe/vbRdwqS7JbWX7rmzaVi//YKO0jW1Jq+zN6I9AYxx7DXUIv8mAZlY70jl8/QF
         JgFEHhaz+bC8gBJz/BPJ/zuvJ5DxXiSUPc1gFV0LyIx1z0g0I+vgcO2n4NC0l35WU/7L
         gZFoDbLv36il/CjLCdPnafvskezoTdVS+/LolLQigYUzveqBozY1sp2NgXF61iOdKnjo
         r1TMelFw6kuNBpsMPQNmnZbtj2LFtFZXqv9wOiYAkv+hZ7Rui444jyI+iO6eFvB3n8LA
         ARk34jK9rpGqVfUXRN5og9FCnzYsvcDy7mcfLPK/ik7/ajpHzzfyoAh4aP/TNefexXzP
         YtJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795170550; x=1795775350;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uVsgtw9AnWofNH90qnHhiYcpUjxrPNJEDFOgQ0n6Gqw=;
        b=qsPFC8wcTwEyyt3lH7syM2/KDbg0kf7wKhwV00daHKzmKLUpFOKmUbcPx+CWRSkIF8
         5jPtaQ6zBaGJd5+ZkuffWUHq9QD+yeFdbPAvajhNT0NZ0inbf/BxoOLH/f1ulk/Zsf1P
         PXwkPLLUQjJ3uZchXL7gQFB8EUm4VbD2TecbGDenhT7bBAktDJ0hpyCB3rX9aZClvB1c
         tPVdX6k3vDdV0xBW8tFeW5+tiSvKL9hjTgrwz/+8Yb8Mjn6fAbli5n3Tqig5NtWMEyL6
         vScIB8CIMdDO8QLKeDpUKvv8NvgJobGo6iy0h9Nnn8NKQ9tWPHp5erGD8vWEYTundI1J
         3nnQ==
X-Gm-Message-State: APuU4Z/uxsq/K2sgY4cnQZ+pM11TDGtWzCSJ8fkPE/A80G1giieT8Maf
	MzWxsmL1oTey730cLH6SFHEcbNv/EtF4XO1azyH6VJnmPVasi2CfcNgnRiNptPOTkqD6nwgcBi5
	+b8UeSfhl96ohwRCXHklBx2RziyG6j7PA9ZHK
X-Gm-Gg: AZFdTZdswZ+Ft/q4hMjpXfExZ6qG9/sRNrxmi22tMyrDUognZE2GuutE+VC6gvnJ0Io
	jaGcF3Xbi9sfpHFCzTZE5aw6JoDUDLg65g6W0uuNSE3fka4AxYpypZdfAo4wkXDAm+t8WosMdQR
	l4yLts0F6RWHHSXTrHZ5AQNqziOo3TZGkXeknW0FGviR3LGwcHAcSJvzXxQAMjU/FUUM8MPor7X
	Mcmf+T7R+jHRqbOESDt2iW3XgbLABocqcIOhWWFKPc3F9zu4Mm4Fy8qCr0q8Gw8Ba0BxuaaOgmb
	F36I25EaMS6bbc+XRidEuEmdKQr5U0QPyRxm+PWVLlfgZQw/+8C3P+De+JMlaeoUs5YK/q23l8Q
	IZpY4/4JGP/3Eu9n+bLvqya9NErMP8iGAtcA6SjLOVDdi59wPJ/AqCWVtsLvH/IPGAZhInAUxxh
	3soliTM7A3PAiBZFCDbZI9EYgCBGja8IejVl+M+2UUxFuiOJJD
X-Received: by 2002:a17:90b:264d:b0:3b1:bd5d:53a9 with SMTP id
 98e67ed59e1d1-3b41c9825a8mr2178054a91.63.1795170550564; Fri, 20 Nov 2026
 02:29:10 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261120100408.8053-1-phucduc.bui@gmail.com> <20261120100408.8053-2-phucduc.bui@gmail.com>
 <sashiko-outbox-224919@kernel.org>
In-Reply-To: <sashiko-outbox-224919@kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 20 Nov 2026 17:28:58 +0700
X-Gm-Features: AclHuK-SrE20lDTbd7YPskSVweT1_hnxLgkilNwL0_Ve5O-b4yK8MlqO-HwVMqo
Message-ID: <CAABR9nE8o6h59mCJuSY6RGKGm0fme6qLqCZj591OiRArRapcDA@mail.gmail.com>
Subject: Re: [PATCH 1/2] ASoC: atmel: mchp-pdmc: Mark IMR as volatile
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

>
> [Severity: Low]
> In 50291652af52 ("ASoC: atmel: mchp-pdmc: add PDMC driver"),
> mchp_pdmc_regmap_config did not enable regmap caching, so regmap_read()
> on MCHP_PDMC_IMR always read from hardware.  Regmap caching
> (.cache_type = REGCACHE_FLAT) was enabled in e8c8e9de4ee3 ("ASoC:
> mchp-pdmc: use runtime pm for clock power saving") without marking
> MCHP_PDMC_IMR volatile.
>
> Should the second Fixes: tag reference e8c8e9de4ee3 ("ASoC: mchp-pdmc:
> use runtime pm for clock power saving") instead of 50291652af52 ("ASoC:
> atmel: mchp-pdmc: add PDMC driver")?
>

Agreed. I'll update the second Fixes tag to reference `e8c8e9de4ee3`.
