Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16D23FB7E9
	for <sashiko-reviews@lists.linux.dev>; Wed,  8 Jul 2026 21:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783547792; cv=none; b=YCDbuqisLilaKTx4dvgJH9MRYgjPbW+6g1pkRKzGvqiB1B1AWY3x+r03Ayj1hT09G1VGejY9nvkCwi75iPxL+3QKueDCY65QuicUrg6DgjTNu0oISqy5aCE9zCbhRAuWwn712MuYMl5hvwgf0nBAwdqIMg1lkY+s9a1Ig4y+x10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783547792; c=relaxed/simple;
	bh=btjBlfn1gEh32xkLC16toOwaofpK3E2AbdoJxAP/F/4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZQLkP+N5A4bKngCOSknsuwRlbqOyncfHQlgZtvklkeNNrx+udODQDv0lpSY3tl78V6y9iIsvmSWI5rnApE8bQp6FturIhmSrWp/R1BAgHwbWIcjDXhthwVtXBUZGGl3TTb+aD3w/EfHEQ3DmuoC4z7l5j8NzXjKw2pZNAE5ZMOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JOoddEpW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JOoddEpW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783547789;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=btjBlfn1gEh32xkLC16toOwaofpK3E2AbdoJxAP/F/4=;
	b=JOoddEpW9Tb0/6eKbkj2lDDfo+YHD8u0RR9zx65OqXXdUtL4ETe5C5KMzULjE5CGGiuro+
	9/bS9aAvA5n3FQV2HfqKpg9pAYTdm+GPH+Junv03FCBEEqc3p82LNn98OEM2+kh4VFrUVJ
	NLHAWv9zXT+STJw9PWvFYGlUQY2hlU8=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-696-S_G1-OPHPTGbXHydKjR1Yw-1; Wed, 08 Jul 2026 17:56:28 -0400
X-MC-Unique: S_G1-OPHPTGbXHydKjR1Yw-1
X-Mimecast-MFC-AGG-ID: S_G1-OPHPTGbXHydKjR1Yw_1783547788
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e663c29f2so45857585a.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 08 Jul 2026 14:56:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783547788; x=1784152588;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=btjBlfn1gEh32xkLC16toOwaofpK3E2AbdoJxAP/F/4=;
        b=LzX+xdFm4lx+UsT0zZHI4z/QWxRiPf5890l0yFYD/uXaUka/36XVIwxvZsaC5GMN9P
         zBbU8vD9D4t3P/uqo5VyDHgbfErVe3pJVoVFUCsYtKv5DHtEriFDI1N9R8k9TYSHkpN/
         i8q3EnblL8EJDwtf4v3uV0zXfjW29aGeghR7IPybBEcX6bbjn8Ts+qUmsZRWzDM/98t9
         YLL0EpDj/gl7IH0c45Asa4mNDqAKKnWVSI1JX42yG40EVjODhWNyTQsSTrgx0Q+hUZu7
         +pLa7c+o/RPuEJgz6RGR+x0j5WSgPDArfKja9NA+T+ki8SlVEObo7h+E1/gpW5CemC3/
         8Uhw==
X-Forwarded-Encrypted: i=1; AHgh+Rrl2Kav6YifgPRIavWSSj3AWUL0ipsCLdPhq0j4lazt0thbATjlf8i51/xXrBKHcIG+7UIW8QafLCZYw/gQddc=@lists.linux.dev
X-Gm-Message-State: AOJu0YzqNGnMl4v8Sbyb69Y5fbgSBikB1+KPrTtiNU/A+qQR2kB++AcD
	Wk8LrHR39HLPViwQMxkQw9F3tALrmmpWHGlzjM3Q27d/EcPP2dqI0tjqfTpgO53y4w2199TRNhL
	CrhlJH9pbCVUVY23Rh5tLpF4QVj9RkVw1yw1m/KFA1TE67ncscx3FzUH0RymJpHB6NQecoQ==
X-Gm-Gg: AfdE7cmC3hJ+ORcm+VFlSzrNk/z0rF2W2aYpyK4h/x9K3llP+1zywmF8sdWY1emw0zK
	HCuqqmSo59Pxwdrzj26ht/OTpqix96pt7do0r79s2vQhOR/V4YYWjP1V2TnxBBE92c6z5NKY//b
	/00wPNvieoIRsR/kJrP1ykz/QtwBzRk3TleHmPrRHWnO8C6PJd/DqgjgJmT50NmNj+p320Rf6Ri
	DpsKVnYbMBtoKdUONeifnkCdZWirJHpE1Wnpk2JGMHTAnTMFYDaejJq8OuKkRei+Z+neB4dR1Oy
	7vHwZi48NHq1VyXUgd5YTf9TooyYhQ3Sy0mxVA55PKAfNPUac7gN5uFsD97EIlPa7bOE8foQDt8
	eU8XhsyU=
X-Received: by 2002:a05:620a:444a:b0:911:e11e:dc0d with SMTP id af79cd13be357-92edac0d694mr13099785a.24.1783547788059;
        Wed, 08 Jul 2026 14:56:28 -0700 (PDT)
