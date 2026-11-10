Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794347397;
	b=EeGv0eBZqw9qAOj4ShYheukznPzB8VVIlHaPsEGbnImmc5Xm+hIHNdyBGSYUtHSnFkdC
	 uA2GxOwKC7OCWJHwbe/YAnTDr7ea7h8zcitSHKs1cog4acwjVQhIgYaZW0gkI3IssMSg/
	 sAYO5Fj8EgrHmlbkvxmCY4sfdhc7IqvcgitCIyPLmHF52tsLGUyZhVbpDxP8035yb3NxB
	 nS+pMnh0MxU9uAAE+3radNK0A84VjX9bnFrE9oUoe052jnmZZGegWcrYjLM9AKbTn7X6Y
	 Gj7TSPnik+yLexpWfYLQgff5IXrnix4sXMgDBpljoh0jI5QanaRZllYuWIHIn0dCY0A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794347397;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lc2d75OL7aQ19NWtHaPUWdOA/U+qQ69pXWLu70/x14s=;
	b=CQtoKg9xNd/VMoT3rc3D0E/MOQnz3dP9AqRUrhfQ1zXxJmNrrNDNhGDwevdfreV6PMJ5
	 G03TH3rL9YcbAFbS+PXrGp76QzoGT8kTwSDcoTdDd/qM62W3wJhdWQKHm2dnjg6FXr7Sj
	 fqeQEO0FLqzYi23lQ9SMzTEh1oomjBHNRBHPodsmLW10cj2+s8xF6bvNPPmS1WUo/JFhe
	 SCjDqPzo9ik4NgdzJkjBcuQm0WSf+sqqzCwu7iPwR5L50BhMXIb36dO34uSqBH1eu8CJz
	 ZRlaHOjXyIBgx61WUGpybIixpwlYRFsHi7RS4Pb2Gfq+paGjtMyzS46RaHxU7Xb6Y9A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vmbPzGlJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6196606A321
	for <sashiko-reviews@lists.linux.dev>; Tue, 10 Nov 2026 21:49:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6196606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vmbPzGlJ
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-33bb5afa736so293587eec.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 10 Nov 2026 13:49:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794347396; cv=none;
        d=google.com; s=arc-20260327;
        b=Su3SxsLkNkfl9QUfXXYMYTbtqk8XyprLP0i8Q25dkbGQ7rrhHq4n4phxV/raeYkhw0
         SnH3Hb186ECJHSBjknqsZzPjb8qf0TZa/kwvyGuMjK2N8AcXtZ949EvZ6vDfwI/KcDjp
         8FwYqqkPYMzn2vNWT+shqH6mrIITeahfY3gfQ/BTpPahrEYZWR9/9wtlVBGm1BSDWJjZ
         nv+ALpmKBdrkLe/+kEiZT95v46QQAdC5a4xx5tKHonyrsKgiHrlCU8z4QtugiXHGcKAw
         uvUyoMXUEgFFlwPVsVPVlynDFb9kX1+oP5qXqjfnQOEHcwcc3365FEvC2/tDWfAcpxMI
         pZqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lc2d75OL7aQ19NWtHaPUWdOA/U+qQ69pXWLu70/x14s=;
        fh=tk5HmGYP9yIbpt4FfndQpazTxzLfjTHFB991PS49kqw=;
        b=SUXSOOWM6jIiSJaR54Ckkz+vR6tolue8i8fDlYKK6IivhnHFbdIFMS5ciTD4hdb6M+
         srM5fsxDoDBYDQo4bij1Iucm/16Pu5on8qfKJ/Ji+hCrESzOcgXgQOrfbb/LyEGWVdCY
         PJvkEFlnst7Vss2PJ1aD/1uMxciS3JK0cLp5jpoaUuKpzKeWh9oeF/Vh08sRBM4QDsXD
         2jbdHa1Obw/8H2Z9zRRO2c4qriLFkhTiDWQlXjrmLAEohKY4H9H01VmmzlU+bicBK0nV
         IYjp52XMGJOfLORjSV5iqrqM9uYL1CKV4qkWczP0e6UfzIBicG/o+4rBtH3p5dUA2ivt
         PnIQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794347396; x=1794952196; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lc2d75OL7aQ19NWtHaPUWdOA/U+qQ69pXWLu70/x14s=;
        b=vmbPzGlJzZeecwrTLY5w2lNCfas2z9GVCJk0ThErGsH2QVCs8rsF01sirGjOjUhkI/
         7nLkp//7PFogKgT/68Tto4EGvh8B+4hnM9+T2D4OEtNqk+70NtkFOCDMnnNxx7AkLgrW
         ocF+MB/L0B5NMprq335W3kySRf+dwsPMt/QUalvh7/ziAUK8hUk74XWbEe/m0EYPZKkr
         ZvCyvYbLfCRF9xB5WDeYXPDwYXRk8aomIf3I5BrmDQ9S8luiM66y0Uz5FtPJfly/qLA3
         aVU9HpReC9A/fggS3s1jUSLFLI396aahDBp4pXfv1Y2HDV/0gm23QsIKVfGhDZCQWHZV
         GiEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794347396; x=1794952196;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lc2d75OL7aQ19NWtHaPUWdOA/U+qQ69pXWLu70/x14s=;
        b=ztz3NEo1MX9CTWoh46A7oL4A/NOpMwXnT7lYg0gxQWZQ1rm2gIArJwaN+WT3Nhbfkw
         8FfQdpu4UIhrDzNNOkA0Gxje6+if17Qeu6zWT2WStbIT5TJ2kuXheOBTd/HFxo1xRf6p
         5HJb+NB3EqozKCiCwsvtEfZ5qWfKMx6BZk0AlhpwxDnSF2PgC2uKMjq3rMD31g/vGCwd
         /AF8gKw24b/q4n2XaCihaE9pD/QbZILlIaME1EWuGF9faEQRRMyaJGRbW6617EBrGON/
         XTyVseojS5BbuMe3HoiBRkd+Ey/EcAbcUF0NqtmAe/2JNf6Yt6qvpPJGyq4Lt0+bxOdu
         HLbA==
