Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C109345CDD
	for <sashiko-reviews@lists.linux.dev>; Thu, 13 Aug 2026 05:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786597360; cv=pass; b=nm+WacLkgRskh27HArnXCgmr1Ci+zESJePbnjldRpYS6nIuwEmIAWAg4K6zMdyU2TDjiAOveIBza0l/KX/PjnZJojECW86ad3R/845jXMYaL5hzcOkFmnDnE2HnQsV5xigVVlR2ZF/2AV31kEy3PjTy/EBHjIKBwesIm83UFZn8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786597360; c=relaxed/simple;
	bh=FPdVbJEJQfj1xWJ2K3M3PZX5UlvGIUA6xNdCdiePNfE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hn2d3+PREIBDJ9L2CDCK749cstqlIIdrJgpsE+ZBslIy2zx9JU2F3WRzTmROd1Tj0EXo6xbOPnVWogMttwq2TEj3tdvXGMSZ6FT+gaJ+Ws6ieKXE1r4R7EITPT594A9IJTxhq7o+rvcOCeZRqAUz9xmyLi0eiLhCvCUfzuOTWOY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HBUjkxgP; arc=pass smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HBUjkxgP"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ccf2360620so17950355ad.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 12 Aug 2026 22:02:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786597358; cv=none;
        d=google.com; s=arc-20260327;
        b=gRo+cCeoNol4gpQnAgQU3eqNmZdKQZjYf+nOBZiqXShmdfFKoHFAGsvVKnIa79qzBy
         tkecVP0AMTPtkaDgK9M5UJx7jkA0g2GaXFwJFHYawPTBzgSMa8+QDPpZqt1pkOuZiiJU
         CFFDdKYJpOuAlWS6wCfTjz6Rb5MCluXIiFDrARMVoel8gcZy0ohg6jKHmsehTXpbOeDn
         34VuM07dvit8ooszCmMBb8XF2hUIOcAf6REYMRpf0+2nZsIbdZRVyeQSI2t5Zn/0QmWF
         TPA7VRZb4ZVLjm2ZKcj1bZvs0h5e0uDAuJ8lp4VWjxXVzZwHYWXE/GOS7B/nCu06i+QI
         bzvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FPdVbJEJQfj1xWJ2K3M3PZX5UlvGIUA6xNdCdiePNfE=;
        fh=WJ81iVv7VVNN3XcmqLwfLU/KtKhWcyunKbGcwKiNOFI=;
        b=VESbEK6aaFfhaAWAjOKl+ONbQs61sjat47IwYYytEiBMT1KcORf48As/EURLrndwP7
         KOBFL4RW4mIWsPPlI/g2AsRg5KG6OxmJQwvSGb0rP2XZRD8XK7g0WWkJt9DBuITMbK1n
         lupUP2lmZ1ZsjMzPncYxBfh21HY/2ahoaH2O5IaUI4cpzNvC4dhO5cFGAi41ZyhOEteW
         oMwcs4gar8reKVT6vkjX4eEaN+IEBBWsaWHiwALbwuLTrrBaF/Efa5MKOjAmujHPBwT1
         alnEuplU8FmP281ESfHjegUTGjV/ev5E32AxIxUC83yRQAdwlMILV1Jp8CedJoWW5SsZ
         yUAQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786597358; x=1787202158; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FPdVbJEJQfj1xWJ2K3M3PZX5UlvGIUA6xNdCdiePNfE=;
        b=HBUjkxgP6fODQoihCl9iKQu9PgBN6oZxfi5VGuP6pGeUaITh5LjzrSa9jT9H5O2Dpq
         RDvCJ+kNdFCbiPvS0x4dfQwXTMvoOvUA7iLHoTC93LW9XO2mYQKlBoQPaCQVp5gxinWs
         1zWi+dSV4aqPMOWpiDvr3mZXlvxKZsKi6QLoyTm9SK1TAQ+UxhKblWi+9PtWbghFuTSt
         4d9XvQa9bihquVDHWaI2d2rFKvanRT/R6tlDyngq8LagMTzD+EtaOuouVmahPCjsf1iJ
         ggYSfai66HSTobwqyCTu7C/xtlqAu5/epLtTRHLd3R5qrFLvSH4SmlY3oozuAyNfghQe
         0gNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786597358; x=1787202158;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FPdVbJEJQfj1xWJ2K3M3PZX5UlvGIUA6xNdCdiePNfE=;
        b=hpxg1pDb6KqB6CF7ytoyi7T75imiZbPCndeTD/Z/Fn9fHEkoKaPhCT8KDMAl2QAlDW
         InwGUKzxEvL6krjAhh6jW4YR4LfFJgwMzjhFbCf2q9k6L3c6x6cC5BQqJcIbgViPJz30
         gRCLvuWgRAkySywNuUTAaJdIe/p9TPOU4bPuR3unNbFkveirGYK/vfZON7c73KGFUA36
         hsOROytv9Dqn7FC7g/WNpEf+Dz0Rotx8soXkpMwoegGS+/Ss6WG+hZcpzrlsYmTnks+w
         sBkkcohuHUIrZ1ITuVZriK0/qspdr3qSvLGLx/f++qRQF46GxjXd9h7iYkgZmzQyywpZ
         MCnQ==
