Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14913AB460
	for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 04:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790136147; cv=none; b=V7bc4+5C5DRX37x8quKTsAeS4x0Qq5WGW3RP9Av3wjsSMKshu17K2Z28BN/5Av8wYfWKcOAZhfBPdR7EHXS8sV7LF5dAsXBZbS88zFfhkABKEEPlUF/a6lnNEx3DjeGrVH0fk9Uq1oO6yhZakRVfInkGsF+Snn1y44YFPVSvY6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790136147; c=relaxed/simple;
	bh=+2gcuAyVI0aB8Lvcu8fN4nAMd9TizkviE8wvySatV6Q=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=iRT9auzLcxzyfhFbIBCQQqpRz4+H7nK8nGANXk+aMWAlgB10pzic0Y96YNbL+Hsr/TH8pYHFRsmkIfBisnuey/gdkFbbfHI7hg5HKwY+E2bpTgpS8pPO84CQ7ZlQjfX1lto7ro+0sMDk9AX0xRvkm8zHxtpztl79uKEdWczUe/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Peq60k5W; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Peq60k5W"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396cccbba92so384813a91.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 22 Sep 2026 21:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790136144; x=1790740944; darn=lists.linux.dev;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=smyTmmEYYTZ4g1y6GKgMxOvAyTt9OblIyZ0tACnM2DA=;
        b=Peq60k5W7yuObxHsxmzTNq0nGA9opbtLRhjdqTUJfb3ywAa15PD4IYq2UxgF7qL1aL
         dOAMMzb668oPA8XHlIZZ8MyKu5TNhRMCcmy7XrmrRYYNxgAm9z96TNmAoL8TmDx8rE0Q
         0GxdZj3QzvnJu+s42/OXoMw48ib16x0AKpbt+ZCHak8CPARRDo1rBQxYb8uctMzRGdoQ
         itF5YtSnNVQr7aN1ijw977e2fmEbCeE4/4rMF3S+fXVCPYvPLGJXgO9wTpyxuDlhdJd1
         m3+r8QSh7DoAV3Ds4kuKc/5H8IE/c/3UzxqkGTLzt3kRpyELGF3pt4L4B4OUVDCegGXM
         Gb7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790136144; x=1790740944;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=smyTmmEYYTZ4g1y6GKgMxOvAyTt9OblIyZ0tACnM2DA=;
        b=dDrYy7fu4Ln3ulBbN0o6S6A64BT/HOpSgxbICtg8c1Vu112FkTEAUIB2c0MwaXJHE2
         +2p9uGPxhlqOZmqYF54DbsfGpNUJ5qLhV2LA5LW/nXs5nfQlP31h7AJ0x3fqkZ1PS+Yb
         ItsCqydUDl5wxy4EpDHq2nQazTpMOiVxYipLlaCJERotZt0hsSDKa1hdisxX8HqmykJb
         Aw73JjaZvM0XgBJ7vqEyO3fG6EWiib+Jh4BWGKGZmqDBBlzKpqUdlbHSMyMatymMRlFu
         zPt+c9b8qBHE9rIKwQR94ij1Qbwc1DkX7uE9Llm/a60ZJHDW0D5KHIoVPILPTNeJQneO
         AucA==
X-Gm-Message-State: AFuF++n1495oWEOVYnBTw+PfXD230qjg4rHFYERQCG1dheD8qaxH60iO
	THbjQIYEERtzDXmo8uSxvJhfyPsmIBtwT8LjC9LQqxEQ1ChMf3JpeCpP3NOXKQ==
