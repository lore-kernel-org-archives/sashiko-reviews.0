Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BFFB3A16AA
	for <sashiko-reviews@lists.linux.dev>; Sun,  9 Aug 2026 09:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786267521; cv=none; b=V1XpEopV9TZ8jXHFkgBq12wuKIPSZsPjzqRg0qbhXU4vkEWDEeYdZR9YcwdkBaFtISUgoBiHEOzl7JoGWh1o6Kdg31wxEYwjOFRohk/dFxvSrS4saYZQlTapDOFDCSf5wANjRF8M/MYIUxDonYeNYQRA9JnCF1SdwQQoq6fiYDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786267521; c=relaxed/simple;
	bh=0leKMjEOnn4MQlTJ6X2hvB7VMlZjuimC0t4G0XxJaeA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EcmqYXMS8+qBNwp3YHer0Vbd/xTKRm7YxyBKdxZM9tWDuGSu680fv3uKXtXUHCJS1Uy8oLj4l7CC7AnQEwD7i9gcRwZHbxqKip8N9xtNQ91nNg0SKzwDWrLNC1kEPmf/H3Ipc/qIVxUuCTOzBqIWMt8zwNyjso4dDgE23I+kHAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=WUYS01tK; arc=none smtp.client-ip=209.85.216.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="WUYS01tK"
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-38e7109321dso485366a91.3
        for <sashiko-reviews@lists.linux.dev>; Sun, 09 Aug 2026 02:25:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786267519; x=1786872319;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U6+6cYU+CYhHsBzzEEvFQPh42qyUj1xAtDPvjFJGXyk=;
        b=qnGRm8y67OWiCh67UPsymm3zUlBCsb0sTpDHB/7lT+z6G/Y58b+Zy5GPXfXWSpv0Qy
         UlfoV0jzmoCE+SWhoqUdeLM4uWBoVrb3AU+G30/058JU9M/SgABicbjDXGcM56mb65QN
         n0n7DtlogRDXx0qnui0G9Pls7jZjbrn3/ZpyJV4GSnqQx3v9vAxyLlssUtFkzK9yAuK9
         OHYapNYIE7AraikouOHqdES/GxxcGV7X786NvSO3gPj8JHykBT6A8NXmODfR1xbCl+1c
         J0N2r6s+RzdRIcYLDGoG74H1cjDBgte+HvMhOGVkritvlG2Fg193OOiaIF2Q3bcczD1w
         RXsg==
X-Gm-Message-State: AOJu0YzlrUL+HT13FiHi1oJlV6F2pZF2K5A6Aa4XwIqOJoA8UvkieKNb
	ySV7CcRrU5CIEtNm/6VmzD1KdafzfnLSC46qqjHVvw6/UQUdSgmclEz1wj0HgO57tnEWqCDgusi
	WmG6V9XvPdAME6Utbt9LfGDiBl4X5hvVZTvni2yitxEkGlrbcdrtqV68pTXOMliJZ5varAqVOsx
	7HFyz9IaYolqxVpiKIFSiugQ8nHoTYQPdUQrIsZHK2ZrCUbeah2LOOToHuDIrfeEyForsd7xF+y
	Rc4LJuSrOw0KXy8+RlkxsSvHRbZLy8=
X-Gm-Gg: AR+sD108Bil398ykj2wO2H9nLynHNLoGG+P3Pd2LQtDl8Aw2/vbuzsPPYBoIyhjF1Gb
	GSkN5GV5sTfDqkBYiOAXjrCFB4GIN7AV2KTtUhtGMzjjtrdpO7DUKlFoM0CL05Il4RteFGI3lJs
	pD+wTP0ed3wTEFam0N1LSftpf/eP4ZYw+nYck+bY3BtduPai69It3/tFzE5SvB8LtrC4kbJ5J4K
	pCxK8wz0x24Vc7hV74EMUILFAZoW9r1VHxcNUcYMTnFPh8padibi1iryrAB6wjVOy5S2LoEGo1Y
	ls/6XWAki7yaNV9gGOzmKxR8us+Pds9jUtcAYoSot3ViF69lbviEt60ZeTss10zK/g28Q8a2d0m
	Ck/46e1IVsR1FZft4qqi8SPMg32LHUNYSnfgPfCGGjXn1dWB/H3DX7ZzMNqZFA4Ne0bH81iv7uT
	UJakr3bGFlm6OqjRYcDKQAbRAdYhkmDrTn+tqW6qcL
