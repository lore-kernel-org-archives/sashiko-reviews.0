Received: from mail-ua1-f98.google.com (mail-ua1-f98.google.com [209.85.222.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC3C433BC0
	for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 19:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789587357; cv=none; b=DCKYCgT8CBIXxqj1y25g4px6BogF4aytn+q9QpR3Whs4gCmxgcWqLZ8fIqLM+dCkRlzh7ajpWCUHSNv/jZYwZCx0ZydDaqvRpsZWP3Wi9P+ec4YTLzvmuWJsvdpP6x5NhTpiysOP/1miPglSmJNzd3F+bv8dPyxoLy7AiQsYT8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789587357; c=relaxed/simple;
	bh=6B56xyUG8B5GTOU/8OHMPLa+LzoiWLOG68iCKD9O1DQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hHcNBXEOaJutrAJDi82tgkFguwBgEMmzp9S2rzH3PbXOy84QtuV8FZTjBmD5Sovh8Jib0q9+5V/yn5iOvCmksFAQM/vgdSt1ZUSWwwR/duTJOt5mbriwcvP76/Y7ZrD7y/ZUyl/V5nBTCY3r7FTBw+QJefq1otX0A6xXuX0IYco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=WaBfrowu; arc=none smtp.client-ip=209.85.222.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="WaBfrowu"
Received: by mail-ua1-f98.google.com with SMTP id a1e0cc1a2514c-982cfbcfa4fso2804241.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 12:35:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789587352; x=1790192152;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v5REqIqOjkR0q6xEyZx1XmGc3akoxdiHDXhBohWT97o=;
        b=Irjyk69CGQEt+fhFKTAvBZX/LOJqIFRlp+2U8sRuKv5QiluJ56jvYneMx5470oZZ3Z
         SQwHOYpeEdbgXEvmkwp+9YMsogSepyML5n/9rHQ9+Clr+tkO6+m2jvJdPOqwPNyG/2ZV
         Z1ZbRPmGWEFsN/lk2giNjQiG2Zb5mWgLI0zlVhRknU5fre1T1rfLd1+QoQchvd1T1JuL
         OCcwqmLohLOwn4kemcYco8r5f/uDZHGpVNQmA4jD05k0FLKNxbgP+9OUuKvlV5sAphnq
         pxEsDT8ATDZra7m9beaDQFU8BIh8XNwXDEHWbi7s5G/0+u4NC/MoV8Kwa1UAE549m2ev
         goZQ==
X-Gm-Message-State: AFuF++mYeCRj3rzWyeR4CTvbS89DTSBLU5SEnrliupKl0zkHuzdO9+dV
	HQqoDMaWB44sarmf1qnQqp4/s7O20DF9E2ki84O/qySovs/DV65N6BtLyU5+RSTh+jh7gqKNMmV
	6nJ7MRxzxYi7x/837s0U1Zj6X/oSE8+y+c0DE+ei3QJQv7sbC/8J2oFLr+RIc0b/FBJURYCwf8P
	MhJZc9U0cWfQNw/mH3LsyAifYWAUTJEnSLGChTH4hmWr8ptSN9nT8lKD4JkOWzN2LiviAmt4Z9O
	y4NyKP9ppITvkVJoyk6rLWu
X-Gm-Gg: AYBFou3KPtwr1RZztjOLneYDpLg1FTl7FmvEwg19Ncq7f+CwEVxhp0D1ch5ksE7/dnC
	KaT45U0KtXeTKJ5Aa1ThB9VUywr3pLDNwpMWhUP3Q4gqAnJnAy5D1KI5zErDu3iZeU3ypztmTQI
	hVesOJINGYaTKqmFQdlFEPgVpazQEbkV0kGBecNCao2RZdGvluwBZ9DC9MqXwWMULxWDQojvqD1
	sAfoBIlCfVAcQV0tiBdxFSTLQPQwX9EIcd8bBp4v6hTHhpQQhDMWgYx7eP8w3Hu0KG5L9EWL+P0
	6uDLp7RrwNtevA8YND01B270o3/oqp67VM4UbMdXZrYUZqBHI5o8N3y5g0GygilA+nSS4U9nAdq
	Y1FaQpkEl2xMu5P/Aa7lh0v+kk7JGe3tCK4NUt/wXGiKRYsGiS4XDIX8pHUT7Od1Si2UcZY2A5b
	iwkgmENyKY0FhC8JQ5ZvNQYp9yX6acQ6PUbQrg
X-Received: by 2002:a05:6102:c08:b0:7a1:f7d2:e83b with SMTP id ada2fe7eead31-7a203bd113bmr94330137.27.1789587351882;
        Wed, 16 Sep 2026 12:35:51 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-29.dlp.protect.broadcom.com. [144.49.247.29])
        by smtp-relay.gmail.com with ESMTPS id ada2fe7eead31-7a1e2f4ba47sm20688137.23.2026.09.16.12.35.51
        for <sashiko-reviews@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Sep 2026 12:35:51 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c252634bc4dso12317066b.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 12:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789587350; x=1790192150; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v5REqIqOjkR0q6xEyZx1XmGc3akoxdiHDXhBohWT97o=;
        b=WaBfrowuaYenQLqjU1oZSm4vim2qL8/9BP9MlBEcQU58OEIWVxZ8zSTHA3+qAf+CQM
         uHuAI3gK1PAgzpwQYykNUCZC44ZHoINyjE7JHr5aKhuQ4HdylhlkmWkLXiI+J2WdZXcq
         o7Z0OsIvyOQ1c+PpBJ8IQxv2mAnHxF1oCOQg8=
X-Received: by 2002:a17:906:f584:b0:c25:47a4:fedc with SMTP id a640c23a62f3a-c29e520df9amr385442966b.2.1789587350260;
        Wed, 16 Sep 2026 12:35:50 -0700 (PDT)
X-Received: by 2002:a17:906:f584:b0:c25:47a4:fedc with SMTP id
 a640c23a62f3a-c29e520df9amr385441966b.2.1789587349713; Wed, 16 Sep 2026
 12:35:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260911233541.1650895-1-james.quinlan@broadcom.com>
 <20260911233541.1650895-6-james.quinlan@broadcom.com> <20260911234736.89C1E1F000FF@smtp.kernel.org>
In-Reply-To: <20260911234736.89C1E1F000FF@smtp.kernel.org>
From: Jim Quinlan <james.quinlan@broadcom.com>
Date: Wed, 16 Sep 2026 15:35:37 -0400
X-Gm-Features: AcwNN1VORf5BnkmRvPPewx8bGctWH7cSbaDRqMXARhQmWajAiAYglFNb_MuxrFg
Message-ID: <CA+-6iNzfwvP78M8gaDJ4Ub5+n+Lan3W-ePwT6ryjScJ5q93JaQ@mail.gmail.com>
Subject: Re: [PATCH 05/13] PCI: brcmstb: Declare and assign quirk OB_WIN_MAXSZ_128MB
To: sashiko-reviews@lists.linux.dev
Cc: linux-pci@vger.kernel.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000005441b3065b9ec62c"

--0000000000005441b3065b9ec62c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 7:48=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] The OB_WIN_MAXSZ_128MB quirk handler silently truncates outbound=
 memory resources and completely ignores subsequent memory windows due to a=
