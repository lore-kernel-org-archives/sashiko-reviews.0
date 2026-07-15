Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD46340A4D
	for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 20:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784146331; cv=none; b=PmQPeV18CM0O3FqTooGz2C7Qu8C2Rd1NyZAvcBMkSRb6+4v0LppxtFwUZJvpfbNAZvS/ImyNeWQivvvFeSwHGtiCO2UA4CFru+qmSzZuZG6EcU8LmZFRByNdeinuR+Jq+JmTqplrm+/LLlG72rjVDgfkrh8g4k+lcsgDb4i42G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784146331; c=relaxed/simple;
	bh=LQoP97ee6SAuWO+aYX1Sg011Xu8NdiUQLdZzTXeAMgs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P30XgDZnMqeZm8s4W+2cZsaG/QErF9XjRmoFCWoWb6ukPgc7tuvhUVc5ZMIRppIQB3ag/M8TxytrMuPmGniYq7vqkxTKin/bY12eDx704Yc31tUilpcTUArrc/1MQ9vAs3IK3gUXG9WxSSXXwosYPIoX/8PsArLlZ+aYjPqhBxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AtK20bnL; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AtK20bnL"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47d70879764so4085043f8f.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 13:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784146328; x=1784751128; darn=lists.linux.dev;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LINappzTtqOvEOGJ2/VoPfdVWpHlvhISScXV6/Tgz94=;
        b=AtK20bnLL5ShiFN8DcBwqQhEMdtHc4DkNtGzo1crEISStRNfItf9rw1laewPraoXce
         d+0qzS6JKyUXH/6W83+ZMeu4DF+UbPY5o3xdA7k58WL0yAIZFrpJuCsAge/mruRRNw35
         Res8vwI+NMuVMhwbVT+tbndyhYGvhxCtrsVUiVOEDzXrcjuoGMRtQlWSJ0aIPNLO3A1R
         AHC7T1zE1x+SQZf1/6UsCSrhOwUoHr3sdOBCZlNJ9bpNqxmhJULG82EPinxnmr5nXv0+
         VqdeHRiDwiqHIj2DiGba95H7QDmsD2XoXQM0w7SZbE7jV23RgzM39zY1qmHwxrf3K19F
         wIbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784146328; x=1784751128;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LINappzTtqOvEOGJ2/VoPfdVWpHlvhISScXV6/Tgz94=;
        b=bas6XEkmqRQm5H4bMkIFUeBYQhV3ytiYCx831wZTm0LM5RZNnemf3hHKinPpma/F0y
         HVzJi0aV1GZu1dfkdd46WIadJnyK0PjVLONPIurdaCfWIneh6kZ7u8tEB6TCCql1Fqrw
         UBQDRDC8EKNmsKUVf6UPYS+wDBKripIThjBj1Y6BZPg+hn49B2GAxMfhrhPK8iee7CJZ
         V42x6bKqFfUIhXFP8H554M+Ni4lzAVAYqBsC7KyapaNs5PdDum1s5zyF3ndta0vCdecC
         cKyPH36O4dp1rn3nmI0WOKoNcqS0aQkEPZ24cvZsVgp3iIPA3YQLo/Xt8CbagWfHvwVk
         1yQw==
X-Gm-Message-State: AOJu0Yzgb0mSWkdIDrQ8X2eHXc+aH6ASlqsyisEhn4/MVTw3N+GQIL3J
	8j2zO9dpUs027oEf+oXUfJ2zQtUalOwDn9z60r38imYQtCWW8+Qf8YfbmlFYmLxe
X-Gm-Gg: AfdE7cmw2CIA7YNW7tRnGZLn3MbwYD7QmKuURt5tUuoL/3Tf7Z3PiGVrLxn6dBXQ5x5
	GNAXl213sXInpTQilt8v3UhPfMA/HWtGeFG0rQKPCWOAtiGSOq/KO21ke5wkINrgJMoZ3FctifX
	Wxil5veSxyob1AyvP+oag2Mj2QsPLTQ1N4oESkIKFiWDXHiO2eRn424Ptw5ZuDqqlcLd5GMTYIn
	wP9p31xIjLjEaVVweA6tHPgUxF2hxKArFLcnOKBNVd2Fn5h0knEUZzDzdTBoekO3/GyxCzfsufr
	JyhZliSLG6bdWvL0Xpd3qIFg2/iztsR5FsyVfEd6eFbtY9+JZg9t46MAi9tX1FNANC3ouRGPwq8
	3/BiqoWQ1lGJfiMw5D3raqylaK5GbyYjoIF4XEpI4jsFIPNuyE6SBsZ2C48QYU27bcDMdSnNP3c
	wU/ZxTIqqULRjY5AkrjtPP76n2dKj4cLUtDTSSGX1Pc8lrlVnlnGqjsdpXWGU6qvY2sekg23JbA
	LNs4df8S3osTJUlHnNra4x4Vj4TuA==
