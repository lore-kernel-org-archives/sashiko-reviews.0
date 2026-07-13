Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52FA53AE1BD
	for <sashiko-reviews@lists.linux.dev>; Mon, 13 Jul 2026 08:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783931297; cv=none; b=eXabGXVWorJfia/IDEi0tF9PoGMahTFCWJJVrWQm8lap+18oAsQ1jDmkxlcZmmIHA8PkpcpQvRobAVpR9b6ozjwYxukbaow8nDUg+Ngwce4/QlKqMFzMt4X+g7Djdf3+EaNtAUcZY6lDfc/LimMieXAdCcVMOIAWYiBhzgvcUdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783931297; c=relaxed/simple;
	bh=1bdQxZ+KT2IXwA3Ltsi7cQksVnEt6y9F8PnZupL8F5A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IG+vUtaDx6el03BW4TLvJ0zgqLkLCTefvI5hlI5SPvtLyDlMG3uNiReZqUhA4q5BstRn2vu1hkm2BWZLRUroTr9neSlGKgDpVIwKxqjG5jc6WJcEmMNodnRxAMQH21QvbBfbC7lApgYb38qi4d50e5eOCDoyUABn9QumOrNW3QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U3a4NoDU; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U3a4NoDU"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-84a2dcede83so1345719b3a.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 13 Jul 2026 01:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783931295; x=1784536095; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1bdQxZ+KT2IXwA3Ltsi7cQksVnEt6y9F8PnZupL8F5A=;
        b=U3a4NoDUksBepORvgG9FX5hINyvXmPRorScKJUfdIRXBOHQGkDA7dPXyqElrzjUz/6
         35yOQ2JrjcnYDCHpq+t3n9Akjn+ooc4/8mEXZBYbMn5GZvqeEEmyk6ci0uV6xC9EMYat
         rBbx5vaApzccTxsWvMarm5Lpl+qtKe2XknVS0pPGPXz6dXtjNlwgrG5jDKhAv0mLxE0h
         XJB8bQIrQv4XE3K3Vu/hI1jyTJqTtBM1OadM5UoIKMFYEyNtLJQdCpjKgO0j/fUyDyyv
         nVA3gNJMpEJ0SRyKezUV5w0P/mkafA/n3GDDZZcM3WyxsEAdEEX8wqNLBRPF9pXK+ia7
         68Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783931295; x=1784536095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1bdQxZ+KT2IXwA3Ltsi7cQksVnEt6y9F8PnZupL8F5A=;
        b=QwF1VJNv5vSky9jiNRqGIRczuLr1Zun6nOg0x4IPG67S6J5XVxcVI1TzDDUhRUNRVb
         Z30fCVuzcDjWiHFDIUGGpDGSZMZJ3htQBtxYf8LCQPlMCIQyByDra5fS9JOBzUJGGNoz
         sOFn2Pft+AKKtQluKoOkW223y+7eBu4nWUZGzdL0ox1CAMNhv3x4gant+Qp7cy79MZBQ
         Q5N8XeNQFStE6GBEF1AqdNGjVcJ0Pp4oftQISDZbxR8zwpWlUci57FUbnHXMPDNZy2xW
         HmEPsNL8HS8XHnANsUhl8UoJycTMogoajJRG6qiYKfJMU31RLhVxhjGaDvcGSSQpAM+U
         AeLg==
X-Forwarded-Encrypted: i=1; AHgh+RrrNHv3CGJivXUzZ95pgwpSVCSLkICxsV6jibyKXyAoS2z6bgAxFPBJHDSBS9rItQBZvtCPRA3Jd3+buXSUt2U=@lists.linux.dev
X-Gm-Message-State: AOJu0YxTgG2b20G9BCFOFtZVNJZB1xrFxBTNl3CpXOB7xXWh9Etq61Jm
	VAKUExGDwIhFzrAN1I7hv0dNabLLZP0iY3pwqtmJQvwGS1rQ6psVdzJb
X-Gm-Gg: AfdE7cnMFnSfDT4j+D6cFX+Hk9PL0UBXw1692Gs3uxUYEXY+jEcPfCkKKCrFpWr1UvK
	arE2jqGvNPhBfJp70uCuiUjyWK4pAyKWaAhd4eCgOBIoYzPbw6E/afZQRfz7u0pyxWTjESiDg6V
	2EJzn1gGThb7KUFcUjACH8hEuKkC9U3dXFoGZtvM/Pv5J6gLYq1/2lC44pfBtEuQ11Yy7cybeHV
	+Q7b0lv0JuLcadIBh8+vAOnP8T1Ar2LfHL9NYv1hn9Nf+j3HrVwmIxptYfGgWV4tUy10xaetP2n
	aysc5umIs/m/Vxg3J7fR/ki9z8ffKSjFideD93+QeO1rJPDYZ6+PI0w7SeUZBkiQnh7ZP8oVD8N
	IrSnUOF6Ut8S7eh8o9jt8XpNosfQo9VQtGLmirXmzT1cvud6PIMwBKL/pvslqvLHMS01/a/tR01
	YWE8dACsOuxT0FXfL+sk2RFQ==
X-Received: by 2002:a05:6a00:3306:b0:847:8dec:141e with SMTP id d2e1a72fcca58-848897569e9mr7818491b3a.54.1783931295613;
        Mon, 13 Jul 2026 01:28:15 -0700 (PDT)
Received: from HP.localdomain ([27.217.83.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8494b279e8bsm2691284b3a.33.2026.07.13.01.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 01:28:15 -0700 (PDT)
From: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
To: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev,
	Zaixiang Xu <zaixiang.xu.dev@gmail.com>
Subject: Re: [PATCH v7 3/4] hwmon: (sht3x) Add devicetree support
Date: Mon, 13 Jul 2026 16:28:09 +0800
Message-Id: <20260713082809.24184-1-zaixiang.xu.dev@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260713080129.D8A8E1F00A3D@smtp.kernel.org>
References: <20260713080129.D8A8E1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 13 Jul 2026 08:01:29 +0000, sashiko-bot@kernel.org wrote:
> While reviewing this patch, I noticed a few pre-existing regressions
> in this file that might be worth addressing.
>
> [Severity: Critical]
> This is a pre-existing issue, but does this unaligned memory access
> crash strict-alignment architectures?
[...]
> [Severity: High]
> This isn't a bug introduced by this patch, but does this integer
> arithmetic overflow?

Thanks for the report. All five findings are in pre-existing code and
are not touched by this series, so I would prefer to keep them
separate from the devicetree support here.

I checked the first two: the unaligned access in sht3x_update_client()
(buf + 3 is an odd offset into a byte buffer, so it needs
get_unaligned_be16()), and the limit_write() overflow (temperature is
clamped to 130000, and (130000 + 45000) * 24543 = 4295025000 just
exceeds U32_MAX, so writing the maximum limit wraps the raw
temperature field to 0). Both look real.

I plan to go through all five and send fixes as a separate series
after this one.

Thanks,
Zaixiang
