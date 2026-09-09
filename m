Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44865498923
	for <sashiko-reviews@lists.linux.dev>; Wed,  9 Sep 2026 10:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788949837; cv=pass; b=pekq1x+LCXonnw+gLAcBCyN6Sp1nbVVd7QKxnsoJNWkHCngq1bzrDG2jJw1jV2RXAaqO2Zkx9Ya2nXefiA8KbYYR+jixehwie+Jifm67hj282dd0Z2R09EMVNxttIL8bHtzwRfN0QhVD5bn4vVmjc8Jsv6iZJZqHjomwMmCMnL4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788949837; c=relaxed/simple;
	bh=Vl/Vp4zgPlpJ8OWYbPuWPyaywrrhONTpt512uVBR9kg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UuhsoqOij2olZYjfZjle828lTVCpxo3tgt8vyxUisAM1IU+wckKArFldE2hAhGZoj+fotyQkq48m4rE9iP/PH6pxdXYn34ja43W9NPMwKNzbriHa3fgiH37dxZPT5KxAvtI19z6PuWz9rQlZ5EYMUyZd+xc21Br0Y7lT8SDg6a0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=iyEYusE7; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="iyEYusE7"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-53091987029so25358121cf.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 09 Sep 2026 03:30:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788949833; cv=none;
        d=google.com; s=arc-20260327;
        b=E7Nkh0yc6r4eWAz5GHykSPzOOb0YxWiXsiecOib3j1kZRrke2nsy/dv+QAridIU+yD
         X547VB/Ei7UcDz2KO0BsbptHzZ+1qvbyYESn+xSntPEebSVKd45GAyTKvShOhF0AJuDd
         BziuWK3VdGVclz4aN/vAFcgV4GS9BpIFQMUl8ja/XsCK+mhB8ETUlp/iSqOOapxKq9lh
         top2m3R1PMPGliOhMI85xtHQm3m6sEATU6pSwfgNqmTCisxEgAmPjFmoi8ekxkoV4Pul
         XVwqCgWUCrE+PbppKfS0SeValN4pugrA9ZYkbFBJVf2QnL2+1PLZWA3yFV3fu/N3vr8D
         LaBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jpRvNvSvD7V0OL3stsnfs9SVxZoTLrRcZKUqJWQu3kQ=;
        fh=7xPp3oLUmdzaheRfikHmCf+gWghlv/k+mYzYc+4xp3I=;
        b=jfeT9KNgk2bJX84IIjnbI1yosAHFx395I7gx2Bdne0eZrhvRqRNuADKnSg9IGuoWbi
         9SddrG/Z6HxToemmt13c+brohky2bFDpzkoZYOpNlbXnWY4Jx582lC4GLwvJkDlRZiaQ
         a142it1fZg7pB0rNbziG2GOffCcAYJaV3CtBntCoWjlLfpEQdohd4HN7ICB0nWreKniR
         G2CAd5nf+9yHCqF5VvqBcAWs/n2akvEYMrTgcrKYaY/OM543veSOxsahbX5uKVS8erpF
         JY8k9l63CV0CiDKajc+cnZQSLzRQCYUNa1Rd+zbl+aK9mjs8b7wYQWh9V/kBXRnysYvR
         jyPw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1788949833; x=1789554633; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jpRvNvSvD7V0OL3stsnfs9SVxZoTLrRcZKUqJWQu3kQ=;
        b=iyEYusE74qa+k8Brr/IOoEKIj+211NaSqrG6fqBzjcal8tADHKmAaIlJy20WLvSwh1
         qoY9M3sa5FVPvuwr3t91IQQshyHnUD6qcdkmYlmCq+OzJOQOuZj/XLewCj1A8Sn5UU7R
         Rr3Sos93gwZWjYJLU9sdGdroFykGcdS8VS+/E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788949833; x=1789554633;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jpRvNvSvD7V0OL3stsnfs9SVxZoTLrRcZKUqJWQu3kQ=;
        b=LX3c8ZokA5+B0ndwoVJFXRrSOYA+4nT3uCRLz9D4FYbb9iTNUMt7xZD1wQ3i6t9rZn
         lIT2tM6/33CZU78ShwkZHQ1GAWyzx6hE7lFMoStiNF4l6kkyDiMVsQ8tG6l1p84IKJeN
         wLpUuN8/W3A9dg7D5kQk18kvzGjmAf1+TbFXtu+09/6YgB1PTCec6bDgc703UPkV5YyX
         3bd5wHheglLakfrOWuHDmdy0yZQLj3G90jJroZZnQ9ZIkt+0voBNCc7SS8oconZDJlgA
         WmsFH5NtZUNADnBz8upqDXacKwblTEflzdx9g9c6b4tBtTcyJfYor2RDnBz2cJRZHYgT
         mIMw==
