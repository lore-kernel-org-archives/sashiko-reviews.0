Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794506679;
	b=mFf/CHql0U1u6jUi/uk9tRAO4T+hDu8r2AKMVwJHEkbxEc/ItsL1ALvucS8XHgu6/uyR
	 d3ZCQdMEhOJ1PAdKETJqn2JybY9Bdfo+hoRKwHba5k9aItJqhkUJ2jCK8IJBd2lAOHlCa
	 uvGWcXDk+Mn8w9zriaRaJu/EH9uTOSZr//EoTmyW7LOfR36mVNddw1NpE5Whn0zc3y+NR
	 Mw3tPD4pnXQ+ZEJ/Yq7lrhKN76s9nXb28L8Uq2CPhOw4yg55R8p/J0R//H5rzmDIqVT7K
	 REdKkiZ2KeEnNdNkDvzadt6Gne9ARwZkjTvn0srbIM+ssdJftU9ROpWoBpa3OgXNpYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794506679;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 X-DetectorID-Processed:Content-Type;
	bh=0joxMgfNTt8HdQVwU7JhylkZYolthAtQtj0YTxMXbik=;
	b=ov7nR5fAiGcls0mwrXogPBCf6NzNMZzG0lsxabkO7NInJydpOCFEXiJFqA7ArClPP/8o
	 6W/KQ6FZMTDh6qqqt1mKi1tZ6uuNg/wy3avO+KUwyi6wkoh8xruzwLwSFhXQ6D+/2yjIo
	 tcU+IEthduJi011kNzsSbfkxgQ3TELX+au/n+SoWvzEAFAf4Ahwjt6vRvJeIXOn6E2gVd
	 zmSUjwJvO6f7IawrYPeApdvfn0kyHyjKYT9/y+FwgGg0Yj40s4IhwhwOVJYEA+ZX3TBeW
	 yK791gtdvvlE1tkHh08OK/AF82yTO3Ad30v8S9AGZ8Bx1N1lUCzndtqIT6Qcq4JXOHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=FB7NWHmI;
	arc=none smtp.remote-ip=209.85.219.100