X-Received: by 2002:a05:6000:4a0a:b0:47d:f43b:fd63 with SMTP id ffacd0b85a97d-47f4fcc1527mr5056710f8f.26.1784146328035;
        Wed, 15 Jul 2026 13:12:08 -0700 (PDT)
Received: from timur-max.localnet (20014C4E24CD7200F6BBA872344E1A32.dsl.pool.telekom.hu. [2001:4c4e:24cd:7200:f6bb:a872:344e:1a32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f4634e5b8sm17552158f8f.6.2026.07.15.13.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 13:12:07 -0700 (PDT)
From: Timur =?UTF-8?B?S3Jpc3TDs2Y=?= <timur.kristof@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 4/4] drm/amd/display: Don't use tiling flags anymore
Date: Wed, 15 Jul 2026 22:12:06 +0200
Message-ID: <31315640.VsfAaAtOVx@timur-max>
In-Reply-To: <20260715114238.856321F000E9@smtp.kernel.org>
References:
 <20260715105757.13125-1-timur.kristof@gmail.com>
 <20260715105757.13125-5-timur.kristof@gmail.com>
 <20260715114238.856321F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On 2026. j=C3=BAlius 15., szerda 13:42:38 k=C3=B6z=C3=A9p-eur=C3=B3pai ny=
=C3=A1ri id=C5=91 sashiko-
bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider: - [High] Removing the `tiling_flags` check in
> `should_reset_plane` allows framebuffers with different DCC pitches or
> dimensions (but identical modifiers) to bypass DRM atomic check validatio=
n,
> leading to hardware corruption and stale DML calculations during commit. =
=2D-

This is not an issue. DCC is not supported at all on GFX6-7 and is not=20
supported by the display engine on GFX8. The code does not advertise any=20
modifiers with DCC on GFX6-8 either.

>=20
> --- Patch [4]: [PATCH 4/4] drm/amd/display: Don't use tiling flags anymore
> --- commit b71fc193d0b1254508d4ef4e5b1e90decbcba27a
> Author: Timur Krist=C3=B3f <timur.kristof@gmail.com>
>=20
> drm/amd/display: Don't use tiling flags anymore
>=20
> This commit removes all code from amdgpu_dm that dealt with tiling flags,
> as all supported GPU generations now support DRM format modifiers. The
> legacy non-DC display code still relies on tiling flags.
>=20
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c index
> > c643cc5428577..2f7388c47d02a 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>=20
> [ ... ]
>=20
> > @@ -4279,7 +4277,6 @@ static void amdgpu_dm_commit_planes(struct
> > drm_atomic_state *state,>=20
> >  		fill_dc_plane_info_and_addr(
> >  	=09
> >  			dm->adev, new_plane_state,
> >=20
> > -			afb->tiling_flags,
> >=20
> >  			&bundle->plane_infos[planes_count],
> >  			&bundle->flip_addrs[planes_count].address,
> >  			afb->tmz_surface);
>=20
> [Severity: High]
> Since the return value of fill_dc_plane_info_and_addr() is ignored here,
> what happens if DCC validation fails due to missed dimension or pitch
> changes?

DCC is not supported by the display engine on GFX6-8 so there is no DCC=20
validation.

>=20
> Could this result in a zero-filled plane_info structure being sent to the
> hardware (for example, setting global_alpha to 0) and causing a black
> screen?

No, it couldn't.

>=20
> [ ... ]
>=20
> > @@ -6248,8 +6245,7 @@ static bool should_reset_plane(struct
> > drm_atomic_state *state,>=20
> >  		new_afb =3D (struct amdgpu_framebuffer *)new_other_state-
>fb;
> >  	=09
> >  		/* Tiling and DCC changes also require bandwidth=20
updates. */
> >=20
> > -		if (old_afb->tiling_flags !=3D new_afb->tiling_flags ||
> > -		    old_afb->base.modifier !=3D new_afb->base.modifier)
> > +		if (old_afb->base.modifier !=3D new_afb->base.modifier)
> >=20
> >  			return true;
> >  =09
> >  	}
>=20
> [Severity: High]
> By removing the tiling_flags check here in should_reset_plane(), how do we
> ensure that framebuffers with identical modifiers but different DCC pitch=
es
> or dimensions still trigger a validation reset?

The tiling flags are no longer used because they are converted to modifiers=
=2E=20
Therefore, removing the tiling flag check is not changing the behavior of t=
he=20
code.

As I explained above, DCC is not supported by this HW.

Additionally, "identical modifiers but with different DCC pitches" would be=
=20
illegal for DRM format modifiers.


>=20
> If a user-space client flips between two framebuffers with the same format
> and source rectangle, but different backing buffer dimensions, it seems
> this might bypass DRM atomic check validation.

How?

>=20
> Could this lead to DC hardware being programmed using stale Display Mode
> Logger (DML) calculations and watermarks, resulting in display corruption?

How?





