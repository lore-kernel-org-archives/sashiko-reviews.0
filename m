Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E4C171CD
	for <sashiko-reviews@lists.linux.dev>; Mon,  3 Aug 2026 05:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785734906; cv=pass; b=TlO+DS5jtuAfC3JkIa6wDLIKVP43Wj0YOxjtY9fhazVnCWFZ8IIWPGzcT/x2pzQpvup36PhSJLmY/PETgvTRyZ5DAzgRRSBVlt7OXZdgIOE1K04nAXkM3ga7/ZWY7s+c2Cv2vI2tItUZtaw4pKk46jCIYTIfAhjozbOG1lkCpks=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785734906; c=relaxed/simple;
	bh=K50g3LVe2JIlyne/f7MYa/IcLR6llYiCcw8Ef17gXBk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fOaPnY2lJjlS57YAbL0GPW7NY/TqnHLBccpp6jvRp7hZJIXKqO7H7LPMhgiMXatTwuIXkGR99LdJcH2X2ZASnbNXGIkOoPpueU636X3WVYHgTbWWPx4ypBhi4HlxDsVOuCjQ31l5OHJV26bWscDaR1K4EUucO6HTJ5Rz6pPBgXA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sldw+rc4; arc=pass smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sldw+rc4"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-81e6f0b4610so33366317b3.2
        for <sashiko-reviews@lists.linux.dev>; Sun, 02 Aug 2026 22:28:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785734904; cv=none;
        d=google.com; s=arc-20260327;
        b=i8PDIgYv5IT8nuOGUotVR9JdJF2Oww39sQASoEqDKRhQ8CkUhYR/lUBFR/ciniCRDD
         DR+PsS/Hh3gMC4iEzs9mJx3uRbc5VsnpuwrjA4vD5IPXqao4kQTMt4HhAairWEpo0ynh
         rRWucw/zKZskkuCD58TyJVUvmJ1U9D1gdE7VU4X5MM6BN09xuz3PSEMrVuPHu4FzpA7+
         J8LzAosHgSkHgRL8oPXR7cN6USr/8qkOmAJGfVywFdlOj8z+8z9RQPee6W5JgFcHQzwI
         qtkF+ZonuAMsogmbp1zvXGUgcU5bXxftOiBjkihtsDk1F8iqibKnQ2WmaHXcD1egpGpZ
         J2ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=K50g3LVe2JIlyne/f7MYa/IcLR6llYiCcw8Ef17gXBk=;
        fh=z+NQq8u+M/6HfaLpZE34W1L5DP7Kce1BOfmppHQKf0c=;
        b=miRQoUuWKtcV+2jBU7Ewp4jHWuwHCm5YR38uyMQl3uqnvo21nlrBiB/unwI+XuTmpF
         KNze+HVmdvKNQKhnw8NGs9dLKTr3dq2RF1NPUrbGAwUCgMM4qyvyiwXpFweyeW50zh7X
         mb1gLYo7/QTZnFuOmie52n78HBDaQSuvziks/WuHWpmDpQ4X8kmzWs8Jk38MG/8wx/fu
         LXOA7fDv+iYjJv0vsUnYzxn9WBnDQySBF43+dMrI4eFGmlIcWVydhr60DRvF3iPvEbUd
         0KmYB+WsBQdwAbAkOetdn9N+c2UtiK+/Kko2fVbRO07oLKW3InMbwaZodg/0Vm3T7aWx
         jCig==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785734904; x=1786339704; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K50g3LVe2JIlyne/f7MYa/IcLR6llYiCcw8Ef17gXBk=;
        b=Sldw+rc4ODqXD2DVynAJRcuZRtGA2B5zrXhpM3F3fw5X68khEgHlzWpAkcHogVsWLt
         N9m3GGb7LgSVUFSyfpUIt/30BXlKe0aSBuozZQA7OqDWsZR53NH2yw1hCGdgDmtuZqZq
         pq1z1RWcMqFq9dmihXbqbxvRPAO3bCQukOJ2rBM11sPcSRmZqihdYnbVv9DKct9ekixO
         lD2YpZ5ioEQJJrPYAXJpSrWu9FVCmdZNt+re8zlKuLMwCSs2svi/QiiXKYWXlUGMavye
         YNTB4w7u6J+f6r0X1UtuF+Du2O+wk4rWQ8N5VMgHQ32v4wvaVB0Hqj2ip39tRtjCGlkw
         JoaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785734904; x=1786339704;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=K50g3LVe2JIlyne/f7MYa/IcLR6llYiCcw8Ef17gXBk=;
        b=lR6kRXnUtMuAvK6eSrLFIHtM4YcOA3IuVDdVe0kh3+9JmgrY2lFk56+THrzE0CHmMA
         mYscvyBA3/obtk146GXKoVo2RZ+x2GEEbodJ2LPnmdh6sz9GW8At1FYba4QWcgPQHcN8
         bHXnEjumvxQZB1zoqLTUhjGizdm1DQAIyoqZhP+22UAj+0HkdOBUx+rRvs1zWgbzt/oP
         NOSRLsog1kaqOOfcDuxCv2Vwu7Jk3xjRiOI9z4fBmcGURHQXyhcmGmcXQfuzNwCDzh2O
         DXNHkPw28b4tWmncC78IEeCznfypOcRx1maFjniISbweacXEb9auGxUAMqvT6QUtMdPX
         Dd5A==
