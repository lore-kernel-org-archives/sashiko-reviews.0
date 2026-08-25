Received: from mail-vk1-f225.google.com (mail-vk1-f225.google.com [209.85.221.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DFC3EB106
	for <sashiko-reviews@lists.linux.dev>; Tue, 25 Aug 2026 12:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787659542; cv=none; b=dG2Ibzhlr6C0VpXO42UiNs7FiuNYjvqmC6P9oqaage8cveno96xHh7qHyh093KFYlcc7o8aHOQUzcHzrJ0lztsqaYQoYfZwheIzWZBzNzdZTm5Bb/KEauMpkiX+cY/jf66u0rXsmAIRDuSca+lV7zv3JDXncnEqFN9Jb9yLgUas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787659542; c=relaxed/simple;
	bh=1P5BkH5XZ6BAa1l5D0mYYJgfmudQaGpN6gPeS1/dXdw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iO+myshTyiXh0aFZZyFpJelUYu7ZAwICF/0E7KIZCex/bSIBQ1pBqoALCfKVx14LP8iXqSr038cdzSDXoOXL2A81EDEkr/48MM+BG6GnbO9UmzIE+54s+JeHKJBC0MEEyYhEvz0fmae9WTohgBw0hWJ88V9oOfvXMkNBP5lEb7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=eNmQFoeh; arc=none smtp.client-ip=209.85.221.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="eNmQFoeh"
Received: by mail-vk1-f225.google.com with SMTP id 71dfb90a1353d-5bf83925ddaso1708951e0c.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 25 Aug 2026 05:05:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787659540; x=1788264340;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qZGBwIR/bxmniOSKM1iPXQpE4j67XWeYPW4FBMwtqsE=;
        b=kBCwnIBPMpGEIaGWOdTxQp3NP4xvsBwF2AaESgcvNKEpuyWFe7F8URW149sSrOqSAB
         HQwDk+os7WROxUe2YAETwWhjcvX5maJhtTv1/RLjfqhzRECqaLr8ffkix2sj6n+GdidS
         lh2Y0p63MqRbLQAw5GpEhYtz4GMJSF936SIL+xQ23SHxej1AnIHwC7rQdTjZV0OjdHKg
         anDTC/lpM3V6RxXHtV47B2j4SiSLeC8Y0H2cDjJ2xwTKbMA4mT34ON4BqlY7zi7bex1h
         tNvLAs2Y0JvE6AJ79rq0MeAq349yJ99ABLmCrDsFNtYhxiCgFoP1hWY1j6RZMMb3oQE2
         Aasg==
X-Gm-Message-State: AFuF++ltc6dDONMCeqyZJzvDtUgqhrtMr1HuRULs680HZJkYfZhvbV7l
	orqPghRAO7ut8LpVeDCNwNV+SI0I0c3t1JOlkewawr91QFqMwLrGWsotRZelvgQMCkMG+jDZkMu
	rg87L+lK17WK9NGiO3TkbSl4JfE7n9wTPVqiPMbSjTxOQVLw2FW8G9C+1jofR3hAXx34F/6olF+
	BqAb2ePusLdgFnC2KDUjl4V526vNtBNz63KjQO1frYAxDwt8RlOUDgFk5dK6FPiVfisBHL6oC0f
	zvnBmDZzj/7KZcaDg36pZPPm96CmLc=
X-Gm-Gg: AR+sD11DVUHqrv+N3PImViF2Lof4pwpNBSowoM4Hn4Ob6sqdW1wxFO8m9STojehcdSM
	HaJyvvpqwYHeQlbaUSEDUk94bw7Xpo6RD2kajezNJjmL76qwy7sLo63Y3DuCXNV+/NSBntgPqXH
	zi+sXoC4fCdejk2LLRR233g93LxL30THLo9VK94DxXV3U8MCE67gdntIGu4DGFMN0waLxfSYPgq
	tLGPDov2HnyEzlePGLIeSspUbQTzMyHb4K3NhdeKMAsoWAizkppRULcWpZV8F22yZiSFPE5gFzE
	wTYgY204rqXotOujpLC5jLhrmiNBzcm7eRD9MVhkFi+bt7DE0kkokJ4DA3hATz51jofJhyqQxd5
	N34CzygtzJlpDyKMY/zxE7c1Bt1dyrFumTroMOdyPYyQ0czyjkTd/xexrWh561V1ZaDr+xOsyHV
	s9nJNiap0Hj4yrg6+yCBKMTcD0ByQ0l+073MXjVzQoaJs=
X-Received: by 2002:a05:6122:3c47:b0:5bd:86ac:a847 with SMTP id 71dfb90a1353d-5c60de75d5dmr9615001e0c.6.1787659539728;
        Tue, 25 Aug 2026 05:05:39 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-16.dlp.protect.broadcom.com. [144.49.247.16])
        by smtp-relay.gmail.com with ESMTPS id 71dfb90a1353d-5c623dedb48sm2142647e0c.6.2026.08.25.05.05.39
        for <sashiko-reviews@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Aug 2026 05:05:39 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c1c4715cf0eso199974866b.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 25 Aug 2026 05:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1787659538; x=1788264338; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qZGBwIR/bxmniOSKM1iPXQpE4j67XWeYPW4FBMwtqsE=;
        b=eNmQFoeheo8J8IvbBixo0AYxEbJ7kLSiklM1XeCZrGloywojbSwrAe1Eyna6/UFlJd
         RDICVXy4wy8mZyBKe/7ZDy8RsaJx6mpF4W73QzGgAf4ENAee/eX5HhxuSI57CSaJFtfo
         Q2CjWTh7OQi96SEYUyvBnFrnlTeu0ZA3KPNx0=
X-Received: by 2002:a17:907:8990:b0:c20:3679:a2e6 with SMTP id a640c23a62f3a-c24925eb3ffmr3098083966b.10.1787659537596;
        Tue, 25 Aug 2026 05:05:37 -0700 (PDT)
X-Received: by 2002:a17:907:8990:b0:c20:3679:a2e6 with SMTP id
 a640c23a62f3a-c24925eb3ffmr3098037966b.10.1787659535255; Tue, 25 Aug 2026
 05:05:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260818231426.58105-1-chandrakanth.patil@broadcom.com>
 <20260818231426.58105-5-chandrakanth.patil@broadcom.com> <20260818181328.01D701F000E9@smtp.kernel.org>
In-Reply-To: <20260818181328.01D701F000E9@smtp.kernel.org>
From: Chandrakanth Patil <chandrakanth.patil@broadcom.com>
Date: Tue, 25 Aug 2026 17:35:22 +0530
X-Gm-Features: AcwNN1WorFaTdd8RFtiqotNs17zTPd5A0NeViKybnTKlMfb8TJ5XGialo7tK2XE
Message-ID: <CABvwm=NaWiC5=_+kFwTE+mQ5N70p86uxAWerGvL11gXGvZgLrg@mail.gmail.com>
Subject: Re: [PATCH 04/17] mpi3mr: Fix target device reference leak in BSG
 task management
To: sashiko-reviews@lists.linux.dev
Cc: linux-scsi@vger.kernel.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000c577b90659ddeb21"

--000000000000c577b90659ddeb21
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2026 at 11:43=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 4 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] Use-after-free of SCSI target private data (`stgt_priv`) during =
completion of BSG task management commands if the device is hot-removed.
> - [High] Unprotected lockless access to `tgtdev->starget` can lead to a N=
ULL pointer dereference or Use-After-Free.
> - [High] Missing bounds validation on the BSG `request_len` allows an Out=
-of-Bounds read when accessing the variable-length buffer entry list.
> - [High] Little-endian `__le16` fields from the user request are assigned=
 to CPU-endian `u16` variables without `le16_to_cpu()` conversion.