X-Gm-Gg: AYBFou2SwanQi1oXAjjnpHNno4AOr0VMDD1Sg4WZY5qPSh7g9COhlF9OwR8O+mRTQ7z
	ofpKBwpyjSU3gcV/MEdvduf0xW0+b4R6pzuSvJpY/f3IWI1v5MFhI2cXbMoVaCLWuhvNT9A6cFv
	kzkLmUx9LHVmi2wUGJa5fF2qOmNKlnZSO1Ar7ApM0qnVXcOx2+Ha1YNvaoUevs2atFZoGEYOjsK
	JgpPANSdB4WUsWfzZpKBh2ZNuTpTx88omyQ0JK4vGO6uyeS0Twxll7+LDLNAOjolpZyfT/2GUp3
	fPxFVMhHNWT8dBo2bVDE+X742bZzUyBuNkjpap+oaLJpsdkYvfu3tbZfbHMfJLrAIMF8SwLgCNT
	A2YqNtgO0qs6c6E6ID5ygYdtj955NHSketRpUtktijuATWk94xOKiT4mI8V2MIIeieK+SdYYDTT
	oDF0IjVPRKQsV1BixKoDqdiAzuy/Y5LDIK71IxM+KyboEpYqyZvqlVUx7+77aGhEejWrYy02w9B
	Ron+LBtDq3TmeolQLA9MUbIYSte8BsL0VhMOXd+HYelsawsXFxcN8GTCVRkrMujbC7iEYgEFfHE
	IZWTaUCQlkAdsw==
X-Received: by 2002:a17:90b:3e82:b0:3a0:42a9:9c78 with SMTP id 98e67ed59e1d1-3a07e6144c4mr1293140a91.41.1790136143761;
        Tue, 22 Sep 2026 21:02:23 -0700 (PDT)
Received: from localhost ([153.61.198.251])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07db882a5sm2431467a91.1.2026.09.22.21.02.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 21:02:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Sep 2026 04:02:22 +0000
Message-Id: <DLMEAUZ632XP.210Y7S9N70NHW@gmail.com>
Subject: Re: [PATCH bpf-next v4] bpf: crypto: Use AES-CBC and AES-ECB
 libraries
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: <sashiko-reviews@lists.linux.dev>, "Eric Biggers" <ebiggers@kernel.org>
Cc: <bpf@vger.kernel.org>
X-Mailer: aerc 0.20.1-349-gb940a4174a3e-dirty
References: <20260923032703.59816-1-ebiggers@kernel.org>
 <20260923033742.D45A81F000FF@smtp.kernel.org>
In-Reply-To: <20260923033742.D45A81F000FF@smtp.kernel.org>

On Wed Sep 23, 2026 at 3:37 AM UTC, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] bpf: BPF_CRYPTO is silently disabled if AES libraries are module=
s
> --
>
> commit 1bcee0286f1c7c6c86befd107081ebb8a0fb0eed
> Author: Eric Biggers <ebiggers@kernel.org>
>
> bpf: crypto: Use AES-CBC and AES-ECB libraries
>
> This commit reimplements BPF crypto using the AES-CBC and AES-ECB library
> APIs instead of the lskcipher API. It adds a new BPF_CRYPTO Kconfig optio=
n
> to conditionally compile crypto.c based on the new AES library dependenci=
es.
>
>> diff --git a/kernel/bpf/Kconfig b/kernel/bpf/Kconfig
>> index d7d25477ef481..a44ecfa3e9ef5 100644
>> --- a/kernel/bpf/Kconfig
>> +++ b/kernel/bpf/Kconfig
>> @@ -91,6 +91,15 @@ config BPF_UNPRIV_DEFAULT_OFF
>> =20
>>  	  If you are unsure how to answer this question, answer Y.
>> =20
>> +config BPF_CRYPTO
>> +	def_bool y
>> +	depends on BPF_SYSCALL
>> +	depends on CRYPTO_LIB_AES_CBC
>> +	depends on CRYPTO_LIB_AES_ECB
>
> [Severity: High]
> Does this dependency logic silently disable BPF_CRYPTO if the AES librari=
es
> are built as modules?
>
> BPF_CRYPTO is defined as a bool in Kconfig but depends on CRYPTO_LIB_AES_=
CBC
> and CRYPTO_LIB_AES_ECB, which are tristate symbols. Under Kconfig rules, =
when
> a bool depends on a tristate that evaluates to m, the dependency evaluate=
s
> to m, which downgrades the bool to n.
>
> Consequently, kernel/bpf/crypto.c might not be compiled, and the crypto
> kfuncs could be silently stripped from the kernel. Existing BPF programs
> using crypto kfuncs will fail to load with "unknown kfunc". Because the A=
ES
> library symbols lack user prompts, users cannot manually fix this by
> explicitly setting them to =3Dy in menuconfig.

The bot is correct. Looks like a regression.
