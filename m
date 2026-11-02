Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793631212;
	b=vGXTn1v5F/g6UZoFxcpn2II0dycJO7UnobKRE+4Pg5XOj1WJVLbDU6ctZZ0LZQWdTVHO
	 gvQ7+a2RGSz7+NAd9gL3CveDsgYi8xlM7+1u/YygKkDSEXDW7pWxjOQ/4mIEcxw1CEVb7
	 KI3nF/iR3mg69dOtQ4UeJJYElv2pa5J8svZunNExfJvmaaB33YnlzAXfNCiVR2pYnc4Lr
	 F4IK/qQJNzJbiSIVuSnJ79Ujz0b2u72JLlhFL4kkTqOBWuH2rVbuDlzuslSHDsQVLhCLR
	 7DYy07Ftk8aDBzyFbCt7Jpwww4s6LhcNwaFOi4Y9vAwbp63ULbejvLuhdaOSAbyJ/6w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793631212;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=iv0Opuv7/g5dGhurve1r2EU5goEiuuajU/Znr60WItk=;
	b=hw3dUV/HSDd8U/SWq9GxAS+IncTzF2LaOgc69IyoTo1qtTMf5LkDt9XaOpLCbE2UGMaF
	 d7+E1YvnCiVQYZ8MIWvNrBAusWoLZfkXZmVgOX5QoFjgjN/FcFW7Eyqfkp1uLXB1pWqlC
	 qhI2AveGHevhaV2FRo6R/K843k4JjmVa8Y7FNKcVqi92XaOR96/HXC5PeVo6NgbIFDfPV
	 yXeuIF8YNv0LD5LeAs8rEE6yv0ectJEYLgknmw1BOUYrXGSvQD6P5DlP13fYSWa1Xnskd
	 FOvWnZi7bh30g2aXUnrgvH2xom/EOkPYKU3wkfPOH2lKwX2C4W8+1fUJ98ELDhDxYxQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X49shHrj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.178
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A4D6079AA9
	for <sashiko-reviews@lists.linux.dev>; Mon,  2 Nov 2026 14:53:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5A4D6079AA9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X49shHrj
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5eac6e4a735so138989e0c.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 02 Nov 2026 06:53:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793631210; cv=none;
        d=google.com; s=arc-20260327;
        b=OniWGxzFkXaMAZPU6HModm4AbldYGv7STqtXuXpBtKkG/GL1L8ymLqk47ZT+vvXHl2
         rAZubnN5zydzOcuCXM/uDB24CKir6bvNPITkrwX8ZMQmdV9dDgPH7AKntQ8rsYJ0yKDr
         hziGGhfTQ6Uj5aqrWuGnfPOJJnEW1M6x6ossJIMq8G5JLt02CBkQcqcSH6Rdd8Utc5yf
         MpgDsX4Y+TVE5lc/LZ9X/hjz39l33lRpFEd0RpU1J0wQpTvRq4nAQKc7CPmCMFm2YcZi
         0SSc/gpkBaN08YUYScOXmH89s/tHFQE4da4S4La5Idgyo1TVfKdO5KIHule6FQMRSCMK
         T21Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iv0Opuv7/g5dGhurve1r2EU5goEiuuajU/Znr60WItk=;
        fh=q3dj96gLWuAJ7lbKPVbtRH+DoN6yxxsfY7OdMI1ZnQA=;
        b=MHrtqdT25BLxnEadgb6euSj/DyzK6/OmrF2DVMhGg1ZSKjIRt122qHDHv6MLAP7S9f
         FXjOZtyrsPb+QCe1CSseGG+95DOBty7JaSC95pM2mJLT4wHGA/Hm/3POZiN3H9pz8CWe
         Afji2hA1TlkiwWQVSlC6gdtSFZriG0XTerLWmJK3vfcPYrQeQ0f9B6MAqADgGdiNlw+w
         odAb8CbWLw4GBl190XbrXNfx+zJhhv4FnqPv2cZZ+2UxV75Uu5mIjPtbqN/jJYms095T
         bOIfqA/Ad+fjK/7H3u/QQ9rLvAawI9AuB8f07NHHQe2kNr3j1hGbAPCwnjVxl/h/vPY8
         /scg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793631210; x=1794236010; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iv0Opuv7/g5dGhurve1r2EU5goEiuuajU/Znr60WItk=;
        b=X49shHrjBCyhjSBJbtz9092h/d3EHUxvj6gGYCeVvq0ri9mqcq2gGXR8YNjYIvv6E5
         vsoDcz5V5dTzD41dfxX6X7Agk1mP+BC1J+m+TDJrjxsRjuJfYQX2idfiyfDr2dr12gfT
         LLrSYhEd/B/Yy3Np5OUT7FKmd/ruMDFwXjg6WBwvJTc0u/8IcoCgUMvSCa/X2/dB4hKk
         ihOjD/rQPavI4MmwQa/oeEa+FaAXymiZWfjjvKwkirwjDRrc4SE9UVzBBVTdtvwTxy9I
         YBGWz8xJND7IUylMfE7RjTIcEVSu9SsJ4FdLWbbhuBrYrJ6zXGlrpKqMobVlryaNeNjD
         DuvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793631210; x=1794236010;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iv0Opuv7/g5dGhurve1r2EU5goEiuuajU/Znr60WItk=;
        b=qzP7+1RS+DiXTp/RrCSuOv9Yg25ejxXK3459WMlduKQYubdxax/G6tICkY31Dd836D
         1CmDMi9ozRG2anmsvgmE3S9EpxseJd+KVRY18D/cLv60BTDwWYuBrANip1sN0VAJfh2M
         zeorHAAqwrP2WeRMZGli6fG4pJw/UwmoWjLtLg+oEmg04B4eHhDbxxPRdSv4tby0RpYO
         m6p9WcZCKBnhkNyDACAcmfBnIitnLUj9MeBA9OUEai5PlBvoVHZt9q9DMpqrWEo3t7QY
         JGbfjcoQQDMIbGLlm5WRg6MzhRpO2LzfVDi15sbj7NXvylLxxZr4YM/0TXrE2nJd2j1t
         8u+Q==
