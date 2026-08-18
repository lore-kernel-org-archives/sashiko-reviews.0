Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080D5466B79
	for <sashiko-reviews@lists.linux.dev>; Tue, 18 Aug 2026 11:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787051473; cv=none; b=OClhPYWW3E60Px/9zpzu99uSeOZjV9eT6zWv529KGCxiLU+xrPecFKWu4Xv/VOvpTIp4DWVhh2QJxvAEs9MH5XVMbWfMlS+jhCGh/IKVF7px1cOEN6Kdy259uvtUGkBUKCUHmnQELodBwAorHP3DByG4bPxOZ3ppZFNS9ZMgCk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787051473; c=relaxed/simple;
	bh=BXckeo+ISA+mumrxeYs4LY5PC4L7kyHxZQPJys0NoZc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dachtVHMCcLZ3sNtB/RhD1H94IYY+wrtFShYSYNWCbl59WnWqBICOazV6oj9BxiuMlhBz4U0dePGFc+nvDXgRW4B2cawmQRjzd4DLmrXsZYfJQCKjcxMo6uuAYAW5EEGoyAMiHzdVURWTBN+QE39TSMJ8gernPOG+n8Di5LzDO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=BBel3tYD; arc=none smtp.client-ip=209.85.216.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="BBel3tYD"
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-38e88b60121so3419249a91.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 18 Aug 2026 04:11:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787051471; x=1787656271;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ucM0aX78A+WLbTFKW74KgVf1ujyNGYVl9qFQRI4g72I=;
        b=Btp9Jjd/H4yEAym2bFnX5Ez3ROjcLUS/4DejKADZYiRDeBdpgV6yk7U+Dy5jbVmkWr
         FRVbanFQEt2l+XQPouZKi6uIpmjKhRUcKUeh3Swmi00b0RxZNF2uECxqQy0+hbH0Q/gh
         QVOdWIMW67xQ83CSygJE+/n50sDsosxMvgVTUEe94uAlHYIFaH0lMD8479NJHeB8dU3M
         5sfKX3/bZ2mXSUxF9WS2fmXXpedl408mkaxgpmAZYnzLa4Gyi9byMKBWFwdt2LLeGIEI
         0RIICZ2GRU5naNN3b+hfUVRXWBwwMa/bUl3tdSHfMQhZISSOJQB6NmDhpILBK5eDuZiw
         z/Yg==
X-Gm-Message-State: AOJu0YxBkYxJ0dkiCIT28vROb2gE4GSXDnEwhxdBOPQuFhtJMgZZr4Lq
	/9uDXmRxMTBPfZZC/AFGF5hM4YMMdB74gog5p0B9Zc2P7RQ3OP2YaxIRvt124YHRUCPZpD8NtsF
	e35D8azOGtP7iG93KE5iKYJdbD3MXTtAX3NVs0aDgZvnsrryDPz0e3jx8hWjlFnJQKnGgxIQf6D
	Y9evZnLkLAUPN/Ix2yWDgp2ZyU8WAoud9uozr7eVJiJBDV/LuW9jeIZb3C8kLcM3FMmsoawdTaa
	NAkCJ1weaE7Obn6pYXXWGI=
X-Gm-Gg: AR+sD11rTyneLmrF2wiJwBcJcWdt/s0rbVqOX1YRMjwcydMNkukk7nkntSqTDZK/XeD
	aFYNnaERNZCKHawHcvxzvnSJYCyYZo0ZorAZ435nnxnO52le8JoAhMAaR8AntWMMUXHWQaNZ86l
	4vtiF4d/Nh3QCRuum9kyUsbPYrb0msW6JY2W/UTL6Z9KMJogcloLSz65h6a87mdvhZJ0izANZ6Y
	NiyW/YUf3d9QCs2SAOjRt2A75Sujgu+YTv2z6yhTmyYuHO8RGBr/O/F40wJkjZwtm2oD2hkPm1A
	T7vEHXE1TiDCR2YxCtJozSNTumadZefxk8mitLUjNHez98CJjfd0GZtZx7zXn/htFpN/ElzbN3p
	tpS+U5/+mJKCpUbBqlLsZ816KadtImK6DNzGLLt8OfXqejp+0Q3NZBPWld0KlQ7pGg+c9j8LbT7
	G49H2v7K0btJcEzudf+OoZp9JZzff22RgUe54=
