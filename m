Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC4E43744D
	for <sashiko-reviews@lists.linux.dev>; Mon, 27 Jul 2026 18:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785177234; cv=pass; b=lC+Fn9UqAP5zDWMfcv2ftqt4sfqq4nLcFlwQXclOyb9BQOCtUeGoGbE3kzDhpYjWYCq6xZy8TUfCV1O6xdtyo8QY59bJzKB1H5uvTopHKncsaKxQGRZ+n+3KxUrTcU2SFdyCcI1Hv+34Pf7hv4eSzWXnrcrHUBDcrA4WSzm87Kw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785177234; c=relaxed/simple;
	bh=XaxOyjSBIp2MfK7GgriCv4snpYNaFDkTzZRvZbQUUvA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cZi29nMaTPRTTiAZyLloNu4FSD+3UyO+gnz05uhnzudy1YrsP9+9cRTrvCEBO/f8m4fL85a40oVZPmtUSDCBefYTE4b+jYEqTEwU66DxbrAbUsSfgDob6bi+wgnX7UpbLFDi2Z65az0LtvWProYRf7SVYI9XfcNL/g+pNdRt8fk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CZbBf4w0; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CZbBf4w0"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cfd2e4e83cso6307035ad.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 27 Jul 2026 11:33:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785177230; cv=none;
        d=google.com; s=arc-20260327;
        b=cYwhN+IQvoJiLE0KejyGIhxaQmbu4SHt+rPmhC7RtCw0H8jvT8OjM5VG2HAf4xSn4a
         oei7IKtY7O9AmfTfJa/diTyZYTksGKzkm+PN22VZ/tQ6EKlL/YPyjIw0x8m0AqNA6sFM
         QjFZ89pO4tgGpWDYaKJeaPlu5IiSg72WOw6he6IWCyBSyj1whSllidS/7vEk7nAkyTYg
         w1p7/OxddT3ejb7lcctP1Kw6cwrudeAGIDnLOOlHPt0CyBcU1prUXM5LZp/eWGcJwqCE
         zmrG9Jod1XH1QSDsTfaTNRLKRlU2aqwjfI5sBKbx6bRy+daAc9UKSpoZ1Vt1dXeZPtYD
         v6dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XaxOyjSBIp2MfK7GgriCv4snpYNaFDkTzZRvZbQUUvA=;
        fh=iapiEpSRG+2ubxn5nOEtWwaxRXffkejsrajQyzzbSDI=;
        b=ZsJU2kYoMzvfrtq7mGvcBB00vSnicNn634H+3mT8VkoAgK8mM4XpQQgp4F8811bwd6
         MrvezCdx7TxJO4zdjqx4woyLSruW1++o0SvmzuWkxbKn8z7Pkd8XV99PeTXmucuRfICP
         cEcXh1CVspGaR5cwyad3d9EDQJeGiuPmqKJmyxQ/3So2uLci14rG6c5LUv/Nb3EmJn0T
         9Nt+/YC68K2lgaJ0lnbPZtPoTk0Jk7wIUknBu44L0GlDnyczyQvOrqc63H4LR8xoU2lW
         KdHRqrB6QR4aP64UpUpWhvXZVSd0Z0GbehYOppdJ3osJ5YXp8KMRAT9o4WwWx9h5++6T
         FoXA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785177230; x=1785782030; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XaxOyjSBIp2MfK7GgriCv4snpYNaFDkTzZRvZbQUUvA=;
        b=CZbBf4w021fyyPU6R84RWKX8Zow0wEEBjq9CBdfUo7R+utXRIUVX25xiuUMJdhLKl/
         KazAmnjeA1B3XAtTaNFcclEnlgWn3MA08HPD/qiGqBw37WfnqTZqQKUxzLsOS2CRpk6l
         Zc9i09Qht2KQ7JvMWUA1KLE4nOhK4IHwCFZlEXyx4MtckmfVyHJzaqa/H6Zwu4opgoau
         lENuq5JxIahub9bftg+9s6609HiNstZPWsFoOghmaotJtLFB+gMeEk3QueiqFw0Sm6lh
         lkCDrfV+gpN1c82srrLozrppJ8GOnW/1iuQjnhQZi758r3ge73JHkkzjH2oCzqGz64u+
         Xpuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785177230; x=1785782030;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XaxOyjSBIp2MfK7GgriCv4snpYNaFDkTzZRvZbQUUvA=;
        b=GRbvge13YtzzLda9pPC8gIXIssO70SF8ruUx0/+MdbmU/WxH7vJzcoTZmC8Ab7NPJv
         dz9+JqMNs5ul1h6rg4XCEZx+YG6n4nemMlPMcSTJM6ayCWVJ/MQ8ZOgH6oXWrKeYjaBY
         C35vb/5cvv/IyaqKjyN1cuyq7aphDh+YWfQKWE+dY1xvBs5trruQhQ4zWsDdEV5YeevV
         VMKfOLrD4CZQK+1uU2SRJI4mVe3F4CFIrEQMrXPeqLZawOeneBwJcz7p4pevX7PObD0X
         zrDQ5y65Sv3+fCjPV8nWLC5txqFUYBcOOlmlETzKw1sMF+ZW/8O8cRDAuqC7JRQsJruE
         Slcw==