> --
>
> --- Patch [4]: [PATCH 04/17] mpi3mr: Fix target device reference leak in =
BSG task management ---
> (Note: The format of this review has been altered to a free-form summary =
due
> to automated recitation restrictions. The original patch diff is not quot=
ed.)
>
> commit c103d1267a7a6a9328e7aab3dbe852bbbb68d3e6
> Author: Chandrakanth Patil <chandrakanth.patil@broadcom.com>
>
> mpi3mr: Fix target device reference leak in BSG task management
>
> This commit fixes a reference leak for the target device during BSG task
> management command processing. The reference is now dropped whenever the
> lookup succeeds, regardless of whether the SCSI target data is fully setu=
p.
>
> [Severity: High]
> This isn't a bug introduced by this patch, but there appears to be a use
> after free risk regarding the SCSI target private data. In
> mpi3mr_bsg_process_mpt_cmds(), the block_io counter is incremented on
> stgt_priv, and then the target device reference is dropped before sleepin=
g
> via wait_for_completion_timeout(). If the target is hot-removed during th=
is
> sleep, mpi3mr_target_destroy() will free starget->hostdata. Upon waking,
> does the atomic_dec() on stgt_priv->block_io write to freed memory?
>
> [Severity: High]
> This is a pre-existing issue, but the access to the target device's starg=
et
> pointer seems unprotected. In mpi3mr_bsg_process_mpt_cmds(), tgtdev->star=
get
> is checked for NULL and then dereferenced locklessly to access hostdata.
> Since mpi3mr_target_destroy() can concurrently set tgtdev->starget to NUL=
L
> under the tgtdev_lock, could this result in a NULL pointer dereference if
> the compiler emits multiple loads and the pointer becomes NULL between th=
e
> check and the dereference?
>
> [Severity: High]
> This isn't a bug introduced by this patch, but there might be an out of
> bounds read when iterating over the BSG buffer entries. In
> mpi3mr_bsg_process_mpt_cmds(), the loop reads buf_type and buf_len from t=
he
> buf_entries list. Is there any validation that the number of entries
> provided by the user does not exceed the bounds of the allocated
> job->request_len? Could a small request length with a large entry count r=
ead
> arbitrary slab memory?
>
> [Severity: High]
> This is a pre-existing issue, but is there a missing endianness conversio=
n
> when parsing the device handle? In mpi3mr_bsg_process_mpt_cmds(),
> tm_req->dev_handle is an __le16 field, but it is assigned directly to a u=
16
> local variable without le16_to_cpu(). Similarly,
> mpi_header->function_dependent is passed directly to mpi3mr_issue_tm(). O=
n
> big-endian architectures, will this block IO on the wrong device and fail
> to block IO on the actual target of the task management command?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818231426.58=
105-1-chandrakanth.patil@broadcom.com?part=3D4

