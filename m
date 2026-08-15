Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53BBF1E5B9A
	for <sashiko-reviews@lists.linux.dev>; Sat, 15 Aug 2026 02:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786762538; cv=pass; b=JihaMh5BtdgxooDcFBy4wONHVef6XHpy3SW7SW0HXdieBxA/EBex3dgB9uzs/0tMXO/L5ycfI/aJv7RG8m5S5H/WkzmoidL9gstbF016Wp2z7txvdDg6dahs+hGoSNtAtCON+9Qvqp4WUBvgiylRdvTYJGn5hG6sVq16Ro1oB8Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786762538; c=relaxed/simple;
	bh=Fx8jpcriAtMOORqEdmHYz+cT8ZtXqnCKp7LKXe/56PY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mxszl9u0qt9phdoYRoWOI+K4HxC/eeEKtEjvdPFFfOHNarvrbi8duLN7nfmV2LNqCP4O8i8cosF0LCOIpctV7TLjDMm5yQ2atf5knE2RceB4LKw1BkIrhDqVoJ1y9hDnbcMLEgN1EbT/O4KkR8xdepC0rmuPG8is/2gT8QZGm44=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DvKgFGsl; arc=pass smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DvKgFGsl"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38dd55ad76cso1719041a91.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 14 Aug 2026 19:55:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786762537; cv=none;
        d=google.com; s=arc-20260327;
        b=R3ClOaZ522Yqv/RwEaXJA88nMj/jffZ6pPFqEgsoaciUzmEUjtrbQNYjtNTjMzEC1Z
         njTg2JTI3nRAAb/YvRG4I8+zV1RkTPGeZg7FerznkVgv2PYyo97D35bbw7Z9dGsFSAsv
         yQpg+rzpxWXMuGW2GcO0Pyy96cxAY8CIjTPHx3m85L2EJKHCVLLlDRS8dt4w8pPjbS7Q
         a6hJ8dJe4y6b8Iwhratqnxq/VQe0WfdY8ko0IMrtVP/QO3yC/QHJFuoMasuZy1ugArGR
         4/9xPheQWEkKqt6Q2O8PPgZb2FVhUsPg5hRviCSHcVQpnFMjgvCUv2MFgp8pp0WDvZEa
         hJJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VPaZxMbqLEnlS6J9v9E+TEXvf9o4iRcf1Qh32ca3bM8=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=s42wC4lgya/mAEZ3+0MIKkFZaa62LITqDsv5px9luEPvCsCUREfJJUHUDZsCjiZZKW
         kXmSKgVAgor0Q7qonhnPG0qPHwKVPlQXqgw8xkS/WJoIpFzcXoWUhqo8R8vJPrdsLAlf
         saF3QiS2WQ+84r03OX3h94q9KXAej8eo6P/UE0WGVfrZ3OnrReXBEwXKeUghHjwnGShJ
         1eDWUuOtilJDBGDGPFDqTAhFjfnalbvVWuhaKYSGwFfk3RyPJeewkYlhKRVAbUtd7dKu
         8sY0c1y5Q044gHb9P3akTlVgDTGSnCpR3xstZuSSeNd4TXrzjLh9HXR272aqahWsEUKP
         5MCg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786762537; x=1787367337; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VPaZxMbqLEnlS6J9v9E+TEXvf9o4iRcf1Qh32ca3bM8=;
        b=DvKgFGsl7cI81mEL2smR2vZFbgyTTjTdwG5zIR/ODu50xJXYazXVxCyyj3GZWQC+Am
         EO4B445BkvkQSpy1RrlKbRnvrzuxtnQYsJFXbM8JCrFP+v4InBhZbBpZ/EMM4Blm/8u+
         m/gBaijSqKIG263kBzNCZrRKoG8m0MX+TBqFgcPdCcOXtgP8OHI0iTBzkDOdgjE+5TcL
         SMDIn5ylGdwHL7lUjnWHwzNQWCKMZKTucH8O+mdt8HlSOAT+9YP89n3YK/TTB5d96tN1
         NLN+qwkKHvHJ/9WTyHibp2jUlxRBuj+or77USHMJVaz3yNMcgClJklDYVFIhEyGeGfS9
         Gd0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786762537; x=1787367337;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VPaZxMbqLEnlS6J9v9E+TEXvf9o4iRcf1Qh32ca3bM8=;
        b=keWwVz7ITjxDc4qV+EX3eNriTg22TZn7iiHhubvzjA53eYZ9X/tAsfrpfS4fiRNtWw
         qdojrOkWggRxPneO/KWOLPv0xsHefkVDTRBAX1oPIuLeywbgFAAiCvudeErNU2QpiYUQ
         a0N02YYUU0uMBZZUetBz3Y7JYrbZFbEOc0Mr/Wbgs57FYCCoEhJJuk0KGgDeE8E/3z9+
         akOnpitYLrqS4T8Uyff+cOtgVS+/cM8OA4T6iyFkLF1wrsxaJJqA8EY0GTPyCY788NWB
         rABN9K2jqyV8P1guoG6cxUciY7edOEtNWMSr2yLmg1zDlAsvPDrRJeHXbEzZiHfBQmua
         DQJA==
