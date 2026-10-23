Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792720161;
	b=dJFqBcEUddvs0nfDYjHKIAbv/uZJx02TO14S78MR2UiXNXf1fUz0gtstV1toOWqHTh+y
	 9y08nmZZ1Kd8dYZ8qfwP8G9F7REvQkQG5TSM48Bzv6bxNeQnrlOsk2v7gGvict7kw0/37
	 bPVqZHGw6GITbD5T1zPfuxWjQhjzQjIQeQmN4Wtnau/2YM+QLHYxETTOS6bUcg6SJl8bd
	 eX7TSaW6OIeE0kd+UGkLzHUUerUOWHHICeCvDV8+gBp4XMCEidChVhU5C+N8cE9Y4Dh2c
	 WYbW5lsUdxCOHmLNa4igVOMgJD9gD1y/qau7C8MIB6HSvbL7cGuWyR1J1F3w3atgj2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792720161;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 X-DetectorID-Processed:Content-Type;
	bh=22/C10ZYKpRlQQVhA0S4k+qdBezIcwiS/xsZ7aeVMfI=;
	b=SoBf88od7TdWdcFE96i+krYjx+eb3Qk4/fy0WXduD+c8ZHNNFTuTFffAiKj7p1jyTtgB
	 UYbPBKu8pddOGSn7zBsL5SEsQoGoYWZt8JD2oW7BGXFcadAkkrehPoSgw1gma089KUcTu
	 z6gVkUAqhRNcK4f26AVr1mx8wVxy+8tXIS+sIINwkx2SHYdLZzN3sI95wqDrnr+oZNRpK
	 LSbWNNvpmLA+cVmKa6SDH7tvvNv/9GCVLuKbkFD1IrrEpx6w0YuopzcYrB+/UsEzXzeGp
	 qnXb5Dawe/OUUbgeMDzDMrroM/H7oBfFfwGLx+Ie/ViHfgOuYbUZtNYFGbAuyHhdreg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="B5uwKM/l";
	arc=none smtp.remote-ip=209.85.210.226