Thanks for the review.

New issues:
- None. This patch specifically fixes a target device reference leak
in BSG task management by ensuring mpi3mr_tgtdev_put() is called
whenever tgtdev lookup succeeds.

Pre-existing issues:
- The reported issues (stgt_priv UAF, lockless starget access,
request_len bounds check, and dev_handle endianness conversion) are
pre-existing in the driver and will
  be addressed in a separate follow-up series.

--000000000000c577b90659ddeb21
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
tJVewHuOmXgWQxNWV7Oiszu1d9xAcqyj65s1PrEIIaHnxEM3eTK+teecLEy8QymZjjDTrCHg4x36
2AczdlQAIiq5TSAucGja5VP8g1zTnfL/RAxEZvLS471GABptArolXY2hMVHdVEYcTduZlu8aHARc
phXveOB5/l3bPqpMVf2aFalv4ab733Aw6cPuQkbtwpMFifp9Y3s/0HGBfADomK4OeDTDJfuvCp8g
a907E48SjOJBGkh6c6B3ace2XH+CyB7+WBsoK6hsrV5twAXSe7frgP4lN/4Cm2isQl3D7vXM3PBQ
ddI2aZzmewTfbgZptt4KCUhZh+t7FGB6ZKppQ++Rx0zsGN1s71MtjJnhXvJyPs9UyL1n7KQPTEX/
07kwIwdMjxC/hpbZmVq0mVccpMy7FYlTuiwFD+TEnhmxGDTVTJ267fcfrySVBHioA7vugeXaX3yL
SqGQdCWnsz5LyCxWvcfI7zjiXJLwefechLp0LWEBIH5+0fJPB1lfiy1DUutGDJTh9WZHeXfVVFsf
rSQ3y0VaTqBESMjYsJnFFYQJ9tZJScBluOYacW6gqPGC6EU+bNYC1wpngwVayaQQMIIGpzCCBI+g
AwIBAgIMAgfxQ1Z7DrZKmCE/MA0GCSqGSIb3DQEBCwUAMFIxCzAJBgNVBAYTAkJFMRkwFwYDVQQK
ExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBDQSAy
MDIzMB4XDTI1MDYyMDEwMzUwNFoXDTI3MDYyMTEwMzUwNFowgekxCzAJBgNVBAYTAlVTMRMwEQYD
VQQIEwpDYWxpZm9ybmlhMREwDwYDVQQHEwhTYW4gSm9zZTEZMBcGA1UEYRMQTlRSVVMrREUtNjYx
MDExNzEOMAwGA1UEBBMFUGF0aWwxFTATBgNVBCoTDENoYW5kcmFrYW50aDEWMBQGA1UEChMNQlJP
QURDT00gSU5DLjEoMCYGA1UEAwwfY2hhbmRyYWthbnRoLnBhdGlsQGJyb2FkY29tLmNvbTEuMCwG
CSqGSIb3DQEJARYfY2hhbmRyYWthbnRoLnBhdGlsQGJyb2FkY29tLmNvbTCCASIwDQYJKoZIhvcN
AQEBBQADggEPADCCAQoCggEBAJwyF5qSHwwr1zJWkKvkMnY7V/sVFYYjTpjgxS4XA76pD6eLsZvS
4J73HkKSNEzORxBE7OyZSnuBJ9zeeRcypuItG9YrHm+0OSF0psIWsH15FBYJ0nvsUnlFbCSNvOdr
Co0WJ1KTe/7caj014uRZM2j7zH1vC+9fjEgrJdDRZakZXarl8M7k9okvVj1N+EuHiYUMvsAuMadE
a3p31Z6QdvMpr+30UdJXHshV1mXca+UBpCx26GbY6NgxhHM2LtHiaCK8Vn4HMofDkFg4nQ6eK4ai
uCiTtPj5aNlkdpcCzcZ+j1eCu6ZfPIq2ycwDaHi8d6Dwcgm+XoxDmD97Ehp2FOkCAwEAAaOCAeMw
ggHfMA4GA1UdDwEB/wQEAwIFoDAMBgNVHRMBAf8EAjAAMIGTBggrBgEFBQcBAQSBhjCBgzBGBggr
BgEFBQcwAoY6aHR0cDovL3NlY3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyNnNtaW1l
Y2EyMDIzLmNydDA5BggrBgEFBQcwAYYtaHR0cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2Ny
NnNtaW1lY2EyMDIzMGUGA1UdIAReMFwwCQYHZ4EMAQUDAzALBgkrBgEEAaAyASgwQgYKKwYBBAGg
MgoDAjA0MDIGCCsGAQUFBwIBFiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5
LzBBBgNVHR8EOjA4MDagNKAyhjBodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWlt
ZWNhMjAyMy5jcmwwKgYDVR0RBCMwIYEfY2hhbmRyYWthbnRoLnBhdGlsQGJyb2FkY29tLmNvbTAT
BgNVHSUEDDAKBggrBgEFBQcDBDAfBgNVHSMEGDAWgBQAKTaeXHq6D68tUC3boCOFGLCgkjAdBgNV
HQ4EFgQUyqNnwId/JCbRPslVl3nm48YRek0wDQYJKoZIhvcNAQELBQADggIBAKPmllSh8cRXzNRs
3OATCVDgrdOfIsZMB9UVXcYQ+HtR1fu9bafeyuuupF9gcCmi+onLsANYRKaEDjC8h+V5FMAgm6TI
bww4EFGpWvP/XEVKrpcpMkYNMLw89lagx9ZZDhx9DmfQMI9gG9MPpCkSMEPnJvEs7gqtOo08aL1+
ts10tGfePsHF/I42Da21hJIJ01XN+Z91y//1cJkHwCBvDmoB8gdMXp3g4sjzahTxRZ25BdZB9W+n
0jfWJXFKtp9MYS1SaVo17usfrlTeyaH3zPyDvfAfGoLB5+i8vyVL6wta2vgVpfsL9iwhbJnAIxr+
ljECWkh1weDJw3UnV6nooG1RztnwqbG4eAG/KSCToXgVH9qSDv5S1lve5mvhv9AHzLjGLs+QtMeg
WEdMM4G0PWyibzGgNrmVgKaLjV6EMo/IZW7KjBtvjyKQZhes90D4GyxXv+/mrTo2rruz53+FoSc/
nuyLmg/SxnnZRaf7JGHFvu0IbwkeINwdHynAanOg9AD4zits7k7jjQ0fwIdhCaoRA3ao7PXUL1t8
LfSp/K5DCYsrXNqitPmQaAAGAiG4d4WDxBev6vtoyH7ejLcuCKkxCefrLO5qYnuDHsMNCObdslAe
tMVer+USn6AqB//6EwmqdiLr4o20UQ79jxNFMAEKdwyNkA8mVCVUAtTe3mPrMYICVzCCAlMCAQEw
YjBSMQswCQYDVQQGEwJCRTEZMBcGA1UEChMQR2xvYmFsU2lnbiBudi1zYTEoMCYGA1UEAxMfR2xv
YmFsU2lnbiBHQ0MgUjYgU01JTUUgQ0EgMjAyMwIMAgfxQ1Z7DrZKmCE/MA0GCWCGSAFlAwQCAQUA
oIHHMC8GCSqGSIb3DQEJBDEiBCBYzF5EH/0Y4k0SP7CPAL0HcvEoVU6qt1BmJ+IM7SppYjAYBgkq
hkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yNjA4MjUxMjA1MzhaMFwGCSqG
SIb3DQEJDzFPME0wCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZI
hvcNAwcwCwYJKoZIhvcNAQEHMAsGCWCGSAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQB/Ro7/y29d
6+b/WZpQRcEg7pO6hMyRvg0E6KYcZb5/wWwPRTnaEevO/x80Uh7lr3KOfKyhqRF8lv0n6LAk9lYx
Kw2TUn3fbOcI3hULYuL3bkmUHJ6MT0SdW0gVZSeRllY1CIAiM12+3EbBt+xTJXQ50t06YmQ9TLg4
zbNyh72aaecskVEFnRump6HjLjsdoJR5w8bhWl4IRCwg/YUSdvjwD7OkC0+Mh88JeZP3o5w6UC4H
DWJGUYk7jWw10b2/FzkjT5KSrAVGDAmrkobq98Sc99L0hRXhVRy7MtRondpf2kt2TiNbvu/9vzLt
D0h5lTV0tMx5g/nLndYSrdUlWlCq
--000000000000c577b90659ddeb21--
