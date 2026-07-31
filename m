Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701812288D5
	for <sashiko-reviews@lists.linux.dev>; Fri, 31 Jul 2026 00:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785457854; cv=pass; b=I7+fOeTNKSRtfDmJ304usSbuQHAxTgDDSizyOs0I7O+XKZ/SXluxKR/yvWTMNo6rEvGdfWvY0/P6ot7lHYEGlrCcFXsX2xE/rQVAOBTtr0ZHNayFxxgEAuXoydKkuLZKW881zq9e0feGVRW5Bb3ggpV2/UYGgP8gDzgD6MDittg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785457854; c=relaxed/simple;
	bh=kXfPPOebYPDWBl85UP8B8XOrtKMOHRhmU5KZ3uXt7Xo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OBdFZiDqQPIeYyHyxEkHqpnKPgR/w1lJ4nT4rmEY40anOOjsHZjUMFkeLg5P4Ze8QQVIC2T39rjC4ggfR0VLeovOc7++ah7azyl39dpAb67hPRXqWTig6tmLIMxHkSRlNZdw3PoPuAy9+zozdq8Ba2rKtsHxaRu1Kwm9YRlWDaA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KiW+98pw; arc=pass smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KiW+98pw"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8f29ec73064so3351216d6.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 30 Jul 2026 17:30:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785457852; cv=none;
        d=google.com; s=arc-20260327;
        b=bV/m1YYeXmfSoeB43+vL0sdvOZZGAesdn8G63R+/dSNcYsI5tuuVEUod4fmElG4wQV
         rH1Ox9YMhDJzdDaY7uwsbcae4SP6VvSDBZxzuRynqFZTOz5VBJvRagcEfGfIb4VMpv/3
         rydon41N075GNpPxwl0wee9GUM0SBRGnWb9gFTT70/M7JpaLmmjYFmmNcNtk9wHuRqXG
         TquZl/Bziy9z7sIIr/IwagQAcP2pgxVPxtexJ57QOhryq6viJSQkhcdSSm3wA4ajFh7L
         0IVDt6cmrv/WlwcPYU1SYVTFvofH/5eDmhXQ41psRxohwjPUYgF2PU5nJ+7o+HwtfmvP
         gCmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BynZKIsVSQr3F1TFU0TVk73YY94J3F9HvqIoa9Y7ly8=;
        fh=S6DDseF5h3+g4zAU2M40h9tycaIPHDMVdwvfM/5iAnk=;
        b=ADaHpIAz4yGRhYDA+os6wOhFQRCRGU1/cQRNyRdE48E43Bzwg6CbTIrwKACMQJvcSW
         89WK7vGV50LX30mDF/v9eqaZXOyjVcuRNp7lV4voOx4om5Ykq7qReypu+i5FL6ObCqRy
         +fiJrSU597FMRNlRiOZ2u31HBD4WDvu5WdjhPmalXNcJM/JGiHA8h0hqMzRlse9TYc3n
         N+SgeC2UtKnBRyhVHqHpwAcJJNZD8PGw6ddgq4BY0rDfBT+Ff5A/9zlrmeeVwSE++Q0X
         DQ0ujvhkd4jWL79/PKMTW099HYEvDiph0qynmRvCGegtf7euCq74oYZ01hbdqfDxrEQi
         W/ng==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785457852; x=1786062652; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BynZKIsVSQr3F1TFU0TVk73YY94J3F9HvqIoa9Y7ly8=;
        b=KiW+98pw4uNTW/9xTp+5+O4fs8HF8BFB0uwQJavuSXQL+MIOi+WsotNmNg05gpx4O/
         0alE/WXITU6LZNXPlqBiigwTYJBtlJZxE1vrwMMw4fxj8EQ5sxmFASeJj6JMU3dcmkZX
         tsBIk3jwu4MFQyIc/NiHyJJYBUwBvTPUi17oPGCCIIbNf7inhQMCCyT76Ba2QSbnXTY/
         5cC6PFxu4Up1Rqk3LZrEIRjvLnaKH6GAGCzSMQXYBDnBrI1Dg2dg65k0fNZ6aQpMjlYM
         bh81fa4OFwl26vAezlSSiHimSGbDo3OWhLxcNvttCaQlPKEBEl3U3In5ux/kyex62h4R
         OKbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785457852; x=1786062652;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BynZKIsVSQr3F1TFU0TVk73YY94J3F9HvqIoa9Y7ly8=;
        b=MZnObAO76j25F2RsiBADADNlqAoFE0Zk0nxwURxUFfhDrMJhQJGsSVnENyftbdF8fs
         4l8UJ/JD+cmcKEPQEEWADkVzS9f2zco2vmtShfHV20wHRHeQMTcu3MgJ/t+vh+ugoxY5
         WCvH5uvG6oMJZyMvjk7JTleDqsmdr97fF97KmoIf7ZYfiO5vHn5o0DXl33Ho5eVSt6Dt
         Wa6wujj+8pMWPTYGMTCDALSQFoDZhq6Lcew+2YqWqbEr9mEShBXFG3xWd1zxF8Ned1Mw
         DixfREQuI2dvOLWFxV3u3oJvQuFEYakhEsxhi6x8xJicxnRnO5jaueEuy3KHIOsWlecH
         fIGQ==
