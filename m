Received: from mail-qk1-f228.google.com (mail-qk1-f228.google.com [209.85.222.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7CC25505F0
	for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 16:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792080491; cv=none; b=d95sBvtSjPd2SrF3XSIIK65w4Utlr/hXeJgcrJ89p4RSePOJkPFso5vefmM6r2lHSYrWrGPAy3jiWoj+/PdqO2CMelfTd7yMfJNLGeOq4WNVwebTcCDTs4fNUKe1vdrLDL2z11NBPxMaRQRrPBR5NTSsE5VXXjQ7Xanq8m2VbtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792080491; c=relaxed/simple;
	bh=qGkHupCewR1IE9uIGxRESolbT0f8yxgSxcEsH1wwDjQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OP1wdGexbPszFzZULBupvpdwo5Ud65/p+3KL0vIWXmCJdH5ITUv9l1pqS+DlDT/4ZE1xdDJTMo9zOxA/88nJyRNulE2EAVBKtn0/pl+725vlCytAG1LHs7PEdW/x1FDxT6k9O73RG8xZwP//dFOzWOapEWCo34ou0PYASoTiaMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Lf3rt66W; arc=none smtp.client-ip=209.85.222.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Lf3rt66W"
Received: by mail-qk1-f228.google.com with SMTP id af79cd13be357-93e56c287b3so130581985a.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 09:07:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792080476; x=1792685276;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qGkHupCewR1IE9uIGxRESolbT0f8yxgSxcEsH1wwDjQ=;
        b=XmhG0WQEySsl+EDMSTgVXmsUnrcLqSZ0PPyEu8b0QLiNeQELA/fVYuPBpR053NK/Bu
         jpujgx0ItcThSvi8vaJs3HHt0YWCheOywmi4zISDyD/6t0xzwBrBIvZq+tDFdTDSTOXH
         piO3lPAcZpPVIi16HiwMCSkd5nCjCF/c8n8JREaPwh6Dt7dUNGcJE771Z81+D4ISXxzB
         5Zkk0/ScyRyiMJqVp7JPE3oUrjTvrBrrDSHI7M77pXlZf3gl0uC7oa1hNigS2U/8ZE1M
         oGQmH9cJaPeWiu2E1SOlEAea8VNw20Dnn8gJCtBBVUdoOXsYodFY9TihSHW+JP7RBrLG
         LrkQ==
X-Gm-Message-State: AFq9FYI9MZk+EkWZhaTHLBHO0ZqERyPtwqiGa9zrVg+PZUFcHX77KUZx
	P2Ll7CwPdlLpND+/65iwga0qytb4z9AT/1DMUhxoa40fk9OziU/5O9dz9rxNFK0ft7A0QirE9Pq
	yx+Rr2xYlq6kP+EJQO6u4DoIZlDoPv3uTnZX8RWh3LFUZAY7ihCdwJw9nxOszW4+L8OiqcL9yAT
	7W3IeDsR7+KyUycGWsaJwPVUl29o0/k6C+IlAEaWGIiC8efeSg/SIulZ/WUM7lXSLseHsgYOLts
	Po2Q71bunM7WVJhy4rZ
X-Gm-Gg: AYBFou3rPdXh2s48QRnUY2Ny2BqNwFDoALg70QMUSq94tDNQ4Tb8nJrt2nUfSRgZH08
	ylgLx2KlR8TTbMqTypz37EfP8R/ghOVCSh3BSyS8wIUA/7J5Plw7XizzQWq8tWb/SBrFnf9g8p6
	lPt/OJj2kUzC+tJI0oaGLzs12S7iw93De77MXLrArDQ9TwYkEjq+aUXZbaqGyHwSoZd+uDf+5Gv
	OAPYSDkGtrcE2u/JeJ771GpV05Zu+zZaUTdfl1TPPDISGMbZkbBREKWTMRphtODKDuHUML8syrH
	osyAqth4TAve9ifHKZfWTSJCHTIq/V/rPGfDPydPURkUqhjE+BxuZTSM5pPlQpzIPFLxsHVqvD8
	bqri4azhCwhNOcOozauqa7D1aVsFLruEZPEFXS+rkO7SlKHYRQcS/ZS8q9L1MSz/JOkbuPawWCX
	Wm6DAk65a5Rs0XQIfsuC9kjOYhnB0N6nIC38A=
X-Received: by 2002:a05:620a:270d:b0:93a:83d:1d0e with SMTP id af79cd13be357-93ebd208bd0mr3202047785a.38.1792080476114;
        Thu, 15 Oct 2026 09:07:56 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-93f0e08702fsm56733885a.12.2026.10.15.09.07.55
        for <sashiko-reviews@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Oct 2026 09:07:56 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-6acb986a43bso6302298a12.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 09:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1792080474; x=1792685274; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qGkHupCewR1IE9uIGxRESolbT0f8yxgSxcEsH1wwDjQ=;
        b=Lf3rt66WFQ96APiAsHR21ZGf3HyTVcSeKt+CCbpN1I+NGBaA2jLCta9P5iFf3Bp8vk
         SL8qrd2PbIgPKlXPm1Zklh1V6whRkd3pAm5oTTL80pjwIaGtimZA69F/bAfQhGsPszaF
         zU0MVnz+8coQM1OsymYdGq+yQl69BagQ/bvhY=
X-Received: by 2002:a05:6402:400e:b0:6b1:b1b9:484b with SMTP id 4fb4d7f45d1cf-6b1b1b96089mr11484237a12.9.1792080474396;
        Thu, 15 Oct 2026 09:07:54 -0700 (PDT)
X-Received: by 2002:a05:6402:400e:b0:6b1:b1b9:484b with SMTP id
 4fb4d7f45d1cf-6b1b1b96089mr11484214a12.9.1792080473928; Thu, 15 Oct 2026
 09:07:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261014-uet-ib-core-v1-0-a0e626117113@broadcom.com>
 <20261014-uet-ib-core-v1-4-a0e626117113@broadcom.com> <sashiko-outbox-172001@kernel.org>
In-Reply-To: <sashiko-outbox-172001@kernel.org>
From: Eric Davis <eric.davis@broadcom.com>
Date: Thu, 15 Oct 2026 09:07:25 -0700
X-Gm-Features: AclHuK_e3pyCcBDZYE76ba3_hzvpN8gt5YjzjPj5bRPl9jMDrRQnbU3zoV-P8l8
Message-ID: <CAMouMYKADaQjsjeGZZyB+eWvswpf+b_H=aT-VZHVoe=vQFhxZA@mail.gmail.com>
Subject: Re: [PATCH rdma-next 04/13] RDMA/core: add the reliable unconnected
 queue pair type
To: sashiko-reviews@lists.linux.dev
Cc: linux-rdma@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>, 
	Leon Romanovsky <leon@kernel.org>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000001bb2f6065de34065"

--0000000000001bb2f6065de34065
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 3:43=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
> With the addition of IB_QPT_RU, should it also be added to qp_state_table=
[]
> in drivers/infiniband/core/verbs.c?

No. Core never calls ib_modify_qp_is_ok(). It is a helper a driver may
call from its own modify_qp, and an RU driver validates RU state changes
itself.

I don't think a row can be added without causing a regression. The valid fl=
ag
in qp_state_table is per transition, not per QP type, so making RESET->RTS
valid for RU would make it valid for RC, UD, and every other type in
every driver that uses the helper.

What core does enforce for RU is in patch 10. The attributes a QP may be
created with are limited to STATE, PKEY_INDEX, PORT, ACCESS_FLAGS and
PATH_MTU, and the state must be RTS. The driver's modify_qp then takes
that as RESET->RTS, and the QP is destroyed if it refuses.

> Since IB_QPT_RU is an unconnected queue pair type, should
> ib_uverbs_post_send() in drivers/infiniband/core/uverbs_cmd.c be updated =
to
> account for it?

No. RU work requests never enter the kernel in this design; they are
posted by the provider (the rdma-core series), and there is no kernel RU
work request struct that a driver could mistake an ib_send_wr for. The
write() POST_SEND and POST_RECV commands are declared with
UAPI_DEF_METHOD_NEEDS_FN(post_send) and (post_recv), so they only
exist on a device whose driver supplies those ops.

>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014-uet-ib-c=
ore-v1-0-a0e626117113@broadcom.com?part=3D4

Thanks,
- e

--0000000000001bb2f6065de34065
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
THSLCC9N61nO6/woOMp7U0lttATSMIeibGPNnU8AizWyI5DxXKkIG5jv1EosjdJwBsJ8ZntvpfIx
+KplEkYfqN7Sy+7LOzXXkl5KhTkDELRuftv+sahPNzVHW1cJgj0HjMb1sCrFjzcAuO27JA4geQXW
cl+gyZDv53xtHnMSNmIoqDEINo4yoSHYPGK+cTtGC4K9a6yCXdP2zyLkkSQtZ+hEUOru4dQ1gIZf
4bWVHOILQGaMbqVAVA1OrjpUNGktgz0CAwEAAaOCAdswggHXMA4GA1UdDwEB/wQEAwIFoDAMBgNV
HRMBAf8EAjAAMIGTBggrBgEFBQcBAQSBhjCBgzBGBggrBgEFBQcwAoY6aHR0cDovL3NlY3VyZS5n
bG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyNnNtaW1lY2EyMDIzLmNydDA5BggrBgEFBQcwAYYt
aHR0cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyNnNtaW1lY2EyMDIzMGUGA1UdIAReMFww
CQYHZ4EMAQUDAzALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgoDAjA0MDIGCCsGAQUFBwIBFiZodHRw
czovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzBBBgNVHR8EOjA4MDagNKAyhjBodHRw
Oi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAyMy5jcmwwIgYDVR0RBBswGYEX
ZXJpYy5kYXZpc0Bicm9hZGNvbS5jb20wEwYDVR0lBAwwCgYIKwYBBQUHAwQwHwYDVR0jBBgwFoAU
ACk2nlx6ug+vLVAt26AjhRiwoJIwHQYDVR0OBBYEFIjgxJwMJZ5pkTAB1796PUvJ+W7DMA0GCSqG
SIb3DQEBCwUAA4ICAQCM/INVouXcD/gHdJNCPtF31BpLUwHGTj4BlO4083w8xuxt0iSjyb0EKv7S
LBz29Dw9scSTMRS/sY9dotjJ03vVvzceiGB4FbMIZNSKHTy1PTNu0oZR7TwhBEEZHC4RtST9S2hU
MvDagOAWRM/56PG6FH2i7dnhwtcnsBX8CMeVJQc6SB21LuxJVqgULli/kbrkr1DBVMh2f7oCFHVu
0VgtvRtACeQVi7ny8wspKNV/WXN2IqT06c0vtUmFUPkidlgGxMzYCfQXbXcE3YvA7+xYqmCY0zdQ
f/ira3VJoAytznhfRSBRV4gmlChdSg8yoaM6LHNE7igDDqhVFT2QCqkRkIcPOCQYxNE4kViiDKKo
3VFnREnYmLzRbJkdGY4X3m+N7HOU8R99Zeatx6hN02eJQH1vZ1J9cH4SqxuqDxKi05n3SGE7J4Wc
oNsgfaIDL28JX+2JBG+gKr/vvjocja5y9G43gvIOs9yEzGBt91FCuuwPedXIIREUcqJtq6+MOvAq
ZMEsct9jQXibihTD7z9wLTIkXqOHumCc6f53zhsQCRofr8m7Tm0YrckGCHd0BowU12A6oVax5xEQ
6j1hyszkhFPrlLKAlaFU7VuIwlcjKvN9XYrmOfXfTnYoVV6f1IDwhgbtJNlKnJksqoCzfsbAVd0e
usA704DOznTCfAYJqjGCAlcwggJTAgEBMGIwUjELMAkGA1UEBhMCQkUxGTAXBgNVBAoTEEdsb2Jh
bFNpZ24gbnYtc2ExKDAmBgNVBAMTH0dsb2JhbFNpZ24gR0NDIFI2IFNNSU1FIENBIDIwMjMCDFfq
Ldxf930IzIe8izANBglghkgBZQMEAgEFAKCBxzAvBgkqhkiG9w0BCQQxIgQgAwcVMa27lcEDL8ys
xXIJvT4YkuZqGz5J2+GhVcL6yfIwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0B
CQUxDxcNMjYxMDE1MTYwNzU0WjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFlAwQBKjALBglghkgB
ZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzALBglghkgBZQMEAgEw
DQYJKoZIhvcNAQEBBQAEggEAgKBAD/aGlUdw+haFfMzZIj+C2aZkGuYOmtAP5FL3mdpgNW9N4boC
hbDxeFNFlSMRffmjBXQzu1t9ktinTdpEIdXcx25wKRXYRAq9OkL6edXQIzUWCBRJ6ZZeWGePZkhs
39Gl/YzummEHj8uUekc2z1A+f6J5m8olWs3DfYrmwWAGE3uNpf40j6rjOOn+5/ljNludNFhNmB8p
rXMNs5puKLgSGFWIFIslrIUhdDNfCnEaWFA2e34LJvkHB31G8v02TZScXDOj4faHqDd6AgkrmPVk
zXIRoz6MjNOjTWQWoOSIz6vWFjwpO9AQ1Q4FSpV4ZowEJ7iTcFX6F0agcLSbiQ==
--0000000000001bb2f6065de34065--
