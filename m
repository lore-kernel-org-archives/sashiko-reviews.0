Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443B9397944
	for <sashiko-reviews@lists.linux.dev>; Fri, 16 Oct 2026 20:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792180909; cv=pass; b=hdZy1X7ljA9/pmJywjhQe1d43Zbc+nggqJ5ycy+jwEfT3rhOZ83qRWrg4inaKuh5qyBfYVCJeisu3/X0IRYOSJT0FU8c+M3t8/Dh3JHYrqkfgxWf715S96YhXE2rRIKZdkdvI3Bd1VFN9vYcWf5BUw0PNg+FxIbrsqBhsEHKsiA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792180909; c=relaxed/simple;
	bh=HdaZXPrWwJ+i5wSHql/5Ik3YGNMv/chCxvt/CSyUgz0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WIKx9LPq8WZKtI8C2YtWg/bOU3Ugq8GyVtQNf/16+S9ezw3aRy6c8JZcuCwJVtNIcY+aMNVeG+g851dlanuEOwhJp0RMMJnvFMV3Neb7wrZhWwvk9gwhTnF5Tu64r29LNFNvNse2wa9hXTQ8tgjVkgFsil4vs9YJ4yWwAiCr0jg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hSMIusQ5; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hSMIusQ5"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b1b12de661so2690a12.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 16 Oct 2026 13:01:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792180906; cv=none;
        d=google.com; s=arc-20260327;
        b=SjDHjXwwQnZudLZ3VeUWO8JGxiPEDWZTCvS0iosuBn1Y4pSu2oZkjipYpNrEfCjbv0
         K3fq4crbQSYc3VgB2CPxtiahgEZ2ELVHOp/tP6TFhw/c0dG4gaws0N/02iQRVi1AOHiA
         8NW75787Sw1VKuIdPG6IIOEmPfxQkJLMJ97toJDBqmFRP94yGPOs/qLiBdNoSw97Eov+
         oSKeHxkAVHlEFC6B8iRoRxgz2ayiAH4b7t88JukUL4PZAWJqc1F4yCrg3QfGwl9FAKru
         f+wCT8nvo34JuZVgdST30+U0bB7j5bXPe1uexaHqMWipGH8tF7XpE3BNxn7Lq59ifFp/
         2FLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HdaZXPrWwJ+i5wSHql/5Ik3YGNMv/chCxvt/CSyUgz0=;
        fh=YriQdl2X5LbjnnAYi4/QM2X/6MpOgfc+mGWKpf8Terk=;
        b=cyBtikfq5urcZEkAbtl1tGmlkON/yBYr4RJFWI5sLRm+nu6XvesdBl2CqlpHhfQ8Th
         OEvjtUG641sk7jrRJ8kyzeDZvzV41OysSBfD8reeV0gh99NSquvHRGQ5o2NUUJzm13G+
         IIPZpRZJs/I0PMCeLmY4I5kiQ+TWxP8UAJz+kM2Af1ygfqK8UJV4k7fsf3BmYJq1lsKc
         STienfT+WYZHH9P08u/OfKyKeMyVB3gb8j+SvGYcdikDbAfdFzSKNOTTN0kaAbeRS8kd
         bxwTv610Cdxt47SD3BEbmFHnmOsIWN8cvvUOFIVmqTgyD/n+DlA86+RhDYPBu53zBVoK
         zQ4A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792180906; x=1792785706; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HdaZXPrWwJ+i5wSHql/5Ik3YGNMv/chCxvt/CSyUgz0=;
        b=hSMIusQ5wspv3wV/SCaSKC/tEQnJyfUDF/O0bWJuG2WI5HpI2C9QEYnfpgMJeHBoCn
         SkG26kJv6rM/+F4QCUIhYEhA3f5B2p9IpxzhH8Egkf0RCQ3p/y2FBXEA4V6gtW6OAeWs
         GP8fLBL40Pr4JDWz1Bjz6XYmLaMXeE56FquZO7RrisPZLr/gGDYVzgVGilNLyeEVc9UY
         zgRFiqdPjyUgb+hQf/0JVOFhReczVvFmceoVeEbMJh1z1GyRYyWXV0sFz5/3XwCmJt2T
         4vCjCJ+qN1WhaslSot76BCNlvOnHBCIWtDTyaQFM5Vq7BV/UEUB5PHTLnOd07fbHO4bb
         iLlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792180906; x=1792785706;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HdaZXPrWwJ+i5wSHql/5Ik3YGNMv/chCxvt/CSyUgz0=;
        b=zkKcnU4EKAWiXC5gTW0ZmnkX/ANnnVXo5Xv1zN61SYtIjEPd8tr7YXN/jLXE7QByV8
         OXjOZzAqu+msvuROVCMVQTiZPgC/3hxwCfVEFY9bbjAhcY79c1pRUNbtwoIQSu76S/qZ
         wimDrgXw+4pzZBk5nYehAApDIPPjODGD/BCFVXCASiwFD37n61qgKVxA+/RY9p/DwfH0
         RRdMaZLrrU2BaJNF0G3O1T4rRFkz6FdlIDmh/oJ234UuhdQcqZKItLbWJ34fIE71SMAS
         udtuXW6+YP7JTI9iUjJ27R4oXo2yTfAcT0g3OyU0K3+9/nf3yq2Tw+7Kps9H2jHWHpXL
         WFkw==