X-Gm-Message-State: AOJu0Yy6tY7jVvQ7ttjoHBrYBG47NfFJJQFkHQYDm31kdc0qatj25h3W
	6+lc8Zzx3kfy55w4XHFx0Xs7Gr2J/7X/4F1JwC3yinElp/h/y/tJpSLEEgpgsy0cH3MyfY9VIIB
	LsXdD/D8u3U1DGg8KnKNhUlzyKG6q4E11TG9E
X-Gm-Gg: AR+sD105VP+dr3FTMxrw+9Y5tkK9BdvD/RgDwAHxsi/JS8iRl3XWvOI1m2X9tl6P6bl
	0IbZJ/9ICjLfnAM++saPWBvUl/pnX4rIM68vxFDWgz1GujVxZP3lSROEtsbv/I9G6gz5T/p7hkj
	Nrd/rwULwEHaKYV+UJV+o/IhABrvF2X+2bl05MfUaUda4M8RZStTS5bvr9f1zfr6V4t9QnHCyMv
	tzd2ZHZP3/k67/oRj8l05C74BFxI0GPfIyawMpH9PuEwy2aegMzPJnyh3zh8EbveqoVgm+uxSi4
	ZhZuKx7tW532RzsrFtABznX13Zw4zsJu9+5Y/wnAraHtGhTPBtJfL67j+RvYAKflPE+TS13nh1b
	64UG+41ZCF8QPlAZaAMaNEAjaaL6bsJ4fxWRwHXWwHtdBTFTi46V+1LfKML5A9GcBeKuEB8WW
X-Received: by 2002:a17:90b:4e8e:b0:38e:5b59:c2ff with SMTP id
 98e67ed59e1d1-3931dfd0888mr3861982a91.3.1786597358325; Wed, 12 Aug 2026
 22:02:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260812112023.42254-1-phucduc.bui@gmail.com> <20260812112023.42254-4-phucduc.bui@gmail.com>
 <20260812115606.6AA5D1F000E9@smtp.kernel.org>
In-Reply-To: <20260812115606.6AA5D1F000E9@smtp.kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 13 Aug 2026 12:02:26 +0700
X-Gm-Features: AUfX_mxshKTDLRVYPf-YHvMsJCb8eL4BRjYK6eEFFCMEmoQ7q_lwa2Buu3dSHlo
Message-ID: <CAABR9nEQ6v26S65WrOx1VX-fx3aP+PfjDWfmtEahgn4Uc-Q3bw@mail.gmail.com>
Subject: Re: [PATCH 3/3] mmc: davinci: Handle optional IRQ return value correctly
To: sashiko-reviews@lists.linux.dev
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> New issues:
> - [Medium] Direct return on `platform_get_irq_optional` error bypasses cl=
ock cleanup, leaking the clock enable reference.
>

This will be addressed in v2.

> Pre-existing issues:
> - [High] The driver manually disables the hardware clock in the remove an=
d probe error paths while devm-managed IRQs are still active, risking unclo=
cked register accesses.
> - [High] If DMA descriptor allocation fails, the driver attempts PIO fall=
back but leaves `host->do_dma` set and leaks the mapped scatterlist.
> - [High] The system suspend routine disables the MMC controller clock wit=
hout masking the SDIO interrupt, risking unclocked register access.

 These issues are pre-existing, and I=E2=80=99d prefer to keep the scope of
this patch focused on the issue being addressed by this series.
