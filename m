Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E50261B71
	for <sashiko-reviews@lists.linux.dev>; Fri,  9 Oct 2026 08:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791533069; cv=pass; b=HgG6UGdrQgxgjRqCKkn8Ia7dfvkidtzGSj44Meg1q0OemxeKnSLtMEV5AlfMZWWymYlNCF/qy4U4C1Rw8gvWO3sq3uucQqlihpjHf8vfX/tVsQxqFHL36XTBnbxUDFrbAD8vZMsXPCxFDI896CEJj8q97mG+t71xwbrLSv2KuC0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791533069; c=relaxed/simple;
	bh=+NsJilTDx1tB947yLQCag6iqhlT3X7wK2H0/heKXVF8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pcWl7f0Goo84MHBp/qwEkrBJbhhtjMJohCwpfQ3A0Nmyq024Z6psD7rkkL3ds8Ue4ajuEykL7MaO0Biw4Ez3TorjvaedTVebsa9VzTOuFkGMNjtxGUTIFSkMWO4K3GvSBBoD/VzR0BLPWf4+KgV69a83BxnDEXUerqKBrhJ6Tic=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GX9vI1Km; arc=pass smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GX9vI1Km"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8917c712f32so1663027b3a.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 09 Oct 2026 01:04:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791533064; cv=none;
        d=google.com; s=arc-20260327;
        b=Z7NY2D3GZxXzDdONw7BjJ5Yf+rPwTqRPsxV3uy69Jf5gJq7sTQRmQvpGn+LVFj+Ckj
         wk4Thte7c1Cn/bxhnEOuBUlAPs2OFp16Mb+yPZvME+bJm7ziT7L4j9wNevMKnPp1ncAG
         T6F3Un+ecnWmC9xKvFw7zkzSVVlLRnH7uiWO2sXChurrNKfqUepXk5OZQVDWY0sm73al
         qA5M6DJAsp38myA7AlDDIeHCPP13CQ9857yQf8Qx+2z5rOILpRVSJ6LyM+GNK8aMeICH
         5B0JRWNgkyJG2DPxQK1b/xeAT7yvlKaUYxmJApQbMmbIhtTWT9KUusWpvdHozSHHUH1c
         VFuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sk+wR6aXcuMffQLCDFaHtfSIQHN9wdgT7SWwoWK51p0=;
        fh=WdZE3kgJeTebCBJ4NXeUoIjbXeb3faIbdq3aHEnJVzw=;
        b=LkAjbY41cyoBq7DAKZqYYAMLQW0K771Gzne0EbakGTGYrIDZDyjcCn2CVoHNxkx+ks
         pidNNTJmlINiqStJazRxG7HBPYj5zMBo8uQyRh68J2e47INskGQpSm3ywi3wWz9kipXU
         TOkmqqHjEgDRDiLZQEugM2hgGvGV6AOf0rQtDs/E0T8zXOJU/Rih274s/8oU2LlterqQ
         Jzm+DSGQCZGfFJ9XpX/yVLRduzz47nO39QU5iagqSj4tDW4B3KOMdJdSsX9BWB0TH9YI
         piZ11UnPZmi+9bogOVohpOPDgdO+01LtNrv2NzwAW4Qs7yZ+8nxg10iPdkwtUWP91eqS
         yYkg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791533064; x=1792137864; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sk+wR6aXcuMffQLCDFaHtfSIQHN9wdgT7SWwoWK51p0=;
        b=GX9vI1Km8tFHNGoe8lkNEUiBH7uQGZSrRGolDU/g0tU82/DdPsZZ+OHGleLyLAgqQ2
         S7zybMIiuPHWIKUcoXqBPA7q327nvGMHayDFgWZeqejeO0FqXXgijOlole52U4J4v/cI
         STzJpVO/jXdaVnwWINxFe6MItc3seJu+BLQCsssM37SgNqlMFM2S6TfVoe6UBw6prfKR
         2wwrlDpDIIwP7wZvVwnL9YyYoyVZSklqr5aBIJU9iOQJI1On2Tr5Yst8xqAhYDXLg86b
         sA69azfnX/wGu65ii5xIXPDqpaHsSYJT66LhEjih44doaOcOkhktnQbLxvht/AFSQNzi
         61aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791533064; x=1792137864;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sk+wR6aXcuMffQLCDFaHtfSIQHN9wdgT7SWwoWK51p0=;
        b=OR9nJjFcABYSJ/lYGflr2C/lnUkTAvwRCDByq8wGuYRGnF07fjlaZ7ZVKLRylEmYFL
         Rz2gJYmh0bRIL+JRMte7fbGO+2QFVk/dNP6c8EtDzZTaFsqTJfz5TC/PQQMVEHb0P7E8
         zGG5DUvc+rRGoQQBu9JpaLZf4gniGpqwSTR7zndWUGv6xdna2y4Ovx5hOzGopDGIEGMZ
         4F4vThgpvtHuZCOvuSkztyDzBsYFOlZy3dQe5gd1YnTjnpBHs7W0uHKnTjsqumHBmRnG
         uJmKJcQoKm8Hy0gIagZrNQS6a/cg2V3NEUIv+UYq5faKQ94rgGeSMFsyCGnLfEk5VL5K
         rkjg==