Received: from mail-qv1-f100.google.com (mail-qv1-f100.google.com [209.85.219.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65255606A327
	for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 18:04:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65255606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=FB7NWHmI
Received: by mail-qv1-f100.google.com with SMTP id 6a1803df08f44-91e8a05ec5aso862756d6.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 10:04:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794506678; x=1795111478;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0joxMgfNTt8HdQVwU7JhylkZYolthAtQtj0YTxMXbik=;
        b=Cg/xQqbdFQG5infXyhN80z+whTYyU/2JplRsdk/vn+tbwRZ/EDRSCQCJO9ttbcMN3i
         OvgIogPwl4uvH97Kt0lwhZpbDth+QmJqE1GrWVlHvkIHOXIMMZwiGr1KeSlnV9eQCd/K
         WZez7wlGHNv++jkhhv7pbBh2ahMh+jI5oUF7HrWL+jBPB7fJE2yjqa6sE/NM1ZRdbqKK
         oAo0Wr45TfvoLF7NVAiVI9GshSjb3dK7P73Qka0UOsHWP+bU9v21rDRgFkRzi/6bcI6a
         TMX7BJnJarIfL1Ab6RdJl2p7jmZuF6NPqgEXROyKVpJvEfdOK4jOQwjanTtKyZZgESsD
         ebGg==
X-Gm-Message-State: APuU4Z+8Ft/nIETAIMAYyu0SR2IKEP5HuY3UnnZ8SrLfiXH829dlZKUo
	7nVyWilbZJqy2aTXcJp4jH6Ftk+G4w7gN64JKRlV//MHxc/WMVk9tPY+57wtxM/f3AMW1hKTKQd
	wWluAgvq24dxkFyyfXqppBWCBwxTZFc07l7EJHnm907whvTnvL77ThW9Ju8pdBC3YNip3pIqEVF
	nZ7uHqw1Koq078Ki9KuvC7LvK1Qsut7Manl4QwKAek0CgGKh25SrZW8dzbys4H7QKxE049Ao9Jv
	ly0BtGI8MJc2iRVSZj0
X-Gm-Gg: AYBFou3zEFtgJvnIEfPcT+IYthW3ulxfQtPHKJYbIhXHW8ETGf/rUYw/hMz6AST+/Z2
	3VRH+CeZn+uG4eupfx7jpvMQHrHBkF5RYeOP5DPPwOE2ht7VnUe5o67hKY7CBwpXmoW6fOQgdy8
	aRu4gzVLiJ8+YhTORpbGD8sxy0TeDcZTW/nIX3Zigc8FdtaZFb8PInzVWpkOhBeJTrIIJ0KLR/R
	XBRulNQ6YapQpTXUzdS1j9roG55dH88ugmO3/yzzuKzSIwwB4I2xn0nFit26KzhnZubg2ei8QUP
	61TJaATDB5Mvafr5DBA7fUoUF0i9NfNRsx1/J+gWOCLy80sFIXZVq2LYEVIY0XAwx1+ajjqqUdK
	6UdZ9yZnLEvX1pnxpOp2XOpPu13ZLjwbJHf9aaSx0XXeT0qie5SV/jqLBVVfExZYiSRVfzBfOSa
	FH8iEo2jO19zf2wsOC+LJsTnUtQC3LS+dh
X-Received: by 2002:a05:620a:278e:b0:947:9060:7efb with SMTP id af79cd13be357-9494bb838a8mr30999485a.18.1794506678061;
        Thu, 12 Nov 2026 10:04:38 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-9479ef8a7f1sm108750485a.7.2026.11.12.10.04.37
        for <sashiko-reviews@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 12 Nov 2026 10:04:38 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4b37620eb73so74592b6e.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 10:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794506677; x=1795111477; darn=lists.linux.dev;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0joxMgfNTt8HdQVwU7JhylkZYolthAtQtj0YTxMXbik=;
        b=FB7NWHmIcIHkn6jL4oiJ6cmlDIc3PzdzkwVUZEkgFfPvZS2jbczwrkEqF4meemdft9
         p+gdRJWG/HySD9VqD1qG5NyaOlQMBlwfho8Kowy3O87+l/9J0ShKeDVpbd8cp9aE/2qU
         havxZF5vp4xWu0jDXhmATSmsiv/XnPsdaQdCk=
X-Received: by 2002:a05:6808:1a10:b0:4d6:308d:4ca7 with SMTP id 5614622812f47-56b97102509mr6217622b6e.24.1794506677116;
        Thu, 12 Nov 2026 10:04:37 -0800 (PST)
X-Received: by 2002:a05:6808:1a10:b0:4d6:308d:4ca7 with SMTP id
 5614622812f47-56b97102509mr6217573b6e.24.1794506676627; Thu, 12 Nov 2026
 10:04:36 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261111194426.1652644-1-kamal.dasu@broadcom.com>
 <20261111194426.1652644-4-kamal.dasu@broadcom.com> <sashiko-outbox-209729@kernel.org>
In-Reply-To: <sashiko-outbox-209729@kernel.org>
From: Kamal Dasu <kamal.dasu@broadcom.com>
Date: Thu, 12 Nov 2026 13:04:00 -0500
X-Gm-Features: AclHuK9qjSALadKVcGiEqIbcbRtni7bR5Wv4nEmvIVE6z4hw48p0pn0vtVxm5YE
Message-ID: <CAKekbetyyqPVjDPZadELCmKMeFziEE7eY38H=_DR9ASYjAvzZQ@mail.gmail.com>
Subject: Re: [PATCH v12 3/6] mmc: core: Add option to keep an eMMC powered on
 at system suspend
To: sashiko-reviews@lists.linux.dev
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000000fb07f066018253e"

--0000000000000fb07f066018253e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 4:59=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] mmc: core: CQE left active in _mmc_suspend() on
>   MMC_NO_POWEROFF_SUSPEND
> --
>
> commit 719eca51e9b0da2d046fb99b21cbf5ff86d8cbfe
> Author: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
>
> mmc: core: Add option to keep an eMMC powered on at system suspend
>
> This commit adds support for keeping an eMMC powered on during system
> suspend when MMC_PM_KEEP_POWER is set, introducing MMC_NO_POWEROFF_SUSPEN=
D
> to skip power-off and keep the card active on resume.
>
> > diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
> > index a02b04938e1a0..c936272bcd813 100644
> > --- a/drivers/mmc/core/mmc.c
> > +++ b/drivers/mmc/core/mmc.c
> [ ... ]
> > @@ -2157,6 +2158,15 @@ static int _mmc_suspend(struct mmc_host *host, e=
num mmc_poweroff_type pm_type)
> >                       goto out;
> >       }
> >
> > +     if (pm_type =3D=3D MMC_NO_POWEROFF_SUSPEND) {
> > +             if (host->retune_period) {
> > +                     mmc_retune_timer_stop(host);
> > +                     mmc_retune_needed(host);
> > +             }
> > +             mmc_card_set_suspended(host->card);
> > +             goto out;
> > +     }
>
> [Severity: Medium]
> Can this leave CQE active across suspend when _mmc_flush_cache() returns
> without sending a command (for example, when the eMMC cache is disabled)?
>
> The existing _mmc_suspend() paths turn off CQE either by issuing a legacy
> command via __mmc_start_request() or by calling mmc_power_off() ->
> mmc_set_initial_state().  With MMC_NO_POWEROFF_SUSPEND, if
> _mmc_flush_cache() is a no-op, _mmc_suspend() returns with host->cqe_on
> still true and CQHCI unhalted.  When the host driver later runs
> cqhci_suspend() -> cqhci_deactivate() -> __cqhci_disable(), CQHCI_ENABLE
> and host->cqe_on are cleared without calling cqhci_off() or
> cq_host->ops->disable(), so later legacy commands and resume paths also
> skip host->cqe_ops->cqe_off(host), leaving CQE controller state active an=
d
> breaking non-CQE commands after resume.
>
> Should this path call host->cqe_ops->cqe_off(host) when host->cqe_on is
> set?
>

