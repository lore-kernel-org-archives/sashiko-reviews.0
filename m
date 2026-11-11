Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794412321;
	b=SARKx9JcHpvZhRz+h/rseDLpsuhQ39X9kbRwULeNJCmilzf0HXN/yZgxLHNIXIGUi5OM
	 YDb6gUKQ9nIwEgUimm6PMIpOxXuQHkNclY4+Uk6Srkmz18RtZhVmZjzt+DH2otFd77m9+
	 4n6pjqaQKVkfxiVCDa+Qn0AWNPYlNLdqKgmkQWnZlBi5B84tj3+15pWdk2LxxFF1xn6F9
	 Il4IyfGSJiA2z6To1jAnJXMtKi6TfKVxjwNJrDX4ta2FHwHyeDlyni2mEjW2I0AqVbZ2f
	 nD83R8rOfaAtNz8MMX57hTQweNyjCoLn4rwXp6VsM+9LRXWrqoswv4ypRGKiusJJWxQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794412321;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=KBQmXpergQV0k3yAGb4YmxsK7ApjQIjQQTJj+akkdKY=;
	b=tAcKjpc7AuxP9rrzBRFZuzEWtI0Wmwg0vAQ1AQSQ6Ml+rbKHW91P38ysY3A/nTkAXBkx
	 NcIKKzIoo+Xs0DoOSvKlKGqC5tYxGsAzW5CgJYZJNF6zF3Dw8JTVSJPDeZiNSLCWrpVqX
	 J5OpCtR01gBQwLZjQTFYsDKUpgunIgfk0sfWIEZUpSQLml2D+bBLUVILBu8dgIynT7iOM
	 6YfdrOJKRHiL5LHSZOA0gJ9hzER5iIh7MS3fXiGhGnAXVuct3p7hcEqM1GCre99fEBGoH
	 s57FrWtou1BjGFsSUOP/gJ869kvFBBZfRUgw/kKdHtcVaj5DTb35/eQXorpjcS/JjVw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VchtzLEL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85804606A321
	for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 15:52:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85804606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VchtzLEL
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-370f4e5cfc9so94259eec.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 07:52:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794412320; cv=none;
        d=google.com; s=arc-20260327;
        b=FPwy04By5PPOW85CKyzbA/yIId0u9mgNIT47x0tYKV3TVnFgENCZNLFi8IIRFeklT2
         WCz5XKGFnmdIOKi+u9lQZxhMNpX9T4glBeboGG+pr/KnGSbvhoBclhg9879tmrlGX1Ru
         Y2L94UAiu3rUqujhRlMcpGLIqJ8KyMNjRFekILFtglBW0eXO81bxs13LcORDueL5tZ26
         701z00UKMOwipwbKOpX+dACizTTB/8RKdmoK1puDzIMGMSrwDsiCGPyBGNUNvgM8qoaq
         tImLyDvi6QunPmxzeCmgUJZcr1Y3kS2lEOIStuZkuBIsjHqihZzIcfnOaON5A8zdkKZ1
         HvEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KBQmXpergQV0k3yAGb4YmxsK7ApjQIjQQTJj+akkdKY=;
        fh=i3hAu5buUQj14XjPS3yuucXs4d8wNC6UvvUfx22vFWI=;
        b=n1LPrmTSC8wr1NhDfQKCxdBl3rj6tMbbnIxMsRF2iw+YgSiD/sVvTt1f4hrsBF4hXu
         iZwx/uvWAXUmKUnN0hgb+tKZNFWZ7H0yJ3YV5vNC3tFCTY/yh1Hc9PPQVoE+Et73c0Yy
         ThjZJZe6XTYgwRkZ2E+EWT4ouRk2xLx6G4RQ7sOrmIxHK088E2yMJMwCeZlycUHUPtD9
         Bcxwckrl+FPbXgEfnQHmyuL7fyEejynRNOhN2ZkK6OLb6dmBALI+Zr6XZoaKV40qnPKF
         DjgYT9gmNZtPwj8f+gr87KWex6z6kzBOB1wFrKQSSN01raKM+WOao8eR77XUB6IdonZB
         Gw5Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794412320; x=1795017120; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KBQmXpergQV0k3yAGb4YmxsK7ApjQIjQQTJj+akkdKY=;
        b=VchtzLEL0kLt8C8OO4mYcRky+2lFHnc1ISwZHb2xkKGZs7y0XdvI0tLY1CrJkBw6gs
         xR1hcZbI1asSmeSwyn9wa39IVmrpC5f02BHmtihu+putYPlymS6fySQFn14x5rbX1Wjt
         vxoqBjq9C2N7w9/+jTgB0SaN8FqfPmQ5NE8VGWobweWMmhihL1/JMGp5Mq7UuJ/X8zm+
         71LKL4UbPXa+y2c5qQ9vSH4tfclb4XsomgR1B6xkG0OCVe/txbgExKOKurI/sNol1mlV
         siF5qBsnF3MQogYN8YM+HCcbljlzykhEnPsHSaDokpVsXp0WqagzE+d9D3BorUoHnu1D
         ldLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794412320; x=1795017120;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KBQmXpergQV0k3yAGb4YmxsK7ApjQIjQQTJj+akkdKY=;
        b=0YsFvdQIfEZndV5UQBSg+yZvydrUGcz7wnfQxI8K0MVdHgQNnNNOnOUBeBkpasX7im
         sX22N0v5SNsBCaw9J2AOj/VCCq6YExjk/g9qFvNn7FMMO3FIDWYtIuapFi54m5nG/WGN
         F4zrn1wn6Zqv3mvnQOlxpEJfoqItCfOzhUMyEhVXDzAc2KgVCPWf+IDgAB+oq/tskafg
         ocofbeDHs5hmpFe6z+NWHSXVVsbtDELqHIcwCoCblYVSRqNRT+1kGkTyCqmN6eZCy/ND
         +1umdJ/yJaJAxpG+IUy/O0AwyT1OVbNUCjyOQFafIveor/IOpFNI3+mWvMAlQgXlZ2ZS
         Cocg==