X-Gm-Message-State: AOJu0YzzCaU8MhNptCFRrO4K6bdF79P1OuNSebaNo3hg50qmZEZl0eRF
	F3YrTAsWSDoH2f6pV0MlnAWnrX5cah4n79jsxQElpmhz4B9CAktqU/C82ml5YxNPgam9gVsiCaj
	tlhA+PVLWP1fvoqpG5G/uwJR8/hDVnxFk9FDGqYY=
X-Gm-Gg: AR+sD11cstBSGGZS+deb/23xELJNgRqzvCys5PpqQzo3r5vZnCVE6L3qiKDxh9qdEUb
	4Fq+WbkTfBoncNr8E46+0Sne5rjjpQUOxSL8U2w1qccjaRdNnoeGZs67pGN5X6Unfn6qd+BZlq+
	hCu81KmUWCqf3+hksPoGVDK1N6BhXD0sPMmuTyh1A2s/wJbFiIApQvxyeb4GIAUoh0PaTBvebM4
	8LDhd20n8l8Qw3m5MaGgRURAT7h7xR6sZiyCSyUOffQtD7/QFIB+j6Tq2sFD2Nc/z6lqYWcfbgw
	vCoaeesrwGMI5YgTA8KAodRJGkCRXhlasAMgC5NXlPDpG4fPAgIENX/LHVWh/yJnwPAAYcjb8pd
	xfh2U+CgtXX/Fjs/SbQy8hzgBMsAPfw==
X-Received: by 2002:a05:690c:6701:b0:7ff:1a93:be35 with SMTP id
 00721157ae682-81fd4a6f84emr111918477b3.16.1785734904411; Sun, 02 Aug 2026
 22:28:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260730204604.1729505-1-lyude@redhat.com> <20260730204604.1729505-4-lyude@redhat.com>
 <20260730205633.9AF051F000E9@smtp.kernel.org>
In-Reply-To: <20260730205633.9AF051F000E9@smtp.kernel.org>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 3 Aug 2026 15:28:12 +1000
X-Gm-Features: AUfX_myCuk4f-IKfNaeeSw-seOnjdRXgmvV5zKiXoeio5KdDQO4TXcGu_APjeoI
Message-ID: <CAPM=9tzFg34jBT7-YYncOoYfvpvXvGnymuYeR6pQ2bQ4qeV4=g@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] drm/nouveau: Fix drm_driver struct/nouveau.atomic
 parameter handling
To: sashiko-reviews@lists.linux.dev
Cc: Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 31 Jul 2026 at 07:13, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>
> New issues:
> - [Critical] Embedding `drm_driver` inside `nouveau_drm` causes a Use-After-Free of `dev->driver` in the DRM core when the device is unbound or hot-unplugged while userspace holds an open file descriptor.

I'm going to agree with sashiko here. We don't want to embed it.

Just create two copies of the struct, one with atomic and one without,
or use some macros to do that, because anything else is just going to
have messy lifetimes.

I think you could also move the atomic flag handling earlier.

Dave.