X-Forwarded-Encrypted: i=1; AL+hErESvNDnG2C9L3+6StzO2PydXZOjSK4RBD15NJFiR/SJYTuref6krty8P4GX9bPm7Z+O6fyDWJ3xFZoafadWrYs=@lists.linux.dev
X-Gm-Message-State: APuU4Z+2AaimvI9+fGrzj9RmV7JVVuBvgv3CSflPfbTkdJSrHyYwkHTV
	aGk1dMkwSpPGZrmiSIHxsZBiwbpaPXDT2bFV33NhnXwbwwj9ubeGG9bFyt0z/8W5XgGupcu7hYZ
	bVfL1z9AWq/3VVCVtusNQQgEccx8Ri1E=
X-Gm-Gg: AYBFou1p9ynTcXuPTD4FP7x0EKInfKWR2+hayB8foYh3HDvk92Y8l+QCCkb4mU2KSeB
	wcwK+6/6L6qlraaY19m2CsfC01fLBoM8u4olhoAUMl7Bu1Hfc3DVQS5nMLMQn++w7Ucdl/Hp5tt
	92cF01GX50Iw6/7IOYpTuewe5NpDLEBNK/mOzFBb+QkibwXA3uayFu63h/nrb//mOvKIlHHzVWl
	gCERN7ObZus/bkxREO28s/GmCUyG/6PELtlIHBMsKft7G9ZVYhQVLj7xdcQ85OEgzLEKJP7pqt7
	PUnwVFnpZXzOEeTJg3lRgk/7Yo9OfY8w/0q0OvGchhlXECQnnXdzqFHDZXsT5JsLWqMtwzlo3l4
	WipKaTvOTtsQaIEF+NVEClxMZ+78KNqSMM8PHcT2m8J1Jo/YICEJbDnSeuQ48SZdRzgRZKBpbXy
	LpfwtKIobGWjkWrZ/j8KR8c9hqxHAE1CfZYkZLyss7Hg58kXM4VU8ijmIaMJk=
X-Received: by 2002:a05:693c:41cb:20b0:36e:66d8:1424 with SMTP id
 5a478bee46e88-37680a60bbdmr1218085eec.0.1794347395773; Tue, 10 Nov 2026
 13:49:55 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261110120326.538252-1-tzimmermann@suse.de>
In-Reply-To: <20261110120326.538252-1-tzimmermann@suse.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 10 Nov 2026 16:49:43 -0500
X-Gm-Features: AclHuK_r02Bf4QXu75VAdsauSxMk2WkxkkNGMymOSn-A5ONgkHUPX0j_0Ud49DY
Message-ID: <CADnq5_NCF2J0Dzea5swubs+eEKBLq+8ontc5n=kihYZVA3A1aw@mail.gmail.com>
Subject: Re: [PATCH 0/5] drm/amdgpu,radeon: Inline drm_crtc_init()
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	sashiko-reviews@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 7:11=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> The helper drm_crtc_init() sets up a CRTC with a primary plane for
> non-atomic mode setting. Only drivers for some AMD hardware still
> use it.
>
> Inline drm_crtc_init() into amdgpu and radeon and remove it from
> DRM. All new code implements atomic mode setting, which does not
> use drm_crtc_init().
>

I'd like to drop all of the old amdgpu non-DC code since DC is now the
default, and we have an LTS kernel now.  I'm planning to send these
out in the near future:
https://gitlab.freedesktop.org/agd5f/linux/-/commits/remove-non-dc-display?=
ref_type=3Dheads
So that just leaves radeon.

Alex

> DRM support for kernel panic is only implemented in amdgpu. Take
> the panic helpers from drm_crtc_init() in amdgpu, but clean it up
> in radeon.
>
> With this series in place, DRM's helpers for drawing panic screens
> can be further integrated with other drawing helpers, as outlined
> in [1].
>
> Tested on radeon with a Radeon HD 6570.
>
> [1] https://lore.kernel.org/dri-devel/20261019154612.777074-1-tzimmermann=
@suse.de/
>
> Thomas Zimmermann (5):
>   drm/amdgpu: dce_v6_0: Inline drm_crtc_init()
>   drm/amdgpu: dce_v8_0: Inline drm_crtc_init()
>   drm/amdgpu: dce_v10_0: Inline drm_crtc_init()
>   drm/radeon: Inline drm_crtc_init()
>   drm: Remove drm_crtc_init()
>
>  drivers/gpu/drm/amd/amdgpu/dce_v10_0.c  | 44 ++++++++++++++-
>  drivers/gpu/drm/amd/amdgpu/dce_v6_0.c   | 44 ++++++++++++++-
>  drivers/gpu/drm/amd/amdgpu/dce_v8_0.c   | 44 ++++++++++++++-
>  drivers/gpu/drm/drm_crtc.c              | 26 +++------
>  drivers/gpu/drm/drm_modeset_helper.c    | 74 -------------------------
>  drivers/gpu/drm/radeon/radeon_display.c | 47 +++++++++++++---
>  include/drm/drm_modeset_helper.h        |  3 -
>  include/drm/drm_plane.h                 |  5 --
>  8 files changed, 170 insertions(+), 117 deletions(-)
>
> --
> 2.56.0
>