X-Forwarded-Encrypted: i=1; AL+hErFR6P7wSHgPc2I+cHugaP+7RBMhnMAYqRDuyhOX5HOFkXEvmKgSMUnGF57ntl80Uim4UL2KIOb9L7GFEp93U+g=@lists.linux.dev
X-Gm-Message-State: APuU4Z/cNcRqaPPmAFVJQ84cILBNUDZ3c02cEz4zbeXx32BAfyiSadBL
	ALqja/pmIH/CwP56OY8h/7NUsHr+859wEluvJYpZII96SYaNZxrDP4iz4Txd3R9L0tafwjpmtl0
	4ThwMDOKNtJddd1IMTjDncp4H5UPzAqI=
X-Gm-Gg: AYBFou0CWZ8X1yMemHcAChNv0Dt8JaXYQUO2mj3V3XIqbq5BA5xoCCfYTedZH9NNvOj
	P20kMHEZJRAZf5HieZWMA17Y9mp9ksFtCb22bWX+cF9pHcxT4Wh3kFQ6CWWVPSRF0noWFvt8/XX
	ov6JhWjxwxhVmGUN80PAkp5VNnOWlAGbCH4lvFpdPYQZ91at/QZ/IO9qgnHbv4lLZTWIY5l32fX
	8XewYke8KT4HyKPVSx8F5FVzyHbY+6zbItVH12wbeSo7yqOT5hCDtKtWsJxP6ktfSa2HoPJ/zi5
	w8W5fN4av48woG6sUZsvZsj6KIhJfuYA6ANL85JnsCHoM46jx6ljLBFGk8Jj46Ckzk4v5OOi9fV
	Lvod2jP8nfORTbyHCjDZpY28JpY/cPePEzeYGkGEDv7qdTucfzeNeSDf1D9iZJ/XJbXBdMRiuX8
	eYrVPeKD6z1hUA2RBhUbe4gkugxdX+H3GwTUtdJLtVTtNH4PiobyMomYFl35g=
X-Received: by 2002:a05:7022:5f1c:b0:165:be2f:c56e with SMTP id
 a92af1059eb24-1b3c02e9530mr3474381c88.2.1794412320307; Wed, 11 Nov 2026
 07:52:00 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261110120326.538252-1-tzimmermann@suse.de> <CADnq5_NCF2J0Dzea5swubs+eEKBLq+8ontc5n=kihYZVA3A1aw@mail.gmail.com>
 <cd49a9ea-a992-4b38-a5d7-d46d1647010f@suse.de>
