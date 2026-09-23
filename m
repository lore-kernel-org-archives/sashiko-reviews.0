Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99DD499F01
	for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 11:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790162682; cv=pass; b=IZtFoeaFuQkcTZAZvbcL20jsoPkbFKaOcsc1ZnHwjyGily8lM0ZkQpu1XviFJBLN7Dvu29svwkpBmr5NvQH5mXi6zYNpuRKxmLhZUSOdDBUIUYv6rpdl4OBJvg9RPJN2ZaGKZooM8RQqoGoUTJgFXjEyBi5++/2hV04tmSSkvvs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790162682; c=relaxed/simple;
	bh=9qFuwrpqqRSVeKCvpQNFoLGrmnYUlan6H12byrt7AHA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TmX4B2llnTEpubstTdCCvk/UX+tyAlOBYAB70phDa2YK9g0cxXg9yFjGmuRa8k3eWp/c8uVhF6BWXl+D+Z02G+B9UGJsa4pazJ/doyc4mVOqyLZzgwgNch/IjZKoZSNb9DtebT92yvNnd2dUHZAx6OlsOSICVjEzcamLzcx3lRs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f6/ikzFq; arc=pass smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f6/ikzFq"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfc93e00so4508766d6.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 04:24:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790162679; cv=none;
        d=google.com; s=arc-20260327;
        b=hRU8KcoSXsG0WhEU1ndRv8+8nZMvgrQ015cx0wRwT38wR1kMQRbAimcTVAf4KFEU5c
         BztIXY81g3RiM6jvx/qsCSuYFQ3b0rWhIOPsVFjAMdqxTFcvNhrygArNEVu2K6ekKjKZ
         LtdVN3gtgXyeXXsh7BV3iSz/N0pbePVoHZw35JjhlVmFySfOXviS8N9hIT2WWNPHRpFI
         GxaLZjVBXdCkgolebn6oXeqcZNib4cWIH6ZkYr48TIP+59ZIGvXNbHyGAYAZwF33a0YJ
         nBgMENgvqJzpq9+GjgMnn6XZWlEtz05CKRzg/ECHLerbtKQ+wH42+yR40XmBLCHsEEGm
         aNJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9qFuwrpqqRSVeKCvpQNFoLGrmnYUlan6H12byrt7AHA=;
        fh=mDAuwFAhs2mIusZI9ah3F5O0wx0xm7KPAs+ghUnUShY=;
        b=Fjk28nf8Zinh61cUQ9KuI2X/LyPp3lyRJVvae9jF0hcA8aMJkDiXjyj1AMxtdT7IFP
         7lyUY4Beku4WOQOJxqZ2d7Yv5RWTNH6rfiO6IR5M+piKEbveNsG6kdjj6zhZJ/Cp2nes
         lk/28sN6Q7FuYruxq+cQ1V0XjER+wu62fsmhjKhGeKSQBj0+1G0gCfCKEOe+0DJ9oSu5
         9reEYbWy63lTQYWmM4XkMFI0bHclkthcvYkWdLnq7qw6MXzh1lbPBOqIwl1vCaF01C/Z
         kPFIGhZpTp8yWtrQcKMl9AEbAksZ8cwFYrq9Nah7EkN+DnJTXQ/zUme2Qrd6GOo6uenY
         /4Fw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790162679; x=1790767479; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9qFuwrpqqRSVeKCvpQNFoLGrmnYUlan6H12byrt7AHA=;
        b=f6/ikzFqQJmV29PTdylwZAmeDge0zqiC5JRROrQWCv16nwnUEavIfiUtQLx5I4UY2Z
         fn4LjPXyQvjNMKqSdQEU8v5Ts9Q/aAehdS40usZPNzRoCGbAYY+0WeJsB53Xs2s1wqB0
         +qY7ja9YLBr1S3Yctue1t/f8HzKg+YmWFYP+ldzyjm2hObUnULmCkQaEgUKiYOgdq+yS
         JwCLsrVksmL4de3YmB8VLWRuC2uK9ir7ktw4kQW7f82HtT6v1k8n7dyCwHAYRiJacq4G
         irJtdIz//2vwVXXnDT54IObPClgvwi2x2MncxO5WwAiFwc1GUh89loen6wEogau1Abkl
         tTdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790162679; x=1790767479;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9qFuwrpqqRSVeKCvpQNFoLGrmnYUlan6H12byrt7AHA=;
        b=G2OUVHtu5CmTjaFXPedqk7yeDBBRKEL6ZYzJk7rdYbmfLrlElq9C82A/WCjR2pOtTf
         2za5gBCbdaGaK4HPwkfozYWePYV1d9z0ejyohBz0tDbTl83BVZB1qVHDr+R1BsKmU91V
         kP0CzORW0c0RXS4J2CvBZt07OqcnJskWszxql8kdWfn4qJ1AMN/CrWSXZyVQ3ZKGtfL5
         NFdLoGEMOFAspruS5a4JgvRx2zI2xEqtMlu3hVWloFeUuYMwyRhkYf4uX8cO+IZF9Ui8
         X+SWufCs+IWHDYmPFHLzQFWXdWBDPa+kL9vVAgqbdd4YyREDf3NVD9nvWe9IIcb9VOg4
         JJAg==
