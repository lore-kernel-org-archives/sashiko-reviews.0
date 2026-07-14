Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B0C42BC2F
	for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 21:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784065744; cv=pass; b=t2Dxgtzlw7qcKspAudComh2I9wE7TquHicDK+kak+ro8z+MCB/fDe/oI67rHcHcPsE8brecX9DfoAXIadL30ghP9WaJ5ENsYmS2ArfjsuV3nn1v6YQ/6KATbD4YcPV66pUV78GLnsW/pI0ErVQ1g8+ZwpkgicJ+w7E42TN7CwKU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784065744; c=relaxed/simple;
	bh=Q7eu7A8mVDYTB7H2y1NiUNmzSiLqKzLWkbT4f/CLkdY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jw2v2r55TPWDP/rp4epInCNOt377umECMIdDwd0Gi59vD7b2iRyNG4tTKqFmU0AxwA5WTyWwY471iwQMPJTj6CZaTqUuBZATueIwQMcjzFHUCFcKWdHxT+emcuX2gJhF+GpTWVy+tX9PbB+7wv7f9p7bOL43eX5wAoUNMjwHXpE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=c8yEXnKX; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="c8yEXnKX"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cc7ef7ec27so55013835ad.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 14:49:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784065743; cv=none;
        d=google.com; s=arc-20260327;
        b=kQtdVH6OJl/AGRxuvG4XIqh+4EAEi7qqdsDJNL0RAIGSH1HuPTUVD8v4+7hEv+yopv
         1XIbKCLwv+qk4ycJTpQ+JUj4+uEcgEGhzQEXGxRrW7239RFa6sdfD9wF713a+T5aabiC
         HKq4bq8JWSA6HbiIBL27Gz9EWMuM9AcdKAf0TBEQxCgVELz6homr0wXbqN76hTS4fV3K
         xK3k0bpsIRZuZg8Nx0TVisikX4Lf/Dm+NO7EREKdS1WJX0hFLHSxqpj5Mk/i/S7xxbCU
         XXsitIpJFrjCBTF1F7CPsP32pebLEPW6aIHYydmkU5mapFYKpzw2NnsMNhpugr+nhXcY
         /g0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KiEkozbG/zzeFhbURXvQxjJe0ZNLrQY5+aHS5HFfXJU=;
        fh=bN3WHTlzXcVIr2RkgMpk3NXK/DwXOefqRaFpMbeYf7s=;
        b=jNOKcQwtJb+pFYO2lOjWZj9RZkXHyPm88Bm5lPDFP6FIAIsPbG2Jq29zBOieKvGNW/
         ZC5WwNyT1kPfemDmhhWLzPbwIu9u3QZFcYpqmkb+HWfEhV/4jwtbazQLQDPZRWRWsz6c
         CpgVAI4x4hZGVwgl+ZiLLJs5F3JhnbOB7CWhM7tL4GyB2vXUA7DoYLVc+9F0Bgfz/dv5
         pjeFst2jjJcWKlkLPWJzODkybLHzs8a7ywYqO9tgIxxP3D2x8WpYttPUGakyMwgs2oHw
         ZzXubw+suy6HSTa5IeLkkiHcuUhJltfVYFB1J6/G32pnOzKoK86Z+xgjcoXMScdSDGys
         rXRA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1784065743; x=1784670543; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KiEkozbG/zzeFhbURXvQxjJe0ZNLrQY5+aHS5HFfXJU=;
        b=c8yEXnKXQRCvGfzicMaVHkUzzjfnTACDJ89YHLM/KWNwbv7waj7wqCFa82138a+Nfr
         TnqM/+6dhlwjdidvbLIKYW9T9QobwJF/MNM7hn4gqNFhZZbXgOHfweC7uOhbVJDF+RmK
         s1ykEvghkbmUWAnkkNv2dhZvnhBUUG37ssqnaR5kwvRsh6S2/ejWToOOQTBOnkVH7FEg
         /8YXKTfeTFIjiH8gCAmViu4yzmiVpD5eS7InxKf2md38ou24Wkwrxat387unPrnJJCB9
         uidb8LcKC+zA+bMtNfZBn9wm6Dw/kdZqI1TuEJg9HOUhJ7tS/al0sqdgEKedH3ext08Y
         ST/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784065743; x=1784670543;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KiEkozbG/zzeFhbURXvQxjJe0ZNLrQY5+aHS5HFfXJU=;
        b=DRC1N1z1fm4GJ11CRDus5AjJdzv+T8wKXTRb8oyt6la0wB6YBN7+ALY7oFNoBR40dk
         Iw6hl9csrUtIpotgK7pIJCEqKncsvSvadLdyshvPjDUia0jwFjX6C1GKDRA4PRIQaMJS
         fdRNZf4Qhe6T7YawkrLyu6p4OuGD8mnREQbX+l7rnWpuoGlJnGBUZcaE77Q7n1EMfriT
         vORU9yqRoMApzY/b6Df+U1rmcDWPRXZP4hq03E36RE7H2nmo9OtCEnj/STXAqyXTaQ6I
         TvgstRwyoQ73BgdPVqKYLO+To7t6nKbhZhqCsJaBbgIJUcuMs/B8VJk7nfP+Jyw8g6GJ
         Ah7Q==