In-Reply-To: <cd49a9ea-a992-4b38-a5d7-d46d1647010f@suse.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 11 Nov 2026 10:51:47 -0500
X-Gm-Features: AclHuK-V9rhzh3ZjlBaGulsYdclwg7wvF6eK8h0-zGf088bOkC0LAbbJi1wg6Ks
Message-ID: <CADnq5_Oi3-zGYV_BiuJzV5VQvxTSTLN1btqFFH7JYz0ra+dP0g@mail.gmail.com>
Subject: Re: [PATCH 0/5] drm/amdgpu,radeon: Inline drm_crtc_init()
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	sashiko-reviews@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 4:35=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Hi
>
> Am 10.11.26 um 22:49 schrieb Alex Deucher:
> > On Tue, Nov 10, 2026 at 7:11=E2=80=AFAM Thomas Zimmermann <tzimmermann@=
suse.de> wrote:
> >> The helper drm_crtc_init() sets up a CRTC with a primary plane for
> >> non-atomic mode setting. Only drivers for some AMD hardware still
> >> use it.
> >>
> >> Inline drm_crtc_init() into amdgpu and radeon and remove it from
> >> DRM. All new code implements atomic mode setting, which does not
> >> use drm_crtc_init().
> >>
> > I'd like to drop all of the old amdgpu non-DC code since DC is now the
> > default, and we have an LTS kernel now.  I'm planning to send these
> > out in the near future:
> > https://gitlab.freedesktop.org/agd5f/linux/-/commits/remove-non-dc-disp=
lay?ref_type=3Dheads
>
> That's even better. :) Do you have an ETA for this work? Resolving
> drm_crtc_init() is required for that series I referred to at [1].

Just sent them out.

Thanks,

Alex

>
>
> > So that just leaves radeon.
>
> I'll fix the Sashiko report and send this out in a separate patch.
>
> Best regards
> Thomas
>
> >
> > Alex
> >
> >> DRM support for kernel panic is only implemented in amdgpu. Take
> >> the panic helpers from drm_crtc_init() in amdgpu, but clean it up
> >> in radeon.
> >>
> >> With this series in place, DRM's helpers for drawing panic screens
> >> can be further integrated with other drawing helpers, as outlined
> >> in [1].
> >>
> >> Tested on radeon with a Radeon HD 6570.
> >>
> >> [1] https://lore.kernel.org/dri-devel/20261019154612.777074-1-tzimmerm=
ann@suse.de/
> >>
> >> Thomas Zimmermann (5):
> >>    drm/amdgpu: dce_v6_0: Inline drm_crtc_init()
> >>    drm/amdgpu: dce_v8_0: Inline drm_crtc_init()
> >>    drm/amdgpu: dce_v10_0: Inline drm_crtc_init()
> >>    drm/radeon: Inline drm_crtc_init()
> >>    drm: Remove drm_crtc_init()
> >>
> >>   drivers/gpu/drm/amd/amdgpu/dce_v10_0.c  | 44 ++++++++++++++-
> >>   drivers/gpu/drm/amd/amdgpu/dce_v6_0.c   | 44 ++++++++++++++-
> >>   drivers/gpu/drm/amd/amdgpu/dce_v8_0.c   | 44 ++++++++++++++-
> >>   drivers/gpu/drm/drm_crtc.c              | 26 +++------
> >>   drivers/gpu/drm/drm_modeset_helper.c    | 74 -----------------------=
--
> >>   drivers/gpu/drm/radeon/radeon_display.c | 47 +++++++++++++---
> >>   include/drm/drm_modeset_helper.h        |  3 -
> >>   include/drm/drm_plane.h                 |  5 --
> >>   8 files changed, 170 insertions(+), 117 deletions(-)
> >>
> >> --
> >> 2.56.0
> >>
>
> --
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstr. 146, 90461 N=C3=BCrnberg, Germany, www.suse.com
> GF: Stefan Gaiser, Jochen Jaser, Abhinav Puri, (HRB 36809, AG N=C3=BCrnbe=
rg)
>
>