X-Gm-Message-State: AOJu0YwLsOGQlodxOsqw8IqKWKKf9FOMZDK9+/1VB3P+vJMnYX1lFpke
	L+JtxJzP0Z5OQrIbi95xgOzkL0tc+h88QRp+LHmKsToRI7oeSxbAf6EO36XjS1OPhjEnP51gU6C
	HohqcmNwZ4FgoRqCHHfmR7e87zMZM3ao=
X-Gm-Gg: AR+sD12MkPK3onU6n0N2IWN2l42FZzWsifKFUIPjJESCa4vfNUQybVcK2EVXJhM31Y7
	iSw5KBT5dnMBo/ENDE/ht+nvPzGWot2TzQ9yE/jwCMXb8Tctpzqu+m08kczXZ30FRp5ejc4If2D
	S1f+YD5LJZMDalxcFUDInVtRq9jzLH626DgFGHB85uSJ05X06ppaU1eFrg7NPbd+QIIqGWV9VT2
	O0S1pFl02IbzSNogalozvDpGr27CuU5wQFYWTEVkAFUNxNACCOYqS8vPXVxuErXYIqro9pR2bBk
	++d1SYzeowPGSIepc2GKswytK9EP6K/LZ4PYTfDQobOGd5LimFUkPy5WKEbg5QuAb1a9FvRVNHA
	t+w==
X-Received: by 2002:a17:903:110d:b0:2c9:8287:fd0d with SMTP id
 d9443c01a7336-2d00ba7bf20mr10354445ad.3.1785177229751; Mon, 27 Jul 2026
 11:33:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260724170132.3783816-1-murp@redhat.com> <20260724172024.0648C1F000E9@smtp.kernel.org>
 <CALYDSrQhUbKDHsPnQqp0K4WMe2iZC-G1nGrLT6eQ9doCqdVXKQ@mail.gmail.com>
In-Reply-To: <CALYDSrQhUbKDHsPnQqp0K4WMe2iZC-G1nGrLT6eQ9doCqdVXKQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 27 Jul 2026 20:33:35 +0200
X-Gm-Features: AUfX_mzyrBSjEtB5Wc2_a2ln4augtqQhWGdC_FE3gAU87ZenRHkTnZVKluWlsi4
Message-ID: <CANiq72nJ=7TAjtArF2VzDZqwKDcuMFjeisD25R2GuA0NiJwk-Q@mail.gmail.com>
Subject: Re: [PATCH] rust: enable fentry support
To: Paul Murphy <paumurph@redhat.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>
Cc: sashiko-reviews@lists.linux.dev, Paul Murphy <murp@redhat.com>, ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 27, 2026 at 7:18=E2=80=AFPM Paul Murphy <paumurph@redhat.com> w=
rote:
>
> Hrm, s390x has more nuanced usage. It still uses -mrecord-mcount and
> -mnop-mcount. The x86 configurations I've looked at use the kernel's
> tooling to nop and record as needed. Is there any reason s390x cannot
> use those, or should rustc support those (for s390x only)?

Cc'ing the s390x maintainers -- they probably know why they use them.

Cheers,
Miguel
