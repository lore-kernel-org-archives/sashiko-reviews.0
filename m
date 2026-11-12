Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794498748;
	b=MFmI3nqiiNRtMm+zGSQij+ab/GfjPyAT73Xv3sqw060jfVQ0ivxzw3GLxlnO3Zahs+l6
	 2Os9RRoSmlpltjconDnMpQpKJD5mdsqxnmXEIX7M9OLOeOAEIa3nvZ6rFr8p5qc6WRt9Y
	 Q/Vusl6sWPA5HP73ZyYgotFZWUUnFR8Rh6AmN/MW6mwmISld55nMRozANTEOdZsQ8mKEF
	 7fl14D/lwa/A9Nuc6os7RAIdYGzuUZ5DQz9qOws/NXQaGyJIg3Z+1gld0f7kX0kvhgjNr
	 LyMZ7za9/pJhzdaRRYL2iR5pEpyZfwdD2CxKTFQWgrjN5Lq7MQTWRbG2wczLH/JcEyA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794498748;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=pFkKfIywj/ZyBZbX5KkOiMNv3xL2LHNwZUtS7p196fg=;
	b=qKsdygQGUy/Ea4fgzFDeO5g5CkxRyCkb4KE8nniiH6Uiy5X8W7aJHs0oUa78S0vW9FIj
	 XiwqjzYohVWpMlfMVHb+0Vu0PVDbQYIWTlg8FGW1UiLvI1ipqb/a0NQs6MxASKUf3W4md
	 vfSrwsgTh2J+dm+Js9aNPi9LADHqf+JUCFrXRmOuWjCulXtewtjzkxSJxA8IgXqy6RSjS
	 faOEo+mRYcqKzrs02NTs7I59DauVD+XOw72umMsB4LL5k60i9k+KKGyc1Fxd46NuPcWk6
	 +IC7M562UQoQLmTr5YRgwyYbhUYlMk1j6JGFolcjzeT7LEJBUkbBnryMzgCaSrVvPhQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lC2F9Y6W;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E9D606A31C
	for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 15:52:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0E9D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lC2F9Y6W
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3b083afebe4so214929a91.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 07:52:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794498747; cv=none;
        d=google.com; s=arc-20260327;
        b=mXTxzaVaHeX5b2KwbBD7YSlxUwI8/x9wJ5uIxK8IVb0QQGvTcTpoo7GjiTaDCadtIY
         Qv5nYeHf/LsxpSCxLbPxcQfYdqLOUWQmQXbOZfCR+KydJWGsXlbsjja4fq2XOkWXIfIb
         g0Gss50+sIcgybie8D4ImOu7nGlqM3jhTCB/GZnjh+FdvIem1MbYnOg+1dZHdWaTXTpo
         BqJDNkLBjmhXGkHVonDXGH7CAgfmFwJ/XRuzwHzee65/aYnLSoerFAEeAR+GJ/t2Fv6W
         XWN8QYreykleXX7a9iUQV2zCSmJRJI1gQRyLRXWEdc64nXQqIVSqVN8SSGl4eV99CAas
         VL7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pFkKfIywj/ZyBZbX5KkOiMNv3xL2LHNwZUtS7p196fg=;
        fh=bN3WHTlzXcVIr2RkgMpk3NXK/DwXOefqRaFpMbeYf7s=;
        b=heFRRkzzXabj0u55W/kdxt+BCclWM72IlXtFLyBqoJrncvSVRySA3sjdm3ekzrq+dU
         qetzIqnpk6Yf00e754ZPSpaNIJfznTXioDmTu/SqHNKF01Kz2XW3OOTwRLUR14tM05cD
         FhvtR5Y6nlaMPf9z6di9NS+UweJFnl0bXgF5Ob/9lAwGOM0T2ZkoMPXWmXdbO1La7cSE
         nH2UKXPL5TayKW+qecOnhcKBu0/UTkIyWdX6RiwupMqPsFeP7i554JHiP/o5D0TfQcyw
         dcMG8PFbk7vHWxz6l1hxfSk86x9w7oYYCqDmy6tlZLEbx9Fp1U6tg4SemJsyE3J5uyU1
         AHOg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794498747; x=1795103547; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pFkKfIywj/ZyBZbX5KkOiMNv3xL2LHNwZUtS7p196fg=;
        b=lC2F9Y6WkmqUaFtr6Re6UN/9yKyuJTzsQj8BDtQzg2Hh1eBxkxHRdDDfCbfd3UlfX2
         CP/vT6vTPGbozofHQkEZmHm762qxe3H56hVCKha7jNDFQZO+kl4JeK6sK3/6H2aJ/IQL
         XPrNeT0tNpQsdC6u3YNZ9RwvxUwxF+sd5I2GEqwWHi8JvNlfHSwcxYqgUxS37ABR6oMb
         5P5pJG+uspMglyVhhCYjNHGcjC+/fZnXQ095U1EGXCQSZyubkO7H2KCiIITOKQx6hy3R
         rMJgTbtTzRMQM/d4FeAQtE8PZTric/LiWDpXuJjYWlXqkeCBkykPBCw+pqR+61PFTEiF
         jTBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794498747; x=1795103547;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pFkKfIywj/ZyBZbX5KkOiMNv3xL2LHNwZUtS7p196fg=;
        b=Au+Cojf7ur8OsfkATQLAVUkUyH7AzI1UNUiGgCTwOG/Cg/j0Yf8VE8FyLtygOFt3ud
         ajxn2gojfuvWjqFMCScoe+HRSOhOAw7lnQEcMuXmKExWOgcwnnMFeDy4EULlUKEyaEjZ
         TmDgCwpzR4XOBREHGcNiRtbnXTKHdFf81kPey8y6KXDreIESm9Jvb2Xgskb3LESkMq65
         qzZXtIFeXZtbJdyUOZlNjXampGH/h3h2EcA7eFZJ62bnOFVgxygysOnW5t0Uw50btIu8
         va1/d/ic4w1SlC09oWxq5Pdjf6Szrn0vETNuTnhb2nBr9YpYPTZmt5XSCWWi7WIZ2k86
         KvMg==