X-Gm-Message-State: AFuF++mcNHK5CBJG04O0gR5iibyRpagZr0KqfqRR5PagqnZlRSy7bqdf
	XfcHfY+GivzYgqHHWIGtGRleaUm2SOfYpH/dtBHlJdQCl/TQ2ha8M/a+We9/Cf93i0YyXxlZPI3
	nnLgLxf1CxZtYdUp+PtiDh8E3C+g0C4kpTp99YsfR3LNa
X-Gm-Gg: AYBFou239Fhfal8fUkYM1238ryT5qi2MeV3bH5mwqMn0y3vUtylfot5wUncDhZ6rWfl
	7Iy+Ipbg6p8XnbvFxJIgf6LXlZ7dO3XmaLntgSGjuViuPkwj4eJeNMRZ+zqwNIG7jSlBkgKhNQF
	hKwxMmHZPZfFngEvWyGj+uAm9xTCgJ5j8eKqO0iFC4m53I/0nU/6PSCQCeBe9z6VVGu3r5HF3ZX
	TjETrVCVrnOZ/TAE/LIEFGqsWt3jfb3O5KNv7wqWusSBeHZTsYfqnFMRlP8+cSdEPWdwGHXNvvt
	tE5Q2PGp9zsiuS3AmdX/aU3sa+Y9y+vLVZoC1szNFJ1etl8hv1l1j/YmQA==
X-Received: by 2002:a05:6214:2507:b0:914:44c:6346 with SMTP id
 6a1803df08f44-9140c3c38e7mr38390736d6.34.1790162679333; Wed, 23 Sep 2026
 04:24:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260923105208.198-1-anykey196@gmail.com> <20260923105920.CAC761F000FF@smtp.kernel.org>
In-Reply-To: <20260923105920.CAC761F000FF@smtp.kernel.org>
From: =?UTF-8?B?0JLQu9Cw0LQg0KHQktCd?= <anykey196@gmail.com>
Date: Wed, 23 Sep 2026 16:24:27 +0500
X-Gm-Features: AclHuK9sh5FBNarHLAEfVcm3oesc7H4_pIzHCxSA_Op301MlJ4p7eXIkEI6zvb8
Message-ID: <CANHPwARnF75UhVpW2UisXW3QVyPiyMqEnu=MGFkQSVUh2F32GQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: allwinner: h616: orangepi-zero2w: add 24-pin
 expansion buttons and IR
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Thanks for the review - you are right. The two buttons and the IR
receiver are on the optional 24-pin expansion board. With the board
detached the LRADC input and the IR receiver pin are undriven and
float, which can lead to phantom key presses and interrupt storms.

v2 drops them from the base board .dts and provides them as a
devicetree overlay (sun50i-h618-orangepi-zero2w-24pin.dtso) with a
Makefile entry, following the existing
sun8i-orangepi-zero-interface-board.dtso approach.

Tested on: OrangePi Zero 2W (Allwinner H618) with the 24-pin expansion board.
