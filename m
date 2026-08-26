Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EBE838A734
	for <sashiko-reviews@lists.linux.dev>; Wed, 26 Aug 2026 10:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787739186; cv=pass; b=NYNtn7KVT3Cq0yCXFVZ26j+owqPEBPWe8H1nYFt3Xe9GprISY9TP9t2cdsggl1EqWTwaSWtstN8uWnJj3gNJIf+4k9DuzHzt9K9dRVpsOj2dy8/HsTprnpOQvm7Ucl8OiH5FNwipTcRXr/Wa1u7EswE7cbycoKl6Do7sSKibQ7M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787739186; c=relaxed/simple;
	bh=r2sqqQeNw+OErfLcyiJmI9dyJ7IG7egdlCrRZGp3Af8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lk7miEv9ivpmiVVqCdgeHbPrKOA8DABr5nPvjeD2fdLiREoWvuAUbW9mRMZu3jiXzUns1lq/KRVYHh26+JAzU7RWXKDrPrSEMy4NNsFUVA7l0vskDfIYN3/wETuw6Q0HjDHRFG7U5FqeyTY3w4ocVlHvzvs9fso8EMyvZ7R1WGo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ngOQ1cDY; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ngOQ1cDY"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d032846c95so11179025ad.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 26 Aug 2026 03:13:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787739184; cv=none;
        d=google.com; s=arc-20260327;
        b=Qjlh/Ap+fIoiwMuvJurob203fYS9d9OLshkCw6EymmJbIakOv8++0SxlrFrNjIOM19
         k4Akio7lmiHNDvG/8exUngzPnFU44cEe7vZQ5CkI4+FJHUAQNni0o9br+vIE8RmoNOEV
         wSxx9Vu6rucF6naa+fodRAG8Skgba1CRjlf4lwF6ul6SOOONwOk8cKhYbmUK/0I2E0Fh
         J0JCCvEIX3Wm1bugX4RslbpimKp8syq/G/EA+xHFxMCVrA7ciQLw0k43rlXPEgwftTvw
         RMve0T378nyRX/uIIqrEUvMtZ37Jbx9wqfBj8jxPaVB7WxAzBT/kKV5yMXXoj8VgrssK
         1X1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=svlYsr7Y694+G4Q58xTTovmhngPrt1vqEywYNBl8gZM=;
        fh=LcgpHvf8Q9R5NlBSSEW9eNy+WcF5IoW3LDiZImP2iwU=;
        b=BNxEYWokekDZ/mL1bmkq6tlc9JgCYUTuHdppzwYyNU259Vi3hy5E5yMu021MvGHkY5
         X0PN3K67slzIZqfylIvhULjY6tVPCaQdvqcdW2VQHvNGBExDvwtSoVC0gbFUuse/2ju1
         5NDsAZl1URnhqKG4CiCcI8hq+77Nm9GUkZF4rUEW543blDuAYgnLPeunJDG8XF3B66dw
         SxwM54/M8focVykcW9qCSY0n3hw273obc5M7cqd0AaxxkVCQLIFALO0+q7C8BLfCDjAt
         OqL1fe9H9oVT+fk6YxyQo9FV4yt5Rwd8GxkF48oGdvjkpmBi+AAdiHUoC5RmkTGPrDX4
         iOkw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787739184; x=1788343984; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=svlYsr7Y694+G4Q58xTTovmhngPrt1vqEywYNBl8gZM=;
        b=ngOQ1cDYhxnMxHxJazUCXmEP47o/wi2AmAS1WfxHOYduf8pFMHkd8Ht3Q72rx1bzVV
         R4jiVLMka5zCo8v8AIiJeQd9+Mgb6RMU+s0ZWfUDNSn/tXtPtYMf2Du0SqcBljLZkeyY
         MC9HNYmEClR1lZQ7meVgH65gJlTG3rsnh/uJ1qrXdcEY5SOl6AfqPC/Y72MP15vspPj4
         wi8TKY5noSF1kbJcDL9WLk2XL3jjf4QduA6FwibkyROAZhgLmDgxiUnJB62Mi0y4uqEF
         yDxKVGwi+Rc31aoYuLSqcAxRM8qu6SwGex2nEqtueT3Kfepd8szr9h9Wbye21ndiukUd
         6r3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787739184; x=1788343984;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=svlYsr7Y694+G4Q58xTTovmhngPrt1vqEywYNBl8gZM=;
        b=m6PMRmrKx3DnZVBAchkCI9dL+dI5DB4yuZ7TwhOKC983UAH2FhmRqgmr2aY2Tofzaw
         odMm3P8FLykMtQC36k+AGvt4JUWIO+625X0m4orBZS3pVhnLGHjSSzzRlzb7rTFF1e+I
         FRa3X0y9e7tifRx18LbLEkG9Xm+m+M6o3VchcG7F365jxZ16oc99hgXQpKPcBtZVq+Xy
         HVAdHJdEKsyIfNpWKJK/IXwdasYqpuBMefpfsHI6O2UvGgt7FNGIMy0XadhTjU2e4/WF
         5reXl+3KYgqZYGKsBa3Xb7wRstSr4iumVpKqv3LTGXU4qVSMIu4tM8VIcK832ILr8vh1
         JyMg==
