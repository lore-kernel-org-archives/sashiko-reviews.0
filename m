Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794606122;
	b=T1sT+HOug8UyltDWBlS8csnguHmlJ/xW/Yca5/7pkjb4Tc9RjCam6xFI4Pn5hC0nmXRC
	 ldKHgHB5bvNqXGR2EiJFax7cjzTDPXqqnUQL5kwY7d77R5sLJSGLndJKJD1FyQTxsiJhS
	 7/hucrgZW9kQ4fynHCNAZsR4nQSZp5dnzL9vHh23Hcj2+RvON9nK6OgglITNkGNex+DHS
	 lZcmp6UVeuUCGGEWwI9qqnvFf7FF8wE1N38SbJAEs+HlJysd19D3/oCeerujsLYZaJY+7
	 LhE3Zi8dvr0zR+euxZOaPg0LLYrcWFEdMSmxsqkOF1NJtsZ7R4E4zABtAIIuKNpNznA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794606122;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 X-DetectorID-Processed:Content-Type;
	bh=P9eqwV95T2ivxxhcffd/gV5+Wg/2FJ60hgjwKxtY7bk=;
	b=pe2yvx0/Mu7TEw/XY0iYZYiUFEaGrfQwj0Zy3NcblolJVOEBw4d2gzwOJuZFZU/afPWq
	 O020Dbnz8jfqNKVzfhhQ8HzQ0p9uq5FVE0zdj6bou6IYf3sJ9Wm2Xy5yxaNA8aTyLkV+L
	 TPDTIx3kRx3lKEb/R/P457ykIZIDs+6HPLX8vTc5VNxIbe6SSZIz6fMY9MN4VSg+d1fD+
	 gakCir6Ho3qpEZMqunGQSXF2GodrNVlJKZlfxbms0IqU18TVW3WAtx3BifboiI0xMju5q
	 oQ9W8kwzbyESUkgnO2aNGN8pXwdqhHue7gKBy482brxXTK3ixFnRFxaEaDuHEpDQDgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="c0/r5viY";
	arc=none smtp.remote-ip=209.85.222.225
