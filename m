Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE083B95EB
	for <sashiko-reviews@lists.linux.dev>; Mon, 10 Aug 2026 10:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786357550; cv=pass; b=C89sn8mXn3MlHnVbvY9yjpvE25gu8KM1HmjOEnI43/PKldbdgtLBkaQ2QArTRZQCK77pijEdoMqUSMKp/d8L0ItPmflK/nuuwWEDZnsn9uEymSCCqBe9LtDGxoppB+SQDdKdSN6ZyfgK1CzA4ZmaG9Zwz6MjdQ66X2UURtsJfW0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786357550; c=relaxed/simple;
	bh=+wQ1/0Ny1GWvfbtUqTtYvQWbT0Ovv2Co+yvv4LxBCis=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qHFkoup6Kk5YuwNWiLDCcf91EGZntBIuBiWyxnltZIW5WED2Psmky9D/xgDFY+UW8UdjhibE1VEScoegcIIMRK3RfSfpluOZBSIO306jDYmIGjw0t2lxdKs3UUK5heEPQ5NiTqtMIBMTCrHaOj/81CJTRH2VyrZMopDqDcPGJ0k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nRlWSVOq; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nRlWSVOq"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2caed617615so20595485ad.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 10 Aug 2026 03:25:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786357548; cv=none;
        d=google.com; s=arc-20260327;
        b=cN6giVWOLHTHPfGQMzR5MYQ+oDkafo4aKfOwI3Gt1K+pxkw8AAdsauL2a9v0mJZXZf
         zECX5E6f6O6CA6qSweDx6Y4g40cFqk/lQPzcZsZLG31KQChQ51UaBtio6Rg+U/k85CGX
         Yc3TpbfoWdC5lQXbsxSN4pbplu22f1tnWjA7qMC35I4fXnCWavFAFgKEy++OCR7TMV4Z
         FsaB+QZqP0Exeb93pWTNT9iSEhEj2s1bT3mu+XS2NaQpuAs3DRFRvf5Ui+yxXBELq2Ub
         A0/Gx9uKhqtWSgMu+l0UG7oAwJdNLd/xKeMKYkouj936t4u1YjqWPlN18FlsHgMnb8kQ
         +W9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fMsszLrae2MK8L8AhSiRXxABl30KILb8MFS1COTcPW8=;
        fh=3mbWQc2KYnV1YBFEjtPx/1jzUpC/uZUzPfAesf3Pc0M=;
        b=IIHmyrP+hahdu+BPaejRtYTxicoJjSxlZ+dpjB6xkZupAAT5hr6Hu1Lr6k8hVRzYHE
         TIT/3fpyKZ/HggIeFx1vbf0lnpBB9Ai8/QMgXsX5tXQSdKjwN8/ADq+6JlJbttrmjIN0
         wn9yTx2zqNifqH05jZkMZCgFnAmA5M/H95jDROCpovVhe3dOwzyU1AvBprTIgFS29SL3
         nn639JadcNrunHhVGj6+MncDt3DsYRKyW50eSjVOakEKptlm9HRaO1KfgowMG65R/Y09
         glEA13Jxe27otk9GC6tgQpw9h1bKKSfBoYTQW2NCPpTnqt619HzQcoPO1r6U4sOS6t2i
         orng==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786357548; x=1786962348; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fMsszLrae2MK8L8AhSiRXxABl30KILb8MFS1COTcPW8=;
        b=nRlWSVOq2b1aotXlit0fgxxhdX7wv9jDJ1XyERB49HAjh1rGFRWj8uk4zV7eCwmjaT
         iGnxTMrEOY3SSfPkbALkMKX+FDQwmwJkgX6vgBHsGi+n1hkciRtRunkUJrEXEPGCsJPS
         xi0ClsPnPV5V/gBki9h/bzbRrnuuOh7oAAwQ+k3IdBzKY45C3m9gGaBl994IHnPJOde8
         kEvf97RgD+d/s4HV4+dHBVTf5SrPe1A7raEcM7G4rh1z8pKYkLeBB/xLNGJN5dFqf1K2
         hePZsiMhTw5wllUfo+ATX/fjnaE/NCOD9lklBMySyWtYr0uzLMHpyRZGeQ+372noMvFs
         GWHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786357548; x=1786962348;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fMsszLrae2MK8L8AhSiRXxABl30KILb8MFS1COTcPW8=;
        b=tVoFNfO0kfqA0UFdX31WcxMhtzZhetgDZxPSY1O5+F37rnB55y9TWda1CWqNVXfCWK
         8jc0eO3Ht34EblDItnW0iyWckdgcJj+JclgT3m4dg1jJHfRv/ZYJ/c5O0+m+sC2Zb+m/
         SubIRUQnVwl2Fsx6taxjFILGnZtlRi3WZyM7p/ijvli1Gldnf6zhsYovWYNqfDNbSxkD
         uFygdKEl22R8k1VaibkETtPhLEwnAj/CvWTxd5VFQ567PXkRvmIPlzgk6yHzVpP37pEX
         DGj5bziWhF0iD+tPMLP9bqyUaykYcIMfUKebe4KLmUkAb7X9SD+Ig/kIqwQsH3s41nZK
         hBXw==