Received: from mail-pf1-f226.google.com (mail-pf1-f226.google.com [209.85.210.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FF5606A31A
	for <sashiko-reviews@lists.linux.dev>; Fri, 23 Oct 2026 01:49:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60FF5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=B5uwKM/l
Received: by mail-pf1-f226.google.com with SMTP id d2e1a72fcca58-8a05b210703so212159b3a.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 22 Oct 2026 18:49:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792720161; x=1793324961;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=22/C10ZYKpRlQQVhA0S4k+qdBezIcwiS/xsZ7aeVMfI=;
        b=fqOlsFT0sCAoV9sPkcxNMW42ZFbB4+jFw0F+OkAhGevpeJDRpo1Xio6+GbAwnC9NRD
         1Xzh1RoLus8MYljvuNtO/4yeCvG9XRh9KlzVjOIQeyn6ZI0697L2U648gTYHFdhjRoTL
         IjEenajTYC1MezHogpghHqf8q0hWcc8rMymJVW5WLTzhJD0ILHceuqygBfS4MfMYHeYF
         9boIgUUmx/BuxQgz5zV4UwWYmXQiTbfbYzkwF/mu7TrHZ8C63OhqcU42DKG1NFn+HDew
         HvBL/RJv5IIZ/ytRJVXDNqNC499Mu05Er9Fot148MsdUoHtkI3P8LT53H/0+ItuJI0St
         OITg==
X-Gm-Message-State: AFq9FYLKXRXLuKzu1p4Cl8J63V4c6YYU0Zrfocv5J6X3nfZP4yK36ais
	e8HNpzVSUDdsJWcOvZl2RbIzfAnXpEyD3Hv5jxkBflk+s26s5YwsJ20511A0gTXeh2gGxXh2G7e
	+LNggk03d4Ck/EsF3K3Kh1xuTMrodJAVlP5CkU+aI94VBLt/ppGFhRhyujCFefaaU05D196Getk
	ImnI+bFPFTsq8H+XEjnWyOZ/g6NsMzdFgnOfezgVLkEK/zLgeJYwmg2GMibbGfGqkiJD0RoBfDh
	WUVfK/dlW4O8TDTiokE
X-Gm-Gg: AYBFou3ZhZBH9sL5IyfkxJwX8g0da5h+8Snd/XXeZcYMn9u5dK7vpRl0iSpBo3ZHgs9
	3wWDSZYws0xPti0zZciX6nIh01GT5AWfuPuNznr9PFImyjND/R5+g71ongpJHmCIml9/tdhBw2v
	65Qb8/y+QNa76LBJ87vR2FA1+r4uqnbEKIHsmaCX+EmdGW9QTM4bGLM3BHEvL4Ft7W69xfu20ao
	sEir4CCkdPASZwYFzyOlx/K4pJVQnIUEj4Jbd0ZSz1lwO+9N7ZyDLLaf3UcDvpdfWX5+lDahwSN
	anrqtxQ2zGCo5GucnqoBqj6eHCn1mkez2GFyQID8ufiVQy7EMOoN+yFMIkXGtk8bojZEDc25p7J
	SgLDtdeYsxhzxwR255OPkRJySBw7fkl+42OYP8LgKRrLA5tbsNfaArS3Mr3UAMSN/KBZLmzXnWX
	w36tzrnwOcUdX8EjAuciP2hCMN1kFgaNHd
X-Received: by 2002:a05:6a00:b41:b0:8a0:2344:c44b with SMTP id d2e1a72fcca58-8a2c63c8b36mr644608b3a.40.1792720160420;
        Thu, 22 Oct 2026 18:49:20 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-17.dlp.protect.broadcom.com. [144.49.247.17])
        by smtp-relay.gmail.com with ESMTPS id d2e1a72fcca58-8a2c8bd2092sm6097b3a.6.2026.10.22.18.49.18
        for <sashiko-reviews@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 22 Oct 2026 18:49:20 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-6b1ab11f480so541120a12.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 22 Oct 2026 18:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1792720157; x=1793324957; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=22/C10ZYKpRlQQVhA0S4k+qdBezIcwiS/xsZ7aeVMfI=;
        b=B5uwKM/l5yeWVtboXPM08SDJp7cPEX3c56AXvSXeGlaKk1EeX8yxkCT3TBVfEIJiTM
         cYi2tOofeUipFrWAcxeKSL+2hEtJvnn1lOgpc6J9r8az20Ofoq13p6NAsTfyPp+ZvuPZ
         4h47Cex3QaMDxigKZHYB5iBxkd5dOnVGs5yyM=
X-Received: by 2002:a05:6402:1246:b0:6b1:a67b:d378 with SMTP id 4fb4d7f45d1cf-6b432c414f8mr1207945a12.17.1792720157173;
        Thu, 22 Oct 2026 18:49:17 -0700 (PDT)
X-Received: by 2002:a05:6402:1246:b0:6b1:a67b:d378 with SMTP id
 4fb4d7f45d1cf-6b432c414f8mr1207929a12.17.1792720156706; Thu, 22 Oct 2026
 18:49:16 -0700 (PDT)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261019-uet-ib-core-v2-0-8bd654f25370@broadcom.com>
 <20261019-uet-ib-core-v2-5-8bd654f25370@broadcom.com> <sashiko-outbox-178596@kernel.org>
In-Reply-To: <sashiko-outbox-178596@kernel.org>
From: Eric Davis <eric.davis@broadcom.com>
Date: Thu, 22 Oct 2026 18:48:48 -0700
X-Gm-Features: AclHuK_JjOg2wfBd5rpKJKlrX5CL3XXEWBiO2j9AUHSpFZYAaygPzGU7za_rRO8
Message-ID: <CAMouMYLNHzpPYa8i_ZJ5aowkAE+6GBbL1rX-8Ofsy+DpZZTMHQ@mail.gmail.com>
Subject: Re: [PATCH rdma-next v2 05/13] RDMA/core: extended address handle attributes
To: sashiko-reviews@lists.linux.dev, Jason Gunthorpe <jgg@ziepe.ca>, 
	Leon Romanovsky <leon@kernel.org>
Cc: linux-rdma@vger.kernel.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000002a68e3065e7830eb"

--0000000000002a68e3065e7830eb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 1:40=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
> Should UVERBS_HANDLER(UVERBS_METHOD_AH_EX_CREATE) call
> uverbs_finalize_uobj_create(attrs, UVERBS_ATTR_CREATE_AH_EX_HANDLE) befor=
e
> returning 0?

Yes, agreed. The method declares UVERBS_ATTR_UHW(), so the UHW_OUT
write after the handler can fail and the abort then skips
uverbs_free_ah(). v3 will call uverbs_finalize_uobj_create() once the AH
is set up.

> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019-uet-ib-c=
ore-v2-0-8bd654f25370@broadcom.com?part=3D5

Thanks,
- eric

--0000000000002a68e3065e7830eb
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
Ldxf930IzIe8izANBglghkgBZQMEAgEFAKCBxzAvBgkqhkiG9w0BCQQxIgQgiQ1IFqEf65Dpt78z
9NxlcYcQ9t31ItbKT5s6RIqQTh4wGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0B
CQUxDxcNMjYxMDIzMDE0OTE3WjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFlAwQBKjALBglghkgB
ZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzALBglghkgBZQMEAgEw
DQYJKoZIhvcNAQEBBQAEggEAsa4vBJ4+XX46Ce6/BnDeC7tFjPc5+yXIOScwBDWlCX1CoRRVgIzD
hL3fpS2hJPV2SoAPnqQIH5AmV8Y9UU9FTWAOlXfdSITS6/+KB0IamaPI0I1bSEz0XAdt9uCi3i8D
jQXc0DD15q9QgvJZmWXfZOtIYO4tUAH8juc4f8QyJZ1HnAoVKLpsS5DGZqInX5Dwuzk4oBXHmCCc
QKgy2lw0Sd2AG3w4mfxuPD5phWAgosG5Qrdw2T9wi4WjVabTtI6S3A9cwD82AAYDBIP9p/ybSdvX
4KfPQ8t7S2fYoCObgkkqPdByKpts3GGTHeSyQoDuS7j1h0DjZPChdRtGI0EeDg==
--0000000000002a68e3065e7830eb--
