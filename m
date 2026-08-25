Received: from mail-pg1-f228.google.com (mail-pg1-f228.google.com [209.85.215.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC86401A2E
	for <sashiko-reviews@lists.linux.dev>; Tue, 25 Aug 2026 12:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787659711; cv=none; b=JcOM4SmeBmf1yJ0v7cWbpN6z9iaQmhVIebpOHNuoigEdEXbqcrCtKzsKscfBqGWWOdFCG6i+nKeoxgAAMXqrUajngc6Pox4vAsKVHcC3PD5znGfoyK/sbmpXxsKidKCv+OssK+13cwt7Y991OBE9VkFZ3vz0EkEfpS/zD43HU9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787659711; c=relaxed/simple;
	bh=HaxPYDuxBW6bfqGcGnhLrbNc2F4EZIpEA2EjU8n/hzI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NFKTcL0S8ZIw1f6CKekDBIgxWtzc5aQqYDbLmUwVNOe5Ue3x7pA8cK/mLjIu4GeJ84ZjCLJx6WZlcss6VkZ60Jc7UpLJkdKnMjfkhVpmJJ4/XcANvdX1Xp1vgHrH1Zlel/glS9QfxyeJvuUKHGy5yxIVDlmXMCaE3wV2C6S3eKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=DAoHwIQ4; arc=none smtp.client-ip=209.85.215.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="DAoHwIQ4"
Received: by mail-pg1-f228.google.com with SMTP id 41be03b00d2f7-cc11a905ba5so3401085a12.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 25 Aug 2026 05:08:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787659709; x=1788264509;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kG+yu2LYobBAey9jcSWIVKG1fLcv30b17kKWJV8xKWo=;
        b=prw+rb3U+oM7R4VReK81RkafQQpuvU7sUV/hNdcnwbjm8bAZgyBtouJvGcnWAsbjOF
         kh973iT2b2W5+sJZNgpTcMzUMRFuD8Rf3vuDQpKrg0nBWSzLYZDkOtwFd9LLHhOnBKpg
         V36HkgemqajTCh0zRUAERuAGKFTwCVl3VM1xnHcqNGVngkK/UwcYFSKrbWEXmgEclWNI
         Bed6wsD2OpmIllm3QlLsxbTMPkY5LHv2RBOO/gKdGmy8L1r0skla4b0ysOVkugoBn7CK
         oxHOxy4DFsS3kMbctFgbnhFYsFE54Jb5vY9xZPZDdoc62qOCoxQL/yUHVtLWEUKljwg2
         nLgA==
X-Gm-Message-State: AFuF++ka655OHBQxhomL8o5QT3sm1U0GnZJ/G1MziD+iRDAI/ThXaBjX
	xRcq1TtoP63Zv3kT+sPW4YWSLDGyK1CdP0xOIjrdTErz4pvrFd0Md8o60ShVWodY6SoM1i3P3cW
	KngqejUjJpzJM235xOSLeNFJRciJmsiM2Fyg9pnYpjngn7DxApbT3cHT2eOdF8luQuaqpglPV16
	8ATzSRw20cKprTDpX9uPabzcPbbl0pdQMN3D8lSQFW3G42qfX/VIZorId1TiDN6qq0qChJAtBmE
	KLU9jL582wsQI3kveVaj8RspOOUbbQ=
X-Gm-Gg: AR+sD11yM1f1t2T+z6OamBCeOc5d0ipxj2fXZLR8UcJEEsUy9D+gnTV0eLyY3Xk8S8a
	0Fc4KE9UKVxtAerwDuK/Eq+fj+UXPDfucHyGD3nlVo4kkhQOSY7LPcS0T37YorSaMaY4+Zf6TDJ
	uH9VZ2Cu/3X+icHbiDwXoq+VuGEjdqzkL+uUg6Q0IRhDzL/tGGCeeHHQF2GAHdhYW0Ht1aNbSim
	x4s0u7rIbc2XCESpAQf4H7yRmZ6J2NnlGqHLWgI0TlXgVS40y/Z4tqJvcYaGu1vqY7rDqFA3LRM
	Bqqc4kvTn5esqRFKYQ2/TMxFzUZpmZ/liu5mayBDq8uxEthpiIQoXzEENXYvzl8inTPA0I+4+4O
	BqkL1t/UYb6SF3DNTDrLS6Hw/CTUprQw7D9/+0wZnUSaI8t8hqC774OvQziRHNa8wwonxQRIqPm
	+moJEMUEqLnwQ0JXxOkpFOmQpOKHOTR3hu4GSyv7lphvHKPw==
X-Received: by 2002:a17:90b:5750:b0:38e:c232:9d3f with SMTP id 98e67ed59e1d1-396463362d3mr12927025a91.5.1787659708837;
        Tue, 25 Aug 2026 05:08:28 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-121.dlp.protect.broadcom.com. [144.49.247.121])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-39645a394c1sm1258930a91.1.2026.08.25.05.08.28
        for <sashiko-reviews@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Aug 2026 05:08:28 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c210c66672eso561178266b.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 25 Aug 2026 05:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1787659707; x=1788264507; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kG+yu2LYobBAey9jcSWIVKG1fLcv30b17kKWJV8xKWo=;
        b=DAoHwIQ4PgxMoSVcHhXjwiKx4JkupwoPPVXLFscWbQQIOJQfjIEbotnIlf2K5li8lw
         4xqJV32GQKq9fOhSESrvslwGgBQ7wcR4ZJt/Qqyoya3Oot3kkhPng85YB1pLajsFh4tJ
         kbTG6mbpI0w3VeW5lv+q5QyQdCAjwP+Bt0Jhg=
X-Received: by 2002:a17:907:1889:b0:c25:4a9:ab95 with SMTP id a640c23a62f3a-c2504a9aefcmr153247466b.14.1787659705823;
        Tue, 25 Aug 2026 05:08:25 -0700 (PDT)
X-Received: by 2002:a17:907:1889:b0:c25:4a9:ab95 with SMTP id
 a640c23a62f3a-c2504a9aefcmr153237166b.14.1787659705185; Tue, 25 Aug 2026
 05:08:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260818231426.58105-1-chandrakanth.patil@broadcom.com>
 <20260818231426.58105-8-chandrakanth.patil@broadcom.com> <20260818181137.5F35A1F000E9@smtp.kernel.org>
In-Reply-To: <20260818181137.5F35A1F000E9@smtp.kernel.org>
From: Chandrakanth Patil <chandrakanth.patil@broadcom.com>
Date: Tue, 25 Aug 2026 17:38:12 +0530
X-Gm-Features: AcwNN1WTdZt4HCRYrjle2YIU_wkIPigXPDqKqnyzSPtcHaicCVCZsyPT5YFDdK8
Message-ID: <CABvwm=PNTiRRK1kKhuENkViZaZ3wEGqsM8ivR87iS=FWDw4Now@mail.gmail.com>
Subject: Re: [PATCH 07/17] mpi3mr: Fix out-of-bounds sense buffer access
To: sashiko-reviews@lists.linux.dev
Cc: linux-scsi@vger.kernel.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000d2e2010659ddf5a9"

--000000000000d2e2010659ddf5a9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2026 at 11:41=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>
> New issues:
> - [Low] 64-bit division by a non-constant integer causes a `__umoddi3` li=
nk error on 32-bit platforms with 64-bit DMA addresses.
>
> Pre-existing issues:
> - [High] Missing `dma_rmb()` in the operational and admin reply queue pol=
ling loops.
> --
>
> --- Patch [7]: [PATCH 07/17] mpi3mr: Fix out-of-bounds sense buffer acces=
s ---
> commit 7536a65ff98a39b2e42c7eb228f93604d2b3086e
> Author: Chandrakanth Patil <chandrakanth.patil@broadcom.com>
>
> mpi3mr: Fix out-of-bounds sense buffer access
>
> The sense buffer address reported on completion is turned into a
> virtual address with no range check, so an address outside the pool
> resolves to memory that does not belong to it.
>
> Check that it lies within the pool and is correctly aligned.
>
> > diff --git a/drivers/scsi/mpi3mr/mpi3mr_fw.c b/drivers/scsi/mpi3mr/mpi3=
mr_fw.c
> > index 5e61448d8dbc6..103ce9dd22666 100644
> > --- a/drivers/scsi/mpi3mr/mpi3mr_fw.c
> > +++ b/drivers/scsi/mpi3mr/mpi3mr_fw.c
> > @@ -141,6 +141,12 @@ void *mpi3mr_get_sensebuf_virt_addr(struct mpi3mr_=
ioc *mrioc,
> >       if (!phys_addr)
> >               return NULL;
> >
> > +     if (phys_addr < mrioc->sense_buf_dma ||
> > +         (phys_addr > mrioc->sense_buf_dma +
> > +          (mrioc->num_sense_bufs * MPI3MR_SENSE_BUF_SZ) - MPI3MR_SENSE=
_BUF_SZ) ||
> > +         ((phys_addr - mrioc->sense_buf_dma) % MPI3MR_SENSE_BUF_SZ))
>
> [Severity: Low]
> Does this modulo operation cause a build failure on 32-bit platforms with
> 64-bit DMA addresses?
>
> When building for a 32-bit architecture with CONFIG_ARCH_DMA_ADDR_T_64BIT
> enabled (such as x86 PAE or ARM LPAE), dma_addr_t is 64-bit. Modulo
> dividing a 64-bit integer by a runtime variable forces the compiler to
> emit a call to __umoddi3, which is not exported in the kernel.
>
> The issue was flagged in mpi3mr_get_reply_virt_addr() within the same fil=
e:
>
> drivers/scsi/mpi3mr/mpi3mr_fw.c:mpi3mr_get_reply_virt_addr() {
>     ...
>         if ((phys_addr < mrioc->reply_buf_dma) ||
>             (phys_addr > mrioc->reply_buf_dma_max_address - mrioc->reply_=
sz) ||
>             ((phys_addr - mrioc->reply_buf_dma) % mrioc->reply_sz))
>                 return NULL;
>     ...
> }
>
> [Severity: High]
> This is a pre-existing issue, but does the reply queue processing miss
> memory barriers?
>
> Looking at the polling loops for both the operational and admin reply que=
ues,
> the phase bit is checked without a subsequent dma_rmb():
>
> drivers/scsi/mpi3mr/mpi3mr_fw.c:mpi3mr_process_op_reply_q() {
>     ...
>         if ((le16_to_cpu(reply_desc->reply_flags) &
>             MPI3_REPLY_DESCRIPT_FLAGS_PHASE_MASK) !=3D exp_phase) {
>                 atomic_dec(&op_reply_q->in_use);
>                 return 0;
>         }
>     ...
> }
>
> And similarly in mpi3mr_process_admin_reply_q():
>
> drivers/scsi/mpi3mr/mpi3mr_fw.c:mpi3mr_process_admin_reply_q() {
>     ...
>         if ((le16_to_cpu(reply_desc->reply_flags) &
>             MPI3_REPLY_DESCRIPT_FLAGS_PHASE_MASK) !=3D exp_phase) {
>                 atomic_dec(&mrioc->admin_reply_q_in_use);
>                 return 0;
>         }
>     ...
> }
>
> Under high concurrent I/O throughput on weakly-ordered architectures like
> ARM64, when the hardware DMAs a reply descriptor, could the CPU speculati=
vely
> execute reads for the descriptor payload or sense buffer before the phase=
 bit
> condition is definitively synchronized?
>
> If the phase bit changes, without a memory barrier, subsequent reads to o=
ther
> descriptor fields might bypass the phase bit evaluation and read stale me=
mory
> data from the previous iteration.
>
> > +             return NULL;
> > +
> >       return mrioc->sense_buf + (phys_addr - mrioc->sense_buf_dma);
> >  }
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818231426.58=
105-1-chandrakanth.patil@broadcom.com?part=3D7

Thanks for the review.

New issues:
- The 32-bit build issue is valid and will be fixed in the v2
submission. switching to do_div() for alignment checking to avoid
64-bit division issues on 32-bit platforms.

Pre-existing issues:
- The missing dma_rmb() memory barrier in reply queue processing is a
pre-existing issue in the driver and will be addressed in a separate
follow-up patch series.

--000000000000d2e2010659ddf5a9
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
oIHHMC8GCSqGSIb3DQEJBDEiBCDVCgYsHs58Gi4GjebSjJ0+dmQPr7leBWrOQos+PfROezAYBgkq
hkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yNjA4MjUxMjA4MjdaMFwGCSqG
SIb3DQEJDzFPME0wCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZI
hvcNAwcwCwYJKoZIhvcNAQEHMAsGCWCGSAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQAU+wV+dIJh
Oik++eelyWgQms+czjBhRpE330mOvadcRIyrEIWbWEYW/a5F1ItT0pPNjN6cGV29dttmxSITk4gH
Ditl7XTY+jnLVfhU5YAndf0fZ7A9hUjgUEo2Rc3BrbG5flzKfcSxXuvUyKHj404ZMjBnrqiV007q
bRjTssvvgb2shuDza3cTHBUPtc0GE6aRy7RfBsaRHXmtn0Kf61LTag4xrqf8Dw6cGwh+vmIrYB0L
FHMG2Kvm9bXrFjtYMwaVb0xWNho2Big7bUC7MXL9MpyHT+a9SI0xVtHyn+o0bYupFD8rvC5rWuga
RlrXbVZzveUEgTFkQzEqZmH+7OHp
--000000000000d2e2010659ddf5a9--