Received: from mail-qk1-f225.google.com (mail-qk1-f225.google.com [209.85.222.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF29606A338
	for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 21:42:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FF29606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=c0/r5viY
Received: by mail-qk1-f225.google.com with SMTP id af79cd13be357-93e63ee7b4cso220507585a.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 13:42:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794606120; x=1795210920;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=P9eqwV95T2ivxxhcffd/gV5+Wg/2FJ60hgjwKxtY7bk=;
        b=XU7TlFOfUD6I8gFrD9knrE9XU7I3Dia5ki9sYLlOIUmH8eO8de31FfuRCtaQ3Yp0sj
         a5PZqX1b0qfd5rfcnInWr81YT1Gq3AP6FZCitekRHvbYQIqAdqqZqZjMKPvWG/SE3m0i
         fHLksL43QYgvfBwBSSQOByCFMDZ5Lweu4djyzN8EpsnhATPGFW1W4glI96PHAj9g7Rox
         pUNc59LbRi8TCgXiRsQQc6yF/jtl8dWjWHGvukyzHFUCpoaFOkMUDS/nU+Epj1c4FTu8
         hZbn+NIHMwb7FLnGSWdbjM5KBw2FqcDhkegdhSrVmwLwoPoZIvQOPz04imen4fLZsaKs
         P+3g==
X-Gm-Message-State: APuU4Z9cW+BqyMOKlDn4TQzChC7Z9Znw4bNjZTxygkGztg7ujFL0FrbP
	LnH358iU48fRimu9PE6jH42+I5OdTCkC8iPP22Hbtqgx8vT0/IbDNPKrIe3CvO7kt79dWnAvvMP
	7Ec/p1wouRAkRy1ZFsQ9Bc0FP+67BwiHWtckpmeI7cD9j5JPB1f7XLEGBiC23ETP2rWo5BE0BK+
	9c3oP2Ra5aV0TJcv8QHIL0CgRTMmiPIHkS8P6hrJ0+E3l9ncZbyHF9clHoynp+LMnLVb6wnaMKe
	Kz9o8y6G6ZwMLh8rAgm
X-Gm-Gg: AYBFou1d693aKOvfU1aOZ73g2XJr75P45L+ajPu56gtIpJo/Z+rZ1glyW9UR1u51Qko
	GFiQTF+TDlmlwLMvh0hLuxkfFl4/4t6tuFdyOxOeMJxsxvNvvdqJnFaG0HqE1p2nVdfFjv4WqSb
	nMK2X2NjImKoFS/Ziuk5sY5g4NueB8EYxDVWN5E22QhPCrYprkTC5bAvKX/0Fz6xXilkezLgsKQ
	rUjQZ0CWVjyBToFhZYXPLcInk49a9Nm3s/O0gMSMtxr21amWuagdmk4QFnulWn01DObPRytMK31
	SEdQmSqyO+pVNiAqG38bmOtOykI5Fc77UvKpgX4jO4nWdpEQP14P3ZBCYjvlIO1RGxRIUnJzW5q
	KVjJypCIia4+0mHWM1h91UJds9l6FFX/k+J3ntT4Ph4t6og1CF8ndK4q4g583kWNI7MfC0JFPFT
	ELMTcbB6Wksww2kXaDYMmJkdqE8p7R3NgXWpo=
X-Received: by 2002:a05:620a:2615:b0:944:941:c060 with SMTP id af79cd13be357-9494ba7e1damr632927785a.15.1794606119817;
        Fri, 13 Nov 2026 13:41:59 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-119.dlp.protect.broadcom.com. [144.49.247.119])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-9494c7b9255sm77671285a.14.2026.11.13.13.41.59
        for <sashiko-reviews@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 13:41:59 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4db3db8687fso2095470b6e.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 13:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794606119; x=1795210919; darn=lists.linux.dev;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P9eqwV95T2ivxxhcffd/gV5+Wg/2FJ60hgjwKxtY7bk=;
        b=c0/r5viYmBDfCvQClbqMqeiaTeoLNgR+rg+zsh1TvFxIBfi5MzEtxLcPqZr9enpx40
         7Yiv3BjbAisVEc0KMIAORUnu9KNYJlp4eH9yTzE01w4g2vtvu3BJyZOJ7xE9h9vUvZWu
         IDQTFdvpKX0v+VDGwffJUi/HBqZij7gl0OoT8=
X-Received: by 2002:a05:6809:184:20b0:571:ceaa:3e16 with SMTP id 5614622812f47-571ceaa4046mr146896b6e.0.1794606118737;
        Fri, 13 Nov 2026 13:41:58 -0800 (PST)
X-Received: by 2002:a05:6809:184:20b0:571:ceaa:3e16 with SMTP id
 5614622812f47-571ceaa4046mr146883b6e.0.1794606118228; Fri, 13 Nov 2026
 13:41:58 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261113211143.3759154-1-kamal.dasu@broadcom.com>
 <20261113211143.3759154-7-kamal.dasu@broadcom.com> <sashiko-outbox-213725@kernel.org>
In-Reply-To: <sashiko-outbox-213725@kernel.org>
From: Kamal Dasu <kamal.dasu@broadcom.com>
Date: Fri, 13 Nov 2026 16:41:21 -0500
X-Gm-Features: AclHuK9lwK-J6E2Y4fwPPuFMW4wBFiMM0Hh-TZwKVcmMySmxmuiJ1JSCpAL0Z5w
Message-ID: <CAKekbevvJx11j3LMGd76jwMWOgXuy43eyy=dOZauYmQsZR8AFg@mail.gmail.com>
Subject: Re: [PATCH v13 6/6] mmc: core: Add support for resetting an eMMC at
 system resume
To: sashiko-reviews@lists.linux.dev
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000003d031506602f4cc0"

--0000000000003d031506602f4cc0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This has been reviewed before its not an issue

On Fri, Nov 13, 2026 at 4:38=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] mmc: core: stale MMC_PM_KEEP_POWER from
>   mmc_host_class_prepare()
> --
>
> commit 4d49b02aec950ca34b4c4a7b8bdc8427b11a7e76
> Author: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
>
> mmc: core: Add support for resetting an eMMC at system resume
>
> This commit adds support for the reset-card-at-resume DT property via
> MMC_CAP2_RESET_AT_RESUME, keeping the card powered during system suspend
> and resetting it in mmc_resume().
>
> > diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
> > index 8e9e618391980..94c8ec81ee08c 100644
> > --- a/drivers/mmc/core/host.c
> > +++ b/drivers/mmc/core/host.c
> > @@ -48,6 +48,14 @@ static int mmc_host_class_prepare(struct device *dev=
)
> >       if (host->bus_ops->pre_suspend)
> >               return host->bus_ops->pre_suspend(host);
> >
> > +     /*
> > +      * If it's required to make a reset of the card at system resume,=
 this
> > +      * indirectly also means that we must keep the card powered on du=
ring
> > +      * system suspend.
> > +      */
> > +     if (host->caps2 & MMC_CAP2_RESET_AT_RESUME)
> > +             return mmc_set_host_pm_flags(host, MMC_PM_KEEP_POWER);
> > +
> >       return 0;
> >  }
>
> [Severity: Medium]
> Can setting MMC_PM_KEEP_POWER in mmc_host_class_prepare() leave a stale
> flag in host->pm_flags when system suspend aborts?
>
> MMC_PM_KEEP_POWER is only cleared in mmc_resume().  If system suspend
> aborts after mmc_host_class_prepare() runs (for example, if a later devic=
e
> fails dpm_prepare() or _mmc_flush_cache() fails inside mmc_suspend()),
> host->card->dev is not suspended, so dpm_resume() skips mmc_bus_resume() =
->
> mmc_resume() and dpm_complete() runs mmc_host_class_complete() without
> clearing the flag.  That leaves MMC_PM_KEEP_POWER set in host->pm_flags
> during normal runtime, affecting runtime PM paths that test
> host->mmc->pm_flags & MMC_PM_KEEP_POWER such as dw_mci_runtime_resume().
>
> Also, mmc_host_class_prepare() only checks host->bus_ops->pre_suspend
> (which is only set by mmc_sdio_ops) rather than verifying that an eMMC ca=
rd
> is attached.  If an SD card is used on a host with MMC_CAP2_RESET_AT_RESU=
ME,
> mmc_host_class_prepare() sets MMC_PM_KEEP_POWER even though
> mmc_sd_suspend() powers off the card and mmc_sd_resume() never clears the
> flag, causing host controller suspend/resume callbacks such as
> sdhci_resume_host() to treat a powered-off card as having kept power.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113211143.37=
59154-1-kamal.dasu@broadcom.com?part=3D6

