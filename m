Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79AC7380FE5
	for <sashiko-reviews@lists.linux.dev>; Mon, 10 Aug 2026 10:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786358290; cv=pass; b=L/rTtvV1XenqWbZTijU9A8pGLGxK5SVCmdM6RkBWebe0kqAXFaVOb9NbVj041WogtensyJ2WvEgHUVnEVVVc/jL73TwKwmksPImURAMe72buicNehoaxuShEvlH1cxNERD9Q6Se0CqZLpEuDDRhoRC1d7R7Fm5rou8D24CSetPw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786358290; c=relaxed/simple;
	bh=q7Go9yYok3C95hUOfmQUuxaqx/nyR/Er6G2c8Gtll/g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rZBEoxvRnVmkY6mTtRzIHAKgQBetN4PoW0UiOloMbe4h44M/B0xEZelZUDc6lV0KIgIbibW50MbXNjbK8Kwa2wook//Rfmfxbl+3OXBwGFTHInwaqP71Ikf/Ag3zf5WCxE0dg79jzULPBr52w5w7MvZ5l7MGXkJaClRiFCVSJ7A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gNZgD2H4; arc=pass smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gNZgD2H4"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-84830c774a0so1525813b3a.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 10 Aug 2026 03:38:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786358289; cv=none;
        d=google.com; s=arc-20260327;
        b=AnN/3bHmV+W/SJhJXLJjQBWzhwSAz57Rk4Wwyi6TTodQSYB531/D33+3BJ6Zw9RV7n
         RyGDMwQZq9DMTy5v+aR8zsUs+Bi2iCkH2o2cJDzwobyxIApO6ZXZNmubLTqlMAwBauuh
         CGCo8AmX9PYHDYT8/HMJ1bRo5PpTc1BCGUBlXoMU4Z8S/4kVZBksdNMBl5GLMPvrj7rz
         UC+47TmKw+GElZFZQI7EMNkqFg4zPLPKg3JU00iTTRrj1A4xULnZC9PgWk3imGbktmAT
         HhAEmIaQjftCiodnqmSX+TJojHW5ym84kFPfLny4aIrWexKP1Qyhkbt/9/LrKv1QwND3
         AIIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ndyTsAfSWT9fU/X+sfJ4tCXGlqjlZNQz8Rp00QAZlQM=;
        fh=zt2hjtFWVrBSbexOnXx/digRN2O0tNSOK4/ceCsrIlE=;
        b=rGO+C4HFZs+ySMeM7ZjVioGNOcrtJl2wrRRt/mywWRMa7eUls9QKcLTBGOrJ4Qores
         /dPECMLjNz5xYPuPPg5uchblFZX166Zx6VA22klIfadiR+oUmF7iRfc4TW1guuMKtEGk
         B9RYYU7aLz8+VRtgSo8cgdBya5iX9uHaZSXFgCn2QLsaGU8f+aTnn5c8wdr08XHrHP/D
         0rPl8qHoBZE1rpPUjyFneUWKxvsX1Yd7+436duGMzKLpBV7E/ppxTeCBut0uwrS96UgT
         Lxo9nSkYQynSQ01o2e/De6HteaH89RFO8XNtGe1EoreQTU/uI3NH9uOAmXhLLYVWvogr
         31PA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786358289; x=1786963089; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ndyTsAfSWT9fU/X+sfJ4tCXGlqjlZNQz8Rp00QAZlQM=;
        b=gNZgD2H4Xy9fMUx+Rta8F+s+oE2+MAe64Nwmy6wqJRYcGdH2yeb0q8FbTwaj5EAeZo
         9BnO1Kgj0D1hEaxhktwTsJzdUFRWJ+t8VxqTjUBb177aHS1/Enrahik1mAuMl5aofKxc
         gaPG7i4y9r3k8od0CznLot/jE03T6yurfGRR8Jc4Wv+xTdfOr3NDZ5HABeIfj/dM/W0C
         DgGcOuzWArpMrVcMFY2WorPkQVY7NcMcvc7tqcM/sXViSv8lXehsnsz2Bm9yDNY9O4Yc
         zsM5+ByAZJ9hw2OUb42NNltC//D2JPuve23xrDEOSdZdFXqdeumM76GD9oieIm0nwP5s
         ICFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786358289; x=1786963089;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ndyTsAfSWT9fU/X+sfJ4tCXGlqjlZNQz8Rp00QAZlQM=;
        b=W7rp5UFV3+OMuudka6ZoFN6p6aOHeIpl7MqibmZGZtSjpVjgATu4zdVfet8YjE7zYf
         PmI9bHmMc4ZPUPp5rYJ2Zaq1qM5HvJW5kxNuo6c3EbGXWKHU6LIV32jj5SqGTRvCOROL
         PlCzHhCvbO1rHyQ90Ax6DdgfbSOpeHIrbosWp4cLiY2iik+4oJI0O0YjWyiJNnKgZJXe
         E6IgiMTXOZQJ8+qKhe5Yn2uk/z2y+h34EAY6Zm4rvdIQSwMIsUY6RdBnKRXiSnz7fUhE
         Y7/jQUF6jZojFZ+gzvJNCVXJz+oXJz2cBkb3Y8KdWs/E/nJDvykFtKI1MZWd0gLvCcwg
         B7GQ==