X-Gm-Message-State: AOJu0YwScIRY7xe9Nf57eFx3YDeX1p1MTbr73YCHO8BUJyqCWOt/JCpd
	Tdxzrm+F/FyIC/yYlhRRmAPTNmYJX1o3ObdKdE7A3ZaLXpyYTfQL8D3ZQi++4UUZBx226xARUMf
	y0TAXx22DsgLMOqsE/h9lBogTMZvwZFBVC0u0
X-Gm-Gg: AR+sD10dHIol/a9Kc+FF7X/MTVAU836apErqLvIQ9atWJ10N+d1OaGmcdWGT6B+rq1F
	MHS2uEuOf0KJAuDz6FWeE1gbf1iJul1p7W5qBaPtuYmLSh+48SdfZONjtHAF0IWVa9hJa+uDGXY
	4z7uG2/ogAewNmGs6tSCxQ3jYytU2GYVDWI1/Mx9kNGafX+yPOJzwkZOC9mNTqX2FOx7+HVLu4F
	CJEP8Fbjrn33KTvZQc2kmdOZG5qOAjOek2QK4aoWpR/Mn9eWzkYkfufOwNVdSPdAmUbQyyZmrYL
	41NANG7bvF47RCgKsIueL/lowh38fK7o0IPA2ErG1uKMJrnOyeUHfN5ItCyyB1qlYAGJgZ4DbXR
	WdgJNFqdOoYX687HfmqkSKzKhgpZ8hthSicv+guR1srSJmCDnXaz18q7M
X-Received: by 2002:a05:6a21:9106:b0:3c3:8651:b302 with SMTP id
 adf61e73a8af0-3cc1a372bfemr862555637.28.1786357547968; Mon, 10 Aug 2026
 03:25:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260810093112.47807-1-phucduc.bui@gmail.com> <20260810094626.DA02F1F00A3A@smtp.kernel.org>
In-Reply-To: <20260810094626.DA02F1F00A3A@smtp.kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 10 Aug 2026 17:25:36 +0700
X-Gm-Features: AUfX_mxcyOkzFIt26apNzc3AQVC2pMBeVC3PSTmwWCNqFnynRLRcPTYJic0izHU
Message-ID: <CAABR9nH3qTfRbsT2aE228M-koP0mNdmHy48ti1-xSkKHQcC7pw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] usb: chipidea: ci_hdrc_imx: Propagate errors from
 optional IRQ lookup
To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

> [Severity: High]
> This is a pre-existing issue, but missing an assignment to ret here causes
> the probe to falsely succeed:
>
> drivers/usb/chipidea/ci_hdrc_imx.c:ci_hdrc_imx_probe() {
>     ...
>         if (data->wakeup_irq > 0) {
>                 irq_name = devm_kasprintf(dev, GFP_KERNEL, "%s:wakeup", pdata.name);
>                 if (!irq_name) {
>                         dev_err_probe(dev, -ENOMEM, "failed to create irq_name\n");
>                         goto err_clk;
>                 }
>     ...
> }
>
> Because dev_err_probe() is called but its return value is not assigned to
> ret, and ret is 0 at this point, the probe function incorrectly returns 0
> (success) despite the memory allocation failure.
>
> Does this code need to assign the error to ret before jumping to err_clk?

This issue has been addressed in patch 2:
[PATCH v3 2/2] usb: chipidea: ci_hdrc_imx: Fix error handling when
creating IRQ name
