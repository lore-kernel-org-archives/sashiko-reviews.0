Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE783AAF6B
	for <sashiko-reviews@lists.linux.dev>; Thu, 30 Jul 2026 18:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785434819; cv=pass; b=btjhqBXwqeZWbmzVfPtYlKlqI2zZvEsOrxYYrVxDVGsLt0GCkY+SNPZQFuwC8gMc505He9/DhyO57sH+0btglvoGXLwN/OPDDiWewuW35ZdcjIelxiYjDftqdFFHAqijq0ZZfwjtny7gLvYQ08oo4KzI+JasGrkq9Jd1o8UtPrM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785434819; c=relaxed/simple;
	bh=dEihRTHtQ5+rqzTB5gZENLrIKf/vdVkf+94K6FYyTic=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fWc5sF0qy4GeS8rKd1gH9evTVpWI03DASnXGamkvJ1I3FlLDcY9UE/ehUfGWljvaiBk6OnLP8Tyruak8QX8CsuoAV3NrsEarJNcpHKewPMgyk+WQ4bdFC51xpSaHYo/Ci4cnLe5kKh1yrJfANV9mGwD3ZIsQyyQY8tU2ywXG654=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pAnY8WxG; arc=pass smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pAnY8WxG"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38e347638adso273226a91.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 30 Jul 2026 11:06:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785434817; cv=none;
        d=google.com; s=arc-20260327;
        b=heT3nMSdY+O64lmzq5HbYcoKZOJKpj7rvRoS5Xx1/jWPHUBZTjZ2JqzcaO8SWN7YSN
         9xzzMYPSipUBnY8+k9yCkGQbLUr7KEovz51Hyhq1d8MFuv7thHFApHKyle7F15mlfFv7
         j6+eUOu64QYSj6ofHq/alCOE+UN2+wBqwrVSA6MLdA+frww5LYw0+iQINzUTpw//v81R
         lU349e9lY8RXnWplgE+aDvPb14nP4OlsF6dEpUQYUBg9ajsaC7dwwivFhqZDmT9KUcTd
         EqcUB4sBSeWkTHB9RiOMYhz2F7mOXXf052SWtN1LEoD/Ng3Bu5LIo5dVvHI+99P1Rr2m
         RPKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:dkim-signature;
        bh=ksA4Cb+zc98xgjMVnrwp9nVxjWZKE5S3Fc2xP42UsGM=;
        fh=tiz2sWbDPPsLahhiZ1KQAdEMgPLocV7jB1S8kZKnHXo=;
        b=WWkCq8bYK7RDvtMLxioDVGiL3l7N/S1uVrTRCMeesklRgdtUSwNvuor0yNVhnSSAJk
         XAxu8knm3Ow/NDn1u+upTqchp2fweWw9WkzrGT8qnmUyfW7tl3hd8IbYp1Ci0y94QwIJ
         /IFyAwjA+PU2CBhxXX+gWTGjFiydS78+RBgsDkDhQb/YhQnbqaOeGKRe21fKKEHqI4YV
         v5CZLrAgtVrmA+fkxnR+/v6hOayd+VysCF6TBypyKSCBeyeqFrFuQzbtAWvR90tnn8T2
         QE9/zUvinvqVI6GRljSaHCpF8iaj1h0AaOSKmSmXN9IGow4PzHT9zK7z+qkQr7Y8PTfy
         pdkA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785434817; x=1786039617; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:mime-version:references:in-reply-to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ksA4Cb+zc98xgjMVnrwp9nVxjWZKE5S3Fc2xP42UsGM=;
        b=pAnY8WxGfvG6N1h613bd88k/mfYc1GXrzS58NWBzY05pphx/nQsMPuKMMFnnNsu/wi
         Q/V4yeF08sea8ivyO89YcdUvY6fghdOvGO5nZizS1E+HMqrUk17I1MBd//KGYFubahoq
         +upRjTjrvgBteV6AiaFG3BSfdhQMv96fb3yCZeH8arUTH9UJas11UenUpWvAvN4eUg4b
         93UZSgKPFV4B8QYQP4BbvrjZTJS+NuRYtn9v5t03uJqbv0MNs3PlGcZqt4Qo6LtJUPZ3
         YGV3SjLOZji4wP79aDy02CL34roT7X5ziYrOe7bbQeXIc+eCfqI+mz9lGr/p5t24v3Hz
         /ELA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785434817; x=1786039617;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:mime-version:references:in-reply-to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ksA4Cb+zc98xgjMVnrwp9nVxjWZKE5S3Fc2xP42UsGM=;
        b=tIX7WAbQTcb2cSBl0bKI8ZgUsYKW8OEFLGnB5cLbja7keKAo/c1tn3DWoGZBNIG/uT
         pmja5GliEjlLe3jOHFwWYNuouExFpSenek19FiHdRWuAAvVB1FQigUShGQbYErM9E1qD
         ANPfINr9mpNFt69iln+YmdT2crZzd+vaEu6XzB5b1NR7rzIv7O1V94mvN/9nFqDVZLNp
         BP5ktWltrvvuwtIArHjQd5xRVbxiyDFE161ASORuEbL61vaRIt4OlJx0dkcAqLRt9qZN
         DHU3B1M+AGTf+kaGaaWIw14GpOldDDhYf45V/YEOQxrXJFEVgd5VprlAO3Qp5GZbbplq
         W3Qg==