X-Gm-Message-State: AFq9FYJOretOkMxDQqNQ+BWv7J9l9kRZzf1HDG6bYb6ISE2Qa7lt48Oe
	H4lMyIf8/9W+X3/o9ZsfpJDYB31Tt6YoLqMSSdKeaKRYoPNPZrLCqYPYRlug+MMAthRHPaJB76/
	yA/coWRw8R4urHLPWjaeya/aGps/S6Byk3uqk
X-Gm-Gg: AYBFou3aWgeV3oPGmhbt6hpz6LMDW6jRtVQiFOCgpdOAz2sIzWgDxFQjs8XxrJxYOOK
	J7de9RAIaYjJxiqrIdEJDJyzMzoeSEiT5uAiUM+UUXooQhxKQKWIfIWpnDpWJqwuu+X0mpm349N
	UYU8jOkBLcQZWLibFzWEdxO82JQTm1iPscmCySSVNnI6U0cpdgNjw4SsfqcDckHfQefBH1v6G/Z
	3iH2S+Lr8ExPvHO18Kvl7mV1ImCp1ZQu0wnwLOXpI/bngyj92rGhmGhRttMIf1xLd1fz5iXu3Q1
	n42D3yLHOiYeRyE2767t5Dge42T+UHowbiqwVib3SSvzj/3XR3O1FKaknG3LRNDLoKq5TeaGJEe
	xwz+98PLw7IzFgV3HM+ht38yVw2X8kLr/CaSyShuwnhNT0TN1z2NdDzYhedqYcdp6ghQ=
X-Received: by 2002:a05:6a00:1798:b0:893:12e5:c07c with SMTP id
 d2e1a72fcca58-897c6d1e604mr938350b3a.27.1791533064649; Fri, 09 Oct 2026
 01:04:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261007104915.507801-1-phucduc.bui@gmail.com> <sashiko-outbox-162904@kernel.org>
In-Reply-To: <sashiko-outbox-162904@kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 9 Oct 2026 15:04:11 +0700
X-Gm-Features: AclHuK-qnBNsXh3a9SJEE5vjJ4fa3L9goXv5wKCmekC_mAzheWKs0hVo_QGCQow
Message-ID: <CAABR9nFAk9-PDsb7CDofeKp3DOHH4LLNMJRtjUkP4CeV0f=01A@mail.gmail.com>
Subject: Re: [PATCH] leds: lm3532: propagate enable GPIO errors
To: sashiko-reviews@lists.linux.dev
Cc: lee@kernel.org, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

>
> [Severity: Low]
> This isn't a bug, but does the commit message subject violate the LED
> subsystem guidelines? The guidelines require the commit message description
> following the subsystem prefix to be capitalized. Should the description
> start with a capital letter?
>

I will update the commit message subject to:
leds: lm3532: Propagate enable GPIO errors


> [Severity: Medium]
> Will this change result in unconditional error logging during deferred probes
> anyway?
>
> When devm_gpiod_get_optional() returns a deferred probe error, dev_err_probe()
> correctly suppresses the log message here. However, the caller lm3532_probe()
> does not use dev_err_probe() for its return check:
>
> lm3532_probe() {
>     ...
>     ret = lm3532_parse_node(drvdata);
>     if (ret) {
>         dev_err(&client->dev, "Failed to parse node\n");
>         return ret;
>     }
>     ...
> }

I will also add this code to the current patch.

--------------------------------------------------------------------------------------------
ret = lm3532_parse_node(drvdata);
if (ret)
        return dev_err_probe(&client->dev, ret, "Failed to parse node\n");
---------------------------------------------------------------------------------------------