X-Gm-Message-State: AOJu0Yzao+V5Abm3yLTIR5Q4/2xH8tKnEQktzBft9ylbCfOL5sQs3yRP
	V736BZcX7gka5+gZj0e0NFxhT8tI58TtMHRjtyKVIk596KOkkKt1+k2dq/ig+yoJ4xBsPwfCe7l
	+CCIs2biKc8GDT34Z8Mol5Elozq10eop98keY
X-Gm-Gg: AR+sD12DbR8ECDJNcO/D9B9sbOEQTY/GLe5j/4DEinPkL/xyuYmGbxf7a072hNLxDsH
	uw+nMjQCdjFTNqQOFLRPTX1KTQ6VpoKs98aeaRzmC7dXbMMVZIkCLGrfzCyOdPjYZL1784lYtev
	nPXdvyQp9SAk1KuzQVsqYxEo8xaUfovMs/zSnAIVANO8IJeWRpSHvJ4v50glNWEalB14UhhFXFN
	Nmi1FJCaHHoP2Oa5C57gx7StBe1wLe+0JGEeMnjDvnd8yezc6Uus3nC1ARq0gjS7V9N0b9U4CTZ
	PP81Q9IL+uXNeci/wWBuvNj5HvOyFYxAjvtPt1+SmKhMUrY=
X-Received: by 2002:a17:90b:38d1:b0:38e:4e61:c9e with SMTP id
 98e67ed59e1d1-3933b168bbfmr6998267a91.21.1786762536518; Fri, 14 Aug 2026
 19:55:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260812-net-netdevsim-v1-1-521a85e4fe91@gmail.com> <20260812140235.8AC2B1F000E9@smtp.kernel.org>
In-Reply-To: <20260812140235.8AC2B1F000E9@smtp.kernel.org>
From: Subasri S <subasris1210@gmail.com>
Date: Sat, 15 Aug 2026 08:25:24 +0530
X-Gm-Features: AcwNN1UFV3hM3RwZUnTxCyjKPBWwLWgg9-4fTDT5T6kLa1MmJrERw0zuW5mD6Ls
Message-ID: <CABfayGNZF553ZW=QoSkwA8YtRoDAQ5RP=MGyGXEbzbegYBN10w@mail.gmail.com>
Subject: Re: [PATCH] netdevsim: update rxq->napi pointer during queue reset
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 12, 2026 at 7:32=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
> Earlier in this function (nsim_queue_start), there is an early return
> for rq_reset_mode =3D=3D 1 that bypasses the new restoration code:
>
> drivers/net/netdevsim/netdev.c:nsim_queue_start() {
>         ...
>         if (ns->rq_reset_mode =3D=3D 1) {
>                 ns->rq[idx]->page_pool =3D qmem->pp;
>                 napi_enable_locked(&ns->rq[idx]->napi);
>                 return 0;
>         }
>         ...
> }
>
> Does this skip restoring rxq->napi, leaving it NULL and preventing XSK bu=
sy
> polling from working after a reset in mode 1?

Yes, I missed to handle the case when reset mode is 1. Sent a v2 patch fixi=
ng
this - https://lore.kernel.org/netdev/20260815-net-netdevsim-v2-1-d6c85c515=
7a7@gmail.com/