X-Received: by 2002:a17:90b:48c1:b0:38e:2517:5d1f with SMTP id 98e67ed59e1d1-3933b792c20mr38697673a91.9.1787051471025;
        Tue, 18 Aug 2026 04:11:11 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-19.dlp.protect.broadcom.com. [144.49.247.19])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3954d176bfesm2292210a91.0.2026.08.18.04.11.10
        for <sashiko-reviews@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Aug 2026 04:11:11 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c15e82278cbso278412566b.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 18 Aug 2026 04:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1787051469; x=1787656269; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ucM0aX78A+WLbTFKW74KgVf1ujyNGYVl9qFQRI4g72I=;
        b=BBel3tYDK9jfg/vFpx7v3gEV5IkRURn/p4dwDHD3kydFpIj9jyA4tL9ZUXsEqPm+am
         iZs1yew/E7YEMHzRQlxcUBxg4cXj9jDXHhUeuDsMZaQEIQKZBYS7acaQnwbRWdc3IMOx
         HuZ45P9zOaCyZFCYEoRtM3o37YUYwwMFJ1Cjw=
X-Received: by 2002:a17:907:1c19:b0:c21:2c32:e2da with SMTP id a640c23a62f3a-c21986e90d6mr93660666b.8.1787051468922;
        Tue, 18 Aug 2026 04:11:08 -0700 (PDT)
X-Received: by 2002:a17:907:1c19:b0:c21:2c32:e2da with SMTP id
 a640c23a62f3a-c21986e90d6mr93656766b.8.1787051468272; Tue, 18 Aug 2026
 04:11:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260805110634.346670-1-ranjan.kumar@broadcom.com>
 <20260805110634.346670-3-ranjan.kumar@broadcom.com> <20260805113305.C23AE1F000E9@smtp.kernel.org>
In-Reply-To: <20260805113305.C23AE1F000E9@smtp.kernel.org>
From: Ranjan Kumar <ranjan.kumar@broadcom.com>
Date: Tue, 18 Aug 2026 16:40:56 +0530
X-Gm-Features: AcwNN1X5EN9y-HkPsGyWZ5btrLVqf9MthTA6w_qegEMw0VPRoAyxhMMU4TdOIJ4
Message-ID: <CAMFBP8MjrQZokOBX4+wJz0d8SoR8MykTDFxaaoAWKOttuq+Z5A@mail.gmail.com>
Subject: Re: [PATCH v4 02/10] mpi3mr: Update MPI Headers to revision 41
To: sashiko-reviews@lists.linux.dev
Cc: linux-scsi@vger.kernel.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="00000000000007368106595058ce"

--00000000000007368106595058ce
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,



On Wed, Aug 5, 2026 at 5:03=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] Incorrect shift macro definition `MPI3_MAN10_ISTWI_CTRLR_FLAGS_BU=
S_SPEED_SHIFT` for mask `0x000c`.
> --
>
> --- Patch [2]: [PATCH v4 02/10] mpi3mr: Update MPI Headers to revision 41=
 ---