X-Gm-Message-State: APuU4Z9+0wdO/y/Uk+CfxYvb0uUA2mRgvk0w6NFQ3k8zNaUV6BexkK18
	0hDdd5AH7fbsA7y8E84/ivNU4+73yGqq6I+kzSMo2ineNjupeU+9q08G53orO9na7VCbWn1gt49
	w/TH02XTQVdHvRz22EJtO5PPS29W7IghYaS37
X-Gm-Gg: AYBFou2nzAXmzHF3YQeqFONFAMdsgEgcp3nlRGbfSH+AfuQmEYWRQF2HjdPJUmFXtub
	c0XA64LmBz8Ka0u6R/gNMIBAdOWYFshvrY4717TS2RPhjQpFDEHAuR95MGMcgjwx+DAHHjkVSph
	YC2ZiJJ634GH7BXqpjkl/phYu+ITHRlfUSca5YRhK586Qm2BuZb0VDCBNsyt3PjsI+n+OgZPs+4
	nl3sbbW80W3DmzjUZguVGfUxd2VP0s40Xh6rLnzkyoj6LtGqTY1UOqLbVtlv5RaL2o2GFKtv3sh
	HW2rWuLh0WiQonR6c+lUG9nDOA0wuFcUFJx3mwHR4Dbl//qecPn45AJbVWr0mprJuoY9x/8d8Fs
	wWtfE6T1AMyzi4UAINBny2++nr0GOivBUsPDLHQ==
X-Received: by 2002:a17:90b:134e:b0:3a0:c162:51af with SMTP id
 98e67ed59e1d1-3b182d6a766mr9385950a91.0.1794498745885; Thu, 12 Nov 2026
 07:52:25 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261107165303.13508-1-lui2012qwq@gmail.com> <sashiko-outbox-204751@kernel.org>
In-Reply-To: <sashiko-outbox-204751@kernel.org>
From: Chengyu Liu <lui2012qwq@gmail.com>
Date: Thu, 12 Nov 2026 23:52:13 +0800
X-Gm-Features: AclHuK-DW0Wyf1thbDSXO7RLTdFK8837q2tulUfBni-HUsH0xnhsu0BaucfkLqE
Message-ID: <CAE=Q7=5M2XXqWpO4SXL4uSzBL5Yvt_Tg6o2nDTpZak281w8keQ@mail.gmail.com>
Subject: Re: [PATCH] drm/gem-atomic-helper: fix fence leak on
 dma_fence_chain_alloc() failure
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 5:50=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
> [Severity: Low]
> Should this commit include a Fixes: tag for the commit that introduced th=
e
> leak:
>
>   Fixes: 1ea28bc5542d ("drm: handle kernel fences in drm_gem_plane_helper=
_prepare_fb v2")

Thanks, v2 will include the fix tag.

On Mon, Nov 9, 2026 at 5:50=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] drm/gem-atomic-helper: missing Fixes trailer for commit
>   1ea28bc5542d
> --
>
> commit b6d9ff23bfcc702d784107d5026972257646c1fc
> Author: Chengyu Liu <lui2012qwq@gmail.com>
>
> > drm/gem-atomic-helper: fix fence leak on dma_fence_chain_alloc() failur=
e
> >
> > In drm_gem_plane_helper_prepare_fb(), when both "new" (the plane's GEM
> > singleton fence) and "fence" (explicit or previous plane's) exist, they
> > are wrapped in a freshly allocated chain.  If dma_fence_chain_alloc()
> > fails, the error path runs before dma_fence_chain_init() adopts "new",
> > and error: only puts "fence" - leaking one fence reference per failure.
> >
> > Put "new" in the allocation-failure branch.
> >
> > Found by static analysis.
> >
> > Signed-off-by: Chengyu Liu <lui2012qwq@gmail.com>
>
> [Severity: Low]
> Should this commit include a Fixes: tag for the commit that introduced th=
e
> leak:
>
>   Fixes: 1ea28bc5542d ("drm: handle kernel fences in drm_gem_plane_helper=
_prepare_fb v2")
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107165303.13=
508-1-lui2012qwq@gmail.com?part=3D1