X-Gm-Message-State: AOJu0YwlAy6KucGK+MPDABO+PAqcPADC+0fV0gmMySvy3hsgkBBrifzc
	eDVMQWEGkPATcHye2dZefTA08/IlOBjeihAAu6W1X8vcX7y6OievroZ80oPlzFzhzcD6VS6p8O1
	8N5CoSo0U1emvl/U+Bi7EnQjoy5WnyLNPvZRvLpvpn0dwF3icxDXyX+Aw
X-Gm-Gg: AR+sD12KWvg3fPgI65UVo31YY9+E/e6Etcun/XQCYpHh54oLiGTGeNy9DFbNGqr6KKw
	zl7KFG8NTHFpDM9SwIeWoUf8yockhiBQGVAdCifZ8J5qJoi4sThNF2pX+FtVzFZj0CdnDqIEunx
	7PMrsK9Qrw88NbHHRRkvMTDntg8NnaTHfneDRPuecG/Nd4ioqybr9T8Vnmq31WKa4oovSL6bISZ
	PR9k6aLCeMbDfIP8dVxY3Pq4TcDJtuD4So3VGm/nPb7hcTK1cXcvUzepFUmx/W82jQ83JGsTiEi
	TvTepki1USQJjE4MwAtI1k9VVZZBMi+HgmGvdJ98gccrY4F+KKRcWiW4PIJAdcv7ZuyPUMu5/sr
	KGAqVDPuhiMuRa+3O4GmMTdDkrJfRR0j82IUSmaCfTXHH
X-Received: by 2002:a17:90b:4424:b0:38e:2517:5d1f with SMTP id
 98e67ed59e1d1-38f9bd3e096mr2908488a91.9.1785434816901; Thu, 30 Jul 2026
 11:06:56 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Jul 2026 11:06:56 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Jul 2026 11:06:56 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260728122245.AA83D1F000E9@smtp.kernel.org>
References: <20260728121138.1103610-1-tarunsahu@google.com>
 <20260728121138.1103610-2-tarunsahu@google.com> <20260728122245.AA83D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 30 Jul 2026 11:06:56 -0700
X-Gm-Features: AUfX_mxg8N6Cgn4jHI_wA550VSPb-h9Q0N7SiD0v3YCrbcFHGVvI1NAH9Wyaw3c
Message-ID: <CAEvNRgGHuiXG1KZ24+kX-ZgTS_rqGPFqJMjoJhqf6GpZh4xN3g@mail.gmail.com>
Subject: Re: [PATCH v4 01/11] liveupdate: Add LIVEUPDATE_GUEST_MEMFD config option
To: sashiko-reviews@lists.linux.dev, Tarun Sahu <tarunsahu@google.com>
Cc: kvm@vger.kernel.org, Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev, 
	Oliver Upton <oupton@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

sashiko-bot@kernel.org writes:

> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] The patch introduces the `LIVEUPDATE_GUEST_MEMFD` Kconfig opti=
on claiming to enable a new feature, but there is no actual implementation =
provided.
> --
>
> --- Patch [1]: [PATCH v4 01/11] liveupdate: Add LIVEUPDATE_GUEST_MEMFD co=
nfig option ---
> commit e0c3fde657d56c548cd9a7467d2143f0f42c5242
> Author: Tarun Sahu <tarunsahu@google.com>
>
> liveupdate: Add LIVEUPDATE_GUEST_MEMFD config option
>
> This commit introduces the LIVEUPDATE_GUEST_MEMFD Kconfig option, which a=
ims
> to enable live update support for KVM guest_memfd files.
>
>> diff --git a/kernel/liveupdate/Kconfig b/kernel/liveupdate/Kconfig
>> index 1a8513f16ef7c..0bbc4037192e9 100644
>> --- a/kernel/liveupdate/Kconfig
>> +++ b/kernel/liveupdate/Kconfig
>> @@ -88,4 +88,19 @@ config LIVEUPDATE_MEMFD
>>
>>  	  If unsure, say N.
>>
>> +config LIVEUPDATE_GUEST_MEMFD
>> +	bool "Live update support for guest_memfd"
>> +	depends on LIVEUPDATE
>> +	depends on KVM_GUEST_MEMFD
>> +	default LIVEUPDATE
>
> [Severity: Medium]
> Is the implementation for this feature missing from this patch?
>
> The commit message notes that this patch enables live update support for =
KVM
> guest_memfd files, but the newly added LIVEUPDATE_GUEST_MEMFD symbol appe=
ars
> to be unreferenced in the tree. Since there are no Makefiles, C files, or
> preprocessor checks that use it, this currently acts as dead code.
>
> Could the implementation be missing, or was this intended to be introduce=
d as
> part of a larger series where the symbol is used in a subsequent patch?
>

Sashiko is right here, I think this patch should be squashed with the
first usage.

>> +	help
>> +	  Enable live update support for KVM guest_memfd files. This allows
>> +	  preserving VM Memory backed by guest_memfd file across kernel live
>> +	  updates.
>> +
>> +	  This can only be used for the guest_memfd that are fully-shared
>> +	  and pre-faulted.
>> +
>> +	  If unsure, say N.
>> +
>>  endmenu
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728121138.11=
03610-1-tarunsahu@google.com?part=3D1