n unconditional early exit.
> --
>
> commit 6fb01c14c0bdf317322f341660866644991a983a
> Author: Jim Quinlan <james.quinlan@broadcom.com>
>
> PCI: brcmstb: Declare and assign quirk OB_WIN_MAXSZ_128MB
>
> Even though only BMIPs chips have this quirk, it is more uniform and
> readable to define this specific quirk where each outbound window is must
> be <=3D SZ_128M.
>
> > diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/contro=
ller/pcie-brcmstb.c
> > index 71ddd8a760af9..401898d04d521 100644
> > --- a/drivers/pci/controller/pcie-brcmstb.c
> > +++ b/drivers/pci/controller/pcie-brcmstb.c
>
> [ ... ]
>
> > @@ -1294,11 +1296,11 @@ static int brcm_pcie_setup(struct brcm_pcie *pc=
ie)
> >                       return -EINVAL;
> >               }
> >
> > -             if (is_bmips(pcie)) {
> > +             if (BQUIRK(pcie, OB_WIN_MAXSZ_128MB)) {
> >                       u64 start =3D res->start;
> >                       unsigned int j, nwins =3D resource_size(res) / SZ=
_128M;
> >
> > -                     /* bmips PCIe outbound windows have a 128MB max s=
ize */
> > +                     /* PCIe outbound windows have a 128MB max size */
> >                       if (nwins > BRCM_NUM_PCIE_OUT_WINS)
> >                               nwins =3D BRCM_NUM_PCIE_OUT_WINS;
>
> [Severity: High]
> This is a pre-existing issue, but does this logic leave resources smaller=
 than
> 128MB unmapped due to integer division dropping the remainder?

Ack
>
> Also, instead of returning an error like the non-quirk path does when the
> window count is exceeded, oversized resources seem to be silently capped =
here.
>
> Could this lead to leaving some required memory regions unmapped?
>
> >                       for (j =3D 0; j < nwins; j++, start +=3D SZ_128M)
>
> [Severity: High]
> This is also a pre-existing issue inherited from the earlier is_bmips()
> implementation, but looking at brcm_pcie_setup() just past this loop:

Ack.  Both issues will be addressed in an additional commit.

Jim Quinlan
Broadcom CM/STB

>
>                         for (j =3D 0; j < nwins; j++, start +=3D SZ_128M)
>                                 brcm_pcie_set_outbound_win(pcie, j, start=
,
>                                                            start - entry-=
>offset,
>                                                            SZ_128M);
>                         break;
>
> Does this unconditional break force an early exit from the resource itera=
tion
> loop over bridge->windows?
>
> If platforms define multiple memory regions in their device tree (such as=
 the
> four 128MB PCIe memory regions in bcm7425.dtsi), wouldn't this break caus=
e the
> handler to map only the first resource and ignore the subsequent memory w=
indows?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911233541.16=
50895-1-james.quinlan@broadcom.com?part=3D5

--0000000000005441b3065b9ec62c
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
P6nIShznyqOL2EoCa0IXujxvXUo0pANFYsDhrCVF5JOVPeEL3Y2m+4flRtOI+YlRQoepb+TEVdkY
/g1rlWG7GIYrtHxrFFRvn2/Iqqpv/x5kzJgoTYFOyTTGlXIqGkKTqCWFrN09kJWzhhmxhxtJprJs
KveDLF8yhHSbqmXfKTkT+CIrynXXDro+80qXEXC8CM9W9d+2lDDM+hWTlC6Pt/ikMYf/ZB4K2Nr8
VFruDYGZfAHhh9/lqK3SpS2Z/8cB88K62U+Eb1yNAgMBAAGjggHeMIIB2jAOBgNVHQ8BAf8EBAMC
BaAwDAYDVR0TAQH/BAIwADCBkwYIKwYBBQUHAQEEgYYwgYMwRgYIKwYBBQUHMAKGOmh0dHA6Ly9z
ZWN1cmUuZ2xvYmFsc2lnbi5jb20vY2FjZXJ0L2dzZ2NjcjZzbWltZWNhMjAyMy5jcnQwOQYIKwYB
BQUHMAGGLWh0dHA6Ly9vY3NwLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAyMzBlBgNV
HSAEXjBcMAkGB2eBDAEFAwMwCwYJKwYBBAGgMgEoMEIGCisGAQQBoDIKAwIwNDAyBggrBgEFBQcC
ARYmaHR0cHM6Ly93d3cuZ2xvYmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wQQYDVR0fBDowODA2oDSg
MoYwaHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9nc2djY3I2c21pbWVjYTIwMjMuY3JsMCUGA1Ud
EQQeMByBGmphbWVzLnF1aW5sYW5AYnJvYWRjb20uY29tMBMGA1UdJQQMMAoGCCsGAQUFBwMEMB8G
A1UdIwQYMBaAFAApNp5ceroPry1QLdugI4UYsKCSMB0GA1UdDgQWBBQiuRLoBkhIaas+1j3yf23P
ffVFcjANBgkqhkiG9w0BAQsFAAOCAgEAp1y0fznw9Uo7UzExANVpYjj+OG1c3C7MhWOvAd7LvfPX
BSFisMaabop5Pyfc/sWzb/jCNfVkkDW5Ij2mzpUsUca2qpILoFhOUT9b0d+nc48MCZ4/Wj6vX5QJ
i9VdYeuv3DYASZsQdH8iYnV5X5YCYo1AO/pyW+M4gG022Nsji9+3A9zkx8JRPDIXkPaDLrzcGD9L
rEVIYnnSK9b/4VHzITVgEmSsUTAIzOD6M6TzgrSoJZFmKNMXlAqo+m1nlNyJkM4OyOvaDx5y+2hA
mp4tzD9gJNU9TzQpQRZFz53+c8BkCpzvcHqT8lMluRlCrIYWqaSOUDHX9HPYvzbtO4iYV+irMdGN
2PBz6Wtfaoi1xTfFSKK9ON1mvxACK+E4B5gycSoZcOBADTbGXLDMqiygl7Wz0oooAPqZpUnaD1nc
x/pX7N8Ff6YK+iN3vVah34vLkE1CMFyDQMtyTCzQPW+7XCTxCL9ML3LBAF+eNAtKpPOsrGIdRHy5
6oQr+2ZquSMvWj447q4v3sk1LHs7ata+sP8/kmcPKn3WPXQ/4xMevqFVyv2VIFrBK9ZnOZ//fz8R
7SjJ7t2kOITvbWcMkizMc33S9hfmYiXaVTjIi89NiO3EXCJouYShpptgGNG6mpYHcddnfdKiILOS
06KlKNuHO4IpRmaGrzcDjsUQQSn8amMxggJXMIICUwIBATBiMFIxCzAJBgNVBAYTAkJFMRkwFwYD
VQQKExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBD
QSAyMDIzAgwHM7pH5w7o7Qb7yXUwDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEIAwh
3hj/+KrxkcxerWGlXZZ1D2kqoM8441drr6pA/kuUMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEw
HAYJKoZIhvcNAQkFMQ8XDTI2MDkxNjE5MzU1MFowXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQME
ASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJ
YIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAHwCnMiy+J+I9i8B16GMDxNxa27fN95kCejZQeir
08R5NVMj6tVl80K/paISHDNJB6NgAoMWsDHjaMHCcLiGFmXMuTDKTyXZCvDVn72dFvHBrCgpTE8W
2tP5TJdanMU3rnpe68b7OvDmVdKaiuKt27WZMmkR46FujN2urW91F1IsHqm3C6bWG+bWhtb089X3
0EK5LKVSBHlF9NP/ukF2zwAJftKQTn82rKCOGpO/o37N5om8Mz4Hm3Q9GoV4bEl6NvA7M6csGWZh
MGK4YIY4UGUnFY6KHOe3tP2KoK9hKlVRV6s0GCzODyf1nm+shqJ/FpSCF9TNk/cBAvk1Z3RaDcE=
--0000000000005441b3065b9ec62c--
