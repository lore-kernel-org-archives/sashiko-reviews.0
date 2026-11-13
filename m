Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794542984;
	b=HfzaAYWJ0XplHJk1rtx+FD705y9LILpS050HSsJTAY+IB+lcxaWHZiem2Y03rQ/nYttm
	 ZRlhlSP6TxT0k14yy2bbpZqTV3WoO6eO4qmAnCWSwuNT4JnQrI/XLcr2A/kQZHnMwv+Sa
	 mNh06IKgzSqIoZ3vAdaoNSL1MWYF7n0DbuFUS7/OmgwZoe91Qy9LBKIGwRQWA8+d9n7q6
	 /VjemQQ9Om45MsdVCbbKn4oetiHXpLzbYJMdW5snNIr6D2SJGn7eLOdAZcgGstM59lXMI
	 fBj82tUm/tj0GW6AwdhplsFOpcoiOShZMG0rhrWSMAug1dKyJQgmaGb1XRNrFKaoGhg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794542984;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=XoLZzG396KJyQUQ2LxytgjwSvwf8GibKblRMQQWhxnE=;
	b=kDTjm4ZY6qE8rqfVKaFEIYzq1+PWM/ejoKKDEfPSs6f2FK9ZS0CuvRT2hpQrXeAFNqh4
	 /xf5thTZLn3K3bmKwN0QUXu7332QXCLnZI4APZk5TL48b4GlfomOLP7pTd3Ju4XjCHFuZ
	 7/GCwEkPIvupuN0KIKxwAFgkf/1FCRzb/cZbnZ9yycul7WyHyh/YbU7MNTeSqG9AV6jyF
	 EmY8VNqod+vIymfLypYvngIR1/L3ubJSwVobqvvysrmcfJTwOaKqsP0T94yGMrkXLmRDc
	 oFiHlJMRNsJKM87TYXJCM+N7p5QJSvDjWrJRyxmtUWOx+bhkxJvTpGT/EKXuLRsoFNw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GzLPPwu5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF358606A321
	for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 04:09:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF358606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GzLPPwu5
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ed0e2015aaso3021585ad.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 20:09:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794542983; cv=none;
        d=google.com; s=arc-20260327;
        b=W9VOT9ZePJHP2IlmbbwahntqM3Mivrsju/ZEIQLd9N6DKpJBYqKXfXD6k86fIyVoHl
         8kDOtdGFinatPX5ZbPUrqkEHkJTXfPSxxyhbqKAKoeP20gwIxwWyucIbQLJodtk/2zpV
         oOeO2S9hjTFQ+fkl8rWwfbvjIbRLNHV6qTjgQEqDZJup5WecuPRCmsEr9/QWgnf82l2k
         5cGB7LNni5emdHffEF+v4UyXq082SVd00v/4Go1u3ynk4/qYxE1YOQ5Pu1rcydELJ0oh
         AFbJMSrR26hxAUwSnMiub64/A7zCMV1g+qLx0q3btLBE5k4g5xGBsXBRYYnCXLQ3ak7i
         Imkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XoLZzG396KJyQUQ2LxytgjwSvwf8GibKblRMQQWhxnE=;
        fh=j7qE0RlvzNR5Qm6xA4ehUDBqPqcz09gsE3Wa6zaxdUU=;
        b=rcQH3TyPswLeh/NZuZFaz29oRzSJhyXApRK4zS31+yxT5n3U+RonsYM1Rc/8+BUyvt
         XJyTt2LVnhZMEorlClAFW3uYWtjBuaf34g/u5nmlwgYPzm18CIH4BTp+++9gLs1bVMIJ
         bS+y7pXgxUHl6C/jGrhkCDMY9uIGt35nXPwgl3c62APE1BJ/s4Uq1VsQ/Ixq0KzQB5Hn
         FVNV6whwhm8+66UwwGDLVVxwbj3OxY6u3rsF8KnmlmQNj5yUWdBC62dWLT3xdcvz6PIi
         GL8ViyZmO3QTLTDUhF236Od2ECownwwOi01npVGdAoAT88NOaHFwkHIhWzEzKu2kNG+0
         X0Pw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794542983; x=1795147783; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XoLZzG396KJyQUQ2LxytgjwSvwf8GibKblRMQQWhxnE=;
        b=GzLPPwu5UhBFuzwzqFYPIQSA201sDnQkqHEv+qjhQH27tsKhAVTxzq2nqD3WnyRXy4
         mbtBBdpXXwiU7ArlWM5WZdbqRl1a3q40iJuoCaa6yLS73mAX0p6fabubNly3kq4M9JPD
         cZcNEaoAPA+eYUXY9etU63IYmyLTqDv6PeW/tSmWfZcnICoazoNUsDQc1zdvyqXhbLjf
         hwSBNK4Ute+ymhKK93sq+kZ0GqxghvUSoDMGZ9WAxQiBBg7OPhu59lotlWQofQP/rNOB
         yF9gp1QqE+UUQjQQZBMoWfim2m/avPKwIOWmVgMl9Cad6cD2cOqjLJNWwLnkHCCCFNz6
         XlQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794542983; x=1795147783;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XoLZzG396KJyQUQ2LxytgjwSvwf8GibKblRMQQWhxnE=;
        b=YX1a+jILiUkwfiJMTegWiVaovcPaXEkYRLivxcg0aZWHTjn/aG2MtUoXFLeT4vLcB9
         Z9MztOt1kDjwybC8Gl8zP7vOTfG1kgt9+gGzi1CUemqglCPSwMaNZY9yQolbh5MmRpAF
         Fhz2w8gVXzkkY+Naz95/yd3A+vlmLD5QkR+WFBgs+tIaxIwuX+pa43aEw9ZcrU/+mo8B
         Sf2Kipje9K1CY0o3E8bRh+DWNeXwrPNvjVbBAqEbmYyWTjGSuFm3KUgSOI8xDzcLHaYA
         yEOuPxu8pYurX24onnA+m1jx78omEMCNAYGKHEFHvJ7dNN2uxs2uGPiOlYyN4Mviwr3h
         OqyQ==