X-Received: by 2002:a17:90b:4ace:b0:375:2a38:1d40 with SMTP id 98e67ed59e1d1-3928246545amr11628528a91.20.1786267519047;
        Sun, 09 Aug 2026 02:25:19 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-0.dlp.protect.broadcom.com. [144.49.247.0])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-392825e7e76sm2751991a91.13.2026.08.09.02.25.18
        for <sashiko-reviews@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 09 Aug 2026 02:25:19 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c20262b5e10so99193666b.1
        for <sashiko-reviews@lists.linux.dev>; Sun, 09 Aug 2026 02:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1786267517; x=1786872317; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U6+6cYU+CYhHsBzzEEvFQPh42qyUj1xAtDPvjFJGXyk=;
        b=WUYS01tKsvzfznfzQNVPNaTj7uef75n1Ua/nqyO0SCgdfhyXQAOp28yao8bge7AuWi
         HXalwO6xoc88QRecpQUN5jUJruDTkLnJB/DtLiuGSO3/EVvq7R0iFDYETgbLMFhm9BY2
         nEJYWyXkBmIp/b7rk90HcfXICtNXWAjUvz1qY=
X-Received: by 2002:a17:907:ea8b:b0:c16:126b:98b4 with SMTP id a640c23a62f3a-c2039c03283mr1719324166b.3.1786267516909;
        Sun, 09 Aug 2026 02:25:16 -0700 (PDT)
X-Received: by 2002:a17:907:ea8b:b0:c16:126b:98b4 with SMTP id
 a640c23a62f3a-c2039c03283mr1719322466b.3.1786267516237; Sun, 09 Aug 2026
 02:25:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260808151010.185603-1-chandrakanth.patil@broadcom.com> <20260808100945.526F51F00A3A@smtp.kernel.org>
In-Reply-To: <20260808100945.526F51F00A3A@smtp.kernel.org>
From: Chandrakanth Patil <chandrakanth.patil@broadcom.com>
Date: Sun, 9 Aug 2026 14:55:02 +0530
X-Gm-Features: AUfX_mx1QPerGwWkX-T21oCgsrqtVYzRtbre9gurcKt1gXiRQqBt4D-Niqz-Sbo
Message-ID: <CABvwm=MZO3TG-Pd=KWdK3Y3DxWk5_74T1EebY4UyhQrQ8R8LzQ@mail.gmail.com>
Subject: Re: [PATCH] scsi: mpt3sas: Avoid freeing unallocated PCIe SGL buffers
To: sashiko-reviews@lists.linux.dev
Cc: linux-scsi@vger.kernel.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000d861e9065899d04e"

--000000000000d861e9065899d04e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 8, 2026 at 3:39=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] _base_release_memory_pools() lacks idempotency, causing fatal Us=
e-After-Free, double-frees, and NULL pointer dereferences when invoked cons=
ecutively on error paths.
> - [High] Missing NULL check for `ioc->chain_lookup[i].chains_per_smid` du=
ring partial allocation failure cleanup causes a guaranteed kernel panic du=
e to invalid pointer arithmetic.
> --
>
> --- Patch [1]: [PATCH] scsi: mpt3sas: Avoid freeing unallocated PCIe SGL =
buffers ---
> commit 74366255b6baaf468aaa8aa5ff843c58339a10f7
> Author: Chandrakanth Patil <chandrakanth.patil@broadcom.com>
>
> scsi: mpt3sas: Avoid freeing unallocated PCIe SGL buffers
>
> _base_release_memory_pools() unconditionally frees every
> ioc->pcie_sg_lookup[] entry, including ones the setup loop never
> allocated after a partial failure, causing a "bad dma" warning on
> debug kernels or a NULL pointer dereference otherwise.
>
> > diff --git a/drivers/scsi/mpt3sas/mpt3sas_base.c b/drivers/scsi/mpt3sas=
/mpt3sas_base.c
> > index 791a3c5fbf442..fed7aeffec58d 100644
> > --- a/drivers/scsi/mpt3sas/mpt3sas_base.c
> > +++ b/drivers/scsi/mpt3sas/mpt3sas_base.c
> > @@ -5870,6 +5870,8 @@ _base_release_memory_pools(struct MPT3SAS_ADAPTER=
 *ioc)