X-Gm-Message-State: AFuF++lHB2mccw35TKd0COx1xWEVmo2pfYdZFin+86VBC+yNHk3TOatl
	cudvwzXr6+lSMy01jc2wQI2lPzyXg1m/h10eJI62euMrDRUcd9jg/GSbJw3FmgyMqDKgWi63BHh
	1V+0nDkeRgWjwFyJ2obbmBuddJC8QHL+dZzm3
X-Gm-Gg: AR+sD10JGH2tgyCX2wxdhs89Gq0wINOX5dQI2VNHFs00VHcjoppGvsPvoBR7vUv64hT
	ra8IDHpRf/To/tnZY7EqvkGenioSMI/xpESnf80OXYYZxtqCT8rkKvmG78Dr0hZDFw1cayeHs9T
	UQaI3taz2QHPbdXyoy3pDnO6eCEgymqXcQmdumye6JS9icBvHwJjbgyXAKBr2vKSSBj54C1NQYa
	4ZEq2y6vakCejvSuV3lwIL/1GH7aObw333pvGLmOsg/hDLHRVPnRIo/uuNanCfKa9ZvZB4OcI0y
	Cx9SxgDGpyCGnoMSsT5k0ioLJw2gj/fuqzaJxwvST7J+JlKJK+avaRdZ2P5TCNfI3sei1XoegZa
	xTsJFYzC8YiozAk6YH68fXN+Qoz3yZzP1I/wLJQ4yaPfS99n+Ic7+Yw0wb70GxxXWf/k=
X-Received: by 2002:a17:903:1246:b0:2d1:1f73:3667 with SMTP id
 d9443c01a7336-2d707a04385mr81721005ad.1.1787739184226; Wed, 26 Aug 2026
 03:13:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260824100834.31655-1-phucduc.bui@gmail.com> <20260825100858.830171F00A3A@smtp.kernel.org>
In-Reply-To: <20260825100858.830171F00A3A@smtp.kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 26 Aug 2026 17:12:52 +0700
X-Gm-Features: AcwNN1V13UwPZmUVPYcB5HEYpY8toOyJ1ccp7thS4TvF6ntFH79Iy199cNLDsGI
Message-ID: <CAABR9nHbtDexQaUnyAcUBASphoOOncuohjp5exfmPsmidg9AZA@mail.gmail.com>
Subject: Re: [PATCH net] net: fec: only stop PTP if it was initialized
To: sashiko-reviews@lists.linux.dev
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
Content-Type: text/plain; charset="UTF-8"

> [Severity: High]
> This is a pre-existing issue, but since this patch fixes the missing
> check in the probe error path, should we also add the same check to
> fec_drv_remove()?
>
> fec_drv_remove() calls fec_ptp_stop() unconditionally:
>
> fec_drv_remove()
>         ...
>         cancel_work_sync(&fep->tx_timeout_work);
>         fec_ptp_stop(pdev);
>         unregister_netdev(ndev);
>         ...
>

That makes sense. Checking fep->bufdesc_ex before calling
fec_ptp_stop() in fec_drv_remove()
is indeed necessary. I will update the patch and send v2.


> - [High] Use-after-free (UAF) due to improper work cancellation order in `fec_drv_remove()`.
> - [High] Use-after-free (UAF) due to improper timer cancellation order in `fec_ptp_stop()`.
> - [High] Unprotected hardware access leading to kernel panic on timer expiry with clocks disabled.
> --

These pre-existing issues are outside the scope of this patch.
Since I do not have the physical hardware to properly validate fixes
for these issues,
I think they would be better addressed separately by someone with
access to the relevant hardware.

For the work cancellation issue, a similar case was discussed here:

https://lore.kernel.org/all/20260728062730.2394873-1-satishkh@cisco.com/