X-Gm-Message-State: APuU4Z9DQBQW6xEmzFtXL2rhXKGPyzZZSrZaE6lzkJXHUHKb5gkfkvaa
	e01LJ59gEoKhnesUHAj7CCqPqDWgESX81H7oOpXYdBMucVRAnV7PrOWAD9fv7cnzZIo/VP5indR
	p+Tu0cPq3tqbt/3wbdob8h2RxRMTjNHU=
X-Gm-Gg: AYBFou0PcjvX1NLQjpEs8r17+61Su0ahrMoL+1CbiNuqixTAayOE6ChZqs3YzmaGTax
	PalDmep13P6nPLSlw7JJQwxWUZnnjhd+zTlHPm4uRgFeR7uwBeInEWdrrKbpZZApfXSsXPx7iUa
	13yEq75TojwLelZhXtamJVzDrviTVHMnmP5qxgWdr7rddGHwIMGckSZAIebnLdu4vJzFRyAHQo+
	v2MqT3oHnravnvhrwYhvymkGNx++EvwJ40MjhewtgHiQHgznLN0bAPdN6kQKfUD13fRHWQAPZEt
	0IwGXDKMBSNBPsez2KFCFqKYAlMnbnxHzkF5GhiKwRUYr452PDjHCuyVZjTByvjD55Dln0uVB3i
	kfvn3cdBJoVB3i0w7ro3NcT/nAZjsiK+W+cKHrD4djokJTtmX1h5Yxhjfp6/CRB2uwPbuL8xgcS
	W8CaWRP9+60iJ71lj/go4erv8=
X-Received: by 2002:a05:6122:2b16:b0:5e0:2ba:5a06 with SMTP id
 71dfb90a1353d-5ec6896981emr4303924e0c.4.1793631209491; Mon, 02 Nov 2026
 06:53:29 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <6C5E74D6-8F98-48BC-9173-7E85D243B3D3@gmx.net> <sashiko-outbox-191902@kernel.org>
 <2630FE08-2F46-4D29-AF3C-DD9EF2DE581E@gmx.net> <sashiko-outbox-192131@kernel.org>
 <3CAB8D41-76B4-49D9-A4B4-6C78A93296C3@gmx.net>