X-Gm-Message-State: AOJu0YxBOd/PeGAcUDuBvxXECj7xIkA16kKHDVt2/fzEjL5v5vM+wQ30
	23JE5Dzz/+1NFUJyIva+eBeCxQJIMkhWVV85t2bzkA5nDfGDtN/skUXWcpYyigDJ4aGxNmfmfcs
	RxwMQm5wfFefKj+DgDu0ULrvWjsRU8onKD1YA
X-Gm-Gg: AR+sD13M6f9LHU3ZkRo90odmdKEjVP2T7R5vEdNOfi0r42I7OJTM3XXuUHpNZfBtX/u
	aeUbSnrRczzVwaYanejH2SfYafvLAViONEgiaZBo7MSCp+JPb2qCz7sS4AVUuM7v5AlRC6jS1kS
	Xjv5CcOoRM80tnVUxn38xh53DU9JTCoXa6b3gi4qZR+yyfje9VNGnbCsLuWlQqorMzJxxiYux0H
	z5japfuaHynUS1EB2tOgId4HS1ppCCwnQNgsv4cqf6Cde9gQmRhYJfXpfwW5IKRfpCJzBVT6YLN
	xVQqsnP7CGjd0pAeltj8NDib+Vfx758jAmYjNxuyQUJ9fLdIbohU+YRHn05cnBlKkbbxadOl3sM
	=
X-Received: by 2002:a05:6214:ac2:b0:8fd:6de3:dd78 with SMTP id
 6a1803df08f44-90842411b43mr799656d6.58.1785457852231; Thu, 30 Jul 2026
 17:30:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260730234533.1912709-1-dwindsor@gmail.com> <20260730234533.1912709-3-dwindsor@gmail.com>
 <20260731000002.576791F000E9@smtp.kernel.org>
In-Reply-To: <20260731000002.576791F000E9@smtp.kernel.org>
From: David Windsor <dwindsor@gmail.com>
Date: Thu, 30 Jul 2026 20:30:40 -0400
X-Gm-Features: AUfX_mxUC87VovUpF6S3n0z22UxNvx0DUvlrhBrcBBLnihCTSSPd1G8mlTOLx6g
Message-ID: <CAEXv5_gTJcP5BkSysZujLxiUcjbbBNi_NNbAnOJsQQVLyO9HoQ@mail.gmail.com>
Subject: Re: [PATCH v6 bpf-next 2/4] security: add security_lsmxattr_add()
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org, selinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 30, 2026 at 8:00=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> > +int security_lsmxattr_add(struct lsm_xattrs *xattrs, u64 lsm_id,
> > +                       const char *name_extra, const void *value,
> > +                       size_t value_len)
> > +{
> [ ... ]
> > +     /* Combine xattr value + name into one allocation. */
> > +     xattr_value =3D kmalloc(value_len + name_len + 1, GFP_NOWAIT);
> > +     if (!xattr_value)
> > +             return -ENOMEM;
> > +
> > +     memcpy(xattr_value, value, value_len);
> > +     memcpy(xattr_value + value_len, suffix, suffix_len);
> > +     if (extra_len)
> > +             memcpy(xattr_value + value_len + suffix_len, name_extra,
> > +                    extra_len);
> > +     ((char *)xattr_value)[value_len + name_len] =3D '\0';
> > +
> > +     xattr =3D lsm_get_xattr_slot(xattrs);
> > +     if (!xattr) {
> > +             kfree(xattr_value);
> > +             return -ENOSPC;
> > +     }
> > +
> > +     xattr->value =3D xattr_value;
> > +     xattr->name =3D (const char *)xattr_value + value_len;
>
> [Severity: High]
> Does this code cause a use-after-free for filesystems like ocfs2?
>
> Looking at ocfs2, the ocfs2_initxattrs() callback saves the xattr->name
> pointer directly into si->name, assuming it has a static lifetime (which
> was true for SELinux and Smack):
>
> fs/ocfs2/xattr.c:ocfs2_initxattrs() {
>     ...
>     si->name =3D xattr_array->name;
>     ...
> }
>
> But here xattr->name points inside the dynamically allocated xattr->value
> block. When security_inode_init_security() completes, it frees
> xattr->value:
>
> security/security.c:security_inode_init_security() {
>     ...
>     ret =3D initxattrs(inode, xattrs.xattrs, fs_data);
> out:
>     for (; xattrs.xattr_count > 0; xattrs.xattr_count--)
>         kfree(xattrs.xattrs[xattrs.xattr_count - 1].value);
>     ...
> }
>
> After this free, ocfs2_mknod() will call ocfs2_calc_xattr_init(), which
> dereferences the now-dangling si->name pointer:
>
> fs/ocfs2/xattr.c:ocfs2_calc_xattr_init() {
>     ...
>     s_size =3D ocfs2_xattr_entry_real_size(strlen(si->name),
>                                          si->value_len);
>     ...
> }
>
> Could the dynamically allocated name trigger a use-after-free here?
>

This is real. ocfs stashes the name pointer beyond the call; it's the
only fs who does so. We can special-case ocfs and be done with it.
Will do this in v7.

> > +     xattr->value_len =3D value_len;
> > +
> > +     return 0;
> > +}
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730234533.19=
12709-1-dwindsor@gmail.com?part=3D2