X-Gm-Message-State: APuU4Z8eE+Uc0PA53dwUv3QqTsMyI+sauynL8LWnV8fwKTrOBMh8lUGJ
	qmT/4rYYsPa7RL/P4TWrGfOkQzt1WZylXNEuN0Rm0RPwbFhMNxzT1j5QFWKyBGTbbsE+zLzD6SB
	ScSOI0d/LbrzqJS+kbsnCpCoJUZd70LD24DAy
X-Gm-Gg: AYBFou1su9V4PDnkvBzmyTclxgAm+U7MOET9Yg3f8UcjQybggjlEzIoWSu0whf0sY98
	ajIMnOQEg00oEgTTLxTbf+y8l0IsPbPXfqu5Ag+tSo+vPz/0veDHWu5FSSWSsbqTKcFfmtLAt4K
	R15eZ25rlmef9H4dIGkPf/vJcvfbDMedF0BetPL1tH33y5RJ7eHfwDIRXAHfbZ7LhSypPcHGuvS
	PTMDqAKRGNcbznt3rWTaxWg5SvSzYKkGnhGknpQfk0cEEhmSgtDjPTai3ynQC+RO6ddM6gOw03u
	nowOYFptrcexDX1JL+flP188NrYQAnpRsDJNV/+UV1pPC0b6KHylC6Ut9CJbRU2euCng/J4z8+d
	1uv3Ik6KMlvf/dk3uZyrNuoNUj1VGK243F+O2V9KbI+XZ92xefVpg7O01j+NeEpJxOeppdBcwvB
	lSBDdZzoX9Sat8EAVmZTRnotXRiD4NIF30hupzB+6gc//H0VHf
X-Received: by 2002:a17:903:94c:b0:2e9:8202:5083 with SMTP id
 d9443c01a7336-2ee0dd6dec3mr13813135ad.55.1794542982803; Thu, 12 Nov 2026
 20:09:42 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261112105116.32274-1-phucduc.bui@gmail.com> <20261112105116.32274-3-phucduc.bui@gmail.com>
 <sashiko-outbox-210979@kernel.org>
In-Reply-To: <sashiko-outbox-210979@kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 13 Nov 2026 11:09:30 +0700
X-Gm-Features: AclHuK_FT4t-gHEPN9lEz3pFi9xgaYKjHallEH_VKLm5TSQEzrOCBtvH2q8fMTY
Message-ID: <CAABR9nGRLeSheafnue9UONDT1My=d4gc7T93gCYxsoR7_SQhDg@mail.gmail.com>
Subject: Re: [PATCH 2/5] ASoC: fsl_asrc: Fix handling of deferred spba clock
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> [Severity: Medium]
> This problem wasn't introduced by this patch, but can [1]
> fsl_asrc_config_pair() leave hardware registers with stale values across a
> warm reboot?
>
> Earlier in fsl_asrc_probe(), devm_regmap_init_mmio() initializes the regmap
> cache to all-zero defaults without issuing a hardware soft-reset first:
>
> sound/soc/fsl/fsl_asrc.c:fsl_asrc_probe() {
>         ...
>         asrc->regmap = devm_regmap_init_mmio(&pdev->dev, regs, &fsl_asrc_regmap_config);
>         ...
> }
>
> When fsl_asrc_config_pair() later calls regmap_update_bits() on REG_ASRCNCR,
> REG_ASRCDR, REG_ASRMCR1, or REG_ASRCFG with a target field value of 0 (for
> example, a 24-bit audio width or 1:1 clock ratio), regmap_update_bits() sees
> 0 in the cache and skips the register write, leaving the hardware running
> with non-zero dividers and modes from the prior boot.
>

This is not related to this patch, but I checked fsl_asrc_config_pair():

- REG_ASRCFG is volatile, so it is read from the hardware and is not
  affected.
- REG_ASRCNCR always gets a non-zero channel count (channel_bits = 4),
  so the write is never skipped.
- REG_ASRMCR1 is affected: with 24-bit input and output, IWD and OW16
  are both 0, so the write can be skipped and a previous width kept,
  e.g. after an unbind/bind.
- REG_ASRCSR and REG_ASRCDR can be affected only in rare cases

One way to fix this would be to write the register defaults to the
hardware in fsl_asrc_init().
I would prefer to keep it out of this series to keep its scope unchanged.