--0000000000003d031506602f4cc0
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
H0K0rs+X8O45xZIUJlxzf5UZex3BLi1f/H+08rSQULWEtO/ECwkFod2DIzSX7fZdz5RQ1PpziEOp
goo/JZPYIeCmgt3rIyvMuupj8Ymb0J/velhpXfQuYUM52viw2nmqVcxCwBqyM3Iq7eI4xtEOFRmR
wxSizd3MSQMf6GCHA4/B/6ttnxhGAr3utaOU+x/RnzG0gPLTW1XRAQ0+GVc/tGFdI864OG1cyrRl
GvBnHJQSAFOIKwYrUk2oFpgMbafQ6osCAwEAAaOCAdswggHXMA4GA1UdDwEB/wQEAwIFoDAMBgNV
HRMBAf8EAjAAMIGTBggrBgEFBQcBAQSBhjCBgzBGBggrBgEFBQcwAoY6aHR0cDovL3NlY3VyZS5n
bG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyNnNtaW1lY2EyMDIzLmNydDA5BggrBgEFBQcwAYYt
aHR0cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyNnNtaW1lY2EyMDIzMGUGA1UdIAReMFww
CQYHZ4EMAQUDAzALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgoDAjA0MDIGCCsGAQUFBwIBFiZodHRw
czovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzBBBgNVHR8EOjA4MDagNKAyhjBodHRw
Oi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAyMy5jcmwwIgYDVR0RBBswGYEX
a2FtYWwuZGFzdUBicm9hZGNvbS5jb20wEwYDVR0lBAwwCgYIKwYBBQUHAwQwHwYDVR0jBBgwFoAU
ACk2nlx6ug+vLVAt26AjhRiwoJIwHQYDVR0OBBYEFOV9h+N/T9ZsJ40qRxh7NYYD+N6MMA0GCSqG
SIb3DQEBCwUAA4ICAQAKtKh30wv1/30230mCimgUjMWQE/LImRmyfDgrp2IhBVS6mDun+wH8thEB
WhBHQMz3gsGixU4ZBJG72eWi39IzQ7CGnisJwA0+hsGaGg03AVtFtqo1rXYRZ81MEDOb6BPYLigJ
RsHbNmrUGR+LsGeUwOWUeRXqBrYaYFrkgHKvVK1NEewv+vUY08n4tsezO3jq0HKhVDY46bMbf8vL
oQqqhtcQvu2+5FK2jpUayeubpzPwobjEG61RIhBvM0KivY4CB2s9A7qgjL1XBycAybIvG03BbFoT
t282FqXwk9JU6YihLlt+hpzO9UF7E8GZYlQlVIZOLOvytqilhua+2h77Yy8Jz/FJyIXKuaLPtvb2
SC2shL7jF28kQbP3QUKwAig+cxwbpngnUkd9D9cXSHVq9PPwYm0A4eAO0YQ/80Uq20+gXF++g0sy
NKrrV3i0T1dbCd86miGDKvarGzjh7pdsdwNY15liGP6Orib1tnWkJcbtP1rJty4r/mbbxcK8ILO4
IvTGFG6BfjJ+La0aRt69i1fQmjUWHLwzkLNpw9cJH8/MONZcEJeDkq9WELSyy29bagStk5KHu7NO
TH65sZg+i/4qmj3DEeEGTr/Shzp4YWSNn4W7NEelr0VgDlwa7xqlwZjXxG4MIJqy0SsQlAwEXtqd
nH2FpJfzgAetkuyU6DGCAlcwggJTAgEBMGIwUjELMAkGA1UEBhMCQkUxGTAXBgNVBAoTEEdsb2Jh
bFNpZ24gbnYtc2ExKDAmBgNVBAMTH0dsb2JhbFNpZ24gR0NDIFI2IFNNSU1FIENBIDIwMjMCDEca
ZUGCu6d0oT1M+zANBglghkgBZQMEAgEFAKCBxzAvBgkqhkiG9w0BCQQxIgQg6HZMxY1G7nHDnR9u
Cy5ljcHUInGqIpnPicCUSPrVkpwwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0B
CQUxDxcNMjYxMTEzMjE0MTU5WjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFlAwQBKjALBglghkgB
ZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzALBglghkgBZQMEAgEw
DQYJKoZIhvcNAQEBBQAEggEAYIkzXPz1WHV829diopmzfbUCxfICdytE2JytMkOK2RlxYSpMuD3j
gHq/F67rMip5dlo/1TydripPLVjt3acuZ5YI08IJoJFcfyLsvjveHshrAfaWHSTdivwqQXwhRqb1
hKCsHh8NZBXnYVT3U9joeUw4putTdCEkiuxGg4XcFK7VHMqzbHZxLgymfj7zqVU7rLvU09NWEhsf
R1eStiWrDlxdNoecbCrQzWNlfe2rcw35g1EezEPgOOYAKy/v9AnR1dYxear1tPk+BnzX3aoVEycX
0d1k8nRQj/bsahOJyxe5MzpZekN+RHXGNskbNFosbbfKQ5h/EmvY228d2bmF0g==
--0000000000003d031506602f4cc0--