X-Gm-Message-State: AOJu0Ywzf0KiTvWf71CnleGyemYeHcNV7qdrpmnDz7m80bzyKgFMzSoD
	NktzjkCGBRDCHV5V32TIpaMWDGmk3NjACoubJcHsKa6PwtNDNUNW4LUKgE5awf7AOBDM1Ek7det
	QFtd8HXHA4bSd9ldRpjSQ+O4dbfDjeaiz8ZMK
X-Gm-Gg: AR+sD12NOgmK70r2JkkKqu4QX66eIaq5r45OXk9K5ZOvZFPqaPhMKJaqs10IjFkM0K7
	/xRAmQP+g1r8FboaYNUOOQ6XV0CP8dIPZGXO0NNpAD18M1B9OuSfA3o/4IaEj8kolyvLOPwGJz2
	oYpliVnbR8q+/AkxXLetHYeP+g9/9UTH2fXTufhj5ACMUw3fOy2qIMNhS9p+lWXI1EALgeLhSg3
	IlxPYvIGbZ6zrN94VJ20YyPNqcHFz1cqJf+QUGUPdI2Dfr8q6Eu1K0fJT1K9iU+is58GGkSOn8B
	vzAmH7LRpG7g+JpYoyrBskgecws7zqPNbidfevFlEpL0f2o8FgHeotwWvXOIwlBHHWdJ/Yauvyj
	8ptOL19JmzAPR/T9M4PPA/bzD9ASs2MklfAnvEm3wOQ2ozCQ1JFuoxpEX
X-Received: by 2002:a05:6a00:8f0c:b0:848:32f5:4999 with SMTP id
 d2e1a72fcca58-84f696d2552mr19666780b3a.30.1786358288679; Mon, 10 Aug 2026
 03:38:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260810102144.51663-1-phucduc.bui@gmail.com> <20260810102815.3720F1F00A3D@smtp.kernel.org>
In-Reply-To: <20260810102815.3720F1F00A3D@smtp.kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 10 Aug 2026 17:37:56 +0700
X-Gm-Features: AUfX_mzvMK0zlcloRVltWRfYX01mBrnV3QFem1x4obOb00rlOZkyBIDJi5Xucsg
Message-ID: <CAABR9nE=oRUr1XbStf0ztudQ9HM7LEVc_fVcmN7QkQixi4DyYw@mail.gmail.com>
Subject: Re: [PATCH v2] watchdog: qcom: Propagate errors from optional IRQ lookup
To: sashiko-reviews@lists.linux.dev
Cc: linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> [Severity: High]
> Does this code leave wdt->wdd.info uninitialized if data->pretimeout is t=
rue
> but the optional IRQ is missing?
>
> If platform_get_irq_optional() returns -ENXIO, the if (irq > 0) branch is
> skipped. Since this all occurs inside the if (data->pretimeout) branch, t=
he
> outer else block is bypassed.
>
> Could this cause devm_watchdog_register_device() to later fail with -EINV=
AL
> because wdd->info is NULL?
>
> >       } else {
> > -             if (irq =3D=3D -EPROBE_DEFER)
> > -                     return -EPROBE_DEFER;
> > -
> >               wdt->wdd.info =3D &qcom_wdt_info;
> >       }
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810102144.51=
663-1-phucduc.bui@gmail.com?part=3D1


Oh, it looks like this approach is correct.

Option C (default-then-override, only look up the IRQ when pretimeout
is supported):

----------------------
wdt->wdd.info =3D &qcom_wdt_info;

if (data->pretimeout) {
        irq =3D platform_get_irq_optional(pdev, 0);
        if(irq < 0 && irq !=3D -ENXIO)
                return irq;

        if (irq > 0){
                ret =3D devm_request_irq(dev, irq, qcom_wdt_isr, 0,
                                                       "wdt_bark", &wdt->wd=
d);
                if(ret)
                        return ret;

                wdt->wdd.info=3D &qcom_wdt_pt_info;
                wdt->wdd.pretimeout =3D 1;
        }
}
-----------------------