In-Reply-To: <3CAB8D41-76B4-49D9-A4B4-6C78A93296C3@gmx.net>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 2 Nov 2026 09:53:16 -0500
X-Gm-Features: AclHuK8wHgKFAL9IE6u51OD-FgMQVUF63LQs5DMX6Z93wgGJFSyEsyc3E1Nf9Ac
Message-ID: <CADnq5_OP7RLsj_RgEX9UN06x7_9wVWMX9FzTCP6+Je0ogxb72A@mail.gmail.com>
Subject: Re: [PATCH v3] drm/amdgpu: prefer exact bus match in VFCT VBIOS lookup
To: Matthias Kesenheimer <m.kesenheimer@gmx.net>
Cc: sashiko-reviews@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, alex.deucher@amd.com, christian.koenig@amd.com, 
	airlied@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 1, 2026 at 7:11=E2=80=AFAM Matthias Kesenheimer
<m.kesenheimer@gmx.net> wrote:
>
> When multiple cards share the same PCI device ID (e.g. RX 6600 and
> RX 6600 XT both use 0x73ff), the VFCT table contains separate VBIOS
> images for each card distinguished by their bus number.
>
> The current implementation iterates VFCT entries and returns on the
> first device-identity match, which may not have an exact bus match.
> This causes cards to load the wrong VBIOS image (e.g. RX 6600 loading
> RX 6600 XT's VBIOS), resulting in incorrect clock speeds and
> potential system hangs.
>
> Walk the VFCT table in a single pass, preferring an exact bus match.
> amdgpu_acpi_vfct_match() returns 0 on an exact bus match, 1 on a
> device-identity-only match, or -ENODEV on no match. The walk records
> the matched entry - an exact bus match ends the walk immediately,
> otherwise the first device-identity match is kept as a fallback. The
> VBIOS is then loaded and validated once, after the walk, and the
> bus-mismatch notice is emitted only when that fallback is actually
> used.
>
> Changes since v2:
> - Load and validate the VBIOS once, after the walk, instead of
>   duplicating the kmemdup()/check_atom_bios()/amdgpu_bios_release()
>   sequence between the exact-match and fallback branches.
> - Only emit the bus-mismatch notice when the device-identity fallback
>   is actually used, avoiding a false notice on multi-GPU systems where
>   an exact bus match exists.
>
> Signed-off-by: Matthias Kesenheimer <m.kesenheimer@gmx.net>

This should be fixed properly with this series:
https://patchwork.freedesktop.org/series/176969/

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c | 66 ++++++++++++++++--------
>  1 file changed, 44 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_bios.c
> index f9315e0472fe..d69f8df87249 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c
> @@ -441,7 +441,8 @@ static bool amdgpu_read_disabled_bios(struct amdgpu_d=
evice *adev)
>   * the bus numbers disagree we accept the entry if the device identity
>   * matches.
>   *
> - * Returns: 0 on match, -ENODEV on no match
> + * Returns: 0 on exact bus match, 1 on device-identity match (bus
> + * mismatch), -ENODEV on no match
>   */
>  static int amdgpu_acpi_vfct_match(struct amdgpu_device *adev,
>                                   VFCT_IMAGE_HEADER *vhdr)
> @@ -460,11 +461,7 @@ static int amdgpu_acpi_vfct_match(struct amdgpu_devi=
ce *adev,
>                 return 0;
>
>         /* Bus mismatch but device identity matches (PCI renumbering case=
) */
> -       dev_notice(adev->dev,
> -                  "VFCT bus number mismatch: table %u !=3D runtime %u, m=
atching by device identity (vendor 0x%04x device 0x%04x)\n",
> -                  vhdr->PCIBus, adev->pdev->bus->number,
> -                  adev->pdev->vendor, adev->pdev->device);
> -       return 0;
> +       return 1;
>  }
>
>  static bool amdgpu_acpi_vfct_bios(struct amdgpu_device *adev)
> @@ -474,6 +471,7 @@ static bool amdgpu_acpi_vfct_bios(struct amdgpu_devic=
e *adev)
>         UEFI_ACPI_VFCT *vfct;
>         unsigned int offset;
>         bool r =3D false;
> +       GOP_VBIOS_CONTENT *vbios =3D NULL;
>
>         if (!ACPI_SUCCESS(acpi_get_table("VFCT", 1, &hdr)))
>                 return false;
> @@ -487,8 +485,9 @@ static bool amdgpu_acpi_vfct_bios(struct amdgpu_devic=
e *adev)
>         offset =3D vfct->VBIOSImageOffset;
>
>         while (offset < tbl_size) {
> -               GOP_VBIOS_CONTENT *vbios =3D (GOP_VBIOS_CONTENT *)((char =
*)hdr + offset);
> -               VFCT_IMAGE_HEADER *vhdr =3D &vbios->VbiosHeader;
> +               GOP_VBIOS_CONTENT *entry =3D (GOP_VBIOS_CONTENT *)((char =
*)hdr + offset);
> +               VFCT_IMAGE_HEADER *vhdr =3D &entry->VbiosHeader;
> +               int match;
>
>                 offset +=3D sizeof(VFCT_IMAGE_HEADER);
>                 if (offset > tbl_size) {
> @@ -502,23 +501,46 @@ static bool amdgpu_acpi_vfct_bios(struct amdgpu_dev=
ice *adev)
>                         goto out;
>                 }
>
> -               if (vhdr->ImageLength &&
> -                   !amdgpu_acpi_vfct_match(adev, vhdr)) {
> -                       adev->bios =3D kmemdup(&vbios->VbiosContent,
> -                                            vhdr->ImageLength,
> -                                            GFP_KERNEL);
> -
> -                       if (!check_atom_bios(adev, vhdr->ImageLength)) {
> -                               amdgpu_bios_release(adev);
> -                               goto out;
> -                       }
> -                       adev->bios_size =3D vhdr->ImageLength;
> -                       r =3D true;
> -                       goto out;
> +               if (!vhdr->ImageLength)
> +                       continue;
> +
> +               match =3D amdgpu_acpi_vfct_match(adev, vhdr);
> +               if (match < 0)
> +                       continue;
> +
> +               if (match =3D=3D 0) {
> +                       /* Exact bus match wins - use it and stop scannin=
g */
> +                       vbios =3D entry;
> +                       break;
>                 }
> +
> +               /* match =3D=3D 1: record the first device-identity match=
 as a fallback */
> +               if (!vbios)
> +                       vbios =3D entry;
>         }
>
> -       dev_info(adev->dev, "ACPI VFCT table present but broken (too shor=
t #2),skipping\n");
> +       /* Load and validate the matched VBIOS once */
> +       if (vbios) {
> +               VFCT_IMAGE_HEADER *vhdr =3D &vbios->VbiosHeader;
> +
> +               if (vhdr->PCIBus !=3D adev->pdev->bus->number)
> +                       dev_notice(adev->dev,
> +                                  "VFCT bus number mismatch: table %u !=
=3D runtime %u, matching by device identity (vendor 0x%04x device 0x%04x)\n=
",
> +                                  vhdr->PCIBus, adev->pdev->bus->number,
> +                                  adev->pdev->vendor, adev->pdev->device=
);
> +               adev->bios =3D kmemdup(&vbios->VbiosContent,
> +                                    vhdr->ImageLength,
> +                                    GFP_KERNEL);
> +
> +               if (!check_atom_bios(adev, vhdr->ImageLength)) {
> +                       amdgpu_bios_release(adev);
> +                       goto out;
> +               }
> +               adev->bios_size =3D vhdr->ImageLength;
> +               r =3D true;
> +       } else {
> +               dev_info(adev->dev, "ACPI VFCT table present but broken (=
too short #2),skipping\n");
> +       }
>
>  out:
>         acpi_put_table(hdr);
> --
> 2.56.0
>
> > On 31. Oct 2026, at 21:51, sashiko-bot@kernel.org wrote:
> >
> > Thank you for your contribution! Sashiko AI review found 3 potential is=
sue(s) to consider:
> > - [Medium] drm/amdgpu: changelog and Signed-off-by placed below --- sep=
arator
> > - [Low] drm/amdgpu: false bus-mismatch notice in amdgpu_acpi_vfct_match=
()
> > - [Low] drm/amdgpu: duplicated VBIOS load logic in amdgpu_acpi_vfct_bio=
s()
> > --
> >
> > commit 02e5f189d060ccb33fa88a19690736b51eba300f
> > Author: Matthias Kesenheimer <m.kesenheimer@gmx.net>
> >
> > drm/amdgpu: prefer exact bus match in VFCT VBIOS lookup
> >
> > This commit modifies amdgpu_acpi_vfct_bios() and amdgpu_acpi_vfct_match=
()
> > to walk the ACPI VFCT table in a single pass, preferring an exact PCI b=
us
> > number match and falling back to the first device-identity match only i=
f no
> > exact bus match is found.
> >
> >>    drm/amdgpu: prefer exact bus match in VFCT VBIOS lookup
> >>
> >>    Thanks for the review. Addressing both points:
> >>     - The unused fallback_vbios/fallback_vhdr are now actually used: t=
he first device-identity match is recorded during the pass and loaded only =
if no exact bus match is found.
> >>    - Collapsed the two passes into a single table walk, keeping all ma=
tching logic in amdgpu_acpi_vfct_match() (returns 0 exact-bus / 1 identity-=
only / -ENODEV none). Matching behavior is unchanged from v1.
> >>
> >>    The patch works on a live system.
> >
> > [Severity: Medium]
> > It looks like the v2 review reply was placed above the --- separator, w=
hile
> > the actual commit description and Signed-off-by tag were placed below i=
t.
> > When applied via git am, everything below --- is stripped, leaving the
> > commit without its changelog explanation or Signed-off-by tag. Could th=
e
> > commit description and Signed-off-by be moved above the --- line, with =
the
> > v2 changelog notes below it?
> >
> >> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_bios.c
> >> index f9315e0472fe9..ef9fd98eb9e1a 100644
> >> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c
> >> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c
> >> @@ -441,7 +441,8 @@ static bool amdgpu_read_disabled_bios(struct amdgp=
u_device *adev)
> >>  * the bus numbers disagree we accept the entry if the device identity
> >>  * matches.
> >>  *
> >> - * Returns: 0 on match, -ENODEV on no match
> >> + * Returns: 0 on exact bus match, 1 on device-identity match (bus
> >> + * mismatch), -ENODEV on no match
> >>  */
> >> static int amdgpu_acpi_vfct_match(struct amdgpu_device *adev,
> >>  VFCT_IMAGE_HEADER *vhdr)
> >> @@ -464,7 +465,7 @@ static int amdgpu_acpi_vfct_match(struct amdgpu_de=
vice *adev,
> >>   "VFCT bus number mismatch: table %u !=3D runtime %u, matching by dev=
ice identity (vendor 0x%04x device 0x%04x)\n",
> >>   vhdr->PCIBus, adev->pdev->bus->number,
> >>   adev->pdev->vendor, adev->pdev->device);
> >> - return 0;
> >> + return 1;
> >> }
> >
> > [Severity: Low]
> > Will amdgpu_acpi_vfct_match() log a false bus-mismatch notice when prob=
ing
> > the second GPU on a system with multiple identical PCI device IDs?
> >
> > When amdgpu_acpi_vfct_bios() walks the VFCT table for the second card,
> > amdgpu_acpi_vfct_match() first encounters the entry for the first card =
on a
> > different bus and immediately prints:
> >
> >    dev_notice(adev->dev,
> >               "VFCT bus number mismatch: table %u !=3D runtime %u, matc=
hing by device identity (vendor 0x%04x device 0x%04x)\n",
> >               ...);
> >
> > before returning 1, even though a subsequent VFCT entry matches the sec=
ond
> > card's bus number exactly and is used instead.
> >
> > Would it be better to move this dev_notice() out of amdgpu_acpi_vfct_ma=
tch()
> > and emit it in amdgpu_acpi_vfct_bios() only when the fallback entry is
> > actually selected after the loop?
> >
> >>
> >> static bool amdgpu_acpi_vfct_bios(struct amdgpu_device *adev)
> >> @@ -474,6 +475,8 @@ static bool amdgpu_acpi_vfct_bios(struct amdgpu_de=
vice *adev)
> >> UEFI_ACPI_VFCT *vfct;
> >> unsigned int offset;
> >> bool r =3D false;
> >> + GOP_VBIOS_CONTENT *fallback_vbios =3D NULL;
> >> + VFCT_IMAGE_HEADER *fallback_vhdr =3D NULL;
> >>
> >> if (!ACPI_SUCCESS(acpi_get_table("VFCT", 1, &hdr)))
> >> return false;
> >> @@ -489,6 +492,7 @@ static bool amdgpu_acpi_vfct_bios(struct amdgpu_de=
vice *adev)
> >> while (offset < tbl_size) {
> >> GOP_VBIOS_CONTENT *vbios =3D (GOP_VBIOS_CONTENT *)((char *)hdr + offse=
t);
> >> VFCT_IMAGE_HEADER *vhdr =3D &vbios->VbiosHeader;
> >> + int match;
> >>
> >> offset +=3D sizeof(VFCT_IMAGE_HEADER);
> >> if (offset > tbl_size) {
> >> @@ -502,8 +506,15 @@ static bool amdgpu_acpi_vfct_bios(struct amdgpu_d=
evice *adev)
> >> goto out;
> >> }
> >>
> >> - if (vhdr->ImageLength &&
> >> -    !amdgpu_acpi_vfct_match(adev, vhdr)) {
> >> + if (!vhdr->ImageLength)
> >> + continue;
> >> +
> >> + match =3D amdgpu_acpi_vfct_match(adev, vhdr);
> >> + if (match < 0)
> >> + continue;
> >> +
> >> + /* Exact bus match - use immediately */
> >> + if (match =3D=3D 0) {
> >> adev->bios =3D kmemdup(&vbios->VbiosContent,
> >>     vhdr->ImageLength,
> >>     GFP_KERNEL);
> >> @@ -516,9 +527,29 @@ static bool amdgpu_acpi_vfct_bios(struct amdgpu_d=
evice *adev)
> >> r =3D true;
> >> goto out;
> >> }
> >> +
> >> + /* Device-identity match (bus mismatch) - record as fallback */
> >> + if (!fallback_vbios) {
> >> + fallback_vbios =3D vbios;
> >> + fallback_vhdr =3D vhdr;
> >> + }
> >> }
> >>
> >> - dev_info(adev->dev, "ACPI VFCT table present but broken (too short #=
2),skipping\n");
> >> + /* No exact bus match - use the first device-identity match */
> >> + if (fallback_vbios) {
> >> + adev->bios =3D kmemdup(&fallback_vbios->VbiosContent,
> >> +     fallback_vhdr->ImageLength,
> >> +     GFP_KERNEL);
> >> +
> >> + if (!check_atom_bios(adev, fallback_vhdr->ImageLength)) {
> >> + amdgpu_bios_release(adev);
> >> + goto out;
> >> + }
> >> + adev->bios_size =3D fallback_vhdr->ImageLength;
> >> + r =3D true;
> >> + } else {
> >> + dev_info(adev->dev, "ACPI VFCT table present but broken (too short #=
2),skipping\n");
> >> + }
> >
> > [Severity: Low]
> > As reported by Sashiko on v1 [1], this isn't a bug, but the kmemdup(),
> > check_atom_bios(), and amdgpu_bios_release() sequence in
> > amdgpu_acpi_vfct_bios() is still duplicated between the exact-match bra=
nch
> > inside the loop and the fallback_vbios branch after the loop.
> >
> > Since vhdr is &vbios->VbiosHeader, could the loop simply record the mat=
ched
> > GOP_VBIOS_CONTENT pointer (breaking immediately when match =3D=3D 0) an=
d run the
> > allocation and validation once after the loop?
> >
> > [1] https://lore.kernel.org/r/6C5E74D6-8F98-48BC-9173-7E85D243B3D3@gmx.=
net
> >
> > --
> > Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/2630FE08-2F46-4=
D29-AF3C-DD9EF2DE581E@gmx.net?part=3D1
>