Hi Ulf,

Sashiko points out that with MMC_NO_POWEROFF_SUSPEND, CQE can stay on
across suspend if _mmc_flush_cache() sends no command (e.g. cache
disabled), since the flush is then the only thing that would call
->cqe_off(). It looks valid to me from reading the code.

This patch is unchanged since v10 and Sashiko had no findings on it for
v11.

In any case would you like a guard in that branch, e.g.
"if (host->cqe_on) host->cqe_ops->cqe_off(host);"? I can fold it into
the next version if so.

Kamal


> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111194426.16=
52644-1-kamal.dasu@broadcom.com?part=3D3

--0000000000000fb07f066018253e
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
ZUGCu6d0oT1M+zANBglghkgBZQMEAgEFAKCBxzAvBgkqhkiG9w0BCQQxIgQgPpkoq2jOLQliCVdR
XrGrQwWwc1qBVcBzkoHsATE85FgwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0B
CQUxDxcNMjYxMTEyMTgwNDM3WjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFlAwQBKjALBglghkgB
ZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzALBglghkgBZQMEAgEw
DQYJKoZIhvcNAQEBBQAEggEAa+r1NFXtrGAQoK7xcwADCceUalH/yOOP5YRmbUQZGujm/5r3Q+Dy
WJSmdpu1r8+2wX3fBLdrOFGyPh28fdvQ5g2maRQtjU60KiD8B/NIeZ0rAhe27ng6k8RPtLkZ7vlG
YKkbPamG9s5UL3lDnLEjapUKYCxv+W+eK2g4DOmhcSN5Frywrq/dR9diuxveDtgO7dkSyrObYxgL
S8arxfuUM0QiF6TaejTJzXOWKasrvSq9ECS+VVsbOvL8/rceUK/c3EO4FhvIAHZmoHbGtN1TJTZS
xEDhpT39wdvoDTBElhU9LDZeiJrGvnJUREnR85lJnQHxMFGOx9jM4ywXNvMJYQ==
--0000000000000fb07f066018253e--