X-Gm-Message-State: AOJu0Yw9Zmjrsa6c/umTwmOWzmR2j7r2grwDpsMjwr1DblUmtoF4SAdg
	XymF9z3rW0PtAT15WBS1MRK4+KkkUW2FIG7TWm2gu8wl7MKlo+Z6zkirbGQxES4WZ+coMeGSfE7
	+BYwxHs0fGIgBBGPAst2WmUb++ijJLTqgEK760OSfdTyzcREOPyghQGOoYEc=
X-Gm-Gg: AfdE7cltzFiXV45zGsxDXa81V/Y3OjERASGFmjSKG9TKZTSVKqsVUpjWoLyW9uTR6lb
	Xq2UvXcLjefeaQEvi40vlGMTF1XLkdUeusQcy0+AWQ4pmvyuWnzKCDJLgqQjgWF2mzrAj98sbal
	wqT48sPzaS2MkUnJncVdoPKipleamatBDxub2PtbOQA8SxgiAuRi6y9Mx2u/tjXgongrjbQqlKb
	z09wCgUw9YpK7dIo/1EZ9ODwgD2OGChyNhj/YQKnaO5c8I4cQccZg22kGkeEkLSNMrgsKGRLCfB
	9zX7Ec0Sj4FuFJrWQ6P7oFVx75ItXlMhH27N/dQ=
X-Received: by 2002:a17:902:f548:b0:2c9:97a7:3278 with SMTP id
 d9443c01a7336-2cf03d55d5emr1967745ad.41.1784065742737; Tue, 14 Jul 2026
 14:49:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260711230728.2250485-1-xmei5@asu.edu> <20260711232012.E57081F000E9@smtp.kernel.org>
In-Reply-To: <20260711232012.E57081F000E9@smtp.kernel.org>
From: Xiang Mei <xmei5@asu.edu>
Date: Tue, 14 Jul 2026 14:48:52 -0700
X-Gm-Features: AUfX_mwevLG8KMsflcSbp_AaCwRgqd89gYVracTIBY8fjD6NVrH4fqTpmwVqwrI
Message-ID: <CAPpSM+ThxPjj0uyfGfmGpu51jL9mKQt=OJU-9J=gS38vzu6r9w@mail.gmail.com>
Subject: Re: [PATCH] drm/modes: reject out-of-range GTF blanking duty cycle
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 11, 2026 at 4:20=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [Medium] Unchecked `vrefresh` parameter from kernel command line can ca=
use multiple divide-by-zero panics.
> --
>
> --- Patch [1]: [PATCH] drm/modes: reject out-of-range GTF blanking duty c=
ycle ---
> commit c78fc29b3d453bf33d5cd88746572b5f1e9a5c60
> Author: Xiang Mei <xmei5@asu.edu>
>
> drm/modes: reject out-of-range GTF blanking duty cycle
>
> This commit rejects GTF blanking duty cycles of 100% or more to prevent a
> divide-by-zero error that occurs when the divisor (100000 - ideal_duty_cy=
cle)
> evaluates to 0.
>
> > diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
> > index e1eed13a8e94f..291037706b587 100644
> > --- a/drivers/gpu/drm/drm_modes.c
> > +++ b/drivers/gpu/drm/drm_modes.c
> > @@ -966,6 +966,10 @@ drm_gtf_mode_complex(struct drm_device *dev, int h=
display, int vdisplay,
> >       /* 18.Find the ideal blanking duty cycle from blanking duty cycle=
 */
> >       ideal_duty_cycle =3D GTF_C_PRIME * 1000 -
> >                               (GTF_M_PRIME * 1000000 / hfreq_est);
>
> [Severity: Medium]
> This is a pre-existing issue, but while fixing divide-by-zero crashes her=
e,
> could an unvalidated vrefresh parameter cause other divide-by-zero panics
> in this function?
>
> For example, if an administrator provides a kernel command line parameter
> with a refresh rate of @0 (e.g., video=3D1024x768@0), vfieldrate_rqd
> evaluates to 0. This would cause a panic earlier in drm_gtf_mode_complex(=
):
>
>     hperiod =3D 1000000 / (vfieldrate_rqd * vtotal_lines);
>
> Also, if the refresh rate is @1818, tmp1 evaluates to 0:
>
>     tmp1 =3D (1000000  - MIN_VSYNC_PLUS_BP * vfieldrate_rqd) / 500;
>     // (1000000 - 550 * 1818) / 500 =3D 0
>
> This leads to another direct division by zero:
>
>     hfreq_est =3D (tmp2 * 1000 * vfieldrate_rqd) / tmp1;
>
> And if hfreq_est evaluates to 0, it causes a third divide-by-zero on the
> ideal_duty_cycle assignment above.
>
> Should drm_gtf_mode_complex() validate the vrefresh parameter before
> performing these calculations?
>
Good catch that those divisions can trap too, but they're on a different
reachability tier than the bug this patch fixes, so I'd keep them out of
this change.

The @0 and @1818 cases you describe are only reachable via
drm_mode_create_from_cmdline_mode() (drm_modes.c:2557), i.e. a
`video=3D...@0` kernel command-line argument. That's root/admin-at-boot,
not a crafted-input boundary.

Xiang
> > +     if (ideal_duty_cycle >=3D 100000) {
> > +             drm_mode_destroy(dev, drm_mode);
> > +             return NULL;
> > +     }
> >       /* 19.Find the number of pixels in the blanking time to the neare=
st
> >        * double character cell: */
> >       hblank =3D total_active_pixels * ideal_duty_cycle /
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260711230728.22=
50485-1-xmei5@asu.edu?part=3D1