X-Gm-Message-State: AFq9FYIWH1ej72CizS1v2E+pUK7We57FJLLF3RQBDla2jORB++TnGaFR
	NqA1xAD+gMYOHkswYZ3Ymb1iS7ibgOLueQaYMxMIMURC4s74i1LbrMjSLUDBaebZau+N2xtvO93
	JRpEeqdCCLj9OUsMM4Dk/mOMyBTRQeCiaytZJ6HQWAtg23yPcXm73Z988
X-Gm-Gg: AYBFou0wCA/+LwV5Yw8Vc5//guBhYqRtPsFH7sR58esM8erKwJtZpW6Smu5Q2Fu5gXw
	aVHcYbjtu4OU7AnU7w+mNt6GbMA1x7+6Ri8gtsX347EGc+P0nhGIgfkCLd8CDitIrPLrA/7ybj7
	hf3ftSLtmf7AIVrvpELZS7Pqgbywv75hHYiYR4HUHqQp/zD8QEvKKlKAqqzHklG4e37eRZLqZcy
	FwllpKVhbIuB2Wsg2V46GfTTOoj7vNW6LSKphXAmGjuQQpGii3DsyNlwHifmIk0yDWisc9H+4pT
	9bb9ZgzbVfgk2DoCxj4o8zqyehNnXhpD2Tv5s3gas3WSbMv5n9Lklnv9HVAzJhspNQ==
X-Received: by 2002:aa7:d58b:0:b0:6aa:b72b:d762 with SMTP id
 4fb4d7f45d1cf-6b3a885d0c5mr9252a12.1.1792180905925; Fri, 16 Oct 2026 13:01:45
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261015163915.1166043-1-almasrymina@google.com>
 <20261015163915.1166043-4-almasrymina@google.com> <sashiko-outbox-174653@kernel.org>
In-Reply-To: <sashiko-outbox-174653@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 16 Oct 2026 13:01:34 -0700
X-Gm-Features: AclHuK8d7OqHLAYxLcDKdLDPscbO2nPPZMWDh7xiX6V5deJEav5-30qThWpMU20
Message-ID: <CAHS8izOeB1Z+1bVicatew26vZtAG5VGYMjyiCUH--yJvtbQaWw@mail.gmail.com>
Subject: Re: [PATCH net v4 3/4] netdevsim: support devmem RX and TX bindings
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, media-ci@linuxtv.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 9:39=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
> - [High] netdevsim: NULL pointer dereference in nsim_pp_hold_write() for =
VFs
> - [High] net: OOB access in nsim_do_psp() due to missing pskb_may_pull()
> - [Medium] bus: missing return value check for dma_coerce_mask_and_cohere=
nt()

I think it's understood that netdevsim is test code and really is
meant to support the minimal needed to run the tests and is not some
production hardened implementation. skillping these is OK yes? Like I
don't know if netdevsim is being used with VFs.

--=20
Thanks,
Mina