> commit e227f986541dd8cdc45ad47d1ea7374c1b7cfc9c
> Author: Ranjan Kumar <ranjan.kumar@broadcom.com>
>
> mpi3mr: Update MPI Headers to revision 41
>
> This commit updates the MPI headers to revision 41.
>
> > diff --git a/drivers/scsi/mpi3mr/mpi/mpi30_cnfg.h b/drivers/scsi/mpi3mr=
/mpi/mpi30_cnfg.h
> > index 33dd303c97bb5..7cf16a5c15b72 100644
> > --- a/drivers/scsi/mpi3mr/mpi/mpi30_cnfg.h
> > +++ b/drivers/scsi/mpi3mr/mpi/mpi30_cnfg.h
> [ ... ]
> > @@ -492,10 +498,31 @@ struct mpi3_man10_istwi_ctrlr_entry {
> >  };
> >
> >  #define MPI3_MAN10_ISTWI_CTRLR_FLAGS_BUS_SPEED_MASK         (0x000c)
> > -#define MPI3_MAN10_ISTWI_CTRLR_FLAGS_BUS_SPEED_100K         (0x0000)
> > -#define MPI3_MAN10_ISTWI_CTRLR_FLAGS_BUS_SPEED_400K         (0x0004)
> > +#define MPI3_MAN10_ISTWI_CTRLR_FLAGS_BUS_SPEED_100_KHZ               (=
0x0000)
> > +#define MPI3_MAN10_ISTWI_CTRLR_FLAGS_BUS_SPEED_400_KHZ               (=
0x0004)
> >  #define MPI3_MAN10_ISTWI_CTRLR_FLAGS_TARGET_ENABLED          (0x0002)
> >  #define MPI3_MAN10_ISTWI_CTRLR_FLAGS_INITIATOR_ENABLED         (0x0001=
)
> > +#define MPI3_MAN10_ISTWI_CTRLR_FLAGS_I2C_GLITCH_FLTR_MASK    (0xc000)
> > +#define MPI3_MAN10_ISTWI_CTRLR_FLAGS_I2C_GLITCH_FLTR_SHIFT      (14)
> [ ... ]
> > +#define MPI3_MAN10_ISTWI_CTRLR_FLAGS_I3C_MAX_DATA_RATE_2_MHZ    (0x080=
0)
> > +#define MPI3_MAN10_ISTWI_CTRLR_FLAGS_BUS_SPEED_MASK             (0x000=
c)
> > +#define MPI3_MAN10_ISTWI_CTRLR_FLAGS_BUS_SPEED_SHIFT            (0)
>
> [Severity: Low]
> Is this shift value defined correctly?
>
> The mask MPI3_MAN10_ISTWI_CTRLR_FLAGS_BUS_SPEED_MASK is defined as 0x000c=
,
> which covers bits 2 and 3. Should MPI3_MAN10_ISTWI_CTRLR_FLAGS_BUS_SPEED_=
SHIFT
> be 2 instead of 0 to ensure any future bitwise operations work properly?
>

This header content is synced from the MPI specification, not driver
logic. If any change is needed, it will be updated in a future header
revision.

Thanks,
Ranjan
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805110634.34=
6670-1-ranjan.kumar@broadcom.com?part=3D2