> >
> >       if (ioc->pcie_sgl_dma_pool) {
> >               for (i =3D 0; i < ioc->scsiio_depth; i++) {
> > +                     if (!ioc->pcie_sg_lookup[i].pcie_sgl)
> > +                             continue;
>
> [Severity: High]
> This is a pre-existing issue, but does adding the array lookup here make
> the function unsafe if called twice?
>
> If _base_release_memory_pools() is invoked a second time on an error path
> (e.g., if a subsequent operation fails after a retry in
> _base_allocate_memory_pools()), ioc->pcie_sgl_dma_pool is still non-NULL
> because it was never cleared.

No, the array is already dereferenced unconditionally by the existing
dma_pool_free() call right below, under the same
if (ioc->pcie_sgl_dma_pool) guard, so this patch doesn't add a new
dereference or change the double-invocation exposure.

The underlying idempotency issue (pcie_sgl_dma_pool never cleared
after dma_pool_destroy()) is real, but pre-existing and independent of
this patch. We'd like to fix it as a separate follow-up.

>
> During the second call, the newly added check will attempt to access
> ioc->pcie_sg_lookup[i].pcie_sgl. Since ioc->pcie_sg_lookup was set to NUL=
L
> at the end of the first call, will this trigger a NULL pointer dereferenc=
e?
>
> Additionally, variables like ioc->reply_post and ioc->config_page are
> freed earlier in this function but never set to NULL. Would it make sense=
 to
> clear these pointers and ioc->pcie_sgl_dma_pool so the function is safely
> idempotent and avoids double-frees?
>
> >                       dma_pool_free(ioc->pcie_sgl_dma_pool,
> >                                       ioc->pcie_sg_lookup[i].pcie_sgl,
> >                                       ioc->pcie_sg_lookup[i].pcie_sgl_d=
ma);
> >                       ioc->pcie_sg_lookup[i].pcie_sgl =3D NULL;
> >               }
> >               dma_pool_destroy(ioc->pcie_sgl_dma_pool);
> >       }
> >       kfree(ioc->pcie_sg_lookup);
> >       ioc->pcie_sg_lookup =3D NULL;
>
> [Severity: High]
> This isn't a bug introduced by this patch, but while fixing the cleanup
> logic in this function, is there a similar vulnerability for
> ioc->chain_lookup[i].chains_per_smid?
>
> If kzalloc() for ioc->chain_lookup[i].chains_per_smid partially fails in
> _base_allocate_memory_pools(), the unallocated indices are NULL.
>
> In the cleanup loop further down in this function, the code calculates th=
e
> pointer offset:
>
>         ct =3D &ioc->chain_lookup[i].chains_per_smid[j];
>         if (ct && ct->chain_buffer)
>                 dma_pool_free(ioc->chain_dma_pool, ...);
>
> If chains_per_smid is NULL and j > 0, C pointer arithmetic will evaluate
> this to a non-NULL address. The subsequent check if (ct && ct->chain_buff=
er)
> will falsely pass, leading to an immediate page fault when trying to
> dereference memory.
>
> Should we also add a NULL check for ioc->chain_lookup[i].chains_per_smid
> before evaluating the offset?

Yes, this look genuine: chains_needed_per_io is greater than one
in essentially every real configuration, so a partial kzalloc()
failure here would hit this on the very first freed index.

We'll add the chains_per_smid NULL check, but as a separate follow-up
patch to keep this one scoped to the PCIe SGL fix.

>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260808151010.18=
5603-1-chandrakanth.patil@broadcom.com?part=3D1

--000000000000d861e9065899d04e
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
oIHHMC8GCSqGSIb3DQEJBDEiBCCrR0AjouGcU0pfvf+BYYg7Ompy0TD9zIpKDsZn0rF69DAYBgkq
hkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yNjA4MDkwOTI1MTdaMFwGCSqG
SIb3DQEJDzFPME0wCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZI
hvcNAwcwCwYJKoZIhvcNAQEHMAsGCWCGSAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQAdNtmYdWOW
sXFCGt0tvrzZJrwq5CrC38av7JM/BbzgQs/b1Dq/R9T7c7oxj9TBQZcN4kklmPjfWgp4px15OLXM
6uEghxI8YUOLW3aI7JNiObvEOibbY8+PtmvzGk6JY9gSeQkUaQ7IBiEf2fKqFqXT3tpBwiOYbyWu
Jv/3ZpUjrY2IzYqe8wYNZadxQtiL2Rnnw0S2mpoqi/TiQwspu+QBoHiH7rfh2gphteeHXtwSPZqH
skHQ2/p63Lx8Kh/5lvLTI08fj3WXCAwzT5H8wH9XVt3jmjccculEcpx7VZslcj+3la3f6hJljVP2
B3jorM+8s34ug0uLdY8TpDAS0Cq0
--000000000000d861e9065899d04e--