X-Forwarded-Encrypted: i=1; AKwUvBzG2e4fa28avCAnZbcBxEGQKcli0ELqFuEqn4aEISzHnFHMEbCbPAu4CHqeAGAVfdJ7kDMnpljHhRj67PZae9I=@lists.linux.dev
X-Gm-Message-State: AFuF++kaAiGyus7Xbaew0Ri4bHpbWsvQljJ3ow+/ZdZoETd7zBH4lBVz
	K/XZN5IqqK849Zhwa272SxLAO6FBNlCi4kGG6TebtaqKrZUJPv8hu2VRNxleYded8EO6bFfJuM9
	6scTVFR0j0cOrudptY6S6QMfemOe79MxjPozkYuko9krxQLGvt41W
X-Gm-Gg: AYBFou1rK2SBhaB+lOLaj9BCX9Eyph5jnkNfWLNWuYMfuNWuKv5eFdptKOCfDw5pebC
	HmIfG749RlFuZRZWTaRulKH3j1O41ImpffSEYxnHZVhB5oxm90hzcJXvwUJW9sGu/XrM70KsoqO
	PAkAByXxRrPlBzcwWz0a60sSuRd7C0WOGLNTckSB1538mM8923U5RXZ5e7tMSpflV5srddKFWQN
	iU7SToPl2meVDGzMfMiXqvUKI6gJbJDeE+UVf19dkhxXn86zawCWLTHT+7j9MNPDBx0PsWE3agi
	dVpaD3RXVeY4ScZtPhu0hPs2xzpsJVzc2kOxUBtjB88cVicDniZKangoNdOGqFPA080nhKwJjzc
	rAaxq6GIfgWTm
X-Received: by 2002:a05:622a:1489:b0:52f:bc89:4933 with SMTP id
 d75a77b69052e-5305483d9ecmr389465191cf.20.1788949831561; Wed, 09 Sep 2026
 03:30:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260903145952.848051-1-mika.kuoppala@linux.intel.com>
 <20260903145952.848051-5-mika.kuoppala@linux.intel.com> <20260903152224.AD48C1F00A3F@smtp.kernel.org>
 <178878748003.179185.16833574173741290547@jlahtine-mobl> <178894801687.37859.4186888279082797860@jlahtine-mobl>
In-Reply-To: <178894801687.37859.4186888279082797860@jlahtine-mobl>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 9 Sep 2026 12:30:20 +0200
X-Gm-Features: AcwNN1Uh9cE_469mX3O2aBqf9qMn4Rt3GJCs03Vdits2s9ouaewG7zKYcPHnkzU
Message-ID: <CAJfpegsFJkghPimBYAnJ_KyZt43T66cAATAvpENZeX5Lj73zSQ@mail.gmail.com>
Subject: Re: FUSE deadlocks vs. copy_from_user() and locks (Was: Re: [PATCH
 v10 04/27] drm/xe/eudebug: Introduce discovery for resources)
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Bernd Schubert <bernd@bsbernd.com>, Joanne Koong <joannelkoong@gmail.com>, 
	Amir Goldstein <amir73il@gmail.com>, intel-xe@lists.freedesktop.org, 
	fuse-devel@lists.linux.dev, sashiko-bot@kernel.org, 
	sashiko-reviews@lists.linux.dev, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Alex Deucher <alexander.deucher@amd.com>, Matthew Brost <matthew.brost@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	dri-devel@lists.freedesktop.org, 
	Mika Kuoppala <mika.kuoppala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 9 Sept 2026 at 12:00, Joonas Lahtinen
<joonas.lahtinen@linux.intel.com> wrote:

> Based on reading of [1] and [2], it seems pretty much expected FUSE
> drivers can trivially deadlock and ultimately in worst case the situation
> can only be solved by manually aborting those connections by sysadmin.

Exactly.

The real question is, how far the effects of this deadlock can spread.
If it remains within control of the user that mounted the fuse
filesystem, than that's okay.  If it affects processes not controlled
by the user, that's bad.

So it's not about being able to stall a process that accesses the
filesystem, that's trivially doable using fuse even without any page
faults.

I'ts about being able to stall an unrelated process.

Thanks,
Miklos