--00000000000007368106595058ce
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
zZSItX49nLoa4TBbzuCzoINrv59QeSCVlVdAYussUS3840ZjvcYHSQx3tqYcBN+an07lDASmGEM5
7PEXJPVInjl/Fva3ksL3r8anR4PWc3Xz5jLD8Xg6BU4zmIcR/t1GlqWuz8uTWmQtm40C9m91Q9a+
2alIIV6BTs8IG2ELtt4EfcVvi5af+Hu878sGeBtMx6Z9ljoKl3MfvDdtUNO4bkJ97a7PXy/CKxiy
TApQj4qg9SKQcsH0xzQan67XeXjkvk4frNDhRikCAwEAAaOCAd0wggHZMA4GA1UdDwEB/wQEAwIF
oDAMBgNVHRMBAf8EAjAAMIGTBggrBgEFBQcBAQSBhjCBgzBGBggrBgEFBQcwAoY6aHR0cDovL3Nl
Y3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyNnNtaW1lY2EyMDIzLmNydDA5BggrBgEF
BQcwAYYtaHR0cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyNnNtaW1lY2EyMDIzMGUGA1Ud
IAReMFwwCQYHZ4EMAQUDAzALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgoDAjA0MDIGCCsGAQUFBwIB
FiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzBBBgNVHR8EOjA4MDagNKAy
hjBodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAyMy5jcmwwJAYDVR0R
BB0wG4EZcmFuamFuLmt1bWFyQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAfBgNV
HSMEGDAWgBQAKTaeXHq6D68tUC3boCOFGLCgkjAdBgNVHQ4EFgQUfLdm66N7GfDsoL8cYp3s4YdO
isMwDQYJKoZIhvcNAQELBQADggIBAA/lnAxDb9jbesclnBxWIKUSxAMIrq4XKO5WKHUYIOOzd2sL
o59fH9AWg1AfVONfWIUNdWDrmNNLs0+drSKaZbGx2RWMbaL9ubo7+BTQV33ZRBxnnkmc9QszlOo5
m6FB9uPOGB9LvJMCkJ8S7hNc9G/p7dB79s1IKc8JGEDIrsgX3s4xSCJA20WdePHY5rLh5ySwXyI2
3sVTUC+oK0HJFRo+TpdMMtdpOetWzIkUbGceiOA2ur8372+0KOmvlIHA/jEnW3BRfmB2vmdk+raY
C/xbXY9JEfS6D881+X/90w+cCQ7nuA1OELebS1RbSdXT6YkRDPWYA/DPFhOYCAiMwVAPRaAH1AQc
8J8yTDigwRUCq4qKCYU9YnqQh3YZRbUYnW+i3+rAO2SUbKl0VM5y0tq+GOGLC7w+v6yGossZmy+6
3w72qp/Colr4r5ZaROb+L2FXqk4tL/HfkRhliyPPPNIjre2mIkvFuShk5A5FcvQYCzDtejAz9JHq
ZVJ1ZD+auQDbIUxT+Dn9bI5XkQnWJ9KrlcORtztdYTDafN8VQuweS3JY0X/VCNBNZkiYXd7fzOza
hvkw/S+v8cIfiakLKBREtiBHqWLdVf5CNDVYpd17yz0LGz0TKARbfuK/EiKflA10pnnnOB33Ru9D
WPp9aHW3szGYr3+H9AHS6IDwkIxyMYICVzCCAlMCAQEwYjBSMQswCQYDVQQGEwJCRTEZMBcGA1UE
ChMQR2xvYmFsU2lnbiBudi1zYTEoMCYGA1UEAxMfR2xvYmFsU2lnbiBHQ0MgUjYgU01JTUUgQ0Eg
MjAyMwIMDcMaKRu9LrbAxERoMA0GCWCGSAFlAwQCAQUAoIHHMC8GCSqGSIb3DQEJBDEiBCBFsdVv
xGuHdr+4Uq3EVCwJOcRXCJU4CSDhfsFUD3q/nDAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwG
CSqGSIb3DQEJBTEPFw0yNjA4MTgxMTExMDlaMFwGCSqGSIb3DQEJDzFPME0wCwYJYIZIAWUDBAEq
MAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEHMAsGCWCG
SAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQALw/2Gr02iOTyCtdeuKP3zzDn/w+adc8nWzQkuln4I
Jb/9Q7bbZl6jZS4Rp5QHpPrWvUAe1YWD0cbwYWi0rGT1ENBKxV5mmbK0EpJXynpX/eBnbZwSqWVD
a2bUNIybvSbF7vKkAdKY4r6/0ksvxRuPaRC1YJ5SEIWbXe5l6/jypzZAKAN9DHHfIARx7HWnUwRe
291cHcUCIRe6myWttLuebQ4Dz36hRmEuwgd6G2gPncmLt6bJk7PlN1+07yMc/ZW5kAjg4FRFf3YJ
AuQHoAOBepGbnTdJt4+ZKK9yBjUF2g7YbZRo7cA6Yjm7UO74HU2GL6tpPEHkGtYgcMxT2Y4Y
--00000000000007368106595058ce--