X-Received: by 2002:a05:620a:444a:b0:911:e11e:dc0d with SMTP id af79cd13be357-92edac0d694mr13096985a.24.1783547787628;
        Wed, 08 Jul 2026 14:56:27 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e90ca90a5sm1483479985a.32.2026.07.08.14.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 14:56:26 -0700 (PDT)
Message-ID: <b6b58477af57eb25e28eefb1a979a65aa250dc45.camel@redhat.com>
Subject: Re: [PATCH 00/10] vga_switcheroo, drm: Push fbcon handling into DRM
 clients
From: lyude@redhat.com
To: Thomas Zimmermann <tzimmermann@suse.de>, lukas@wunner.de, 
	jfalempe@redhat.com, alexander.deucher@amd.com, christian.koenig@amd.com, 
	airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, 	rodrigo.vivi@intel.com,
 tursulin@ursulin.net, dakr@kernel.org, deller@gmx.de
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
	intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	linux-fbdev@vger.kernel.org, sashiko-reviews@lists.linux.dev
Date: Wed, 08 Jul 2026 17:56:25 -0400
In-Reply-To: <20260707135724.247562-1-tzimmermann@suse.de>
References: <20260707135724.247562-1-tzimmermann@suse.de>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JhK8fSXkN8tcCeHsm5J72gur-MWue0ojzrTBIWj1W2I_1783547788
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

For both nouveau patches:

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Tue, 2026-07-07 at 15:38 +0200, Thomas Zimmermann wrote:
> Vga_switcheroo currently invokes fb_switch_outputs() to inform fbcon
> about switching of the physical outputs among framebuffer devices.
> But
> new DRM clients to not use fbdev/fbcon and might require their own
> vga_switcheroo support. Let's strictly separate them from each other.
>=20
> Remove fbdev/fbcon from vga_switcheroo. Introduce a pre_switch
> callback
> for vga_switcheroo clients to do the fbcon update. Allows for
> removing
> all direct interactions between vga_switcheroo and fbdev/fbcon.
>=20
> Also replace the existing reprobe hook with post_switch for symetry.
>=20
> At the same time, push the fbcon update into DRM's client for fbdev
> emulation. Do this with the new DRM client callback acquire_outputs,
> so that other clients can have their own handling of vga_switcheroo.
>=20
> There are only four drivers that support vga_switcheroo: amdgpu,
> radeon, i915 and nouveau. Update each of them with the new callbacks.
> When vga_switcheroo now invokes pre_switch, each DRM driver forwards
> to aquire_outputs and lets the DRM clients handle the new outputs.
>=20
> Tested with radeon on a notebook with Radeon HD 4225 and HD 5430.
>=20
> Thomas Zimmermann (10):
> =C2=A0 drm/edid: Include <linux/fb.h>
> =C2=A0 drm/client: Add acquire_outputs callback; implement for fbdev
> =C2=A0=C2=A0=C2=A0 emulation
> =C2=A0 vga_switcheroo: Add pre_switch callback to client ops
> =C2=A0 vga_switcheroo: Add post_switch callback to client ops
> =C2=A0 drm/amdgpu: Implement struct vga_switcheroo_client_ops.pre_switch
> =C2=A0 drm/i915: Implement vga_switcheroo_client_ops.pre_switch
> =C2=A0 drm/nouveau: Implement vga_switcheroo_client_ops.pre_switch
> =C2=A0 drm/nouveau: Implement vga_switcheroo_client_ops.post_switch
> =C2=A0 drm/radeon: Implement struct vga_switcheroo_client_ops.pre_switch
> =C2=A0 vga-switcheroo: Remove unused interfaces
>=20
> =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |=C2=A0 9 ++++-
> =C2=A0drivers/gpu/drm/clients/drm_fbdev_client.c | 23 ++++++++----
> =C2=A0drivers/gpu/drm/drm_client_event.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 18 ++++++++++
> =C2=A0drivers/gpu/drm/drm_edid.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A0drivers/gpu/drm/i915/i915_switcheroo.c=C2=A0=C2=A0=C2=A0=C2=A0 | 11=
 +++++-
> =C2=A0drivers/gpu/drm/nouveau/nouveau_vga.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | 28 +++++++++------
> =C2=A0drivers/gpu/drm/radeon/radeon_device.c=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 9 ++++-
> =C2=A0drivers/gpu/vga/vga_switcheroo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 41 +++++---------------
> --
> =C2=A0drivers/video/fbdev/core/fbcon.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 8 -----
> =C2=A0include/drm/drm_client.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 14 +++=
+++++
> =C2=A0include/drm/drm_client_event.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 ++
> =C2=A0include/linux/vga_switcheroo.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 30 +++++++++-------
> =C2=A012 files changed, 122 insertions(+), 73 deletions(-)
>=20
>=20
> base-commit: cd8abe2554ec7eba16c1d48ab508732bf93534eb

